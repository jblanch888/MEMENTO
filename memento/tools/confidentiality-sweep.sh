#!/usr/bin/env bash
set +x
# Confidentiality sweep: checks everything a push publishes against banned-token
# lists held OUTSIDE the repository (a public check that contained its own
# tokens would republish them).
#
# Earned 2026-07-21 by incident (banned literals published inside the memo that
# documented their banning). Rebuilt 2026-10-03 under the leak-hardening plan
# (evidence archive: plan-leak-hardening-2026-10-03.md, slice 1a), after the
# first version was found to read only the working copy, skip history and
# commit messages, and report clean on a list it could not parse.
#
# What a push publishes, and what this sweeps:
#   - every blob an outgoing commit adds or changes, in full (merges and root
#     commits included);
#   - every path an outgoing commit adds or changes;
#   - every outgoing commit object: its header block (author, committer,
#     mergetag, encoding, signature and any other header) and its message,
#     read raw with git cat-file. Signature lines are swept too: base64 cannot
#     be told apart from a word by its characters, and a chance match on a
#     signature fails closed;
#   - every tag object on a pushed ref's chain, and a tree or blob a pushed
#     ref points at;
#   - the pushed ref names.
# Outgoing commits are those unreachable from any ref the remote holds, read
# with git ls-remote. Replace refs and grafts are switched off, so the sweep
# reads the objects that are actually sent.
#
# Text that is not valid UTF-8 cannot be matched reliably (grep stops matching
# at an invalid byte), so it is treated as a hit in a text field and as binary
# in a blob. A blob holding a NUL byte is binary too. Binary blobs block unless
# their exact path is listed in memento/tools/sweep-binary-allow.txt.
#
# By default, output carries no matched token, pattern or line of content. A
# hit is reported by location: commit, header or message line, path and line
# number. (--show-redacted, below, adds masked hit lines on request.)
# A path that matches, or holds a non-printable character, is shown as path#N
# (the Nth entry of that commit's diff-tree listing). Patterns reach grep
# through process substitution, so they stay off the command line and off disk.
#
# Modes (one is required):
#   --pre-push <remote> <url>   called by .githooks/pre-push, with git's ref lines on stdin
#   --range <rev-list args>     standalone, e.g. --range origin/main..HEAD, or --range HEAD
#   --pre-commit                called by .githooks/pre-commit and
#                               .githooks/pre-merge-commit: the staged changes
#                               (the index against HEAD). cherry-pick, revert,
#                               rebase and amend run no such check on what they
#                               carry over. The pre-push sweep covers them.
#   --commit-msg <file>         called by .githooks/commit-msg: the whole message
#                               file and the author and committer identities
#   --published [--update-baseline] <rev-list args>
#                               every commit reachable from the arguments (run
#                               after a fetch, e.g. --published origin/main; tag
#                               objects and ref names are outside this mode),
#                               compared with a baseline of known hits held outside
#                               the repository ($MEMENTO_SWEEP_BASELINE, default
#                               ~/.memento/sweep-baseline.txt). Each baseline line
#                               is the sha256 of the lists' digest and one hit
#                               line, so the file holds no path or token text, and
#                               a change to either list brings every hit back for
#                               review. Known hits are counted. New hits are
#                               printed, and the run exits 1. --update-baseline
#                               records the current hits as known.
# Modifier, placed first:
#   --show-redacted             with each hit in scanned text, also prints the hit
#                               lines with every matched span masked by '#'. The
#                               masked text is checked again before it is printed,
#                               and a line that still matches, or is not valid
#                               UTF-8, is withheld. The mask keeps each span's
#                               length in bytes. Applies to every mode except
#                               --published.
#
# Lists (one extended regex per line; a leading BOM, '#' comments, blank lines,
# CR and trailing space are stripped):
#   $MEMENTO_BANNED_TOKENS     default ~/.memento/banned-tokens.txt      case-insensitive, required
#   $MEMENTO_BANNED_TOKENS_CS  default ~/.memento/banned-tokens-cs.txt   case-sensitive, required
#                              unless MEMENTO_NO_CS_LIST=1
#
# Exit: 0 clean, 1 hit, 2 cannot run. Every failure the script does not
# expect also exits 2.

set -euo pipefail
ME=confidentiality-sweep

# Deliberate exits set FINISHED (0 or 1) or go through cannot (2). Any other
# exit, such as errexit firing on an unexpected failure, becomes exit 2.
FINISHED=0
WORK=""
on_exit() {
  local s=$?
  [ -z "$WORK" ] || rm -rf "$WORK"
  if [ "$FINISHED" != 1 ] && [ "$s" -ne 2 ]; then
    echo "$ME: CANNOT RUN: unexpected failure (status $s)" >&2
    exit 2
  fi
  exit "$s"
}
trap on_exit EXIT
cannot() { echo "$ME: CANNOT RUN: $1" >&2; exit 2; }

# Read the objects that are sent: no replace refs, no grafts.
export GIT_NO_REPLACE_OBJECTS=1
export GIT_GRAFT_FILE="/nonexistent/$ME-grafts"

# ---- tools and locale ----------------------------------------------------
GREP=""
for g in /usr/bin/grep /bin/grep; do
  if [ -x "$g" ]; then GREP=$g; break; fi
done
[ -n "$GREP" ] || cannot "no grep found"
command -v iconv >/dev/null 2>&1 || cannot "iconv not found"
LOCALES=$(locale -a 2>/dev/null) || cannot "locale -a failed"
LOC=""
for l in en_US.UTF-8 en_US.utf8 C.UTF-8 C.utf8; do
  if printf '%s\n' "$LOCALES" | "$GREP" -Fx -e "$l" >/dev/null 2>&1; then LOC=$l; break; fi
done
[ -n "$LOC" ] || cannot "no UTF-8 locale available"
export LC_ALL=$LOC

# ---- mode ----------------------------------------------------------------
SHOW_REDACTED=0
if [ "${1:-}" = --show-redacted ]; then SHOW_REDACTED=1; shift; fi
MODE=${1:-}
UPDATE_BASELINE=0
case $MODE in
  --pre-push)   [ $# -ge 3 ] || cannot "--pre-push needs <remote> <url>"; URL=$3 ;;
  --range)      shift; [ $# -ge 1 ] || cannot "--range needs rev-list arguments"; RANGE_ARGS=("$@") ;;
  --pre-commit) [ $# -eq 1 ] || cannot "--pre-commit takes no arguments" ;;
  --commit-msg)
    [ $# -eq 2 ] || cannot "--commit-msg takes exactly one argument, the message file"
    MSG_FILE=$2
    case $MSG_FILE in /*) ;; *) MSG_FILE="$PWD/$MSG_FILE" ;; esac ;;
  --published)
    [ "$SHOW_REDACTED" = 0 ] || cannot "--show-redacted applies to --range, --pre-push, --pre-commit and --commit-msg"
    shift
    if [ "${1:-}" = --update-baseline ]; then UPDATE_BASELINE=1; shift; fi
    [ $# -ge 1 ] || cannot "--published needs rev-list arguments"; RANGE_ARGS=("$@") ;;
  *) cannot "usage: $ME [--show-redacted] --pre-push <remote> <url> | --range <rev-list args> | --pre-commit | --commit-msg <file> | --published [--update-baseline] <rev-list args>" ;;
esac

TOP=$(git rev-parse --show-toplevel 2>/dev/null) || cannot "not inside a git repository"
cd "$TOP"
WORK=$(mktemp -d "${TMPDIR:-/tmp}/$ME.XXXXXX") || cannot "mktemp failed"

# ---- lists ---------------------------------------------------------------
BOM=$(printf '\357\273\277')
load_list() { # $1 file; prints the cleaned lines; awk's stderr is discarded to keep list bytes out of the output
  LC_ALL=C BOM="$BOM" awk '{
    if (NR == 1 && substr($0, 1, 3) == ENVIRON["BOM"]) $0 = substr($0, 4)
    sub(/\r$/, ""); sub(/[ \t]+$/, "")
    if ($0 ~ /^[ \t]*#/ || $0 ~ /^[ \t]*$/) next
    print
  }' "$1" 2>/dev/null
}
check_list_text() { # $1 patterns, $2 label: must be valid UTF-8
  local rc=0 n
  printf '%s\n' "$1" | iconv -f UTF-8 -t UTF-8 >/dev/null 2>&1 || cannot "the $2 list is not valid UTF-8"
  n=$(printf '%s\n' "$1" | "$GREP" -c -v -E '^.*$' 2>/dev/null) || rc=$?
  case $rc in 0|1) ;; *) cannot "grep failed checking the $2 list" ;; esac
  [ "$n" = 0 ] || cannot "the $2 list is not valid UTF-8"
}
check_pats() { # $1 grep case flag ("-i" or ""), $2 patterns, $3 label
  local rc=0
  printf '\n' | "$GREP" $1 -E -f <(printf '%s\n' "$2") >/dev/null 2>&1 || rc=$?
  case $rc in
    0) cannot "a $3 pattern matches the empty line" ;;
    1) ;;
    *) cannot "a $3 pattern does not compile" ;;
  esac
}
count_lines() { if [ -z "$1" ]; then echo 0; else printf '%s\n' "$1" | wc -l | tr -d ' '; fi; }

CI_FILE=${MEMENTO_BANNED_TOKENS:-$HOME/.memento/banned-tokens.txt}
CS_FILE=${MEMENTO_BANNED_TOKENS_CS:-$HOME/.memento/banned-tokens-cs.txt}

[ -f "$CI_FILE" ] || cannot "no case-insensitive list (set MEMENTO_BANNED_TOKENS or create ~/.memento/banned-tokens.txt)"
CI_PATS=$(load_list "$CI_FILE") || cannot "could not read the case-insensitive list"
[ -n "$CI_PATS" ] || cannot "the case-insensitive list is empty"
check_list_text "$CI_PATS" case-insensitive
check_pats -i "$CI_PATS" case-insensitive

CS_PATS=""
if [ -f "$CS_FILE" ]; then
  CS_PATS=$(load_list "$CS_FILE") || cannot "could not read the case-sensitive list"
  [ -n "$CS_PATS" ] || cannot "the case-sensitive list is empty"
  check_list_text "$CS_PATS" case-sensitive
  check_pats "" "$CS_PATS" case-sensitive
elif [ "${MEMENTO_NO_CS_LIST:-0}" != 1 ]; then
  cannot "no case-sensitive list (create ~/.memento/banned-tokens-cs.txt, or set MEMENTO_NO_CS_LIST=1 to run without one)"
fi
N_CI=$(count_lines "$CI_PATS")
N_CS=$(count_lines "$CS_PATS")

ALLOW="$TOP/memento/tools/sweep-binary-allow.txt"
: > "$WORK/allow"
if [ -f "$ALLOW" ]; then load_list "$ALLOW" > "$WORK/allow" || cannot "could not read the binary allow list"; fi

: > "$WORK/seen-commits"; : > "$WORK/seen-blobs"

# ---- matching ------------------------------------------------------------
# Functions below that return 1 for "no" are always called from an if, where
# errexit is suspended, so every failure inside them is handled explicitly.
# Pipelines whose first command may exit 1 for "no match" run with errexit off
# for that one line and are judged through PIPESTATUS, so they behave the same
# whether or not the caller is an if.

# valid_lines FILE: writes the numbers of lines that are not valid UTF-8 to
# $WORK/inv. Returns 0 when every line is valid. grep is the judge, because a
# line grep cannot parse is a line it cannot search; iconv is a second check,
# and if it alone objects, every line is marked.
valid_lines() {
  local st
  set +e
  "$GREP" -n -v -E '^.*$' "$1" 2>/dev/null | LC_ALL=C cut -d: -f1 > "$WORK/inv"
  st=("${PIPESTATUS[@]}")
  set -e
  case ${st[0]} in 0|1) ;; *) cannot "grep failed on a validity check" ;; esac
  [ "${st[1]}" = 0 ] || cannot "cut failed"
  [ -s "$WORK/inv" ] && return 1
  if ! iconv -f UTF-8 -t UTF-8 < "$1" >/dev/null 2>&1; then
    LC_ALL=C awk 'END { for (i = 1; i <= NR; i++) print i }' "$1" > "$WORK/inv" || cannot "awk failed"
    [ -s "$WORK/inv" ] || echo 1 > "$WORK/inv"
    return 1
  fi
  return 0
}

# scan_file FILE: sets SCAN_HITS (line numbers matching a pattern) and
# SCAN_BAD (line numbers that are not valid UTF-8). Returns 0 when either is
# non-empty. grep's matched lines go straight down a pipe to cut, which runs
# byte-wise (LC_ALL=C) so a line holding invalid UTF-8 keeps its number; only
# line numbers are written to disk.
SCAN_HITS="" SCAN_BAD=""
grep_list() { # $1 case flag, $2 patterns, $3 file, $4 label: appends hit line numbers to $WORK/m
  local st
  set +e
  "$GREP" -n $1 -E -f <(printf '%s\n' "$2") "$3" 2>/dev/null | LC_ALL=C cut -d: -f1 >> "$WORK/m"
  st=("${PIPESTATUS[@]}")
  set -e
  case ${st[0]} in 0|1) ;; *) cannot "grep failed on the $4 list" ;; esac
  [ "${st[1]}" = 0 ] || cannot "cut failed"
}
scan_file() {
  SCAN_HITS="" SCAN_BAD=""
  if ! valid_lines "$1"; then SCAN_BAD=$(sort -n -u "$WORK/inv") || cannot "sort failed"; fi
  : > "$WORK/m"
  grep_list -i "$CI_PATS" "$1" case-insensitive
  if [ -n "$CS_PATS" ]; then grep_list "" "$CS_PATS" "$1" case-sensitive; fi
  SCAN_HITS=$(sort -n -u "$WORK/m") || cannot "sort failed"
  [ -n "$SCAN_HITS$SCAN_BAD" ]
}
lines_desc() { # describes SCAN_HITS and SCAN_BAD as "3,5" plus a validity note
  local d
  d=$(printf '%s\n%s\n' "$SCAN_HITS" "$SCAN_BAD" | awk 'NF' | sort -n -u | tr '\n' ',' | sed 's/,$//')
  if [ -n "$SCAN_BAD" ]; then d="$d (not valid UTF-8, so not fully checkable)"; fi
  printf '%s' "$d"
}

# show_redacted FILE: with --show-redacted, prints the lines named in
# SCAN_HITS with every matched span masked.
#   1. The hit lines (valid UTF-8 only) are copied out. Each pattern is run on
#      its own with grep -o -b, so spans from different patterns that overlap
#      are all found.
#   2. grep -o reports a pattern's matches without overlap, so the first
#      character of every span found is replaced by \001 and grep runs again,
#      until no new span appears. That finds overlapping matches of one
#      pattern (aba in ababa). After 64 passes the lines are withheld.
#   3. redact_enumerate adds every match start position, pattern by
#      pattern, so a match whose interior held an earlier span's replaced
#      first character is still found.
#   4. awk masks the union of the spans with '#', segment by segment.
#   5. The masked lines are checked against both lists again; a line that
#      still matches is withheld. Control bytes are shown as '?'.
# Lines that are not valid UTF-8 are withheld throughout.
redact_spans_raw() { # $1 file: every pattern's matches as "line:offset:text", one grep per pattern
  local pat
  printf '%s\n' "$CI_PATS" | while IFS= read -r pat; do
    "$GREP" -n -b -o -i -E -f <(printf '%s\n' "$pat") "$1" 2>/dev/null || true
  done
  if [ -n "$CS_PATS" ]; then
    printf '%s\n' "$CS_PATS" | while IFS= read -r pat; do
      "$GREP" -n -b -o -E -f <(printf '%s\n' "$pat") "$1" 2>/dev/null || true
    done
  fi
}
# redact_enumerate: for each pattern that matched a hit line, finds every
# start position that begins a match: the leftmost match at or after k is
# taken, then k moves one character past that match's start, until no match
# remains. It runs on suffixes of each line, which can only add spans (a
# suffix may satisfy ^ or \b where the full line does not). Appends
# "line offset length" to $WORK/spans; returns 1 if a line did not settle.
redact_enumerate() {
  local idx=0 pat flag pass
  REDACT_PATS=() REDACT_FLAGS=()
  while IFS= read -r pat; do REDACT_PATS[$idx]=$pat; REDACT_FLAGS[$idx]=-i; idx=$((idx + 1)); done < <(printf '%s\n' "$CI_PATS")
  if [ -n "$CS_PATS" ]; then
    while IFS= read -r pat; do REDACT_PATS[$idx]=$pat; REDACT_FLAGS[$idx]=""; idx=$((idx + 1)); done < <(printf '%s\n' "$CS_PATS")
  fi
  local j=0
  while [ $j -lt $idx ]; do
    pat=${REDACT_PATS[$j]}; flag=${REDACT_FLAGS[$j]}
    # Lines this pattern matches at all start active at k = 0.
    "$GREP" -n $flag -E -f <(printf '%s\n' "$pat") "$WORK/hl" 2>/dev/null | LC_ALL=C cut -d: -f1 \
      | LC_ALL=C awk '{ print $1, 0 }' > "$WORK/en-k" || true
    pass=0
    while [ -s "$WORK/en-k" ]; do
      pass=$((pass + 1))
      [ $pass -le 256 ] || return 1
      LC_ALL=C awk '
        FILENAME == ARGV[1] { k[$1] = $2; next }
        { if (FNR in k) print substr($0, k[FNR] + 1); else print "" }' "$WORK/en-k" "$WORK/hl" > "$WORK/en-suf" \
        || cannot "redaction failed"
      LC_ALL=C awk -v SP="$WORK/en-spans" '
        BEGIN { for (c = 1; c < 256; c++) ord[sprintf("%c", c)] = c }
        FILENAME == ARGV[1] { k[$1] = $2; next }
        FILENAME == ARGV[2] { st[FNR] = pos; pos += length($0) + 1; line[FNR] = $0; next }
        {
          i = index($0, ":"); n = substr($0, 1, i - 1) + 0; r = substr($0, i + 1)
          q = index(r, ":"); a = substr(r, 1, q - 1) + 0; m = substr(r, q + 1)
          if (m == "" || !(n in k) || (n in done)) next
          done[n] = 1
          rel = a - st[n]; o = k[n] + rel
          print n, o, length(m) > SP
          b = ord[substr(line[n], rel + 1, 1)] + 0
          cl = (b >= 240) ? 4 : (b >= 224) ? 3 : (b >= 192) ? 2 : 1
          print n, o + cl
        }' "$WORK/en-k" "$WORK/en-suf" \
        <("$GREP" -n -b -o $flag -E -f <(printf '%s\n' "$pat") "$WORK/en-suf" 2>/dev/null || true) \
        > "$WORK/en-k2" || cannot "redaction failed"
      if [ -f "$WORK/en-spans" ]; then cat "$WORK/en-spans" >> "$WORK/spans" || cannot "redaction failed"; rm -f "$WORK/en-spans"; fi
      mv "$WORK/en-k2" "$WORK/en-k" || cannot "redaction failed"
    done
    j=$((j + 1))
  done
  return 0
}
show_redacted() {
  local f=$1 want bad l pass settled=1
  [ "$SHOW_REDACTED" = 1 ] || return 0
  want=$(printf '%s\n' $SCAN_HITS | tr '\n' ',') || cannot "redaction failed"
  bad=$(printf '%s\n' $SCAN_BAD | tr '\n' ',') || cannot "redaction failed"
  LC_ALL=C awk -v want=",$want" -v bad=",$bad" -v M="$WORK/red-map" '
    index(want, "," FNR ",") && !index(bad, "," FNR ",") { print FNR > M; print }' "$f" > "$WORK/hl" \
    || cannot "redaction failed"
  : > "$WORK/spans"; : > "$WORK/red"
  if [ -s "$WORK/hl" ]; then
    cp "$WORK/hl" "$WORK/hl-cur" || cannot "redaction failed"
    pass=0
    while :; do
      pass=$((pass + 1))
      if [ $pass -gt 64 ]; then settled=0; break; fi
      LC_ALL=C awk '
        FILENAME == ARGV[1] { st[FNR] = pos; pos += length($0) + 1; next }
        FILENAME == ARGV[2] { known[$0] = 1; next }
        {
          i = index($0, ":"); n = substr($0, 1, i - 1) + 0; r = substr($0, i + 1)
          j = index(r, ":"); a = substr(r, 1, j - 1) + 0; m = substr(r, j + 1)
          if (m == "") next
          k = n " " (a - st[n]) " " length(m)
          if (!(k in known)) { known[k] = 1; print k }
        }' "$WORK/hl-cur" "$WORK/spans" <(redact_spans_raw "$WORK/hl-cur") > "$WORK/spans-new" \
        || cannot "redaction failed"
      [ -s "$WORK/spans-new" ] || break
      cat "$WORK/spans-new" >> "$WORK/spans" || cannot "redaction failed"
      LC_ALL=C awk '
        BEGIN { for (c = 1; c < 256; c++) ord[sprintf("%c", c)] = c; ph = sprintf("%c", 1) }
        FILENAME == ARGV[1] { R[$1] = R[$1] " " ($2 + 1) ":" $3; next }
        {
          s = $0
          if (FNR in R) {
            nr = split(substr(R[FNR], 2), parts, " ")
            for (q = 1; q <= nr; q++) {
              split(parts[q], ol, ":"); o = ol[1] + 0; len = ol[2] + 0
              b = ord[substr(s, o, 1)] + 0
              cl = (b >= 240) ? 4 : (b >= 224) ? 3 : (b >= 192) ? 2 : 1
              if (cl > len) cl = len
              rp = ""; for (z = 0; z < cl; z++) rp = rp ph
              s = substr(s, 1, o - 1) rp substr(s, o + cl)
            }
          }
          print s
        }' "$WORK/spans-new" "$WORK/hl-cur" > "$WORK/hl-next" || cannot "redaction failed"
      mv "$WORK/hl-next" "$WORK/hl-cur" || cannot "redaction failed"
    done
    if [ $settled = 1 ] && ! redact_enumerate; then settled=0; fi
    LC_ALL=C awk -v settled="$settled" '
      function hashes(n,  r) { r = ""; while (n-- > 0) r = r "#"; return r }
      FILENAME == ARGV[1] { orig[FNR] = $0; next }
      FILENAME == ARGV[2] { c = ++cnt[$1]; S[$1, c] = $2 + 1; E[$1, c] = $2 + $3; next }
      {
        i = FNR; s = $0; n = cnt[i]
        if (settled != 1) { print orig[i] "\t(not shown: masking did not settle)"; next }
        for (a = 2; a <= n; a++) {
          ts = S[i, a]; te = E[i, a]; b = a - 1
          while (b >= 1 && S[i, b] > ts) { S[i, b + 1] = S[i, b]; E[i, b + 1] = E[i, b]; b-- }
          S[i, b + 1] = ts; E[i, b + 1] = te
        }
        out = ""; cur = 1; a = 1
        while (a <= n) {
          ms = S[i, a]; me = E[i, a]
          while (a + 1 <= n && S[i, a + 1] <= me + 1) { a++; if (E[i, a] > me) me = E[i, a] }
          if (ms < cur) ms = cur
          if (ms > cur) out = out substr(s, cur, ms - cur)
          if (me >= ms) out = out hashes(me - ms + 1)
          if (me + 1 > cur) cur = me + 1
          a++
        }
        out = out substr(s, cur)
        print orig[i] "\t" out
      }' "$WORK/red-map" "$WORK/spans" "$WORK/hl" > "$WORK/red" || cannot "redaction failed"
  fi
  # Re-check the masked text: a line that still matches is withheld.
  LC_ALL=C cut -f2- "$WORK/red" > "$WORK/red-text" || cannot "redaction failed"
  : > "$WORK/m"
  if [ -s "$WORK/red-text" ]; then
    grep_list -i "$CI_PATS" "$WORK/red-text" case-insensitive
    if [ -n "$CS_PATS" ]; then grep_list "" "$CS_PATS" "$WORK/red-text" case-sensitive; fi
  fi
  LC_ALL=C awk -v bad=",$bad" '
    FILENAME == ARGV[1] { still[$0] = 1; next }
    {
      t = index($0, "\t"); n = substr($0, 1, t - 1); s = substr($0, t + 1)
      if (index(bad, "," n ",")) next
      if (FNR in still) s = "(not shown: masking incomplete)"
      gsub(/[\001-\010\013-\037\177]/, "?", s); gsub(/\302[\200-\237]/, "?", s)
      print "  line " n ": " s
    }' "$WORK/m" "$WORK/red" >&2 || cannot "redaction failed"
  for l in $SCAN_BAD; do echo "  line $l: (not valid UTF-8; not shown)" >&2; done
  rm -f "$WORK/red" "$WORK/red-text" "$WORK/hl" "$WORK/hl-cur" "$WORK/red-map" || cannot "rm failed"
}

# ---- state ---------------------------------------------------------------
HITS=0 N_COMMITS=0 N_BLOBS=0 N_BIN=0 N_PATHS=0 N_FIELDS=0 N_REFLINES=0
hit() { # $1 location; under --published hits are collected and compared with the baseline
  HITS=$((HITS + 1))
  if [ "$MODE" = --published ]; then printf '%s\n' "$1" >> "$WORK/hits" || cannot "write failed"
  else echo "$ME: HIT: $1" >&2; fi
}

has_nul() { # $1 file: returns 0 when it holds a NUL byte
  local n
  n=$(LC_ALL=C tr -cd '\000' < "$1" | wc -c | tr -d ' ') || cannot "NUL check failed"
  [ "$n" -gt 0 ]
}
seen() { # $1 file, $2 sha: returns 0 if already seen, else records it and returns 1
  local rc=0
  "$GREP" -Fx -e "$2" "$1" >/dev/null 2>&1 || rc=$?
  case $rc in 0) return 0 ;; 1) printf '%s\n' "$2" >> "$1" || cannot "write failed"; return 1 ;; *) cannot "seen-set lookup failed" ;; esac
}
is_allowed_binary() { # $1 real path: exact whole-line match
  local rc=0
  [ -n "$1" ] || return 1
  P="$1" LC_ALL=C awk 'BEGIN { p = ENVIRON["P"] } $0 == p { f = 1 } END { exit f ? 0 : 1 }' "$WORK/allow" 2>/dev/null || rc=$?
  case $rc in 0) return 0 ;; 1) return 1 ;; *) cannot "binary allow-list lookup failed" ;; esac
}

sweep_blob() { # $1 context, $2 blob sha, $3 display, $4 real path ("" if none)
  local ctx=$1 sha=$2 disp=$3 n rc binary=0
  git cat-file blob "$sha" > "$WORK/blob" 2>/dev/null || cannot "could not read blob $sha"
  if has_nul "$WORK/blob"; then binary=1; fi
  if [ $binary -eq 0 ] && ! iconv -f UTF-8 -t UTF-8 < "$WORK/blob" >/dev/null 2>&1; then binary=1; fi
  if [ $binary -eq 0 ]; then
    rc=0; n=$("$GREP" -c -v -E '^.*$' "$WORK/blob" 2>/dev/null) || rc=$?
    case $rc in 0|1) ;; *) cannot "grep failed on a validity check" ;; esac
    [ "$n" = 0 ] || binary=1
  fi
  if [ $binary -eq 1 ]; then
    N_BIN=$((N_BIN + 1))
    if ! is_allowed_binary "$4"; then
      hit "$ctx $disp: binary or non-UTF-8 content not on the binary allow list"
    fi
    return 0
  fi
  if seen "$WORK/seen-blobs" "$sha"; then return 0; fi
  N_BLOBS=$((N_BLOBS + 1))
  if scan_file "$WORK/blob"; then hit "$ctx $disp line(s) $(lines_desc)"; show_redacted "$WORK/blob"; fi
}

# sweep_entries CONTEXT FILE KIND: KIND "diff" reads git diff-tree -r -z
# output (meta and path records), KIND "tree" reads git ls-tree -r -z output.
# Paths are scanned together in one file (a path holding a newline alone),
# then each entry's blob is swept.
sweep_entries() {
  local ctx=$1 f=$2 kind=$3 meta rec p i=0 n=0 line=0 j l disp
  E_PATH=() E_MODE=() E_SHA=() E_IDX=() E_FLAG=() LMAP=()
  : > "$WORK/paths"
  add_entry() { # $1 path, $2 mode, $3 sha, $4 listing index
    E_PATH[$n]=$1; E_MODE[$n]=$2; E_SHA[$n]=$3; E_IDX[$n]=$4; E_FLAG[$n]=0
    case $1 in
      *$'\n'*)
        printf '%s' "$1" > "$WORK/one" || cannot "write failed"
        if scan_file "$WORK/one"; then E_FLAG[$n]=1; fi ;;
      *)
        printf '%s\n' "$1" >> "$WORK/paths" || cannot "write failed"
        line=$((line + 1)); LMAP[$line]=$n ;;
    esac
    n=$((n + 1))
  }
  if [ "$kind" = diff ]; then
    while IFS= read -r -d '' meta && IFS= read -r -d '' p; do
      i=$((i + 1))
      set -f; set -- $meta; set +f          # :oldmode newmode oldsha newsha status
      case ${5:-} in D*|U*) continue ;; esac
      add_entry "$p" "$2" "$4" "$i"
    done < "$f"
  else
    while IFS= read -r -d '' rec; do
      i=$((i + 1))
      meta=${rec%%$'\t'*}; p=${rec#*$'\t'}
      set -f; set -- $meta; set +f          # mode type sha
      add_entry "$p" "$1" "$3" "$i"
    done < "$f"
  fi
  if [ -s "$WORK/paths" ] && scan_file "$WORK/paths"; then
    for l in $SCAN_HITS $SCAN_BAD; do E_FLAG[${LMAP[$l]}]=1; done
    if [ "$SHOW_REDACTED" = 1 ]; then
      echo "$ME: redacted path names for $ctx (line N is the Nth path listed without a newline):" >&2
      show_redacted "$WORK/paths"
    fi
  fi
  j=0
  while [ $j -lt $n ]; do
    p=${E_PATH[$j]}
    disp="path $p"
    case $p in *[![:print:]]*) disp="path#${E_IDX[$j]}" ;; esac
    N_PATHS=$((N_PATHS + 1))
    if [ "${E_FLAG[$j]}" = 1 ]; then
      disp="path#${E_IDX[$j]}"
      hit "$ctx $disp: the path name matches a pattern or is not valid UTF-8"
    fi
    if [ "${E_MODE[$j]}" != 160000 ] && ! is_zero "${E_SHA[$j]}"; then sweep_blob "$ctx" "${E_SHA[$j]}" "$disp" "$p"; fi
    j=$((j + 1))
  done
}

sweep_commit() { # $1 commit sha
  local c=$1
  if seen "$WORK/seen-commits" "$c"; then return 0; fi
  N_COMMITS=$((N_COMMITS + 1))
  # Under --published every (commit, path) is judged against the baseline, so
  # a known leak copied to a new place shows as new: blob dedupe is per commit.
  if [ "$MODE" = --published ]; then : > "$WORK/seen-blobs"; fi
  git cat-file commit "$c" > "$WORK/obj" 2>/dev/null || cannot "could not read commit $c"
  if has_nul "$WORK/obj"; then hit "commit $c holds a NUL byte, so its text is not checkable"; fi
  : > "$WORK/h"; : > "$WORK/b"
  LC_ALL=C awk -v H="$WORK/h" -v B="$WORK/b" '
    inh == 0 && NR == 1 { inh = 1 }
    inh == 1 && $0 == "" { inh = 2; next }
    inh == 1 {
      print > H; next
    }
    { print > B }' "$WORK/obj" || cannot "could not split commit $c"
  N_FIELDS=$((N_FIELDS + 2))
  if scan_file "$WORK/h"; then
    if [ -n "$SCAN_BAD" ]; then hit "commit $c header (not valid UTF-8, so not fully checkable)"; else hit "commit $c header"; fi
    show_redacted "$WORK/h"
  fi
  if scan_file "$WORK/b"; then hit "commit $c message:$(lines_desc)"; show_redacted "$WORK/b"; fi
  git diff-tree -r -m --root --no-renames --no-commit-id -z "$c" > "$WORK/dt" 2>/dev/null || cannot "git diff-tree failed on $c"
  sweep_entries "commit $c" "$WORK/dt" diff
}

sweep_commit_list() { # $1 file of commit shas, oldest first
  local c
  while IFS= read -r c; do
    [ -n "$c" ] || continue
    sweep_commit "$c"
  done < "$1"
}

is_sha() { case $1 in ''|*[!0-9a-f]*) return 1 ;; esac; [ ${#1} -eq 40 ] || [ ${#1} -eq 64 ]; }
is_zero() { case $1 in *[!0]*) return 1 ;; *) return 0 ;; esac; }

# sweep_pushed OBJ: follows a pushed object through any tag chain to a commit,
# tree or blob, sweeping every tag object on the way.
sweep_pushed() {
  local obj=$1 t depth=0
  while :; do
    t=$(git cat-file -t "$obj" 2>/dev/null) || cannot "could not read object $obj"
    case $t in
      tag)
        depth=$((depth + 1)); [ $depth -le 32 ] || cannot "tag chain too deep at $obj"
        git cat-file tag "$obj" > "$WORK/obj" 2>/dev/null || cannot "could not read tag $obj"
        if has_nul "$WORK/obj"; then hit "tag object $obj holds a NUL byte, so its text is not checkable"; fi
        N_FIELDS=$((N_FIELDS + 1))
        if scan_file "$WORK/obj"; then hit "tag object $obj line(s) $(lines_desc)"; show_redacted "$WORK/obj"; fi
        obj=$(LC_ALL=C awk 'NR == 1 && $1 == "object" { print $2 }' "$WORK/obj") || cannot "could not parse tag"
        is_sha "$obj" || cannot "could not parse tag"
        ;;
      commit)
        { printf '%s\n' "$obj"; cat "$WORK/excl"; } | git rev-list --topo-order --reverse --stdin > "$WORK/commits" 2>/dev/null \
          || cannot "git rev-list failed for $obj"
        sweep_commit_list "$WORK/commits"
        return 0 ;;
      tree)
        git ls-tree -r -z "$obj" > "$WORK/lt" 2>/dev/null || cannot "git ls-tree failed on $obj"
        sweep_entries "tree $obj" "$WORK/lt" tree
        return 0 ;;
      blob)
        sweep_blob "pushed blob $obj" "$obj" "(no path)" ""
        return 0 ;;
      *) cannot "unexpected object type at $obj" ;;
    esac
  done
}

# ---- modes ---------------------------------------------------------------
if [ "$MODE" = --range ] || [ "$MODE" = --published ]; then
  : > "$WORK/hits"
  git rev-list --topo-order --reverse "${RANGE_ARGS[@]}" > "$WORK/commits" 2>/dev/null || cannot "git rev-list rejected the range"
  sweep_commit_list "$WORK/commits"
elif [ "$MODE" = --pre-commit ]; then
  if git rev-parse --verify -q HEAD >/dev/null 2>&1; then BASE=HEAD
  else BASE=$(git hash-object -t tree /dev/null 2>/dev/null) || cannot "could not compute the empty tree"; fi
  git diff-index --cached -r --no-renames -z "$BASE" > "$WORK/dt" 2>/dev/null || cannot "git diff-index failed"
  sweep_entries "staged" "$WORK/dt" diff
elif [ "$MODE" = --commit-msg ]; then
  [ -f "$MSG_FILE" ] && [ -r "$MSG_FILE" ] || cannot "the commit message file is not readable"
  # The whole file is swept, comment lines and any scissors section included:
  # git keeps text below a scissors line unless -v or --cleanup=scissors is in
  # play, and the hook cannot tell which.
  cat "$MSG_FILE" > "$WORK/msg" 2>/dev/null || cannot "the commit message file is not readable"
  N_FIELDS=$((N_FIELDS + 2))
  if has_nul "$MSG_FILE"; then hit "commit message holds a NUL byte, so it is not checkable"
  elif scan_file "$WORK/msg"; then
    hit "commit message line(s) $(lines_desc)"
    show_redacted "$WORK/msg"
    if printf '%s\n' $SCAN_HITS | LC_ALL=C awk 'FILENAME == ARGV[1] { w[$1] = 1; next } (FNR in w) && /^#/ { f = 1 } END { exit f ? 0 : 1 }' - "$WORK/msg" 2>/dev/null; then
      echo "$ME: a hit in a '#' line can come from git's own status text or a commit -v diff (a path, a branch, a removed line). Fix the source, or commit with -m." >&2
    fi
  fi
  { git var GIT_AUTHOR_IDENT && git var GIT_COMMITTER_IDENT; } > "$WORK/one" 2>/dev/null || cannot "git var failed"
  if scan_file "$WORK/one"; then hit "commit identity"; show_redacted "$WORK/one"; fi
else
  # Read every ref line first: later git commands must not consume stdin.
  cat > "$WORK/stdin" || cannot "could not read the push lines"
  : > "$WORK/excl"
  if [ -s "$WORK/stdin" ]; then
    git ls-remote "$URL" > "$WORK/remote" 2>/dev/null || cannot "could not read the remote's refs (git ls-remote)"
    while IFS= read -r line || [ -n "$line" ]; do
      sha=${line%%[[:space:]]*}
      if git cat-file -e "$sha^{commit}" 2>/dev/null; then printf '^%s\n' "$sha" >> "$WORK/excl"; fi
    done < "$WORK/remote"
  fi
  while IFS=' ' read -r local_ref local_sha remote_ref remote_sha extra || [ -n "${local_ref:-}" ]; do
    N_REFLINES=$((N_REFLINES + 1))
    if [ -z "${remote_sha:-}" ] || [ -n "${extra:-}" ] || ! is_sha "${local_sha:-}" || ! is_sha "$remote_sha"; then
      cannot "push line $N_REFLINES is malformed"
    fi
    if is_zero "$local_sha"; then local_ref=""; continue; fi      # deletion: nothing published
    printf '%s\n%s\n' "$local_ref" "$remote_ref" > "$WORK/one" || cannot "write failed"
    N_FIELDS=$((N_FIELDS + 1))
    if scan_file "$WORK/one"; then hit "push line $N_REFLINES ($local_sha): a ref name matches a pattern or is not valid UTF-8"; fi
    sweep_pushed "$local_sha"
    local_ref=""
  done < "$WORK/stdin"
fi

SUMMARY="$N_CI case-insensitive and $N_CS case-sensitive patterns loaded; swept $N_COMMITS commits, $N_BLOBS text blobs, $N_BIN binary, $N_PATHS paths, $N_FIELDS text fields"
if [ "$MODE" = --pre-push ]; then SUMMARY="$SUMMARY, $N_REFLINES push lines"; fi

if [ "$MODE" = --published ]; then
  BASELINE=${MEMENTO_SWEEP_BASELINE:-$HOME/.memento/sweep-baseline.txt}
  if command -v sha256sum >/dev/null 2>&1; then SHA256="sha256sum"
  elif command -v shasum >/dev/null 2>&1; then SHA256="shasum -a 256"
  else cannot "no sha256 tool found"; fi
  LISTS_DIGEST=$(printf '%s\n--\n%s\n' "$CI_PATS" "$CS_PATS" | $SHA256 | cut -d' ' -f1) || cannot "hashing failed"
  [ ${#LISTS_DIGEST} -eq 64 ] || cannot "hashing failed"
  : > "$WORK/hit-hashes"
  while IFS= read -r h || [ -n "$h" ]; do
    printf '%s\n%s' "$LISTS_DIGEST" "$h" | $SHA256 | cut -d' ' -f1 >> "$WORK/hit-hashes" || cannot "hashing failed"
  done < "$WORK/hits"
  [ ! -d "$BASELINE" ] || cannot "the baseline path is a directory: $BASELINE"
  if [ "$UPDATE_BASELINE" = 1 ]; then
    PREV=0
    if [ -f "$BASELINE" ]; then PREV=$(wc -l < "$BASELINE" | tr -d ' ') || cannot "could not read the baseline"; fi
    mkdir -p "$(dirname "$BASELINE")" || cannot "could not create the baseline directory"
    sort -u "$WORK/hit-hashes" > "$WORK/baseline-new" || cannot "sort failed"
    # Written through cat so a symlinked baseline keeps its link.
    cat "$WORK/baseline-new" > "$BASELINE" || cannot "could not write the baseline"
    NOW=$(wc -l < "$BASELINE" | tr -d ' ') || cannot "could not read the baseline back"
    echo "$ME: baseline written: $NOW known hit(s) recorded at $BASELINE (previously $PREV). $SUMMARY"
    FINISHED=1
    exit 0
  fi
  KNOWN=0 NEW=0
  if [ -f "$BASELINE" ]; then
    exec 3< "$WORK/hits"
    while IFS= read -r hh; do
      IFS= read -r h <&3 || h=""
      rc=0; "$GREP" -Fx -e "$hh" "$BASELINE" >/dev/null 2>&1 || rc=$?
      case $rc in
        0) KNOWN=$((KNOWN + 1)) ;;
        1) NEW=$((NEW + 1)); echo "$ME: HIT (new): $h" >&2 ;;
        *) cannot "baseline lookup failed" ;;
      esac
    done < "$WORK/hit-hashes"
    exec 3<&-
  else
    echo "$ME: no baseline at $BASELINE: every hit counts as new (record known hits with --update-baseline)" >&2
    while IFS= read -r h || [ -n "$h" ]; do NEW=$((NEW + 1)); echo "$ME: HIT (new): $h" >&2; done < "$WORK/hits"
  fi
  if [ "$NEW" -gt 0 ]; then
    if [ "$KNOWN" -eq 0 ] && [ -s "$BASELINE" ]; then
      echo "$ME: none of the baseline's hits matched: if the lists changed since it was recorded, review the hits with --range, then run --update-baseline" >&2
    fi
    echo "$ME: BLOCKED: $KNOWN known hits, $NEW new. $SUMMARY" >&2
    FINISHED=1
    exit 1
  fi
  echo "$ME: clean against the baseline: $KNOWN known hits, 0 new. $SUMMARY"
  FINISHED=1
  exit 0
fi
if [ "$HITS" -gt 0 ]; then
  echo "$ME: BLOCKED: $HITS hit(s). $SUMMARY" >&2
  echo "$ME: hits are reported by location. Open a hit location in redacted form." >&2
  FINISHED=1
  exit 1
fi
echo "$ME: clean. $SUMMARY"
FINISHED=1
exit 0
