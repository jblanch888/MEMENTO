#!/usr/bin/env bash
set -euo pipefail
# PreCompact gate (CD #9f): /compact only after the pre-compact consolidation
# protocol has run and the User approved the drafts (max 3 learnings graduated,
# working-context coherently reset, STATUS session-scoped).
#
# Blocking convention imported from the lineage's live-proven hook (founding
# review finding 2): a JSON block decision on stdout, exit 0. Teeth remain
# UNVERIFIED in THIS estate until witnessed at the first live /compact —
# record the verdict in TOOLING_TRIGGERS.md.

MARKER=/tmp/memento-estate-precompact-done
MAX_AGE_MINUTES=30

if [ -f "$MARKER" ] && [ -n "$(find "$MARKER" -mmin -"$MAX_AGE_MINUTES" 2>/dev/null)" ]; then
  exit 0
fi

if [ -f "$MARKER" ]; then
  REASON="memento: pre-compact marker is STALE (>${MAX_AGE_MINUTES} min). Re-run the CD #9 consolidation protocol, get the User's approval, then: touch $MARKER"
else
  REASON="memento: NO pre-compact marker. Run the CD #9 consolidation protocol (max 3 learnings, coherent working-context reset, the User's approval of all drafts), then: touch $MARKER"
fi

printf '{"decision": "block", "reason": "%s"}\n' "$REASON"
exit 0
