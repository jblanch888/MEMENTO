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
# Output carries no matched token, pattern or line of content. A hit is
# reported by location: commit, header or message line, path and line number.
# A path that matches, or holds a non-printable character, is shown as path#N
# (the Nth entry of that commit's diff-tree listing). Patterns reach grep
# through process substitution, so they stay off the command line and off disk.
#
# Modes (one is required):
#   --pre-push <remote> <url>   called by .githooks/pre-push, with git's ref lines on stdin
#   --range <rev-list args>     standalone, e.g. --range origin/main..HEAD, or --range HEAD
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
MODE=${1:-}
case $MODE in
  --pre-push) [ $# -ge 3 ] || cannot "--pre-push needs <remote> <url>"; URL=$3 ;;
  --range)    shift; [ $# -ge 1 ] || cannot "--range needs rev-list arguments"; RANGE_ARGS=("$@") ;;
  *)          cannot "usage: $ME --pre-push <remote> <url> | --range <rev-list args>" ;;
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
# errexit is suspended, so every failure inside them is handled explicitly,
# pipelines included (through PIPESTATUS).

# valid_lines FILE: writes the numbers of lines that are not valid UTF-8 to
# $WORK/inv. Returns 0 when every line is valid. grep is the judge, because a
# line grep cannot parse is a line it cannot search; iconv is a second check,
# and if it alone objects, every line is marked.
valid_lines() {
  local st
  "$GREP" -n -v -E '^.*$' "$1" 2>/dev/null | LC_ALL=C cut -d: -f1 > "$WORK/inv"
  st=("${PIPESTATUS[@]}")
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
  "$GREP" -n $1 -E -f <(printf '%s\n' "$2") "$3" 2>/dev/null | LC_ALL=C cut -d: -f1 >> "$WORK/m"
  st=("${PIPESTATUS[@]}")
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

# ---- state ---------------------------------------------------------------
HITS=0 N_COMMITS=0 N_BLOBS=0 N_BIN=0 N_PATHS=0 N_FIELDS=0 N_REFLINES=0
hit() { echo "$ME: HIT: $1" >&2; HITS=$((HITS + 1)); }

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
  if scan_file "$WORK/blob"; then hit "$ctx $disp line(s) $(lines_desc)"; fi
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
      case ${5:-} in D*) continue ;; esac
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
    if [ "${E_MODE[$j]}" != 160000 ]; then sweep_blob "$ctx" "${E_SHA[$j]}" "$disp" "$p"; fi
    j=$((j + 1))
  done
}

sweep_commit() { # $1 commit sha
  local c=$1
  if seen "$WORK/seen-commits" "$c"; then return 0; fi
  N_COMMITS=$((N_COMMITS + 1))
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
  fi
  if scan_file "$WORK/b"; then hit "commit $c message:$(lines_desc)"; fi
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
        if scan_file "$WORK/obj"; then hit "tag object $obj line(s) $(lines_desc)"; fi
        obj=$(LC_ALL=C awk 'NR == 1 && $1 == "object" { print $2 }' "$WORK/obj") || cannot "could not parse tag"
        is_sha "$obj" || cannot "could not parse tag"
        ;;
      commit)
        { printf '%s\n' "$obj"; cat "$WORK/excl"; } | git rev-list --reverse --stdin > "$WORK/commits" 2>/dev/null \
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
if [ "$MODE" = --range ]; then
  git rev-list --reverse "${RANGE_ARGS[@]}" > "$WORK/commits" 2>/dev/null || cannot "git rev-list rejected the range"
  sweep_commit_list "$WORK/commits"
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
if [ "$HITS" -gt 0 ]; then
  echo "$ME: BLOCKED: $HITS hit(s). $SUMMARY" >&2
  echo "$ME: hits are reported by location. Open a hit location in redacted form." >&2
  FINISHED=1
  exit 1
fi
echo "$ME: clean. $SUMMARY"
FINISHED=1
exit 0
