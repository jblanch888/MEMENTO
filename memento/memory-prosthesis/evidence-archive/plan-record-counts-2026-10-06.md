---
description: plan to add a counts line, carrying its own date and models, to this estate's review and plan-slice records, so that several of the Bitter Lesson sort's owed instruments can be measured; the tally script waits for data
type: plan
date: 2026-10-06
genre: build/change (3A)
size: S (two slices)
status: APPROVED 2026-10-06 (the User: "approve"); slice 1 DONE 2026-10-06; slice 2 (the playbook sentence) awaits the User's word
related: [decision-bitter-lesson-sort-2026-10-06, design-sort-slice2a-2026-10-06, design-sort-slice2b-2026-10-06, TOOLING_TRIGGERS, PLANNING_PLAYBOOK, KILLED_MECHANISMS]
---

# Plan: record counts

## Origin and authority

The Bitter Lesson sort's decision record lists instruments owed before several units' tests can run. Eight are counts drawn from review and plan records. On 2026-10-06 the User approved, in principle, a shared counter to supply them, under its own plan. No tooling trigger has fired for it, so the register requires the User's explicit approval and a pre-registered kill condition.

## Pattern Search Results

- **The sort's owed instruments, with their definitions** (`design-sort-slice2a-2026-10-06.md`, `design-sort-slice2b-2026-10-06.md`, decision record):
  - material findings per review, by the authoring model's generation (unit 7, delegate-tier clock);
  - re-grounding corrections per scout report, by the scout tier's generation (8);
  - defects found in shadow per new control (20);
  - faults found by suite and mutants per new control (22, ten-percent rule where the baseline is zero);
  - proposals of tools ahead of a trigger, measured in a trial without the register (25);
  - unsanctioned changes of scope per undertaking (28);
  - writing-rule breaches per reviewed document (31);
  - unsupported claims per memo (32).
- **What the records hold today.** Review records in this estate's plans give their counts in prose: findings, accepted, refuted, and named classes of finding. They do not record which model wrote the work or which model reviewed it.
- **The census method** counts identifiers and figures without reading content. A structured line extends it to review outcomes.
- **KILLED §1 and §3.** An approval prompt nobody refused, and a checklist ticked by the same assistant that made the claims. Both bear on the risks below.

## Problem Statement

Seven of the eight instruments need counts that already exist in prose but cannot be tallied: they carry no model attribution and no defined denominators. The eighth (unit 25) needs a trial without the register, which no count can supply. It is out of this plan's reach and stays owed.

## Proposed Solution Overview

Two plain-text lines, each carrying its own date and models.

**At the end of each review record:**

`Review counts (r<N>, <date>, author <model>, reviewer <model>): material findings M · accepted A · refuted R · unsupported claims U · writing-rule breaches W`

- A *material finding* is an accepted finding that changed substance. A finding that changed wording only is not material.
- The reviewer reports these counts in its own output, and the line copies them unchanged.

**At the end of each plan slice record:**

`Slice counts (<date>, author <model>, scout <model or ->): new controls N · faults by suite or mutants F · defects in shadow D · unsanctioned scope changes P · scout reports S · scout reports corrected C`

- *Unsanctioned* means a change of scope the User did not rule on at a feedback point or by an explicit word.
- Fields that do not apply are written as `-`.

**How each instrument is served:**

| Unit | Count | Rate |
|---|---|---|
| 7 | M | per review, by reviewer model |
| 8 | C | per scout report S, by scout model |
| 20 | D | per new control N |
| 22 | F | per new control N |
| 28 | P | summed per plan |
| 31 | W | per reviewed document |
| 32 | U | per memo |

Model names are written in one normal form (`opus-5.5`, `sonnet-5.5`, `fable-5.1`, `haiku-4.5`), so generations group cleanly.

**Tallying.** `grep` and a one-line `awk` until there is something to compare. The tally script is registered as an earned tool, triggered by at least ten lines in each of two model generations for any one unit. No backfill: this week's records are a single generation, and banked memos change only by dated amendment note (CD #4d).

## Key Components/Changes

| File | Change | Seam |
|---|---|---|
| `memento/tools/README.md` | a section defining both lines, their fields, *material*, *unsanctioned*, the model normal form and the `grep` tally | estate |
| `memento/memory-prosthesis/active-knowledge/TOOLING_TRIGGERS.md` | a row for the counts lines (built on the User's approval, with the kill condition below), and a row for the tally script with its trigger | estate |
| `memento/protocols/playbooks/PLANNING_PLAYBOOK.md` | slice 2 only, on the User's word: one sentence in §2 spine item 6 asking each review record and plan slice record to end with its counts line | estate (governing) |
| The reviewer prompt habit | review prompts ask the reviewer to report the review-counts fields | practice, recorded in the README section |

No canon change and no other estates.

## Potential Risks

- **Self-report** (KILLED §3). The author writes the line. Mitigations:
  - the review counts come from the reviewer's own output;
  - at each census re-run, the main thread re-grounds one line in five, drawn by the census script, against its review record, first-hand.
- **Reviewer sensitivity.** Breach and unsupported-claim counts reflect how sharp the reviewer is as well as the author's work. The reviewer model is recorded, and comparisons are made within one reviewer model. This is a stated limit.
- **Judgement in "material" and "unsanctioned".** The definitions are written once in the README, and the re-grounding sample checks them.
- **Theatre** (KILLED §1). The kill condition below retires the lines if no test uses them.
- **Reversibility.** All changes are additive. The playbook sentence, if retired, takes a dated note (CD #4d).

## Verification Strategy Overview

- The README definitions are checked against the eight unit definitions by an independent reviewer (CD #14), as part of this plan's review.
- **First live use:** the next plan's review and slice records carry the lines. A `grep` tally then reproduces their counts by hand, as the witness.
- The User looks at the first live lines.

## Pre-registered kill condition

The lines are retired, with a KILLED_MECHANISMS-form entry and a dated note on the playbook sentence, if either of these holds:
- after the first change of main-thread or reviewer-tier generation, ten new-generation lines exist for some unit and no test in the sort's decision record has been run with them by the census re-run that follows;
- by 2027-07-01, fewer than ten lines exist in total.

The User judges "run with them" from the census re-run's record.

## Scope and slices

1. **The definitions and the register.** The README section and the two register rows. Lines start on the next plan's records. S.
2. **The playbook sentence** (a governing change, on the User's word), with first live use. S.

**Out of scope:**
- the tally script (registered, waiting for its trigger);
- backfill;
- unit 25's trial;
- other estates and the canon.

## Routing (CD #12)

- **Main thread:** definitions and records.
- **Smart tier:** the review.
- **The User:** approval, the playbook sentence and the first look.

## Estimated Effort (relative sizing only — §2.5)

| Slice | Size | Shape |
|---|---|---|
| 1 | S | Two documents, additive |
| 2 | S | One governing sentence, then first use |

Overall: S.

## Seam

Estate side only: `docs(estate)`.

## Review record (r1, 2026-10-06, smart tier): NEEDS-CHANGES; every finding accepted

- **Instrument fit:**
  - **Models:** the author, reviewer and scout models are written into the lines, so the commit-trailer proxy and `git log -S` dating go.
  - **Denominators:** new controls and scout reports added.
  - **Quantities:** *material* findings and *unsanctioned* scope changes, each defined.
  - **Unit 25:** stated as out of reach.
  - **Reviewer sensitivity:** named as a limit.
- **Design:**
  - The backfill is dropped (one generation; banked memos are immutable).
  - The re-grounding sample is defined: one in five lines, drawn by the census script, checked first-hand.
  - The kill condition is tied to a generation change, with a dated backstop and a named judge.
  - The playbook sentence's retirement path is stated.
- **Conformance:** the 3A headings are used exactly.
- **Overreach:**
  - the script is deferred to an earned trigger;
  - the suite is dropped with it;
  - the overstatement and factual-error fields are cut, since they serve no unit.
- **Writing:** the two contrast constructions restated.

Approved by the User, 2026-10-06.

## Slice record

**Slice 1 (2026-10-06).** The definitions are in `memento/tools/README.md`, § Record counts. Two register rows were added: the counts lines, built on the User's approval with the kill condition above, and the tally script, with its trigger. The lines start with the next plan's records.
