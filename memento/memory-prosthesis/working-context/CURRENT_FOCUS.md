---
description: active mission and task for the MEMENTO estate: working context, replaced coherently per CD #11
type: working-context
date: 2026-10-06
status: live
---

# CURRENT_FOCUS

## Mission

Produce and steward the **mid-2026 open-source version of Memento** in this repository. Charter: `../active-knowledge/CHARTER.md`. Public framing: continuity across hundreds of agent sessions; the framework is two-armed (memory prosthesis + operational protocols).

## Active Playbook and plan

**Plan: the Bitter Lesson sort** (`../evidence-archive/plan-bitter-lesson-sort-2026-10-03.md`), APPROVED 2026-10-03. Slice 0 (alternatives to the sort) is banked as `../evidence-archive/design-sort-alternatives-2026-10-03.md` and awaits the User's choice; the session's lean is F with G (an assumption register keyed to model releases, sorted by prescribed procedure or judgement practice), with a without-the-part trial aimed at the planning playbook. **Plan: leak hardening** (`../evidence-archive/plan-leak-hardening-2026-10-03.md`): all slices done and validated; awaits the User's word to close. PLANNING governs; slices run WIP of one.

## Current state

- **Evidence for the sort is banked:** `finding-exercise-census-2026-10-03.md` (use, content-free) and `finding-longitudinal-evidence-2026-10-03.md` (the 2025 founding to October 2026 across model generations). Receipts, scripts and scout reports are held privately at `~/.memento/census/` (receipts index `receipts-2026-10-03.md`); the census can be re-run from there. build-protocols/dev has the findings (thread `t-20261003-190701-f9facd`) and raised whether its explainer figure of the plan rule is affected; the answer given: the rule is unaffected, the playbook's step sequence is what a trial could retire.
- **Posture (i) reaffirmed by the User, 2026-10-03:** the estate stays published with the canon.
- **Restart:** SessionStart and "restart" prompts put CD #8 into context (`memento/tools/restart-trigger.sh`); the session-start arm is unwitnessed.
- The canon reads in plain language; the estate keeps its own vocabulary (D3).
- The spawn-tier control plan is DONE in this estate bar Proportion's owed items and the User's eyeball passes in its §15.
- **Publication state is never asserted in this file: derive it live from git (`git status -sb`, `git log @{u}..`, `git log ..@{u}`) per CD #8d.**

## Constraints

- **Seam:** root = canon, `memento/` = estate; commits declare their side (CD #10); pushes User-only (CD #4a). Commits use explicit file lists written out from the work's own files.
- **Writing rules (CD #5):** no em dashes in prose; no contrast framing in any form; reviewers hunt the pattern.
- **Canon wording:** new canon text follows the ruled term table and the glossary. Astra (`agent-messaging/astra-reviewer`) reviews wording changes; the User rules final wording.
- **Confidentiality sweep:** it sweeps everything a push publishes and each commit as it is made, and fails closed. Uncommitted and untracked files get a direct grep. At restart, after `git fetch`, run `memento/tools/confidentiality-sweep.sh --published origin/main`: known hits are counted against `~/.memento/sweep-baseline.txt`, and any new hit is a finding for the User. Inspect a hit only with `--show-redacted`. Never print a matched token or pattern into the session; report counts, paths and hashes.
- **Imports (CD #4e):** material from another Memento instance, and confidential material from any source, is drafted outside the working tree and enters the repository, a commit, a shared document or a message after a de-identification pass and the User's clearance. Procedure: `memento/tools/README.md`, § Imports.
- **Text published through `gh`** is swept by hand first (`gh` is not logged in on this machine; the User runs `gh auth login`).
- Canon self-claims re-ground with the User; generic naming; private hashes stay out of canon text, and hashes of published residue stay out of every tracked file.
- **Decisions go to the User in plain prose with leans.**

## Open with the User

- **The sort, slice 0:** his choice among A to G (lean: F with G).
- **Leak hardening:** his word to close the plan.
- **Tier map and Rooms tool copies:** who does which (proposal: this session edits the canon tier map, `verified_against` 2.1.271 to 2.1.286 and `policy.last_verified`; rooms/dev copies in the `1addabb` tools). Also raised by rooms/dev: the judgement role's rank against the main thread's model, and the haiku alias trailing a generation. The script's default `--map` path does not resolve in this repository.
- **Build-protocols** re-syncs the explainer page's quotes from the canon commits once they are public.
- **Six inherited adoption gaps** (plain-language plan, slice 4 record). Not taken up.
- **Spawn-tier eyeball items** (that plan's §15).
- **Untracked leftovers:** `.tmp-agents-after/` and `framework/conventions/TIER_MAP.json.bak-20260919`; deletion is his call.
