---
description: active mission and task for the MEMENTO estate: working context, replaced coherently per CD #11
type: working-context
date: 2026-10-03
status: live
---

# CURRENT_FOCUS

## Mission

Produce and steward the **mid-2026 open-source version of Memento** in this repository. Charter: `../active-knowledge/CHARTER.md`. Public framing: continuity across hundreds of agent sessions; the framework is two-armed (memory prosthesis + operational protocols).

## Active Playbook and plan

**Plan: leak hardening** (`../evidence-archive/plan-leak-hardening-2026-10-03.md`), APPROVED 2026-10-03. Slices 1a (the push gate) and 1b (commit-time sweeps, the sweep of what is published, the redacted view) complete and validated, and slice 1c (the documents) complete; slice 2 (the directive, CD #4e) next, the User choosing the option and ruling the wording. PLANNING governs; slices run WIP of one, each to the User's eyeball.

## Current state

- **Posture (i) reaffirmed by the User, 2026-10-03:** the estate stays published with the canon. Other Memento instances, some holding material that must stay private, now feed lessons and messages into these sessions; that is the reason for the active plan.
- The canon reads in plain language across README, docs/index, story/, framework/ and adoption/; a "Words used here" glossary sits in `framework/README.md`. The estate (`memento/`) keeps its own vocabulary by ruling (D3 of the plain-language plan).
- The spawn-tier control plan (`plan-spawn-tier-control-across-estates-2026-09-06.md`) is DONE in this estate bar Proportion's owed items and the User's eyeball passes in its §15.
- **Publication state is never asserted in this file: derive it live from git (`git status -sb`, `git log @{u}..`, `git log ..@{u}`) per CD #8d.**

## Constraints

- **Seam:** root = canon, `memento/` = estate; commits declare their side (CD #10); pushes User-only (CD #4a). Commits use explicit file lists written out from the work's own files.
- **Writing rules (CD #5):** no em dashes in prose; no contrast framing in any form; reviewers hunt the pattern.
- **Canon wording:** new canon text follows the ruled term table and the glossary. Astra (`agent-messaging/astra-reviewer`) reviews wording changes; the User rules final wording.
- **The confidentiality sweep runs LAST, on the final tracked tree, before any ready-to-push claim** (`memento/tools/confidentiality-sweep.sh`, pre-push hook; token list outside the repo). It sweeps everything a push publishes (outgoing blobs, paths, commit and tag objects, ref names) and fails closed; the pre-commit, pre-merge-commit and commit-msg hooks sweep each commit as it is made. Uncommitted and untracked files get a direct grep. At restart, after `git fetch`, run `memento/tools/confidentiality-sweep.sh --published origin/main`: known hits are counted against `~/.memento/sweep-baseline.txt`, and any new hit is a finding for the User. Inspect a hit only with `--show-redacted`. Never print a matched token or pattern into the session; report counts, paths and hashes.
- **Material from other instances** (agent-messaging, relayed lessons, tool copies) is an import under CD #4e: de-identified and cleared by the User before it reaches any tracked file. Slice 2 of the active plan writes this into the directive.
- **Text published through `gh`** is swept by hand first (plan decision D3, until a guard exists).
- Canon self-claims re-ground with the User; generic naming; private hashes stay out of canon text, and hashes of published residue stay out of every tracked file.

## Open with the User

- **Tier map:** rooms/dev reports the live-dispatch witness passed on Claude Code 2.1.286 (2026-09-30); the canon edit of `verified_against` (2.1.271 to 2.1.286) and `policy.last_verified` awaits his go. Also raised: the judgement role's rank 0 against the main thread's rank 1 model, and the haiku alias trailing a generation. The script's default `--map` path does not resolve in this repository.
- **Tool copies in Rooms and Proportion:** `generate_agents.py` and `tier-map-check.py` changed here (`1addabb`); Rooms' doctor CHECK 9 fails on the drift. Whether, when and who copies in is his call.
- **The Bitter Lesson audit sort** (build-protocols, 2026-10-02): sort the parts into compensating, record-holding and authority-keeping kinds, and give the compensating kind retirement criteria. For discussion.
- **Restart loading:** nothing in this repository loads CD #8 at session start (no CLAUDE.md, no SessionStart hook); options are a root CLAUDE.md (canon side, published) or a local hook.
- **Build-protocols** re-syncs the explainer page's quotes from the canon commits once they are public (derive publication from git).
- **Six inherited adoption gaps** (plain-language plan, slice 4 record): SPIRIT.md's links after copying, pointing the agent at SPIRIT.md, STATUS in set-up step 3, the advance-build exception, the founding plan's timing, a link to the writing rules. Not taken up.
- **Spawn-tier eyeball items** (that plan's §15): the tier map's role efforts, the slice-4 canon passages, the register row.
- **Untracked leftovers:** `.tmp-agents-after/` and `framework/conventions/TIER_MAP.json.bak-20260919`; deletion is his call.
