---
description: plan to grade Rooms' own Memento elements on evidence and propose removals, consolidations and refinements to the User, read-only from this estate, with changes made by rooms/dev on the User's rulings in Rooms' session
type: plan
date: 2026-10-10
genre: investigation (3B), then design/decision (3C)
size: M (four slices)
status: APPROVED 2026-10-10 (the User: "1 approve 2 fine 3 ok": the plan, the runbook scope boundary, the 60-day falsifier); slice 1 in progress
related: [plan-reshape-memento-2026-10-06, design-reshape-batch1-2026-10-07, handover-memento-instances-2026-10-08, decision-bitter-lesson-sort-2026-10-06, plan-planning-skill-trial-2026-10-09]
---

# Plan: reshape Rooms, level 2

## Origin and authority

On 2026-10-10 the User chose "rooms reshape" from the options left by the reshape plan. Level 1 brought Rooms level with the canon, and it is closed. Level 2 grades the elements Rooms added for itself. The aim is the User's original one: "reshape memento by removing unnecessary elements and perhaps even refining some of the remaining via reviewing evidence", acting on "strong evidence strong action, weak evidence restraint".

## Pattern Search Results

- **The method exists** (`plan-reshape-memento-2026-10-06.md`):
  - **Grades:**
    - STRONG needs a test, or two independent criteria: inert by a firing test, non-use corroborated, duplicated in the same repository, or superseded.
    - MODERATE is one criterion.
    - WEAK and NO-EVIDENCE mean keep.
  - **Protected categories:** authority, confidentiality, safety, the record.
  - **The standards rule:** a standard moves to a permanent home, and only the procedure around it goes.
  - **Three homes** for what remains: standards and conventions, skills, directives or hooks.
  - **Level 1 in Rooms:** read-only by script, output outside every repository, scouts on a closed schema with no quotation.
- **Rooms' own elements, read-only inventory, 2026-10-10:**
  - `memento/protocols/`: eight governing documents besides the directives (architecture principles, the confidence scheme, the estate spine, git standards, the lab and safety charters, method, a README); ten playbooks, runbooks and operating guides; one skill page (gardening).
  - `memento/tools/`: about twenty scripts, and a doctor with 16 checks.
  - **Hooks:** two harness hooks (SessionStart, PreToolUse) and a git pre-commit hook.
  - `memento/memory-prosthesis/`: a validation ledger, ten or so active-knowledge files, a knowledge archive near its 900-line limit, about 200 evidence-archive records.
  - Two project skills.
- **Lessons that bear on method:**
  - **Read counts understate habitual use.** Rooms' git standard is used at every push without being opened. Non-use from read counts is at most MODERATE, and never grounds for removal on its own.
  - **Agents run in sequence.** A frontier agent is used only where judgement needs one.
- **Instruments that do not yet exist:**
  - **The doctor's output is not logged.** Whether a check ever finds anything has to be read from transcripts where the doctor ran.
  - **Hook firings** are logged only where a hook logs itself.
- **The planning skill trial is running in Rooms.** The planning playbook and the `memento-planning` skill are protected until its verdict.

## Problem / purpose

Rooms is the most active estate, and it needs to stay current. It carries governance that grew with it, and some of that may be inert, duplicated, superseded or better delivered another way. The purpose is to find which, with evidence, and to propose changes to the User. Nothing is removed on judgement alone.

## Posture

Adaptive.
- **Slice 1 is predictive:** a scripted inventory.
- **Slice 2 has a feedback point:** the User sees the grades before any proposal goes to Rooms.
- **Slice 3** applies only what he rules.

## Scope and slices

**In scope:** Rooms' own Memento elements:
- the governing documents in `memento/protocols/`;
- the playbooks, runbooks and guides;
- the tools and the doctor's checks;
- the hooks;
- the governing files in active knowledge, and the validation ledger.

**Product runbooks** (room bootstrap, rollout, upgrade, promoter flip, record consolidation, the operating guides) are graded for home and staleness only. Whether their product content is right is Rooms' own business.

**Slice 1: evidence by script, read-only.** For each element, written to `~/.memento/reshape/rooms-l2/` and never into a repository:
- **History:** last commit touching it; commits in the last 30 and 90 days.
- **Reads:** reads in Rooms' transcripts over the last 30 days, main thread and subagents, as a lower bound.
- **References:** inbound references from other governing files and tools.
- **Firing:** for doctor checks, runs and findings seen in transcripts; for hooks, firing evidence where it exists.
- **Duplication:** overlap with the canon or with another Rooms file, by shared normalised lines.
- **Frontmatter:** status and last verified date.

**Slice 2: grading and proposals.**
- **The grading:** the main thread grades each element under the reshape plan's rules, and names its home if it stays.
- **Review:** one independent read-only reviewer checks the grades against the slice 1 data.
- **To the User:** the grades and the proposals, as one table.

**Slice 3: changes in Rooms**, on the User's rulings.
- **Delivery:** one message to rooms/dev carries the ruled proposals. rooms/dev makes the changes in Rooms, where the User can rule again in its session.
- **Removals** are made by banner-and-archive for governing text (CD #4d).
- **Checked read-only here:** the doctor passes in Rooms, and no dangling references remain.

**Slice 4: the record.**
- **Closing record:** a closing note in this plan, with the counts lines.
- **Findings for the canon:** if any applies to the canon, it goes forward as an import under CD #4e, in its own change set.

**Consciously out of scope:**
- the planning playbook and the `memento-planning` skill (protected by the trial);
- the directives, already level with the canon at level 1;
- the product's code;
- the evidence archive's records (kept as written);
- any change made from this estate directly.

## Pre-registered falsifier for the grading

The grading is wrong if an element removed or slimmed under this plan is found needed within 60 days of the change. "Found needed" means an incident traced to its absence, or the User restoring it. One such case reopens every grade that rested on the same criterion.

## Risks

- **Usage hidden from read counts:** handled by the rule above, and by asking rooms/dev, before proposals are final, for any use the data cannot see. That is one discussion message.
- **Rooms is busy:**
  - slice 1 reads only;
  - the slice 3 message waits for the User's rulings;
  - changes go in at rooms/dev's pace, around its own work.
- **Confidentiality:** the counts stay private. Rooms content goes back only to Rooms, and anything bound for the canon goes through CD #4e.
- **Cost:** scripts do the counting. One frontier pass (the grading, in this main thread) and one smart-tier review, in sequence.
- **The trial:** this plan touches neither the playbook nor the skill. Messages to rooms/dev may mention the trial, and they go to a session the trial already counts as aware.

## Verification discipline

| Slice | Witness |
|---|---|
| 1 | script output files with their SHA-256 in the plan record; spot re-ground of one element in five, first-hand |
| 2 | review record with counts line; the User's rulings quoted |
| 3 | rooms/dev's commits; doctor pass and dangling-reference check run read-only here |
| 4 | closing record with counts lines; falsifier date set (change date plus 60 days) |

## Estimated Effort

M overall:
- slice 1: S to M;
- slice 2: M;
- slice 3: depends on the rulings;
- slice 4: S.

## The User's approval gate

**Rulings sought:**
1. this plan;
2. the scope boundary for product runbooks (home and staleness only);
3. the 60-day falsifier.

Awaiting user approval of this plan before detailed design or implementation.
