---
description: active mission and task for the MEMENTO estate: working context, replaced coherently per CD #11
type: working-context
date: 2026-10-10
status: live
---

# CURRENT_FOCUS

## Mission

Produce and steward the **mid-2026 open-source version of Memento** in this repository. Charter: `../active-knowledge/CHARTER.md`. Public framing: continuity across hundreds of agent sessions; the framework is two-armed (memory prosthesis + operational protocols).

## Active plan

**The planning skill trial** (`../evidence-archive/plan-planning-skill-trial-2026-10-09.md`). It runs passively until 8 counted undertakings, or 2027-01-09.
- **Installed:** here and in Rooms. Codex lists the skill; a real load is still to be seen, in the User's next significant Codex undertaking.
- **Counting:** run `memento/tools/skill-trial-count.py trial` for each estate. The start times are in the plan. Check each case against its transcript first-hand.
- **Awareness:** sessions that have seen trial messages are kept apart. Awareness lapses at a clean compaction. Messages to Rooms leave the trial unnamed.
- **Tally (2026-10-10):** 0 of 8 counted; 6 apart, all from sessions aware of the trial.
- **The interim count** goes to the User at 4 counted cases.

**Other candidates, at the User's choice:**
- a multi-session test of continuity, where Memento claims its value;
- a dormant estate's drift check when it is reopened.

## Current state

**Closed on 2026-10-10:**
- **The implementation test** (`plan-ablation-implementation-test-2026-10-10.md`). Two features in Proportion, three arms each. The finding: no measurable effect of Memento, or of the planning playbook, on working software from a single-session build. Design quality varied in both directions. The sort's decision record carries a dated amendment noting this for unit 4b.
- **The Rooms level 2 reshape** (`plan-reshape-rooms-level2-2026-10-10.md`). No removal qualified on strong evidence. Five small items were done in Rooms. The falsifier date is 2026-12-09.
- **The governed optimisation playbook import** (`plan-import-optimisation-playbook-2026-10-10.md`). The playbook is in the canon.

**Canon version tags** (`plan-canon-versions-2026-10-09.md`):
- `v2026.10` is on 7200c20, and `v2026.10.1` on 195c249.
- **The rule:** `GIT_STANDARDS.md` §8. The change notes are in `CHANGES.md`.
- **The site** builds against a tag. Moving it to `v2026.10.1` is the User's call.

**Earlier and still true:**
- **The instances:** `handover-memento-instances-2026-10-08.md`.
- **The reshape** is closed for the active estates.
- **Rooms** is level with the canon.
- **The Bitter Lesson sort** is closed.
- **Record counts** are in use. They are observations, never targets (`memento/tools/README.md`).

**Posture (i):** the estate stays published with the canon.

**Publication state is never asserted in this file:** derive it live from git (`git status -sb`, `git log @{u}..`, `git log ..@{u}`) per CD #8d.

## Constraints

- **Seam:** root = canon, `memento/` = estate.
  - Commits declare their side (CD #10).
  - Pushes need the User's word (CD #4a). When he gives it, the assistant runs the push itself.
  - Commits use explicit file lists. Never use a directory-wide `git add`.
- **Writing rules (CD #5):** no em dashes in prose; no contrast framing in any form.
- **Canon wording** follows the ruled term table and glossary. The User rules final wording.
- **Confidentiality sweep:** at restart, after `git fetch`, run `memento/tools/confidentiality-sweep.sh --published origin/main`, and report any new hit. Never print a matched token or pattern.
- **Imports (CD #4e):** draft outside the tree, de-identify, review, then the User's clearance.
- **Agents:**
  - **Run in sequence.** Frontier only where judgement needs it.
  - **No Fable** in trials (the User, 2026-10-10).
  - **Witness harnesses** with the cheapest model first.
- **The permission system refuses deletions.** Say so, and only then hand the User the command.
- **Version tags:** made at the close of a change set, on the User's word, with a `CHANGES.md` entry. A tag is final (CD #4g).
- **Decisions go to the User in plain prose with leans.** Threads cap at ten exchanges.

## Open with the User

- **Rooms, in its session:** rulings on the consolidation ritual (retire the tripwire's action and archive the runbook, rooms/dev's lean) and on a CHECK 13 ratchet.
- **build-protocols:**
  - moving the page to `v2026.10.1`;
  - the `adoption/` ruling;
  - the epoch comparison: the two opinions are with him.
- **The messaging service's thread:** commit the User's hold change, and fix the Codex SessionStart hook, which prints plain text where JSON is expected.
- **The trial folder** `~/abl-trial` (product work), kept until he rules.
- **Spawn-tier eyeball items,** and Proportion's owed items when it wakes.
- **The tier map backup file:** the User runs `rm framework/conventions/TIER_MAP.json.bak-20260919`. It is byte-identical to 1937426.
