#!/usr/bin/env bash
set -euo pipefail
# Confidentiality sweep: greps every TRACKED file against a banned-token list
# held OUTSIDE the repository (the list itself must never be committed — a
# public check that contains its own tokens republishes them).
#
# Earned 2026-07-21 by incident: an external re-review caught banned literals
# published inside the very memo that documented their banning, because the
# manual sweep ran before the final writes. The rule this mechanises: the
# sweep runs LAST, on the final tracked tree. Wired as .githooks/pre-push
# (activate per clone: git config core.hooksPath .githooks); also runnable
# standalone. Falsifier and witness plan: TOOLING_TRIGGERS register row.

LIST="${MEMENTO_BANNED_TOKENS:-$HOME/.memento/banned-tokens.txt}"

if [ ! -f "$LIST" ]; then
  echo "confidentiality-sweep: BLOCKED — no banned-token list at $LIST" >&2
  echo "Create it: one case-insensitive extended-regex pattern per line; '#' comments allowed." >&2
  exit 1
fi

PATTERN=$(grep -v '^#' "$LIST" | grep -v '^[[:space:]]*$' | paste -sd '|' -)
if [ -z "$PATTERN" ]; then
  echo "confidentiality-sweep: BLOCKED — token list at $LIST is empty" >&2
  exit 1
fi

cd "$(git rev-parse --show-toplevel)"
HITS=$(git ls-files -z | xargs -0 grep -iInE "$PATTERN" -- 2>/dev/null || true)

if [ -n "$HITS" ]; then
  echo "confidentiality-sweep: BLOCKED — banned tokens in the tracked tree:" >&2
  echo "$HITS" >&2
  exit 1
fi

echo "confidentiality-sweep: clean ($(git ls-files | wc -l | tr -d ' ') tracked files)"
