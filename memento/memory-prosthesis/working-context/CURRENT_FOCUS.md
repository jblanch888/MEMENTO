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

**Plan: reshape Memento on evidence** (`../evidence-archive/plan-reshape-memento-2026-10-06.md`), APPROVED 2026-10-06. It reshapes the canon, this estate and every live instance, with action proportionate to the strength of evidence (the User: "strong evidence strong action, weak evidence restraint"). STRONG needs a test or two independent criteria. Records and the authority, confidentiality and safety parts are protected. The planning playbook is kept. **Now: slice 0** with the User: the grade table, the two repositories of unknown status, and the owner roles. Then a cheap pilot on the canon and this estate. Instance repository names beyond those already public are held privately at `~/.memento/reshape/`. PLANNING governs; slices run WIP of one.

## Current state

- **The Bitter Lesson sort is CLOSED** (`../evidence-archive/decision-bitter-lesson-sort-2026-10-06.md`). Of 37 units, 5 are prescribed procedure, 9 judgement practice, 22 independent of the model and 1 deferred. Each unit carries its review clock and its test. Evidence is banked in `finding-exercise-census-2026-10-03.md` and `finding-longitudinal-evidence-2026-10-03.md`. Receipts are held privately at `~/.memento/census/`.
- **The ablation trial is CLOSED at the pilot stage** (`../evidence-archive/plan-memento-ablation-trial-2026-10-06.md`). Two features were run. Full Memento ranked first on the mean both times, and the playbook's effect is unresolved. The trial is resumable after a recorded revision.
- **Record counts are in place** (`../evidence-archive/plan-record-counts-2026-10-06.md`). Each review and slice record ends with its counts line (`memento/tools/README.md`, § Record counts; planning playbook spine item 6). The first live use is on the next plan.
- **Leak hardening is CLOSED.** The confidentiality sweep covers everything a push publishes.
- **Tier map (canon):**
  - verified against CLI 2.1.286;
  - the judgement role at rank 1;
  - the scout carries no agent memory, so its no-write guarantee is enforced;
  - the reviewer's guarantee is behavioural;
  - recon spawns use the latest Haiku through the bare alias.
- **Fired build triggers** (doctor, pattern-search probe, restart-diff, generated indexes) stay held. Each is a unit in the sort's decision record.
- **Posture (i), reaffirmed 2026-10-03:** the estate stays published with the canon. The canon reads in plain language; the estate keeps its own vocabulary (D3).
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
- **Agent work runs in sequence by default.** Many frontier agents in parallel spent a large share of the User's session allowance in minutes (2026-10-06).
- **Agent-messaging threads cap at ten exchanges;** a reply past the cap is held for the User. Open a new thread on his word when a topic runs on.

## Open with the User

- **The trial folder** `~/abl-trial` holds product work outside both repositories. It is kept until the User rules on it; the review copies are already deleted.
- **Build-protocols** re-syncs the explainer page's quotes from the canon commits once they are public.
- **Spawn-tier eyeball items** (that plan's §15). Proportion is dormant, so its gate trial (9 of 20 spawns, no denies) and its owed items wait for its next session.
- **Untracked leftovers:** `.tmp-agents-after/` and `framework/conventions/TIER_MAP.json.bak-20260919`; deletion is his call.
