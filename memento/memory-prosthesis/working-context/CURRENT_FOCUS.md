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

PLANNING governs. **Plan:** `../evidence-archive/plan-canon-plain-language-2026-10-01.md`, the plain-language pass on the canon. All slices (0 to 4) are ruled by the User sentence by sentence and committed; the close-out record is written. **The plan closes on the User's confirmation (CD #2).** No other undertaking is active.

## Current state

- The canon now reads in plain language across README, docs/index, story/, framework/ and adoption/; a "Words used here" glossary sits in `framework/README.md`. The estate (`memento/`) keeps its own vocabulary by ruling (D3).
- The spawn-tier control plan (`plan-spawn-tier-control-across-estates-2026-09-06.md`) is DONE in this estate bar Proportion's owed items and the User's eyeball passes in its §15.
- **Publication state is never asserted in this file: derive it live from git (`git status -sb`, `git log @{u}..`, `git log ..@{u}`) per CD #8d.**

## Constraints

- **Seam:** root = canon, `memento/` = estate; commits declare their side (CD #10); pushes User-only (CD #4a). Commits use explicit file lists written out from the work's own files.
- **Writing rules (CD #5):** no em dashes in prose; no contrast framing in any form; reviewers hunt the pattern.
- **Canon wording:** new canon text follows the ruled term table (plan, slice 0) and the glossary. Astra (`agent-messaging/astra-reviewer`) reviews wording changes; the User rules final wording.
- **The confidentiality sweep runs LAST, on the final tracked tree, before any ready-to-push claim** (`memento/tools/confidentiality-sweep.sh`, pre-push hook; token list outside the repo). It covers tracked files only; new untracked files get a direct grep.
- Canon self-claims re-ground with the User; generic naming; private hashes stay out of canon text.

## Open with the User

- **Confirm the plain-language plan closed**, or name what remains.
- **The push.** It publishes the plain-language commits and the six September canon commits together, and must reconcile the User's web edit to STATUS.md on origin (`ca22cb8`). Build-protocols re-syncs the explainer page's quotes once the commits are public.
- **Six inherited adoption gaps** (plan, slice 4 record): SPIRIT.md's links after copying, pointing the agent at SPIRIT.md, STATUS in set-up step 3, the advance-build exception, the founding plan's timing, a link to the writing rules. Not taken up.
- **GitHub repository description:** the plain version proposed in slice 1, for the User to set in the GitHub UI.
- **Tier-map harness drift:** `tier-map-check.py --map framework/conventions/TIER_MAP.json` reported the CLI at 2.1.280 against a binding verified at 2.1.271; the live-dispatch witness is owed, then a canon edit of `verified_against`. The script's default `--map` path does not resolve in this repository.
- **Spawn-tier eyeball items** (that plan's §15): the tier map's role efforts, the slice-4 canon passages, the register row.
- **Untracked `framework/conventions/TIER_MAP.json.bak-20260919`:** redundant with history; deletion is his call.
