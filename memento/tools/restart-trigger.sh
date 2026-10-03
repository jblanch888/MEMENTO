#!/usr/bin/env bash
# Restart trigger: makes the Session Restart Protocol (CD #8) fire when it
# should, by putting the instruction into the session's context.
#
# Earned 2026-10-03 by incident: the User said "restart" and the session took
# a messaging role without running CD #8. Nothing in this repository loaded
# the directives at session start, so the protocol depended on the model
# remembering to look.
#
# Usage (wired in .claude/settings.json):
#   restart-trigger.sh session-start   SessionStart (startup, resume, clear,
#                                      compact): always prints the instruction
#   restart-trigger.sh prompt          UserPromptSubmit: reads the hook JSON on
#                                      stdin and prints the instruction when
#                                      the prompt holds the word "restart"
#                                      (also "restrt" and "re-start"), skipping
#                                      agent hand-backs and other sessions'
#                                      messages, which arrive as prompts too
# The hook's stdout is added to the session's context. It exits 0 in every
# case, so it can never block a prompt or a session.

MSG='MEMENTO: run the Session Restart Protocol (CD #8) before anything else in this turn. Read memento/protocols/CORE_DIRECTIVES.md, memento/memory-prosthesis/working-context/CURRENT_FOCUS.md and STATUS.md; reconcile them with live git (git fetch, git status -sb, ahead and behind); state each mismatch as the live value adopted and the stale claim dropped. Then run memento/tools/confidentiality-sweep.sh --published origin/main and report any new hit to the User. Then carry on with what the User asked.'

case ${1:-} in
  session-start)
    printf '%s\n' "$MSG" ;;
  prompt)
    if python3 -c '
import json, re, sys
d = json.load(sys.stdin)
p = d.get("prompt", "")
# Agent hand-backs and messages from other sessions arrive as prompts too. What counts is what the User types.
if "<agent-message" in p or "[Subagent hand-back]" in p or p.startswith("Another Claude session"):
    sys.exit(1)
sys.exit(0 if re.search(r"\bre-?sta?rt", p, re.I) else 1)
' 2>/dev/null; then
      printf '%s\n' "$MSG"
    fi ;;
esac
exit 0
