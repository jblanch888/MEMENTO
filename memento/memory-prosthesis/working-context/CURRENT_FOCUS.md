---
description: active mission and task for the MEMENTO estate: working context, replaced coherently per CD #11
type: working-context
date: 2026-10-08
status: live
---

# CURRENT_FOCUS

## Mission

Produce and steward the **mid-2026 open-source version of Memento** in this repository. Charter: `../active-knowledge/CHARTER.md`. Public framing: continuity across hundreds of agent sessions; the framework is two-armed (memory prosthesis + operational protocols).

## Active plan

**No active plan.** The next undertaking is the User's choice. The candidates:
- a dormant estate's drift check and reshape, when Proportion, cartographer or the writing estate is reopened;
- the skills trial (the planning playbook packaged as a skill, alongside the playbook);
- resuming the ablation trial as an implementation test;
- a level 2 reshape of Rooms' own files.

PLANNING governs whichever is chosen. A playbook or skill is brought in when the work calls for one (CD #1).

## Current state

- **Every known Memento instance and its state:** `../evidence-archive/handover-memento-instances-2026-10-08.md`. The full private table is at `~/.memento/reshape/`.
- **The reshape plan is CLOSED for the active estates** (`plan-reshape-memento-2026-10-06.md`). In the canon (change sets 1, 1b, 2 and 2b, pushed):
  - three playbooks became standards in `framework/conventions/`;
  - CD #1 brings in a playbook or skill when the work calls for one;
  - six practices were imported from Rooms;
  - CD #4g was added;
  - the directives are now "Foundation", dated and revisable.
- **Rooms** is level with the canon. Re-syncing 2b is the User's call in its session.
- **The Bitter Lesson sort** is CLOSED (`decision-bitter-lesson-sort-2026-10-06.md`). The ablation trial is CLOSED at the pilot stage and can be resumed (`plan-memento-ablation-trial-2026-10-06.md`). Record counts are in place; the first live lines come with the next plan.
- **Posture (i):** the estate stays published with the canon. The canon reads in plain language; the estate keeps its own vocabulary.
- **Publication state is never asserted in this file: derive it live from git (`git status -sb`, `git log @{u}..`, `git log ..@{u}`) per CD #8d.**

## Constraints

- **Seam:** root = canon, `memento/` = estate; commits declare their side (CD #10); pushes User-only (CD #4a). Commits use explicit file lists written out from the work's own files. Never use a directory-wide `git add`.
- **Writing rules (CD #5):** no em dashes in prose; no contrast framing in any form; reviewers hunt the pattern.
- **Canon wording:** follows the ruled term table and glossary. Astra (role `astra/reviewer`) reviews wording; the User rules final wording.
- **Confidentiality sweep:** it sweeps everything a push publishes and each commit as it is made. At restart, after `git fetch`, run `memento/tools/confidentiality-sweep.sh --published origin/main`, and report any new hit. Never print a matched token or pattern.
- **Imports (CD #4e):** material from another instance, or confidential material, is drafted outside the working tree, de-identified, reviewed and cleared by the User (`memento/tools/README.md`, § Imports).
- **Agent work runs in sequence by default.** Frontier agents only where judgement needs them, one at a time.
- **The permission system refuses deletions and edits to agent settings in other folders.** Hand such steps to the User as a script he runs (`! bash <path>`).
- **Decisions go to the User in plain prose with leans.** Agent-messaging threads cap at ten exchanges.

## Open with the User

- **The next undertaking** (see Active plan).
- **The trial folder** `~/abl-trial` (product work, outside both repositories), kept until he rules.
- **Build-protocols** re-syncs its explainer page from the canon commits.
- **Spawn-tier eyeball items** (that plan's §15), and Proportion's owed items when it wakes.
- **Untracked leftovers:** `.tmp-agents-after/` and `framework/conventions/TIER_MAP.json.bak-20260919`; deletion is his call.
