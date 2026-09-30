---
description: active mission and task for the MEMENTO estate: working context, replaced coherently per CD #11
type: working-context
date: 2026-10-01
status: live
---

# CURRENT_FOCUS

## Mission

Produce and steward the **mid-2026 open-source version of Memento** in this repository. Charter: `../active-knowledge/CHARTER.md`. Public framing: continuity across hundreds of agent sessions; the framework is two-armed (memory prosthesis + operational protocols).

## Active Playbook and plan

PLANNING governs. **Active plan:** `../evidence-archive/plan-canon-plain-language-2026-10-01.md` (approved by the User 2026-10-01, D1 to D5 ruled): a plain-language pass on the canon, at the source, after Astra's newcomer review of the Memento explainer page. **Current slice: 0**, the term table, proposed in the plan's slice record, awaiting Astra's review and the User's ruling. Slices 1 to 4 follow, WIP of one.

## Current state

- The mid-2026 canon is content-complete. The spawn-tier control plan (`plan-spawn-tier-control-across-estates-2026-09-06.md`) is DONE in this estate bar Proportion's owed items and the User's eyeball passes listed in its §15.
- **Publication state is never asserted in this file: derive it live from git (`git status -sb`, `git log @{u}..`, `git log ..@{u}`) per CD #8d.**

## Constraints

- **Seam:** root = canon, `memento/` = estate; commits declare their side (CD #10); pushes User-only (CD #4a).
- **Writing rules (CD #5):** no em dashes in prose; no contrast framing in any form; reviewers hunt the pattern. Astra's suggested wording passes CD #5 before adoption.
- **Plain-language pass:** Astra (`agent-messaging/astra-reviewer`) reviews every wording change; **the User rules every changed sentence**, and no wording reaches a commit without his ruling. A review request is a new message, so it goes in a turn the User starts.
- **The confidentiality sweep runs LAST, on the final tracked tree, before any ready-to-push claim** (`memento/tools/confidentiality-sweep.sh`, pre-push hook; token list lives outside the repo). The script covers tracked files only; new untracked files get a direct grep.
- Canon self-claims re-ground with the User; generic naming; private hashes stay out of canon text.

## Open with the User

- **Tier-map harness drift:** `tier-map-check.py --map framework/conventions/TIER_MAP.json` reports the CLI at 2.1.280 against a binding verified at 2.1.271; the live-dispatch witness is owed, then a canon edit of `verified_against`. The script's default `--map` path does not resolve in this repository.
- **Spawn-tier eyeball items** (plan §15): the tier map's role efforts, the three slice-4 canon passages, the register row.
- **Untracked `framework/conventions/TIER_MAP.json.bak-20260919`:** redundant with history (differs only in `verified_against`); deletion is his call.
- **Origin carries the User's web edit to STATUS.md** (`ca22cb8`), which local history does not contain; reconcile it at the next pull.
