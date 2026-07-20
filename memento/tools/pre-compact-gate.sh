#!/usr/bin/env bash
set -euo pipefail
# PreCompact gate (CD #9f): /compact only after the pre-compact consolidation
# protocol has run and the User approved the drafts (max 3 learnings graduated,
# working-context coherently reset, STATUS session-scoped).
#
# Blocking convention imported from the lineage's live-proven hook (founding
# review finding 2): a JSON block decision on stdout, exit 0.
#
# v2 (2026-07-21, external-review finding 1): the marker is repo-scoped (a
# hash of the project directory, so clones and sibling estates cannot share
# an approval) and consumed on use (one approval authorises exactly one
# compaction). Falsifier, witness plan and arm-by-arm teeth status live on
# the TOOLING_TRIGGERS register row.

# CLAUDE_PROJECT_DIR is set by the harness; the $PWD fallback exists only for
# bench-testing outside it, where the computed path follows the shell's cwd.
PROJECT_DIR="${CLAUDE_PROJECT_DIR:-$PWD}"
SCOPE=$(printf '%s' "$PROJECT_DIR" | shasum | cut -c1-12)
MARKER="/tmp/memento-precompact-${SCOPE}"
MAX_AGE_MINUTES=30

if [ -f "$MARKER" ] && [ -n "$(find "$MARKER" -mmin -"$MAX_AGE_MINUTES" 2>/dev/null)" ]; then
  rm -f "$MARKER"
  exit 0
fi

if [ -f "$MARKER" ]; then
  REASON="memento: pre-compact marker is STALE (>${MAX_AGE_MINUTES} min). Re-run the CD #9 consolidation protocol, get the User's approval, then: touch $MARKER"
else
  REASON="memento: NO pre-compact marker. Run the CD #9 consolidation protocol (max 3 learnings, coherent working-context reset, the User's approval of all drafts), then: touch $MARKER"
fi

printf '{"decision": "block", "reason": "%s"}\n' "$REASON"
exit 0
