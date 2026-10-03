#!/usr/bin/env bash
# Test suite for the confidentiality sweep (slice 1a of the leak-hardening plan).
#
# Every case builds a fresh scratch repository plus bare remotes under one
# mktemp directory, with throwaway lists that hold only invented nonsense words.
# The real banned lists are never read: HOME points at a temporary directory.
#
# Environment:
#   SWEEP       script under test (default: confidentiality-sweep.sh beside this file)
#   HOOK        hook under test (default: <repo>/.githooks/pre-push)
#   SWEEP_BASH  interpreter used for direct runs of the script (default: bash)
#   ONLY        extended regex; run only the cases whose name matches
#   KEEP=1      keep the scratch directory after the run
#
# The suite touches the script and the hook only through $SWEEP and $HOOK, so a
# mutated copy can be swapped in by setting those variables.
#
# Interface contract exercised here:
#   --pre-push <remote-name-or-url> <url>   reads git's pre-push stdin lines
#   --range <rev-range>                     standalone
#   no mode flag                            exit 2
#   exit codes: 0 clean, 1 hit, 2 cannot run
#   output on a hit names the full 40 character sha of the introducing commit
#   output never contains a matched token or any pattern text
#
# Choices where the spec leaves room:
#   * Direct runs execute the copy of $SWEEP placed at memento/tools/ inside the
#     scratch repository, so the script works whether it finds its repository
#     from the working directory or from its own location.
#   * The binary allow list is committed in the base commit (published, tracked
#     and present in the working tree), so either reading of "tracked" works.
#   * Failing grep: the script calls /usr/bin/grep by absolute path, so a fake
#     grep on PATH cannot be injected. Lists holding an invalid pattern drive the
#     failing-grep cases (an unmatched bracket or parenthesis makes grep exit 2).
#   * Failing git: a fake git earlier on PATH exits 2 for chosen subcommands only
#     and passes everything else to the real git. The case fails if the fake was
#     never reached, because a pass would then prove nothing.
#   * The whole suite runs under LC_ALL=C, a hostile locale, so a script that
#     fails to pin its own UTF-8 locale fails the accented cases.
#   * The published set comes from git ls-remote on the pushed URL, so the
#     remote sha on a stdin line is ignored: a URL as the remote argument and an
#     unknown remote sha both give exit 1 when the outgoing commit holds a token.

HERE=$(cd "$(dirname "$0")" && pwd)

case "${SWEEP:-}" in
  "") SWEEP=$HERE/confidentiality-sweep.sh ;;
  /*) ;;
  *) SWEEP=$PWD/$SWEEP ;;
esac
case "${HOOK:-}" in
  "") HOOK=$HERE/../../.githooks/pre-push ;;
  /*) ;;
  *) HOOK=$PWD/$HOOK ;;
esac
SWEEP_BASH=${SWEEP_BASH:-bash}
# The real commit-time hook files, copied into the scratch repository by the
# cases that run a real git commit or merge.
HOOK_PRE_COMMIT=${HOOK_PRE_COMMIT:-$HERE/../../.githooks/pre-commit}
HOOK_COMMIT_MSG=${HOOK_COMMIT_MSG:-$HERE/../../.githooks/commit-msg}
HOOK_PRE_MERGE_COMMIT=${HOOK_PRE_MERGE_COMMIT:-$HERE/../../.githooks/pre-merge-commit}

if [ ! -f "$SWEEP" ]; then
  echo "harness: script under test not found: $SWEEP" >&2
  exit 2
fi
if [ ! -f "$HOOK" ]; then
  echo "harness: hook under test not found: $HOOK" >&2
  exit 2
fi

REAL_GIT=$(command -v git)
if [ -z "$REAL_GIT" ]; then
  echo "harness: git not found" >&2
  exit 2
fi

T=$(mktemp -d "${TMPDIR:-/tmp}/sweep-tests.XXXXXX") || exit 2
cleanup() {
  if [ "${KEEP:-0}" = 1 ]; then
    echo "scratch directory kept: $T"
  else
    rm -rf "$T"
  fi
}
trap cleanup EXIT

# Isolate from the user's configuration, hooks and real lists.
mkdir -p "$T/home"
export HOME="$T/home"
export XDG_CONFIG_HOME="$HOME/.config"
export GIT_CONFIG_NOSYSTEM=1
export GIT_CONFIG_GLOBAL=/dev/null
export GIT_TERMINAL_PROMPT=0
export LC_ALL=C
export LANG=C
unset GIT_DIR GIT_WORK_TREE GIT_INDEX_FILE GIT_PREFIX GIT_COMMON_DIR \
  GIT_OBJECT_DIRECTORY GIT_ALTERNATE_OBJECT_DIRECTORIES \
  GIT_AUTHOR_NAME GIT_AUTHOR_EMAIL GIT_COMMITTER_NAME GIT_COMMITTER_EMAIL \
  MEMENTO_BANNED_TOKENS MEMENTO_BANNED_TOKENS_CS MEMENTO_NO_CS_LIST

RESULTS=$T/results
: >"$RESULTS"

ZERO40=0000000000000000000000000000000000000000
ZERO64=${ZERO40}000000000000000000000000
UNKNOWN_SHA=1234567890123456789012345678901234567890
UNKNOWN_SHA2=2222222222222222222222222222222222222222

# ---------------------------------------------------------------- helpers

g()  { git -C "$W" "$@" >/dev/null 2>&1; }   # quiet git in the work repository
gs() { git -C "$W" "$@" 2>/dev/null; }       # git whose output is wanted
H()  { gs rev-parse HEAD; }
rsha() { gs rev-parse "$1"; }

put() {   # path, one-line content: write and stage
  mkdir -p "$W/$(dirname "$1")"
  printf '%s\n' "$2" >"$W/$1"
  git -C "$W" --literal-pathspecs add -- "$1" >/dev/null 2>&1
}
putf() {  # path, printf format, args: write exact bytes and stage
  local p=$1
  shift
  mkdir -p "$W/$(dirname "$p")"
  printf "$@" >"$W/$p"
  git -C "$W" --literal-pathspecs add -- "$p" >/dev/null 2>&1
}
cm() {    # subject [body]: commit what is staged
  if [ $# -gt 1 ]; then g commit -q -m "$1" -m "$2"; else g commit -q -m "$1"; fi
}
cf() {    # path, content [subject]: add one file and commit it
  put "$1" "$2"
  cm "${3:-add $1}"
}
publish() {   # push refs to origin without the hook, then refresh tracking refs
  g push -q --no-verify origin "$@"
  g fetch -q origin
}
sl() {    # append one pre-push stdin line: local ref, local sha, remote ref, remote sha
  printf '%s %s %s %s\n' "$1" "$2" "$3" "$4" >>"$STDIN"
}
forbid() {  # add a throwaway token or pattern string that must never be echoed
  printf '%s\n' "$1" >>"$FORBID"
}
remote_head() {  # sha of a branch on the bare origin, or empty
  git --git-dir="$R" rev-parse -q --verify "refs/heads/$1" 2>/dev/null
}

mkcase() {
  CN=$1
  C=$T/$CN
  W=$C/w
  R=$C/remote.git
  R2=$C/other.git
  OUT=$C/out.txt
  STDIN=$C/stdin.txt
  FORBID=$C/forbid.txt
  L_CI=$C/lists/ci.txt
  L_CS=$C/lists/cs.txt
  NOCS=0
  FAKEPATH=0
  XTRACE=0
  SWEEP_FLAGS=""
  BASELINE=$C/baseline.txt
  OUTMATCH=""
  EXTRA_BAD=""
  RC=""
  mkdir -p "$C/lists" "$C/fake" "$W"
  : >"$STDIN"
  : >"$OUT"
  printf '%s\n' '# throwaway case-insensitive patterns (invented words only)' \
    zorblax quuxwidget >"$L_CI"
  printf '%s\n' '# throwaway case-sensitive pattern' Wibblefrotz >"$L_CS"
  printf '%s\n' zorblax quuxwidget Wibblefrotz >"$FORBID"
  git init -q --bare "$R" >/dev/null 2>&1
  git init -q --bare "$R2" >/dev/null 2>&1
  git init -q "$W" >/dev/null 2>&1
  g symbolic-ref HEAD refs/heads/main
  g config user.name "Test Person"
  g config user.email "test@example.invalid"
  g config commit.gpgsign false
  g config tag.gpgsign false
  g config core.hooksPath .githooks
  g remote add origin "$R"
  g remote add other "$R2"
  mkdir -p "$W/memento/tools" "$W/.githooks"
  cp "$SWEEP" "$W/memento/tools/confidentiality-sweep.sh"
  cp "$HOOK" "$W/.githooks/pre-push"
  chmod +x "$W/.githooks/pre-push"
  printf '%s\n' 'assets/known.bin' >"$W/memento/tools/sweep-binary-allow.txt"
  put README "hello"
  g add -A
  cm base
  BASE=$(H)
  publish main
}

apply_env() {   # inside a subshell: set the sweep's environment for this case
  if [ -n "$L_CI" ]; then export MEMENTO_BANNED_TOKENS=$L_CI; else unset MEMENTO_BANNED_TOKENS; fi
  if [ -n "$L_CS" ]; then export MEMENTO_BANNED_TOKENS_CS=$L_CS; else unset MEMENTO_BANNED_TOKENS_CS; fi
  export MEMENTO_SWEEP_BASELINE=${BASELINE:-$C/baseline.txt}
  if [ "$NOCS" = 1 ]; then export MEMENTO_NO_CS_LIST=1; else unset MEMENTO_NO_CS_LIST; fi
  if [ "$FAKEPATH" = 1 ]; then export PATH="$C/fake:$PATH"; fi
}

run_sweep() {   # direct run of the copy in the scratch repository; stdin from $STDIN
  ( cd "$W" && apply_env
    if [ "$XTRACE" = 1 ]; then
      exec env SHELLOPTS=xtrace "$SWEEP_BASH" $SWEEP_FLAGS "$W/memento/tools/confidentiality-sweep.sh" "$@"
    else
      exec "$SWEEP_BASH" $SWEEP_FLAGS "$W/memento/tools/confidentiality-sweep.sh" "$@"
    fi ) <"$STDIN" >"$OUT" 2>&1
  RC=$?
}

hpush() {   # a real git push, which runs the hook
  ( cd "$W" && apply_env && exec git push "$@" ) </dev/null >"$OUT" 2>&1
  RC=$?
}

pp_main() {   # one stdin line for main (HEAD against the published base), then run
  sl refs/heads/main "$(H)" refs/heads/main "$BASE"
  run_sweep --pre-push origin "$R"
}

make_fake_git() {   # space-separated subcommands that must fail with exit 2
  cat >"$C/fake/git" <<EOF
#!/bin/sh
sub=
skip=0
for a in "\$@"; do
  if [ \$skip -eq 1 ]; then skip=0; continue; fi
  case \$a in
    -C|-c|--git-dir|--work-tree|--namespace) skip=1 ;;
    -*) ;;
    *) sub=\$a; break ;;
  esac
done
for f in $1; do
  if [ "\$sub" = "\$f" ]; then : > "$C/fake-git-reached"; exit 2; fi
done
exec "$REAL_GIT" "\$@"
EOF
  chmod +x "$C/fake/git"
  FAKEPATH=1
}

make_fake_cmd() {   # command name, exit status: a stand-in that always fails, scoped to this case
  printf '#!/bin/sh\nexit %s\n' "$2" >"$C/fake/$1"
  chmod +x "$C/fake/$1"
  FAKEPATH=1
}

rc_ok() {   # spec, rc.  Spec: a number, "N" for any non-zero, or "1|2" alternatives
  case "$1" in
    N) [ "$2" -ne 0 ] ;;
    *) case "|$1|" in *"|$2|"*) return 0 ;; esac; return 1 ;;
  esac
}
rc_label() {
  case "$1" in
    N) echo "non-zero" ;;
    *'|'*) echo "$1" | sed 's/|/ or /g' ;;
    *) echo "$1" ;;
  esac
}

report() {   # status text
  echo "$1"
  echo "$1" >>"$RESULTS"
}

finish() {   # expected-rc-spec [full sha that must appear in the output]
  local want=$1 sha=${2-} bad=""
  if ! rc_ok "$want" "$RC"; then
    bad="expected $(rc_label "$want"), got $RC"
  elif [ -n "$EXTRA_BAD" ]; then
    bad=$EXTRA_BAD
  elif [ -n "$sha" ] && ! grep -q -F "$sha" "$OUT"; then
    bad="expected exit $RC to name the full commit sha, which is missing from the output"
  elif [ -n "$OUTMATCH" ] && ! grep -q -E "$OUTMATCH" "$OUT"; then
    bad="expected output to match: $OUTMATCH"
  elif grep -q -i -F -f "$FORBID" "$OUT"; then
    bad="output echoed a throwaway token or pattern"
  fi
  if [ -z "$bad" ]; then report "PASS $CN"; else report "FAIL $CN ($bad)"; fi
}

# ------------------------------------------------------- mode and usage

t_no_mode_flag_no_args() { run_sweep; finish 2; }
t_no_mode_flag_positional() { run_sweep origin "$R"; finish 2; }
t_unknown_mode_flag() { run_sweep --bogus; finish 2; }
t_range_missing_argument() { run_sweep --range; finish 2; }

t_hook_contract_text() {
  local want='exec bash "$(git rev-parse --show-toplevel)/memento/tools/confidentiality-sweep.sh" --pre-push "$@"'
  RC=0
  grep -q -F -x -- "$want" "$HOOK" || EXTRA_BAD="the hook lacks the contract exec line"
  finish 0
}

# ------------------------------------------- real git push through the hook

t_hook_clean_allow() {
  cf docs/a.txt "alpha beta"
  hpush origin main
  [ "$(remote_head main)" = "$(H)" ] || EXTRA_BAD="clean push did not reach the remote"
  finish 0
}
t_hook_token_block() {
  local x
  cf notes.txt "this line holds zorblax"
  x=$(H)
  hpush origin main
  [ "$(remote_head main)" = "$BASE" ] || EXTRA_BAD="blocked push still advanced the remote"
  finish N "$x"
}
t_hook_cannot_run_blocks() {
  # git push reports any failing hook as its own exit 1, so the hook's own exit
  # code is checked by running the hook directly after the real push.
  L_CI=$C/lists/missing.txt
  cf docs/a.txt "clean"
  hpush origin main
  [ "$(remote_head main)" = "$BASE" ] || EXTRA_BAD="cannot-run push still advanced the remote"
  [ "$RC" -ne 0 ] || EXTRA_BAD="git push succeeded although the sweep could not run"
  sl refs/heads/main "$(H)" refs/heads/main "$BASE"
  ( cd "$W" && apply_env && exec bash .githooks/pre-push origin "$R" ) <"$STDIN" >"$OUT" 2>&1
  RC=$?
  finish 2
}
t_hook_url_argument_token_block() {
  local x
  cf notes.txt "this line holds zorblax"
  x=$(H)
  hpush "$R" main
  [ "$(remote_head main)" = "$BASE" ] || EXTRA_BAD="blocked push still advanced the remote"
  finish N "$x"
}
t_hook_stale_tracking_ref_block() {
  local x
  cf notes.txt "this line holds zorblax"
  x=$(H)
  publish main
  git --git-dir="$R" update-ref refs/heads/main "$BASE"
  cf docs/d.txt "clean follow-up"
  hpush origin main
  [ "$(remote_head main)" = "$BASE" ] || EXTRA_BAD="blocked push still advanced the remote"
  finish N "$x"
}
t_hook_two_refs_second_blocks() {
  local s
  cf docs/a.txt "clean"
  g checkout -q -b second "$BASE"
  cf leak.txt "holds zorblax"
  s=$(H)
  hpush origin main second
  if [ "$(remote_head main)" != "$BASE" ] || [ -n "$(remote_head second)" ]; then
    EXTRA_BAD="a ref reached the remote although one ref was blocking"
  fi
  finish N "$s"
}
t_hook_tag_message_block() {
  local t
  cf docs/a.txt "clean"
  g tag -a -m "release note mentions zorblax" v1
  t=$(rsha v1)
  publish main
  hpush origin v1
  if git --git-dir="$R" rev-parse -q --verify refs/tags/v1 >/dev/null 2>&1; then
    EXTRA_BAD="the blocked tag reached the remote"
  fi
  finish N "$t"
}
t_hook_delete_ref_allow() {
  g checkout -q -b old
  cf leak.txt "zorblax published long ago"
  publish old
  g checkout -q main
  g branch -q -D old
  hpush origin --delete old
  [ -z "$(remote_head old)" ] || EXTRA_BAD="the branch deletion did not go through"
  finish 0
}
t_hook_new_branch_allow() {
  g checkout -q -b nb
  cf docs/a.txt "clean"
  hpush origin nb
  [ "$(remote_head nb)" = "$(H)" ] || EXTRA_BAD="the clean new branch did not reach the remote"
  finish 0
}

# ------------------------------------------------ pre-push mode, direct

t_prepush_clean_allow() {
  cf docs/a.txt "alpha beta"
  OUTMATCH='[0-9]+ case-insensitive and [0-9]+ case-sensitive patterns loaded'
  pp_main
  finish 0
}
t_prepush_token_block() {
  local x
  cf notes.txt "this line holds zorblax"
  x=$(H)
  pp_main
  finish 1 "$x"
}
t_prepush_token_added_then_removed_block() {
  local c1
  cf leak.txt "holds zorblax"
  c1=$(H)
  cf docs/b.txt "clean"
  g rm -q leak.txt
  cm "remove leak"
  pp_main
  finish 1 "$c1"
}
t_prepush_delete_public_token_allow() {
  cf old.txt "zorblax published earlier"
  cf gone.txt "quuxwidget published earlier"
  publish main
  BASE=$(H)
  put old.txt "clean now"
  g rm -q gone.txt
  cm "scrub published tokens"
  pp_main
  finish 0
}
t_prepush_token_in_ci_upper_case_block() {
  local x
  cf notes.txt "SHOUTING ZORBLAX HERE"
  x=$(H)
  pp_main
  finish 1 "$x"
}
t_prepush_token_without_trailing_newline_block() {
  local x
  putf notes.txt 'clean line\nlast line zorblax'
  cm "no trailing newline"
  x=$(H)
  pp_main
  finish 1 "$x"
}
t_prepush_symlink_target_block() {
  local x
  ln -s zorblax-target "$W/link"
  g add link
  cm "add a symlink"
  x=$(H)
  pp_main
  finish 1 "$x"
}

# ------------------------------------------------------------ range mode

t_range_clean_allow() {
  cf docs/a.txt "alpha beta"
  OUTMATCH='[0-9]+ case-insensitive and [0-9]+ case-sensitive patterns loaded'
  run_sweep --range origin/main..HEAD
  finish 0
}
t_range_token_first_of_three_removed_in_third_block() {
  local c1
  cf leak.txt "holds zorblax"
  c1=$(H)
  cf docs/b.txt "clean"
  g rm -q leak.txt
  cm "remove leak"
  run_sweep --range origin/main..HEAD
  finish 1 "$c1"
}
t_range_delete_public_token_allow() {
  cf old.txt "zorblax published earlier"
  cf gone.txt "quuxwidget published earlier"
  publish main
  put old.txt "clean now"
  g rm -q gone.txt
  cm "scrub published tokens"
  run_sweep --range origin/main..HEAD
  finish 0
}
t_range_whole_blob_token_on_unchanged_line_block() {
  local x
  put f.txt $'line one\nzorblax unchanged line\nline three'
  cm "add f"
  publish main
  put f.txt $'line ONE\nzorblax unchanged line\nline three'
  cm "edit line one only"
  x=$(H)
  run_sweep --range origin/main..HEAD
  finish 1 "$x"
}
t_range_no_upstream_exit2() {
  cf docs/a.txt "clean"
  run_sweep --range '@{upstream}..HEAD'
  finish 2
}
t_range_unknown_revision_exit2() {
  cf docs/a.txt "clean"
  run_sweep --range nosuchref..HEAD
  finish 2
}
t_range_message_block() {
  local x
  put a.txt "clean"
  cm "tidy up" "the body mentions zorblax"
  x=$(H)
  run_sweep --range origin/main..HEAD
  finish 1 "$x"
}
t_range_author_name_block() {
  local x
  put a.txt "clean"
  env GIT_AUTHOR_NAME="Zorblax Person" git -C "$W" commit -q -m "tidy"
  x=$(H)
  run_sweep --range origin/main..HEAD
  finish 1 "$x"
}
t_range_path_name_block() {
  local x
  cf docs/zorblax-notes.txt "clean content"
  x=$(H)
  run_sweep --range origin/main..HEAD
  finish 1 "$x"
}

# ---------------------------------------------------------------- merges

mk_evil_merge() {
  g checkout -q -b side
  cf side.txt "side change"
  g checkout -q main
  cf main.txt "main change"
  g merge -q --no-ff --no-commit side
  put evil.txt "added in the merge itself: zorblax"
  g commit -q -m "merge side"
  MERGE=$(H)
}
t_merge_token_added_in_merge_block() {
  mk_evil_merge
  run_sweep --range origin/main..HEAD
  finish 1 "$MERGE"
}
t_merge_token_removed_later_block() {
  mk_evil_merge
  g rm -q evil.txt
  cm "remove the evil file"
  run_sweep --range origin/main..HEAD
  finish 1 "$MERGE"
}
t_merge_token_added_in_merge_prepush_block() {
  mk_evil_merge
  pp_main
  finish 1 "$MERGE"
}

# ------------------------------------------------------------------ refs

t_refs_two_refs_blocking_one_second() {
  local m s
  cf a.txt "clean one"
  m=$(H)
  g checkout -q -b second "$BASE"
  cf leak.txt "has zorblax in it"
  s=$(H)
  sl refs/heads/main "$m" refs/heads/main "$BASE"
  sl refs/heads/second "$s" refs/heads/second "$ZERO40"
  run_sweep --pre-push origin "$R"
  finish 1 "$s"
}
t_refs_deleted_ref_allow() {
  local o
  g checkout -q -b old
  cf leak.txt "zorblax published long ago"
  o=$(H)
  publish old
  g checkout -q main
  g branch -q -D old
  sl "(delete)" "$ZERO40" refs/heads/old "$o"
  run_sweep --pre-push origin "$R"
  finish 0
}
t_refs_deleted_ref_sha256_zero_allow() {
  local o
  g checkout -q -b old
  cf leak.txt "zorblax published long ago"
  o=$(H)
  publish old
  g checkout -q main
  g branch -q -D old
  sl "(delete)" "$ZERO64" refs/heads/old "$o"
  run_sweep --pre-push origin "$R"
  finish 0
}
t_refs_deleted_ref_then_blocking_ref() {
  local o s
  g checkout -q -b old
  cf leak.txt "zorblax published long ago"
  o=$(H)
  publish old
  g checkout -q main
  g branch -q -D old
  g checkout -q -b second "$BASE"
  cf leak2.txt "fresh zorblax"
  s=$(H)
  sl "(delete)" "$ZERO40" refs/heads/old "$o"
  sl refs/heads/second "$s" refs/heads/second "$ZERO40"
  run_sweep --pre-push origin "$R"
  finish 1 "$s"
}
t_refs_tag_message_block() {
  local t
  cf docs/a.txt "clean"
  g tag -a -m "release note mentions zorblax" v1
  t=$(rsha v1)
  sl refs/tags/v1 "$t" refs/tags/v1 "$ZERO40"
  run_sweep --pre-push origin "$R"
  finish 1
}
t_refs_tagger_name_block() {
  local t
  cf docs/a.txt "clean"
  env GIT_COMMITTER_NAME="Zorblax Tagger" git -C "$W" tag -a -m "clean message" v1 >/dev/null 2>&1
  t=$(rsha v1)
  sl refs/tags/v1 "$t" refs/tags/v1 "$ZERO40"
  run_sweep --pre-push origin "$R"
  finish 1
}
t_refs_tag_name_block() {
  g tag zorblax-v1 "$BASE"
  sl refs/tags/zorblax-v1 "$BASE" refs/tags/zorblax-v1 "$ZERO40"
  run_sweep --pre-push origin "$R"
  finish 1
}
t_refs_new_branch_clean_allow() {
  g checkout -q -b nb
  cf docs/a.txt "clean"
  sl refs/heads/nb "$(H)" refs/heads/nb "$ZERO40"
  run_sweep --pre-push origin "$R"
  finish 0
}
t_refs_new_branch_token_in_second_commit_block() {
  local c2
  g checkout -q -b nb
  cf docs/a.txt "clean"
  cf leak.txt "has zorblax"
  c2=$(H)
  cf docs/c.txt "clean again"
  sl refs/heads/nb "$(H)" refs/heads/nb "$ZERO40"
  run_sweep --pre-push origin "$R"
  finish 1 "$c2"
}
t_refs_unknown_remote_sha_block() {
  # The remote sha on the line is ignored; the token commit still blocks.
  local x
  cf leak.txt "has zorblax"
  x=$(H)
  sl refs/heads/main "$x" refs/heads/main "$UNKNOWN_SHA"
  run_sweep --pre-push origin "$R"
  finish 1 "$x"
}
t_refs_branch_name_block() {
  g checkout -q -b feature/zorblax-thing
  cf docs/a.txt "clean"
  sl refs/heads/feature/zorblax-thing "$(H)" refs/heads/feature/zorblax-thing "$ZERO40"
  run_sweep --pre-push origin "$R"
  finish 1
}
t_refs_remote_ref_name_block() {
  g checkout -q -b clean-local
  cf docs/a.txt "clean"
  sl refs/heads/clean-local "$(H)" refs/heads/zorblax-remote "$ZERO40"
  run_sweep --pre-push origin "$R"
  finish 1
}
t_refs_exit_codes_accumulate_hit_then_error() {
  cf leak.txt "has zorblax"
  sl refs/heads/main "$(H)" refs/heads/main "$BASE"
  sl refs/heads/ghost "$UNKNOWN_SHA2" refs/heads/ghost "$ZERO40"
  run_sweep --pre-push origin "$R"
  finish 2
}
t_refs_exit_codes_accumulate_error_then_hit() {
  cf leak.txt "has zorblax"
  sl refs/heads/ghost "$UNKNOWN_SHA2" refs/heads/ghost "$ZERO40"
  sl refs/heads/main "$(H)" refs/heads/main "$BASE"
  run_sweep --pre-push origin "$R"
  finish 2
}
t_refs_two_remotes_commit_known_only_to_other_block() {
  local x
  cf x.txt "contains zorblax"
  x=$(H)
  g push -q --no-verify other main
  g fetch -q other
  cf d.txt "clean follow-up"
  sl refs/heads/main "$(H)" refs/heads/main "$BASE"
  run_sweep --pre-push origin "$R"
  finish 1 "$x"
}
t_refs_stale_tracking_ref_ahead_of_remote_block() {
  local x
  cf x.txt "contains zorblax"
  x=$(H)
  publish main
  git --git-dir="$R" update-ref refs/heads/main "$BASE"
  cf d.txt "clean follow-up"
  sl refs/heads/main "$(H)" refs/heads/main "$BASE"
  run_sweep --pre-push origin "$R"
  finish 1 "$x"
}
t_refs_url_argument_token_block() {
  # The URL resolves to the configured remote and the token commit blocks.
  local x
  cf leak.txt "has zorblax"
  x=$(H)
  sl refs/heads/main "$x" refs/heads/main "$BASE"
  run_sweep --pre-push "$R" "$R"
  finish 1 "$x"
}
t_refs_unresolvable_url_exit2() {
  cf docs/a.txt "clean"
  sl refs/heads/main "$(H)" refs/heads/main "$BASE"
  run_sweep --pre-push "$C/nowhere.git" "$C/nowhere.git"
  finish 2
}

# -------------------------------------------------------------- surfaces

t_surface_message_block() {
  local x
  put a.txt "clean"
  cm "tidy up" "the body mentions zorblax"
  x=$(H)
  pp_main
  finish 1 "$x"
}
t_surface_message_subject_block() {
  local x
  cf a.txt "clean" "quuxwidget leaks via the subject"
  x=$(H)
  pp_main
  finish 1 "$x"
}
ident_case() {   # environment variable, value
  local x
  put a.txt "clean"
  env "$1=$2" git -C "$W" commit -q -m "tidy" >/dev/null 2>&1
  x=$(H)
  pp_main
  finish 1 "$x"
}
t_surface_author_name_block()     { ident_case GIT_AUTHOR_NAME "Zorblax Person"; }
t_surface_author_email_block()    { ident_case GIT_AUTHOR_EMAIL "quuxwidget@example.invalid"; }
t_surface_committer_name_block()  { ident_case GIT_COMMITTER_NAME "Zorblax Person"; }
t_surface_committer_email_block() { ident_case GIT_COMMITTER_EMAIL "quuxwidget@example.invalid"; }
t_surface_path_name_block() {
  local x
  cf docs/zorblax-notes.txt "clean content"
  x=$(H)
  pp_main
  finish 1 "$x"
}
t_surface_directory_name_block() {
  local x
  cf zorblax/readme.txt "clean content"
  x=$(H)
  pp_main
  finish 1 "$x"
}
t_surface_published_blob_copied_under_token_path_block() {
  local x
  cf docs/a.txt "clean published content"
  publish main
  BASE=$(H)
  cp "$W/docs/a.txt" "$W/zorblax-copy.txt"
  g add zorblax-copy.txt
  cm "copy of a published blob"
  x=$(H)
  pp_main
  finish 1 "$x"
}
t_surface_rename_to_token_path_block() {
  local x
  g mv README zorblax-readme
  cm "rename README"
  x=$(H)
  pp_main
  finish 1 "$x"
}
t_surface_rename_with_token_edit_block() {
  local x
  put b.txt $'one\ntwo\nthree\nfour\nfive\nsix\nseven\neight'
  cm "add b"
  publish main
  BASE=$(H)
  g mv b.txt c.txt
  printf 'nine zorblax\n' >>"$W/c.txt"
  g add c.txt
  cm "rename b and extend it"
  x=$(H)
  pp_main
  finish 1 "$x"
}

# ----------------------------------------------------------------- lists

bounded_list() {
  printf '%s\n' '\bgrault\b' >"$L_CI"
  forbid '\bgrault\b'
  forbid grault
}
t_list_bounded_pattern_blob_block() {
  local x
  bounded_list
  cf a.txt "we saw grault today"
  x=$(H)
  pp_main
  finish 1 "$x"
}
t_list_bounded_pattern_message_block() {
  local x
  bounded_list
  put a.txt "clean"
  cm "grault arrived"
  x=$(H)
  pp_main
  finish 1 "$x"
}
t_list_bounded_pattern_path_block() {
  local x
  bounded_list
  cf docs/grault.txt "clean"
  x=$(H)
  pp_main
  finish 1 "$x"
}
t_list_bounded_pattern_no_overmatch_allow() {
  bounded_list
  put graultish.txt "graultish content"
  cm "graultish subject"
  pp_main
  finish 0
}
t_list_case_sensitive_right_case_blob_block() {
  local x
  cf a.txt "x Wibblefrotz y"
  x=$(H)
  pp_main
  finish 1 "$x"
}
t_list_case_sensitive_right_case_message_block() {
  local x
  put a.txt "clean"
  cm "Wibblefrotz in the subject"
  x=$(H)
  pp_main
  finish 1 "$x"
}
t_list_case_sensitive_right_case_path_block() {
  local x
  cf docs/Wibblefrotz.txt "clean"
  x=$(H)
  pp_main
  finish 1 "$x"
}
t_list_case_sensitive_other_case_allow() {
  cf a.txt "wibblefrotz and WIBBLEFROTZ"
  pp_main
  finish 0
}
accent_list() {
  printf 'zorbl\303\251x\n' >"$L_CI"
  printf 'zorbl\303\251x\n' >>"$FORBID"
  printf 'ZORBL\303\211X\n' >>"$FORBID"
}
t_list_accented_token_lower_case_block() {
  local x
  accent_list
  putf a.txt 'see zorbl\303\251x here\n'
  cm "accented lower"
  x=$(H)
  pp_main
  finish 1 "$x"
}
t_list_accented_token_upper_case_block() {
  local x
  accent_list
  putf a.txt 'see ZORBL\303\211X here\n'
  cm "accented upper"
  x=$(H)
  pp_main
  finish 1 "$x"
}
t_list_accented_token_upper_case_message_block() {
  local x
  accent_list
  put a.txt "clean"
  cm "$(printf 'subject ZORBL\303\211X here')"
  x=$(H)
  pp_main
  finish 1 "$x"
}
blank_line_lists() {
  # comments, blank lines, a spaces-only line, trailing spaces and CRLF endings
  printf '# comment\n\nzorblax  \n   \nquuxwidget\r\n\r\n' >"$L_CI"
  printf '# comment\n\nWibblefrotz \n' >"$L_CS"
}
t_list_blank_lines_stripped_clean_allow() {
  blank_line_lists
  cf a.txt "perfectly clean text"
  OUTMATCH='2 case-insensitive and 1 case-sensitive patterns loaded'
  pp_main
  finish 0
}
t_list_blank_lines_stripped_token_block() {
  local x
  blank_line_lists
  cf a.txt "this holds zorblax"
  x=$(H)
  pp_main
  finish 1 "$x"
}
t_list_crlf_pattern_still_matches_block() {
  local x
  blank_line_lists
  cf a.txt "this holds quuxwidget"
  x=$(H)
  pp_main
  finish 1 "$x"
}
t_list_comment_line_is_not_a_pattern_allow() {
  printf '%s\n' '# quuxignored' zorblax >"$L_CI"
  forbid quuxignored
  cf a.txt "# quuxignored"
  pp_main
  finish 0
}
t_list_ci_missing_exit2() {
  L_CI=$C/lists/missing.txt
  cf a.txt "clean"
  pp_main
  finish 2
}
t_list_ci_variable_unset_exit2() {
  L_CI=""
  cf a.txt "clean"
  pp_main
  finish 2
}
t_list_ci_empty_exit2() {
  : >"$L_CI"
  cf a.txt "clean"
  pp_main
  finish 2
}
t_list_ci_comments_only_exit2() {
  printf '%s\n' '# nothing but comments' '' '   ' >"$L_CI"
  cf a.txt "clean"
  pp_main
  finish 2
}
t_list_cs_empty_exit2() {
  : >"$L_CS"
  cf a.txt "clean"
  pp_main
  finish 2
}
t_list_ci_bad_pattern_exit2() {
  # A valid pattern comes first, so only a script that treats the grep error as
  # fatal reaches the required exit 2.
  printf '%s\n' zorblax 'zorb[lax' >"$L_CI"
  forbid 'zorb[lax'
  cf a.txt "holds zorblax"
  pp_main
  finish 2
}
t_list_cs_bad_pattern_exit2() {
  printf '%s\n' 'Wibblefrotz' 'Wibble[frotz' >"$L_CS"
  forbid 'Wibble[frotz'
  cf a.txt "holds Wibblefrotz"
  pp_main
  finish 2
}
t_list_ci_bad_pattern_unmatched_parenthesis_exit2() {
  printf '%s\n' zorblax 'quux(widget' >"$L_CI"
  forbid 'quux(widget'
  cf a.txt "holds zorblax"
  pp_main
  finish 2
}
t_list_cs_missing_without_optout_exit2() {
  L_CS=$C/lists/missing-cs.txt
  cf a.txt "clean"
  pp_main
  finish 2
}
t_list_cs_variable_unset_without_optout_exit2() {
  L_CS=""
  cf a.txt "clean"
  pp_main
  finish 2
}
t_list_cs_optout_variable_unset_allow() {
  L_CS=""
  NOCS=1
  cf a.txt "clean"
  pp_main
  finish 0
}
t_list_cs_optout_missing_file_allow() {
  L_CS=$C/lists/missing-cs.txt
  NOCS=1
  cf a.txt "clean"
  pp_main
  finish 0
}
t_list_cs_optout_ci_list_still_blocks() {
  local x
  L_CS=""
  NOCS=1
  cf a.txt "holds zorblax"
  x=$(H)
  pp_main
  finish 1 "$x"
}

# -------------------------------------------------------------- failures

t_failure_git_revlist_exit2() {
  cf leak.txt "has zorblax"
  make_fake_git "rev-list log"
  pp_main
  [ -f "$C/fake-git-reached" ] || EXTRA_BAD="the fake git was never reached (script uses other subcommands)"
  finish 2
}
t_failure_git_blob_read_exit2() {
  cf leak.txt "has zorblax"
  make_fake_git "cat-file show"
  pp_main
  [ -f "$C/fake-git-reached" ] || EXTRA_BAD="the fake git was never reached (script uses other subcommands)"
  finish 2
}
t_failure_git_difftree_exit2() {
  cf leak.txt "has zorblax"
  make_fake_git "diff-tree diff"
  pp_main
  [ -f "$C/fake-git-reached" ] || EXTRA_BAD="the fake git was never reached (script uses other subcommands)"
  finish 2
}

t_failure_unhandled_wc_exit2() {
  # wc is called unguarded at the top level, so its failure kills the script
  # through errexit with status 1; the script's exit handler must report 2.
  cf docs/a.txt "clean"
  make_fake_cmd wc 1
  pp_main
  finish 2
}
t_failure_sort_in_scan_exit2() {
  cf leak.txt "has zorblax"
  make_fake_cmd sort 2
  pp_main
  finish 2
}

# -------------------------------------------------------------- binaries

t_binary_not_on_allow_list_block() {
  local x
  putf assets/other.bin 'PK\000\001\002binary\000data'
  cm "add a binary"
  x=$(H)
  OUTMATCH='assets/other.bin'
  pp_main
  finish 1 "$x"
}
t_binary_on_allow_list_allow() {
  putf assets/known.bin 'PK\000\001\002binary\000data'
  cm "add a reviewed binary"
  pp_main
  finish 0
}
t_binary_allow_list_longer_path_block() {
  local x
  putf assets/known.bin.bak 'PK\000\001\002binary\000data'
  cm "add a binary whose path is an allowed path plus a suffix"
  x=$(H)
  pp_main
  finish 1 "$x"
}
t_binary_allow_list_nested_path_block() {
  local x
  putf elsewhere/assets/known.bin 'PK\000\001\002binary\000data'
  cm "add a binary whose path is an allowed path under another directory"
  x=$(H)
  pp_main
  finish 1 "$x"
}
t_binary_latin1_text_with_token_block() {
  local x
  putf notes.txt 'caf\351 zorblax\n'
  cm "latin1 text"
  x=$(H)
  pp_main
  finish 1 "$x"
}
t_binary_latin1_text_without_token_block() {
  local x
  putf notes.txt 'caf\351 au lait\n'
  cm "latin1 text"
  x=$(H)
  pp_main
  finish 1 "$x"
}
t_binary_utf16_text_with_token_block() {
  local x
  mkdir -p "$W/docs"
  printf 'zorblax\n' | iconv -f UTF-8 -t UTF-16 >"$W/docs/wide.txt"
  g add docs/wide.txt
  cm "utf-16 text"
  x=$(H)
  pp_main
  finish 1 "$x"
}

# ------------------------------------------------ review extension: helpers

fresh_repo() {   # build a second, unrelated repository and point $W at it
  W=$C/$1
  mkdir -p "$W/memento/tools"
  git init -q "$W" >/dev/null 2>&1
  g symbolic-ref HEAD refs/heads/main
  g config user.name "Test Person"
  g config user.email "test@example.invalid"
  g config commit.gpgsign false
  cp "$SWEEP" "$W/memento/tools/confidentiality-sweep.sh"
  printf '%s\n' 'assets/known.bin' >"$W/memento/tools/sweep-binary-allow.txt"
}
cmm() {   # commit what is staged with an exact message (printf format)
  printf "$1" | git -C "$W" commit -q -F - >/dev/null 2>&1
}
set_allow() {   # replace the tracked allow list with the given lines, commit, publish
  printf '%s\n' "$@" >"$W/memento/tools/sweep-binary-allow.txt"
  g add memento/tools/sweep-binary-allow.txt
  cm "allow list"
  publish main
  BASE=$(H)
}
mk_blob() {   # content line: prints the blob sha
  printf '%s\n' "$1" | git -C "$W" hash-object -w --stdin 2>/dev/null
}
mk_tree() {   # blob sha, file name: prints the tree sha
  printf '100644 blob %s\t%s\n' "$1" "$2" | git -C "$W" mktree 2>/dev/null
}
no_remote_tag() {
  if git --git-dir="$R" rev-parse -q --verify "refs/tags/$1" >/dev/null 2>&1; then
    EXTRA_BAD="the blocked tag reached the remote"
  fi
}
forge_commit() {   # extra header text (ends in newline), message (printf format),
                   # optional author name: sets FORGED and a ref. Raw bytes reach the
                   # object untouched, because git commit may re-encode odd bytes.
  local tree
  tree=$(gs rev-parse "$BASE^{tree}")
  FORGED=$( {
    printf 'tree %s\nparent %s\n' "$tree" "$BASE"
    printf 'author %s <a@example.invalid> 1700000000 +0000\n' "${3:-A U Thor}"
    printf 'committer C O Mitter <c@example.invalid> 1700000000 +0000\n'
    printf '%s' "$1"
    printf '\n'
    printf "$2"
    printf '\n'
  } | git -C "$W" hash-object -t commit -w --literally --stdin 2>/dev/null )
  g update-ref refs/heads/forged "$FORGED"
}

# ------------------------------------------------ review extension: cases

t_root_commit_orphan_token_block() {
  local x
  g checkout -q --orphan rootb
  g rm -rf -q --cached .
  cf leak.txt "has zorblax"
  x=$(H)
  sl refs/heads/rootb "$x" refs/heads/rootb "$ZERO40"
  run_sweep --pre-push origin "$R"
  finish 1 "$x"
}
t_root_commit_range_single_commit_repo_block() {
  local x
  fresh_repo single
  cf leak.txt "has zorblax"
  x=$(H)
  run_sweep --range HEAD
  finish 1 "$x"
}
t_list_ci_pattern_matching_empty_line_exit2() {
  printf '%s\n' zorblax 'x*' >"$L_CI"
  forbid 'x*'
  cf a.txt "clean"
  pp_main
  finish 2
}
t_list_cs_pattern_matching_empty_line_exit2() {
  printf '%s\n' Wibblefrotz 'y*' >"$L_CS"
  forbid 'y*'
  cf a.txt "clean"
  pp_main
  finish 2
}
t_list_ci_alternation_with_empty_branch_exit2() {
  printf '%s\n' 'zorblax|' >"$L_CI"
  forbid 'zorblax|'
  cf a.txt "clean"
  pp_main
  finish 2
}
t_list_ci_bom_before_first_pattern_block() {
  local x
  printf '\357\273\277zorblax\nquuxwidget\n' >"$L_CI"
  cf a.txt "this holds zorblax"
  x=$(H)
  pp_main
  finish 1 "$x"
}
t_list_ci_invalid_utf8_exit2() {
  printf 'zorblax\ncaf\351x\n' >"$L_CI"
  printf 'caf\351x\n' >>"$FORBID"
  forbid caf
  cf a.txt "clean"
  pp_main
  finish 2
}
t_list_cs_invalid_utf8_exit2() {
  printf 'Wibblefrotz\nWibble\351\n' >"$L_CS"
  printf 'Wibble\351\n' >>"$FORBID"
  cf a.txt "clean"
  pp_main
  finish 2
}
t_submodule_gitlink_clean_allow() {
  g update-index --add --cacheinfo "160000,$BASE,vendor/lib"
  cm "add a submodule entry"
  pp_main
  finish 0
}
t_submodule_gitlink_token_path_block() {
  local x
  g update-index --add --cacheinfo "160000,$BASE,vendor/zorblax-lib"
  cm "add a submodule entry"
  x=$(H)
  OUTMATCH='path#[0-9]+'
  pp_main
  finish 1 "$x"
}
t_mapping_token_on_message_line_three_reports_line() {
  local x
  put a.txt "clean"
  cmm 'subject line\n\nthird line has zorblax\n'
  x=$(H)
  OUTMATCH="commit $x message:3"
  pp_main
  finish 1 "$x"
}
t_mapping_token_in_author_name_reports_header() {
  local x
  put a.txt "clean"
  env GIT_AUTHOR_NAME="Zorblax Person" git -C "$W" commit -q -m "tidy" >/dev/null 2>&1
  x=$(H)
  OUTMATCH="commit $x header"
  pp_main
  finish 1 "$x"
}
t_path_token_named_binary_reports_index_block() {
  local x
  putf assets/zorblax.bin 'PK\000\001\002binary\000data'
  cm "add a token-named binary"
  x=$(H)
  OUTMATCH='path#[0-9]+'
  pp_main
  finish 1 "$x"
}
t_path_token_named_in_two_commits_two_hits() {
  local c1 c2
  cf zorblax-a.txt "first version"
  c1=$(H)
  cf zorblax-a.txt "second version"
  c2=$(H)
  pp_main
  grep -q -F "$c2" "$OUT" || EXTRA_BAD="the second commit is missing from the output"
  finish 1 "$c1"
}
t_remote_holds_commit_local_repo_lacks_allow() {
  local y
  git clone -q "$R" "$C/second" >/dev/null 2>&1
  git -C "$C/second" checkout -q -b main origin/main >/dev/null 2>&1
  printf 'from the second clone\n' >"$C/second/other.txt"
  git -C "$C/second" add other.txt >/dev/null 2>&1
  git -C "$C/second" -c user.name=Other -c user.email=o@example.invalid commit -q -m "other work" >/dev/null 2>&1
  git -C "$C/second" push -q --no-verify origin main >/dev/null 2>&1
  y=$(git --git-dir="$R" rev-parse refs/heads/main)
  cf d.txt "clean follow-up"
  sl refs/heads/main "$(H)" refs/heads/main "$y"
  run_sweep --pre-push origin "$R"
  finish 0
}
t_binary_allow_list_extra_suffix_block() {
  local x
  putf assets/known.bin.extra 'PK\000\001\002binary\000data'
  cm "add a binary with an extra suffix"
  x=$(H)
  pp_main
  finish 1 "$x"
}
t_binary_allow_list_entry_is_substring_of_name_block() {
  local x
  set_allow known
  putf known.bin 'PK\000\001\002binary\000data'
  cm "add a binary whose name contains an allow-list entry"
  x=$(H)
  pp_main
  finish 1 "$x"
}
t_binary_same_blob_allowed_and_disallowed_paths_block() {
  local x
  putf assets/known.bin 'PK\000\001\002binary\000same'
  putf assets/copy.bin 'PK\000\001\002binary\000same'
  cm "one blob at two paths"
  x=$(H)
  pp_main
  finish 1 "$x"
}
t_binary_same_blob_disallowed_path_sorts_first_block() {
  local x
  putf assets/aaa.bin 'PK\000\001\002binary\000same'
  putf assets/known.bin 'PK\000\001\002binary\000same'
  cm "one blob at two paths"
  x=$(H)
  pp_main
  finish 1 "$x"
}
t_binary_same_blob_disallowed_path_sorts_last_block() {
  local x
  putf assets/known.bin 'PK\000\001\002binary\000same'
  putf assets/zzz.bin 'PK\000\001\002binary\000same'
  cm "one blob at two paths"
  x=$(H)
  pp_main
  finish 1 "$x"
}
t_path_newline_in_name_block() {
  local x nm
  cf ok.txt "fine"
  publish main
  BASE=$(H)
  nm=$'zorblax\nok.txt'
  put "$nm" "clean content"
  cm "path with a newline"
  x=$(H)
  pp_main
  finish 1 "$x"
}
t_path_newline_binary_imitating_allowed_path_block() {
  local x nm
  nm=$'evil.dat\nassets/known.bin'
  putf "$nm" 'PK\000\001\002binary\000data'
  cm "binary whose name ends with an allowed path after a newline"
  x=$(H)
  pp_main
  finish 1 "$x"
}
t_utf8_message_invalid_byte_before_token_block() {
  forge_commit "" 'a\377 zorblax'
  sl refs/heads/forged "$FORGED" refs/heads/forged "$ZERO40"
  run_sweep --pre-push origin "$R"
  finish 1 "$FORGED"
}
t_utf8_message_invalid_byte_without_token_block() {
  forge_commit "" 'subject a\377 only'
  sl refs/heads/forged "$FORGED" refs/heads/forged "$ZERO40"
  run_sweep --pre-push origin "$R"
  finish 1 "$FORGED"
}
t_utf8_author_invalid_byte_before_token_block() {
  forge_commit "" 'clean message' "$(printf '\377zorblax')"
  sl refs/heads/forged "$FORGED" refs/heads/forged "$ZERO40"
  run_sweep --pre-push origin "$R"
  finish 1 "$FORGED"
}
t_utf8_blob_f4_90_80_80_before_token_block() {
  local x
  putf a.txt 'a\364\220\200\200 zorblax\n'
  cm "out of range sequence"
  x=$(H)
  pp_main
  finish 1 "$x"
}
t_utf8_blob_five_byte_f8_with_cs_token_block() {
  local x
  putf a.txt 'a\370\210\200\200\200 Wibblefrotz\n'
  cm "five byte sequence"
  x=$(H)
  pp_main
  finish 1 "$x"
}
t_utf8_path_invalid_byte_block() {
  local x b
  b=$(mk_blob "clean content")
  g update-index --add --cacheinfo "100644,$b,$(printf 'docs/a\377.txt')"
  cm "path with an invalid byte"
  x=$(H)
  pp_main
  finish 1 "$x"
}
t_utf8_tag_message_invalid_byte_block() {
  local t
  t=$( {
    printf 'object %s\ntype commit\ntag v1\n' "$BASE"
    printf 'tagger T <t@example.invalid> 1700000000 +0000\n\n'
    printf 'a\377 note\n'
  } | git -C "$W" hash-object -t tag -w --stdin 2>/dev/null )
  sl refs/tags/v1 "$t" refs/tags/v1 "$ZERO40"
  run_sweep --pre-push origin "$R"
  finish 1
}
t_hook_lightweight_tag_on_blob_block() {
  local b
  b=$(mk_blob "holds zorblax")
  g tag bt "$b"
  hpush origin bt
  no_remote_tag bt
  finish N
}
t_hook_lightweight_tag_on_tree_block() {
  local b tr
  b=$(mk_blob "holds zorblax")
  tr=$(mk_tree "$b" file.txt)
  g tag tt "$tr"
  hpush origin tt
  no_remote_tag tt
  finish N
}
t_hook_annotated_tag_on_blob_block() {
  local b
  b=$(mk_blob "holds zorblax")
  g tag -a -m "clean note" bt2 "$b"
  hpush origin bt2
  no_remote_tag bt2
  finish N
}
t_hook_tag_of_tag_inner_message_block() {
  g tag -a -m "inner note holds zorblax" inner "$BASE"
  g tag -a -m "outer note is clean" outer inner
  g tag -d inner
  hpush origin outer
  no_remote_tag outer
  finish N
}
t_refs_tree_ref_token_path_block() {
  local b tr
  b=$(mk_blob "clean content")
  tr=$(mk_tree "$b" zorblax.txt)
  g tag tt "$tr"
  sl refs/tags/tt "$tr" refs/tags/tt "$ZERO40"
  run_sweep --pre-push origin "$R"
  finish 1
}
t_hook_replace_ref_hides_token_commit_block() {
  local x
  g checkout -q -b bad
  cf leak.txt "has zorblax"
  x=$(H)
  g checkout -q main
  g replace "$x" "$BASE"
  hpush origin bad
  [ -z "$(remote_head bad)" ] || EXTRA_BAD="the blocked branch reached the remote"
  finish N "$x"
}
t_header_mergetag_block() {
  local mt
  mt=$'mergetag object '"$BASE"$'\n type commit\n tag zorblax-tag\n tagger T <t@example.invalid> 1700000000 +0000\n \n tag note\n'
  forge_commit "$mt" "clean message"
  sl refs/heads/forged "$FORGED" refs/heads/forged "$ZERO40"
  OUTMATCH="commit $FORGED header"
  run_sweep --pre-push origin "$R"
  finish 1 "$FORGED"
}
t_header_encoding_block() {
  forge_commit $'encoding zorblax\n' "clean message"
  sl refs/heads/forged "$FORGED" refs/heads/forged "$ZERO40"
  OUTMATCH="commit $FORGED header"
  run_sweep --pre-push origin "$R"
  finish 1 "$FORGED"
}
t_header_unknown_header_block() {
  forge_commit $'x-note zorblax\n' "clean message"
  sl refs/heads/forged "$FORGED" refs/heads/forged "$ZERO40"
  OUTMATCH="commit $FORGED header"
  run_sweep --pre-push origin "$R"
  finish 1 "$FORGED"
}
t_header_gpgsig_lines_skipped_allow() {
  forge_commit $'gpgsig -----BEGIN PGP SIGNATURE-----\n \n abcdefghij\n -----END PGP SIGNATURE-----\n' "clean message"
  sl refs/heads/forged "$FORGED" refs/heads/forged "$ZERO40"
  run_sweep --pre-push origin "$R"
  finish 0
}
t_config_log_output_encoding_does_not_hide_accented_token_block() {
  local x
  accent_list
  g config i18n.logOutputEncoding ISO-8859-1
  put a.txt "clean"
  cmm 'subject ZORBL\303\211X here\n'
  x=$(H)
  pp_main
  finish 1 "$x"
}
t_config_log_show_signature_does_not_hide_token_block() {
  local x
  g config log.showSignature true
  cf a.txt "this holds zorblax"
  x=$(H)
  pp_main
  finish 1 "$x"
}
t_stdin_three_fields_exit2() {
  printf 'refs/heads/main %s refs/heads/main\n' "$BASE" >"$STDIN"
  run_sweep --pre-push origin "$R"
  finish 2
}
t_stdin_five_fields_exit2() {
  printf 'refs/heads/main %s refs/heads/main %s extra\n' "$BASE" "$BASE" >"$STDIN"
  run_sweep --pre-push origin "$R"
  finish 2
}
t_stdin_empty_local_sha_exit2() {
  printf 'refs/heads/main  refs/heads/main %s\n' "$BASE" >"$STDIN"
  run_sweep --pre-push origin "$R"
  finish 2
}
t_stdin_short_local_sha_exit2() {
  printf 'refs/heads/main %s refs/heads/main %s\n' "$(printf '%s' "$BASE" | cut -c1-39)" "$BASE" >"$STDIN"
  run_sweep --pre-push origin "$R"
  finish 2
}
t_stdin_non_hex_remote_sha_exit2() {
  printf 'refs/heads/main %s refs/heads/main gggggggggggggggggggggggggggggggggggggggg\n' "$BASE" >"$STDIN"
  run_sweep --pre-push origin "$R"
  finish 2
}
t_stdin_final_line_without_newline_block() {
  local x
  cf leak.txt "has zorblax"
  x=$(H)
  printf 'refs/heads/main %s refs/heads/main %s' "$x" "$BASE" >"$STDIN"
  run_sweep --pre-push origin "$R"
  finish 1 "$x"
}
t_stdin_empty_allow() {
  : >"$STDIN"
  run_sweep --pre-push origin "$R"
  finish 0
}
t_xtrace_shellopts_does_not_echo_patterns() {
  local x
  cf leak.txt "has zorblax"
  x=$(H)
  XTRACE=1
  pp_main
  finish 1 "$x"
}
t_xtrace_bash_dash_x_does_not_echo_patterns() {
  local x
  cf leak.txt "has zorblax"
  x=$(H)
  SWEEP_FLAGS=-x
  pp_main
  finish 1 "$x"
}
t_xtrace_shellopts_clean_run_does_not_echo_patterns() {
  cf a.txt "clean"
  XTRACE=1
  pp_main
  finish 0
}
t_path_escape_byte_clean_allow() {
  put $'docs/\033[31mred.txt' "clean content"
  cm "path with an escape byte"
  pp_main
  grep -q "$(printf '\033')" "$OUT" && EXTRA_BAD="the output holds a raw escape byte"
  finish 0
}
t_path_escape_byte_with_token_content_block() {
  local x
  put $'docs/\033[31mred.txt' "this holds zorblax"
  cm "path with an escape byte"
  x=$(H)
  pp_main
  grep -q "$(printf '\033')" "$OUT" && EXTRA_BAD="the output holds a raw escape byte"
  finish 1 "$x"
}

# ------------------------------------------- round 2 review extension: cases

# F4 90 80 80 is accepted by iconv but cannot be parsed by grep, so every text
# field that carries it must be reported (exit 1), whatever else it holds.
mk_tag_object() {   # tag message (printf format): prints the tag object sha
  {
    printf 'object %s\ntype commit\ntag v1\n' "$BASE"
    printf 'tagger T <t@example.invalid> 1700000000 +0000\n\n'
    printf "$1"
    printf '\n'
  } | git -C "$W" hash-object -t tag -w --literally --stdin 2>/dev/null
}
forged_push_line() {
  sl refs/heads/forged "$FORGED" refs/heads/forged "$ZERO40"
}
t_f4_message_byte_before_token_block() {
  forge_commit "" 'a\364\220\200\200 zorblax'
  forged_push_line
  run_sweep --pre-push origin "$R"
  finish 1 "$FORGED"
}
t_f4_message_token_before_byte_block() {
  forge_commit "" 'zorblax a\364\220\200\200'
  forged_push_line
  run_sweep --pre-push origin "$R"
  finish 1 "$FORGED"
}
t_f4_message_f8_sequence_with_cs_token_block() {
  forge_commit "" 'a\370\210\200\200\200 Wibblefrotz'
  forged_push_line
  run_sweep --pre-push origin "$R"
  finish 1 "$FORGED"
}
t_f4_message_without_token_reports_not_valid_utf8() {
  forge_commit "" 'subject a\364\220\200\200 only'
  forged_push_line
  OUTMATCH='not valid UTF-8'
  run_sweep --pre-push origin "$R"
  finish 1 "$FORGED"
}
t_f4_author_name_block() {
  forge_commit "" 'clean message' "$(printf 'a\364\220\200\200 zorblax')"
  forged_push_line
  run_sweep --pre-push origin "$R"
  finish 1 "$FORGED"
}
t_f4_tag_text_block() {
  local t
  t=$(mk_tag_object 'msg\364\220\200\200 zorblax')
  sl refs/tags/v1 "$t" refs/tags/v1 "$ZERO40"
  run_sweep --pre-push origin "$R"
  finish 1
}
t_f4_path_byte_before_token_block() {
  local x b
  b=$(mk_blob "clean content")
  g update-index --add --cacheinfo "100644,$b,$(printf 'docs/a\364\220\200\200zorblax.txt')"
  cm "path with an F4 sequence"
  x=$(H)
  pp_main
  finish 1 "$x"
}
t_f4_path_token_before_byte_block() {
  local x b
  b=$(mk_blob "clean content")
  g update-index --add --cacheinfo "100644,$b,$(printf 'docs/zorblax\364\220\200\200a.txt')"
  cm "path with an F4 sequence"
  x=$(H)
  pp_main
  finish 1 "$x"
}
t_f4_ref_name_via_hook_block() {
  local name
  name="refs/heads/zorblax$(printf '\364\220\200\200')"
  # A loose ref file with such a name cannot exist on every filesystem, so the
  # ref goes straight into packed-refs.
  printf '# pack-refs with: peeled fully-peeled sorted \n%s %s\n' "$BASE" "$name" >"$W/.git/packed-refs"
  hpush origin "$name"
  finish N
}
t_nul_in_commit_object_block() {
  forge_commit "" 'clean\000 zorblax'
  forged_push_line
  OUTMATCH='NUL'
  run_sweep --pre-push origin "$R"
  finish 1 "$FORGED"
}
t_nul_in_tag_object_block() {
  local t
  t=$(mk_tag_object 'clean\000 note')
  sl refs/tags/v1 "$t" refs/tags/v1 "$ZERO40"
  run_sweep --pre-push origin "$R"
  finish 1
}
t_header_gpgsig_continuation_with_token_block() {
  forge_commit $'gpgsig -----BEGIN PGP SIGNATURE-----\n zorblax\n -----END PGP SIGNATURE-----\n' "clean message"
  forged_push_line
  OUTMATCH="commit $FORGED header"
  run_sweep --pre-push origin "$R"
  finish 1 "$FORGED"
}

# ------------------------------------------------ slice 1b: modes and modifier

# The real commit-time hook files are copied in only inside the cases that run a
# real git commit or merge, so ordinary setup commits never trigger them.
install_real_hook() {   # hook name
  local src
  case "$1" in
    pre-commit) src=$HOOK_PRE_COMMIT ;;
    commit-msg) src=$HOOK_COMMIT_MSG ;;
    pre-merge-commit) src=$HOOK_PRE_MERGE_COMMIT ;;
  esac
  mkdir -p "$W/.githooks"
  cp -p "$src" "$W/.githooks/$1" 2>/dev/null
}
hcommit() {   # a real git commit, which runs the installed commit-time hooks
  ( cd "$W" && apply_env && exec git commit "$@" ) </dev/null >"$OUT" 2>&1
  RC=$?
}
note_bad() {   # record the first extra failure only
  [ -n "$EXTRA_BAD" ] || EXTRA_BAD=$1
}
check_no_echo() {   # the same echo assertion as finish, for a run that is not the last one
  if grep -q -i -F -f "$FORBID" "$OUT"; then note_bad "output echoed a throwaway token or pattern"; fi
}
no_line_text() {   # no "  line N: text" output line may be present
  if grep -q -E '^ +line [0-9]+:' "$OUT"; then note_bad "line text was printed without --show-redacted"; fi
}

# ------------------------------------------------------------- pre-commit

t_precommit_clean_allow() {
  put docs/a.txt "alpha beta"
  OUTMATCH='[0-9]+ case-insensitive and [0-9]+ case-sensitive patterns loaded'
  run_sweep --pre-commit
  finish 0
}
t_precommit_staged_token_block() {
  put leak.txt "this line holds zorblax"
  OUTMATCH='staged path leak.txt line\(s\) 1'
  run_sweep --pre-commit
  finish 1
}
t_precommit_unstaged_token_allow() {
  cf a.txt "clean"
  printf 'zorblax added in the working tree only\n' >>"$W/a.txt"
  printf 'zorblax in an untracked file\n' >"$W/untracked.txt"
  run_sweep --pre-commit
  finish 0
}
t_precommit_staged_edit_keeps_token_on_unchanged_line_block() {
  put f.txt $'line one\nzorblax unchanged line\nline three'
  cm "add f"
  put f.txt $'line ONE\nzorblax unchanged line\nline three'
  run_sweep --pre-commit
  finish 1
}
t_precommit_staged_token_unstaged_cleanup_block() {
  # The index is what gets committed, so a working-copy edit that removes the
  # token without staging it does not make the commit clean.
  put leak.txt "this line holds zorblax"
  printf 'clean now\n' >"$W/leak.txt"
  run_sweep --pre-commit
  finish 1
}
t_precommit_staged_deletion_of_token_file_allow() {
  cf old.txt "zorblax committed earlier"
  g rm -q old.txt
  run_sweep --pre-commit
  finish 0
}
t_precommit_staged_token_path_block() {
  put docs/zorblax-notes.txt "clean content"
  OUTMATCH='staged path#[0-9]+'
  run_sweep --pre-commit
  finish 1
}
t_precommit_staged_binary_not_allow_listed_block() {
  putf assets/other.bin 'PK\000\001\002binary\000data'
  run_sweep --pre-commit
  finish 1
}
t_precommit_staged_binary_allow_listed_allow() {
  putf assets/known.bin 'PK\000\001\002binary\000data'
  run_sweep --pre-commit
  finish 0
}
t_precommit_first_commit_in_empty_repo_token_block() {
  fresh_repo empty
  put leak.txt "this line holds zorblax"
  run_sweep --pre-commit
  finish 1
}
t_precommit_first_commit_in_empty_repo_clean_allow() {
  fresh_repo empty
  put docs/a.txt "clean"
  run_sweep --pre-commit
  finish 0
}
t_precommit_real_commit_refused() {
  install_real_hook pre-commit
  put leak.txt "this line holds zorblax"
  hcommit -q -m "tidy"
  [ "$(H)" = "$BASE" ] || EXTRA_BAD="the refused commit moved HEAD"
  finish N
}
t_precommit_real_commit_clean_allow() {
  install_real_hook pre-commit
  put docs/a.txt "clean"
  hcommit -q -m "tidy"
  [ "$(H)" != "$BASE" ] || EXTRA_BAD="the clean commit did not move HEAD"
  finish 0
}

# ------------------------------------------------------------- commit-msg

MSG_FILE() { echo "$C/COMMIT_EDITMSG"; }

t_commitmsg_clean_allow() {
  printf 'subject\n\nclean body\n' >"$(MSG_FILE)"
  run_sweep --commit-msg "$(MSG_FILE)"
  finish 0
}
t_commitmsg_token_in_message_block() {
  printf 'subject\n\nthe body holds zorblax\n' >"$(MSG_FILE)"
  OUTMATCH='commit message line\(s\) 3'
  run_sweep --commit-msg "$(MSG_FILE)"
  finish 1
}
t_commitmsg_token_in_comment_line_block() {
  printf 'subject\n\n# a comment line holding zorblax\n' >"$(MSG_FILE)"
  OUTMATCH='commit message line\(s\) 3'
  run_sweep --commit-msg "$(MSG_FILE)"
  finish 1
}
t_commitmsg_token_in_author_name_block() {
  printf 'subject\n' >"$(MSG_FILE)"
  OUTMATCH='commit identity'
  GIT_AUTHOR_NAME="Zorblax Person" run_sweep --commit-msg "$(MSG_FILE)"
  finish 1
}
t_commitmsg_token_in_committer_email_block() {
  printf 'subject\n' >"$(MSG_FILE)"
  OUTMATCH='commit identity'
  GIT_COMMITTER_EMAIL="quuxwidget@example.invalid" run_sweep --commit-msg "$(MSG_FILE)"
  finish 1
}
t_commitmsg_missing_file_exit2() {
  run_sweep --commit-msg "$C/no-such-message-file"
  finish 2
}
t_commitmsg_missing_argument_exit2() {
  run_sweep --commit-msg
  finish 2
}
t_commitmsg_invalid_utf8_message_block() {
  printf 'subject a\377 only\n' >"$(MSG_FILE)"
  run_sweep --commit-msg "$(MSG_FILE)"
  finish 1
}
t_commitmsg_nul_in_message_block() {
  printf 'clean\000 zorblax\n' >"$(MSG_FILE)"
  run_sweep --commit-msg "$(MSG_FILE)"
  finish 1
}
t_commitmsg_real_commit_refused() {
  install_real_hook commit-msg
  put docs/a.txt "clean"
  hcommit -q -m "this subject mentions zorblax"
  [ "$(H)" = "$BASE" ] || EXTRA_BAD="the refused commit moved HEAD"
  finish N
}
t_commitmsg_real_commit_clean_allow() {
  install_real_hook commit-msg
  put docs/a.txt "clean"
  hcommit -q -m "a clean subject"
  [ "$(H)" != "$BASE" ] || EXTRA_BAD="the clean commit did not move HEAD"
  finish 0
}

# -------------------------------------------------------------- published

t_published_no_baseline_residue_exit1() {
  local x
  cf leak.txt "residue: zorblax"
  x=$(H)
  OUTMATCH='no baseline'
  run_sweep --published HEAD
  finish 1 "$x"
}
t_published_clean_history_no_baseline_allow() {
  cf docs/a.txt "clean"
  run_sweep --published HEAD
  finish 0
}
t_published_clean_history_empty_baseline_allow() {
  : >"$BASELINE"
  cf docs/a.txt "clean"
  run_sweep --published HEAD
  finish 0
}
t_published_update_baseline_then_known_allow() {
  cf leak.txt "residue: zorblax"
  run_sweep --published --update-baseline HEAD
  [ "$RC" -eq 0 ] || note_bad "--update-baseline exited $RC, expected 0"
  [ -f "$BASELINE" ] || note_bad "--update-baseline wrote no baseline file"
  check_no_echo
  run_sweep --published HEAD
  OUTMATCH='[0-9]+ known hits, 0 new'
  finish 0
}
t_published_new_hit_after_baseline_prints_only_new() {
  local c1 c2
  cf leak.txt "residue: zorblax"
  c1=$(H)
  run_sweep --published --update-baseline HEAD
  [ "$RC" -eq 0 ] || note_bad "--update-baseline exited $RC, expected 0"
  cf leak2.txt "fresh: quuxwidget"
  c2=$(H)
  run_sweep --published HEAD
  if grep -q -F "$c1" "$OUT"; then note_bad "the known commit was printed"; fi
  OUTMATCH='[0-9]+ known hits, 1 new'
  finish 1 "$c2"
}
t_published_baseline_file_holds_hashes_only() {
  local bad n
  cf leak.txt "residue: zorblax"
  cf docs/zorblax-notes.txt "clean content"
  put a.txt "clean"
  cm "message with quuxwidget residue"
  run_sweep --published --update-baseline HEAD
  [ "$RC" -eq 0 ] || note_bad "--update-baseline exited $RC, expected 0"
  if [ -f "$BASELINE" ]; then
    bad=$(grep -v -c -E '^[0-9a-f]{64}$' "$BASELINE")
    n=$(grep -c -E '^[0-9a-f]{64}$' "$BASELINE")
    [ "$bad" = 0 ] || note_bad "the baseline holds a line that is not a 64-hex hash"
    [ "$n" -ge 3 ] || note_bad "the baseline holds fewer hashes than hits"
    if grep -q -i -F -f "$FORBID" "$BASELINE"; then note_bad "the baseline holds token text"; fi
  else
    note_bad "no baseline file was written"
  fi
  finish 0
}
t_published_update_baseline_replaces_existing_file() {
  local junk
  junk=$(printf '%064d' 0)
  printf '%s\n' "$junk" >"$BASELINE"
  cf leak.txt "residue: zorblax"
  run_sweep --published --update-baseline HEAD
  if grep -q -F "$junk" "$BASELINE"; then note_bad "the old baseline entry survived the update"; fi
  [ "$(grep -c -E '^[0-9a-f]{64}$' "$BASELINE")" = 1 ] || note_bad "the baseline does not hold exactly the one current hit"
  finish 0
}
t_published_update_baseline_clean_history_empty_file() {
  printf '%064d\n' 0 >"$BASELINE"
  cf docs/a.txt "clean"
  run_sweep --published --update-baseline HEAD
  [ -f "$BASELINE" ] || note_bad "no baseline file was written"
  [ "$(grep -c . "$BASELINE")" = 0 ] || note_bad "the baseline still holds entries for a clean history"
  finish 0
}

# -------------------------------------------------------- show-redacted

t_redacted_blob_line_masks_both_case_variants() {
  cf a.txt "x zorblax y ZORBLAX"
  OUTMATCH='line 1: x #+ y #+'
  run_sweep --show-redacted --range origin/main..HEAD
  finish 1
}
t_redacted_blob_token_at_line_start_and_end() {
  cf a.txt $'zorblax starts the line\nthe line ends with ZORBLAX\nZORBLAX'
  OUTMATCH='line 3:'
  run_sweep --show-redacted --range origin/main..HEAD
  finish 1
}
t_redacted_overlapping_patterns_mask_the_union() {
  printf '%s\n' zorblax blaxwidget >"$L_CI"
  forbid blaxwidget
  forbid widget
  cf a.txt "zorblaxwidget"
  OUTMATCH='line 1: #+$'
  run_sweep --show-redacted --range origin/main..HEAD
  finish 1
}
t_redacted_case_sensitive_list_span_masked() {
  cf a.txt "a Wibblefrotz b"
  OUTMATCH='line 1: a #+ b'
  run_sweep --show-redacted --range origin/main..HEAD
  finish 1
}
t_redacted_message_line() {
  put a.txt "clean"
  cmm 'subject\n\nthe zorblax here\n'
  OUTMATCH='line 3: the #+ here'
  run_sweep --show-redacted --range origin/main..HEAD
  finish 1
}
t_redacted_path() {
  cf docs/zorblax-notes.txt "clean content"
  OUTMATCH='line [0-9]+: '
  run_sweep --show-redacted --range origin/main..HEAD
  finish 1
}
t_redacted_header_author_name() {
  forge_commit "" 'clean message' "Zorblax Person"
  OUTMATCH='line [0-9]+: '
  run_sweep --show-redacted --range origin/main..forged
  finish 1
}
t_redacted_tag_object() {
  local t
  t=$(mk_tag_object 'note zorblax here')
  sl refs/tags/v1 "$t" refs/tags/v1 "$ZERO40"
  OUTMATCH='line [0-9]+: '
  run_sweep --show-redacted --pre-push origin "$R"
  finish 1
}
t_redacted_invalid_utf8_line_not_shown() {
  forge_commit "" 'a\377 zorblax'
  OUTMATCH='line 1: \(not valid UTF-8; not shown\)'
  run_sweep --show-redacted --range origin/main..forged
  finish 1
}
t_redacted_token_invalid_byte_token_line_withheld() {
  # A blob with such a line counts as binary, so no line text exists for it;
  # the output must still hold neither the token nor the raw bytes.
  local x
  putf a.txt 'zorblax \364\220\200\200 zorblax\n'
  cm "line with an invalid byte between two tokens"
  x=$(H)
  printf '\364\220\200\200\n' >>"$FORBID"
  run_sweep --show-redacted --range HEAD
  finish 1 "$x"
}
t_redacted_message_token_invalid_byte_token_line_withheld() {
  # In a commit message the line reaches the line printer: it must be withheld
  # whole, because grep cannot see the second token past the invalid byte.
  forge_commit "" 'zorblax \364\220\200\200 zorblax'
  printf '\364\220\200\200\n' >>"$FORBID"
  OUTMATCH='line 1: \(not valid UTF-8; not shown\)'
  run_sweep --show-redacted --range origin/main..forged
  finish 1 "$FORGED"
}
t_redacted_no_hits_prints_summary_only() {
  cf docs/a.txt "clean"
  OUTMATCH='clean'
  run_sweep --show-redacted --range origin/main..HEAD
  no_line_text
  finish 0
}
t_redacted_cannot_run_exit2() {
  run_sweep --show-redacted --range nosuchref..HEAD
  finish 2
}
t_redacted_default_mode_prints_no_line_text() {
  cf a.txt "x zorblax y"
  run_sweep --range origin/main..HEAD
  no_line_text
  finish 1
}

# ----------------------------------- review 1b extension: hooks, merge, more

hook_file_check() {   # file, required exec line: exists, executable, holds the line
  RC=0
  : >"$OUT"
  [ -f "$1" ] || note_bad "hook file is missing: $1"
  [ -x "$1" ] || note_bad "hook file is not executable: $1"
  grep -q -F -x -- "$2" "$1" 2>/dev/null || note_bad "hook file lacks the contract exec line"
  finish 0
}
t_hook_file_pre_commit_contract() {
  hook_file_check "$HOOK_PRE_COMMIT" 'exec bash "$(git rev-parse --show-toplevel)/memento/tools/confidentiality-sweep.sh" --pre-commit'
}
t_hook_file_pre_merge_commit_contract() {
  hook_file_check "$HOOK_PRE_MERGE_COMMIT" 'exec bash "$(git rev-parse --show-toplevel)/memento/tools/confidentiality-sweep.sh" --pre-commit'
}
t_hook_file_commit_msg_contract() {
  hook_file_check "$HOOK_COMMIT_MSG" 'exec bash "$(git rev-parse --show-toplevel)/memento/tools/confidentiality-sweep.sh" --commit-msg "$1"'
}

hmerge() {   # a real git merge, which runs the pre-merge-commit hook
  ( cd "$W" && apply_env && exec git merge "$@" ) </dev/null >"$OUT" 2>&1
  RC=$?
}
t_merge_token_on_side_branch_refused() {
  local m
  g checkout -q -b side
  cf side.txt "side holds zorblax"
  g checkout -q main
  cf main.txt "main change"
  m=$(H)
  install_real_hook pre-merge-commit
  hmerge --no-ff -m "merge side" side
  [ "$(H)" = "$m" ] || note_bad "the refused merge moved HEAD"
  finish N
}
t_merge_clean_side_branch_allow() {
  local m
  g checkout -q -b side
  cf side.txt "side change"
  g checkout -q main
  cf main.txt "main change"
  m=$(H)
  install_real_hook pre-merge-commit
  hmerge --no-ff -m "merge side" side
  [ "$(H)" != "$m" ] || note_bad "the clean merge did not move HEAD"
  gs rev-parse -q --verify 'HEAD^2' >/dev/null || note_bad "HEAD is not a merge commit"
  finish 0
}

# Self-overlapping matches: the masked line is checked exactly.
expect_line() {
  grep -q -x -F -- "$1" "$OUT" || note_bad "expected the exact masked line: $1"
}
overlap_blob() {   # list line, text line, expected masked text
  printf '%s\n' "$1" >"$L_CI"
  cf a.txt "$2"
  run_sweep --show-redacted --range origin/main..HEAD
  expect_line "  line 1: $3"
  finish 1
}
overlap_message() {
  printf '%s\n' "$1" >"$L_CI"
  put a.txt "clean"
  cmm "tidy up\n\n$2\n"
  run_sweep --show-redacted --range origin/main..HEAD
  expect_line "  line 3: $3"
  finish 1
}
t_redacted_self_overlap_aba_blob()      { overlap_blob 'aba' 'xababa y' 'x##### y'; }
t_redacted_self_overlap_aa_blob()       { overlap_blob 'aa' 'caaac' 'c###c'; }
t_redacted_self_overlap_xyxy_blob()     { overlap_blob 'xyxy' 'xyxyxy' '######'; }
t_redacted_self_overlap_alternation_blob() { overlap_blob 'foo|oob' 'xfoob y' 'x#### y'; }
t_redacted_self_overlap_chain_blob()    { overlap_blob 'abc|bcd|cde' 'abcde' '#####'; }
t_redacted_self_overlap_aba_message()   { overlap_message 'aba' 'xababa y' 'x##### y'; }
t_redacted_self_overlap_aa_message()    { overlap_message 'aa' 'caaac' 'c###c'; }
t_redacted_self_overlap_xyxy_message()  { overlap_message 'xyxy' 'xyxyxy' '######'; }
t_redacted_self_overlap_alternation_message() { overlap_message 'foo|oob' 'xfoob y' 'x#### y'; }
t_redacted_self_overlap_chain_message() { overlap_message 'abc|bcd|cde' 'abcde' '#####'; }

no_control_bytes() {
  if grep -q "$(printf '\033')" "$OUT"; then note_bad "the output holds a raw ESC byte"; fi
  if grep -q "$(printf '\007')" "$OUT"; then note_bad "the output holds a raw BEL byte"; fi
}
t_redacted_control_bytes_in_blob_line_become_question_marks() {
  putf a.txt 'zorblax \033[31m red \007 bell\n'
  cm "control bytes"
  OUTMATCH='line 1: #+ \?\[31m red \? bell'
  run_sweep --show-redacted --range origin/main..HEAD
  no_control_bytes
  finish 1
}
t_redacted_control_bytes_in_message_line_become_question_marks() {
  forge_commit "" 'zorblax \033[31m red \007 bell'
  OUTMATCH='line 1: #+ \?\[31m red \? bell'
  run_sweep --show-redacted --range origin/main..forged
  no_control_bytes
  finish 1
}

run_sweep_limited() {   # seconds, then the script arguments; a run past the limit is killed
  local lim=$1 pid killer
  shift
  ( cd "$W" && apply_env && exec "$SWEEP_BASH" "$W/memento/tools/confidentiality-sweep.sh" "$@" ) \
    <"$STDIN" >"$OUT" 2>&1 &
  pid=$!
  ( sleep "$lim"; kill -9 "$pid" ) >/dev/null 2>&1 &
  killer=$!
  wait "$pid" 2>/dev/null
  RC=$?
  kill "$killer" >/dev/null 2>&1
  wait "$killer" >/dev/null 2>&1
}
t_redacted_two_megabyte_line_finishes_in_time() {
  { head -c 2097152 /dev/zero | tr '\0' 'a'; printf ' zorblax\n'; } >"$W/big.txt"
  g add big.txt
  cm "a very long line"
  run_sweep_limited 60 --show-redacted --range HEAD
  finish 1
}

t_published_republished_copy_under_new_path_block() {
  local c2
  cf leak.txt "residue: zorblax"
  run_sweep --published --update-baseline HEAD
  [ "$RC" -eq 0 ] || note_bad "--update-baseline exited $RC, expected 0"
  cp "$W/leak.txt" "$W/copy.txt"
  g add copy.txt
  cm "copy of the known file"
  c2=$(H)
  run_sweep --published HEAD
  finish 1 "$c2"
}
t_published_list_change_makes_old_hits_new() {
  local bad n
  cf leak.txt "residue: zorblax"
  run_sweep --published --update-baseline HEAD
  [ "$RC" -eq 0 ] || note_bad "--update-baseline exited $RC, expected 0"
  printf '%s\n' quuxwidget >>"$L_CI"
  OUTMATCH='lists'
  run_sweep --published HEAD
  if [ -f "$BASELINE" ]; then
    bad=$(grep -v -c -E '^[0-9a-f]{64}$' "$BASELINE")
    n=$(grep -c -E '^[0-9a-f]{64}$' "$BASELINE")
    [ "$bad" = 0 ] || note_bad "the baseline holds a line that is not a 64-hex hash"
    [ "$n" -ge 1 ] || note_bad "the baseline holds no hashes"
  else
    note_bad "no baseline file"
  fi
  finish 1
}
t_published_baseline_target_directory_exit2() {
  mkdir "$C/adir"
  BASELINE=$C/adir
  cf leak.txt "residue: zorblax"
  run_sweep --published --update-baseline HEAD
  finish 2
}
t_published_baseline_symlink_kept_and_target_updated() {
  local junk bad n
  junk=$(printf '%064d' 0)
  printf '%s\n' "$junk" >"$C/real-baseline.txt"
  ln -s "$C/real-baseline.txt" "$C/baseline-link"
  BASELINE=$C/baseline-link
  cf leak.txt "residue: zorblax"
  OUTMATCH='previously'
  run_sweep --published --update-baseline HEAD
  [ -L "$BASELINE" ] || note_bad "the baseline path is no longer a symlink"
  bad=$(grep -v -c -E '^[0-9a-f]{64}$' "$C/real-baseline.txt")
  n=$(grep -c -E '^[0-9a-f]{64}$' "$C/real-baseline.txt")
  [ "$bad" = 0 ] || note_bad "the target holds a line that is not a 64-hex hash"
  [ "$n" -ge 1 ] || note_bad "the target holds no hashes"
  if grep -q -F "$junk" "$C/real-baseline.txt"; then note_bad "the old entry survived in the target"; fi
  finish 0
}

SCISSORS='# ------------------------ >8 ------------------------'
# git keeps text below a scissors line under -m and -F, so the hook sweeps it.
t_commitmsg_token_below_scissors_line_block() {
  printf 'subject\n\n%s\ndiff --git a/x b/x\nzorblax below the line\n' "$SCISSORS" >"$(MSG_FILE)"
  run_sweep --commit-msg "$(MSG_FILE)"
  finish 1
}
t_commitmsg_token_above_scissors_line_block() {
  printf 'subject zorblax\n\n%s\nbelow the line\n' "$SCISSORS" >"$(MSG_FILE)"
  run_sweep --commit-msg "$(MSG_FILE)"
  finish 1
}

t_precommit_extra_argument_exit2() {
  put docs/a.txt "clean"
  run_sweep --pre-commit extra
  finish 2
}
t_commitmsg_extra_argument_exit2() {
  printf 'subject\n' >"$(MSG_FILE)"
  run_sweep --commit-msg "$(MSG_FILE)" extra
  finish 2
}


t_commitmsg_real_commit_scissors_in_m_message_refused() {
  install_real_hook commit-msg
  put docs/a.txt "clean"
  hcommit -q -m "$(printf 'subject\n%s\nbody zorblax' "$SCISSORS")"
  [ "$(H)" = "$BASE" ] || note_bad "the refused commit moved HEAD"
  finish N
}
t_commitmsg_hint_absent_when_hit_is_not_in_a_comment_line() {
  printf 'subject zorblax\n\nplain body\n' >"$(MSG_FILE)"
  run_sweep --commit-msg "$(MSG_FILE)"
  if grep -q -F "'#' line" "$OUT"; then note_bad "the comment-line hint was printed for a non-comment hit"; fi
  finish 1
}
t_commitmsg_hint_present_when_hit_is_in_a_comment_line() {
  printf 'subject\n\n# a comment line holding zorblax\n' >"$(MSG_FILE)"
  OUTMATCH="'#' line"
  run_sweep --commit-msg "$(MSG_FILE)"
  finish 1
}
t_redacted_chained_alternation_short_blob()    { overlap_blob 'ab|bcde|de' 'abcde' '#####'; }
t_redacted_chained_alternation_short_message() { overlap_message 'ab|bcde|de' 'abcde' '#####'; }
t_redacted_chained_alternation_long_blob()     { overlap_blob 'ab|bcdefg|fg' 'q abcdefg q' 'q ####### q'; }
t_redacted_chained_alternation_long_message()  { overlap_message 'ab|bcdefg|fg' 'q abcdefg q' 'q ####### q'; }
t_redacted_non_word_boundary_context_blob() {
  forbid foo
  forbid '\Bfoo'
  overlap_blob '\Bfoo' 'xfoo yfoo' 'x### y###'
}
t_redacted_non_word_boundary_context_message() {
  forbid foo
  forbid '\Bfoo'
  overlap_message '\Bfoo' 'xfoo yfoo' 'x### y###'
}

# ---------------------------------------------------------------- runner

for fn in $(compgen -A function | grep '^t_'); do
  name=$(echo "${fn#t_}" | tr '_' '-')
  if [ -n "${ONLY-}" ] && ! echo "$name" | grep -q -E "$ONLY"; then
    continue
  fi
  ( mkcase "$name"; "$fn" )
  if ! grep -q -E "^(PASS|FAIL) $name( |\$)" "$RESULTS"; then
    echo "FAIL $name (case did not report a result)"
    echo "FAIL $name (case did not report a result)" >>"$RESULTS"
  fi
done

pass=$(grep -c '^PASS ' "$RESULTS")
fail=$(grep -c '^FAIL ' "$RESULTS")
echo
echo "Summary: $pass passed, $fail failed, $((pass + fail)) run"
if [ "$fail" -eq 0 ] && [ "$pass" -gt 0 ]; then
  exit 0
fi
exit 1
