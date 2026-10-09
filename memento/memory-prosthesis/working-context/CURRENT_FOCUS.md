---
description: active mission and task for the MEMENTO estate: working context, replaced coherently per CD #11
type: working-context
date: 2026-10-09
status: live
---

# CURRENT_FOCUS

## Mission

Produce and steward the **mid-2026 open-source version of Memento** in this repository. Charter: `../active-knowledge/CHARTER.md`. Public framing: continuity across hundreds of agent sessions; the framework is two-armed (memory prosthesis + operational protocols).

## Active plan

**The planning skill trial** (`../evidence-archive/plan-planning-skill-trial-2026-10-09.md`).
- **Status:** slices 1 and 2 are done. The skill is installed here and in Rooms; Codex lists it, and a real load is still to be seen.
- **Slice 3:** counting runs until 8 undertakings or 2027-01-09. Run `memento/tools/skill-trial-count.py trial` for each estate (start times are in the plan). Check each case against its transcript first-hand.
- **The interim count** goes to the User at 4 counted cases.
- **Tally:** 0 of 8 counted, 1 flagged apart (the session had seen the trial invitation). Cases from sessions that have seen trial messages are kept out of the 8 (the User, 2026-10-09).

**Other candidates, at the User's choice:**
- a dormant estate's drift check when it is reopened;
- the ablation trial resumed as an implementation test;
- a level 2 reshape of Rooms.

## Current state

- **Every known Memento instance and its state:** `../evidence-archive/handover-memento-instances-2026-10-08.md`. The full private table is at `~/.memento/reshape/`.
- **The reshape plan is CLOSED for the active estates** (`plan-reshape-memento-2026-10-06.md`). In the canon (change sets 1, 1b, 2 and 2b, pushed):
  - three playbooks became standards in `framework/conventions/`;
  - CD #1 brings in a playbook or skill when the work calls for one;
  - six practices were imported from Rooms;
  - CD #4g was added;
  - the directives are now "Foundation", dated and revisable.
- **Rooms** is level with the canon. It has adopted 2b in part (CD #4g and governing-stale; it declined CD #9a's approval step for index refreshes). Its knowledge-archive limit is now 900 lines.
- **Canon version tags** (`plan-canon-versions-2026-10-09.md`, DONE). `v2026.10` was pushed on 7200c20, with the rule in `GIT_STANDARDS.md` §8 and the change note in `CHANGES.md`. The site and build-protocols build against tags.
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
- **Version tags:** a tag is made at the close of a change set, on the User's word, with a `CHANGES.md` entry, and the User pushes it. A tag is final, and only the User may move or delete one (CD #4g).
- **Decisions go to the User in plain prose with leans.** Agent-messaging threads cap at ten exchanges.

## Open with the User

- **The next undertaking** (see Active plan).
- **The trial folder** `~/abl-trial` (product work, outside both repositories), kept until he rules.
- **Build-protocols**, on the User's approval in its session: the links check compares against the newest tag; the page is re-synced from `1c8adfc` to `v2026.10`. Still open there: the User's `adoption/` ruling and the dual-thread unit.
- **The messaging service's hold change** (applied by the User on 2026-10-08, 133 tests pass) awaits a commit by that repository's own thread.
- **Spawn-tier eyeball items** (that plan's §15), and Proportion's owed items when it wakes.
- **The tier map backup** `framework/conventions/TIER_MAP.json.bak-20260919` (byte-identical to commit 1937426) is to be deleted. The User runs the deletion, because the permission system refuses it.
