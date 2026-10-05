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

**Plan: the Bitter Lesson sort** (`../evidence-archive/plan-bitter-lesson-sort-2026-10-03.md`), APPROVED 2026-10-03. Slice 0 is DONE: the User chose **F with G** on 2026-10-06 (an assumption register keyed to model releases; each unit marked as prescribed procedure or judgement practice, with prescribed procedure expected to fade at a model change). **Next: slice 1**, the kinds and the unit with the User. The lean's first test, a without-the-part trial on the planning playbook, is its own undertaking. PLANNING governs; slices run WIP of one.

## Current state

- **Evidence for the sort is banked:** `finding-exercise-census-2026-10-03.md` and `finding-longitudinal-evidence-2026-10-03.md`, with receipts, scripts and scout reports held privately at `~/.memento/census/` (receipts index `receipts-2026-10-03.md`). build-protocols/dev has the findings (thread `t-20261003-190701-f9facd`).
- **Leak hardening is CLOSED** (the User, 2026-10-06).
- **Tier map, 2026-10-06 (canon):** verified against CLI 2.1.286; judgement role at rank 1 (the User's main thread is Opus 5.5); the scout carries no agent memory, so its no-write guarantee is enforced; the reviewer keeps memory, and with it the runtime's Write and Edit, so its no-write guarantee is behavioural. The tier-gate witness runs 82 of 82 again after 1addabb's path guard. Rooms/dev copies the map and tools in and regenerates, on the User's ruling. Haiku, the User 2026-10-06: recon spawns default to the latest Haiku available, which the bare `haiku` alias gives.
- **Posture (i) reaffirmed by the User, 2026-10-03:** the estate stays published with the canon.
- The canon reads in plain language; the estate keeps its own vocabulary (D3).
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
- **Agent-messaging threads cap at ten exchanges;** a reply past the cap is held for the User. Open a new thread on his word when a topic runs on.

## Open with the User

- **The sort, slice 1:** the kinds and the unit, on F with G.
- **Build-protocols** re-syncs the explainer page's quotes from the canon commits once they are public.
- **Six inherited adoption gaps** (plain-language plan, slice 4 record). Not taken up.
- **Spawn-tier eyeball items** (that plan's §15).
- **Untracked leftovers:** `.tmp-agents-after/` and `framework/conventions/TIER_MAP.json.bak-20260919`; deletion is his call.
