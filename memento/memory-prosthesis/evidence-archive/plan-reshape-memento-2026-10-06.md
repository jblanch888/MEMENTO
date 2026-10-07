---
description: plan to reshape Memento on evidence (remove, slim, refine) across the canon, this estate and every live instance, with action proportionate to the strength of evidence; starts with the canon and this estate, and tests its own grading before going further
type: plan
date: 2026-10-06
genre: decision (3C) on an investigation (3B), executed as build/change (3A, debt/excision variant)
size: L (six slices)
status: APPROVED 2026-10-06 (the User: "approve"); slices 0 to 4 DONE 2026-10-08; slice 5 (live instances) next
related: [decision-bitter-lesson-sort-2026-10-06, plan-memento-ablation-trial-2026-10-06, finding-exercise-census-2026-10-03, finding-longitudinal-evidence-2026-10-03, finding-lineage-verdicts-2026-07-20, ORGAN_REGISTRY, KILLED_MECHANISMS, TOOLING_TRIGGERS]
---

# Plan: reshape Memento on evidence

## Origin and authority

The User, 2026-10-06: his intention for the Bitter Lesson sort was to reshape Memento, removing unnecessary elements and refining the rest by reviewing evidence. His rulings on this plan's scope and stance: "canon, this estate, and memento in rooms, proportion, cartographer and any other live repo"; "act on evidence, strong evidence strong action, weak evidence restraint."

**This plan departs from the sort's ruling, on the User's later word.** The sort's decision record says retiring or changing a part follows a test result. This plan lets strong evidence other than a test justify action, under the grades below. The sort's tests, clocks and its re-run on 2027-01-03 stand for every element this plan does not act on. A removal this plan makes is recorded against the sort unit it touches.

## Pattern Search Results

- **The sort's decision record and its slice 2 memos:** a kind, a clock and a test for each of 37 units, including six authority units, two confidentiality units and the safety charter.
- **The census and the longitudinal finding, with their limits.** Use inside delegated agents is undercounted. Hook silence is a missing reading. Telemetry carries no paths. Only one estate supports a verdict. Activity is a confound.
- **The ablation pilot.** Two features, judges split by about the size of the effect. Full Memento ranked first on the mean. The no-playbook arm did no better than No Memento, a direction not yet separable from noise.
- **KILLED_MECHANISMS,** including its "Running your own removals" checklist, §7 (a removal over-applied by analogy) and §8 (dangling references fixed in place).
- **The register:** four build triggers fired with nothing built and nothing missed.
- **The live repositories.** A search of the User's home folder found the canon, this estate and seven further places carrying Memento: rooms, Proportion, cartographer, build-protocols and agent-messaging, plus two whose status slice 0 settles, and the User's own slash commands. The full table (names, counts, last activity) is held privately at `~/.memento/reshape/`.

## Problem Statement

Memento has grown by addition. Parts built for weaker models, triggers never needed, dangling references, and copies that drifted all cost reading time and attention. The purpose is a lighter Memento that keeps what the evidence supports, with each change proportionate to its evidence and reversible.

## The question, the grades and the actions

**The question asked of each element:** what evidence shows this element is unnecessary, broken or duplicated, and how strong is that evidence?

| Grade | What qualifies | Action permitted |
|---|---|---|
| **STRONG** | Either a test or trial result against the element, or at least two independent criteria from the list below | Remove (banner-and-archive, CD #4d), or merge within the same repository |
| **MODERATE** | One criterion from the list below | Slim (cut the part the criterion covers, keep the core) or refine, marked provisional with a review date |
| **WEAK** | Use counts only, unchecked scout readings, a single-feature or split trial | Keep, and note the sort's test for it |
| **NO-EVIDENCE** | Nothing either way | Keep |

**The criteria:**
- **Inert:** a firing test on a scratch copy shows the element does nothing when its condition occurs. Never-fired alone does not qualify: a gate that deters and a hook that logs only on firing look identical to a dead one (KILLED §2, §3).
- **Non-use, corroborated:** no use where a signature exists, while the estate was active, with the instrument's days-with-data check passing, and confirmed by a second, independent source.
- **Duplicated within the repository:** its content is restated in full by an element that stays.
- **Superseded:** a later ruling or element explicitly replaces it.

**A dangling reference** (to code, files or mechanisms that no longer exist) is a defect, and the fix is to repair the pointer (KILLED §8). It is graded for refinement, not removal.

**Excluded from removal grading:**
- **Records:** banked memos, the evidence archive, KILLED_MECHANISMS, the validation ledger. These are immutable or User-only to delete; graded "record, not graded".
- **Authority, confidentiality and safety parts.** Non-use is their success. They are graded only on dangling references or in-repository duplication. Any proposal to remove one goes to the sort's scratch-copy trial first.
- **The planning playbook** is graded WEAK on the pilot and kept.

**Refinement** needs evidence of a problem the change fixes: a recorded misreading, an incident, drift that broke something, or a reviewer finding.

**Instances:** a canon removal is never propagated by analogy (KILLED §7). Each instance's copy is re-graded on that instance's own evidence, with the allocation test.

## Posture

Adaptive. The grading itself is tested before it is trusted.

**Feedback points:**
1. after slice 0;
2. after slice 1's pilot, when the User sees the grades on about ten elements and the sweep results;
3. after each proposal batch;
4. before any instance work.

**Pivot points:** if the pilot shows the criteria misgrade elements the User knows well, the grades are revised before any further slice.

## Scope and slices

**Slice 0. With the User: variance before the rubric (3C).**
- He reviews the grades and criteria above and amends them.
- He settles the two repositories of unknown status, and who owns the slash commands.
- He confirms the owner role for each live estate.

S.

**Slice 1. Pilot on the canon and this estate (3B).**
- **Denominator:** `git ls-files` in this repository, filtered to Memento paths. Element = file; core directives and the planning playbook's sections are individual elements.
- **A dangling-reference sweep by script,** read-only. Output goes to `~/.memento/reshape/`.
- **Grading:** about ten elements chosen by the User, each with its receipt. Every STRONG grade is checked first-hand.

Feedback point. M.

**Slice 2. The canon and this estate in full.**
- Grade every element.
- Proposals in batches: action, evidence, receipt, and what would show the action wrong.
- Each batch reviewed, then ruled by the User.

M per batch.

**Slice 3. Canon changes (3A, debt/excision variant).**
- A reference sweep before each removal, since some elements are referenced from scores of files.
- Migrate-don't-delete, banner-and-archive, staged verification.
- Astra and the User on wording.
- An adversarial review of each change set, then the User's approval, then a push on his word.

M per change set.

**Slice 4. This estate,** under the same rules. S to M.

**Slice 5. Live instances, one at a time,** in this order:
1. rooms;
2. build-protocols;
3. agent-messaging;
4. the dormant estates (Proportion, cartographer).

**How each instance is reached:**
- **Reading only:** inventory and grading in an instance run read-only by script, with output outside every repository. Scouts there use a closed schema with no quotation.
- **The message:** a message to the owner role, sent on the User's word, carries the canon change sets and the graded evidence for that instance's copies. The owner executes under its own plan and its own checks.
- **The dormant estates and the slash commands** are the User's own act, or a separate plan he approves.

M per instance.

**Out of scope:**
- building new mechanisms (a WEAK element keeps its existing sort test, and owed instruments stay owed);
- product code in any instance;
- changing any instance from this session.

## Potential Risks

- **Removing something load-bearing (plan-threatening).** Mitigations:
  - STRONG requires a test or two independent criteria;
  - authority and safety parts are protected;
  - every removal is reversible;
  - each removal carries a falsifier and is followed by the instance's own checks.
- **Treating use or non-use as need.** Non-use counts only when corroborated, and alone it is at most MODERATE.
- **Cross-estate authority.** This session edits the canon and this estate. Instance changes are their owners' acts on the User's word.
- **Confidentiality.** Repository names beyond those already public stay in `~/.memento/reshape/`. Instance evidence stays in its instance, or enters this estate de-identified with the User's clearance (CD #4e).
- **Cost.** Scripts first. Scouts one at a time on the smart or recon tier. Frontier work is kept to grading in the main thread and to reviews.
- **Scope creep.** Slice 1 is cheap and delivers on its own, and the User can stop after any slice.

## Verification Strategy Overview

- Receipts per grade.
- Every STRONG grade checked first-hand.
- Adversarial review of each proposal batch and each change set (CD #14).
- Each instance's own checks after its changes.
- Counts lines on every review record and plan slice record (playbook spine item 6).

## Falsifier for the plan's grading

The grading fails if, in the slice 1 pilot, the User overturns two or more of the roughly ten grades as wrong in kind. That means an element graded for removal that he knows is needed, or one graded for keeping that he knows is dead. The grades are then revised before any further slice.

## Routing (CD #12)

- **Scripts:** inventory and the sweep.
- **Recon or smart scouts, one at a time:** reading where a script cannot reach.
- **Main thread:** grading and proposals.
- **Smart tier:** reviews.
- **Astra:** canon wording.
- **Owner roles:** instance execution.
- **The User:** every ruling.

## Estimated Effort (relative sizing only — §2.5)

| Slice | Size |
|---|---|
| 0 | S |
| 1 | M |
| 2 | M per batch |
| 3 | M per change set |
| 4 | S to M |
| 5 | M per instance |

Overall: L, sliced, WIP of one.

## Seam

The canon (slice 3) and the estate (slices 1, 2 and 4) are committed separately, each declaring its side. Instance changes are committed in their own repositories by their owners.

## Review record (r1, 2026-10-06, smart tier): NEEDS-CHANGES; every finding accepted

- **The sort's ruling:** the departure is declared on the User's later word, with the sort's clocks standing for every element left alone.
- **Grades:**
  - STRONG needs a test or two independent criteria;
  - non-use counts only when corroborated, with instrument health checked;
  - "dead" is split into dangling references (fixed in place) and inert elements (proved by a firing test);
  - NO-EVIDENCE is added, and the question is stated.
- **Protected categories:** authority, confidentiality and safety parts are protected; records are excluded; merging stays within one repository.
- **The pilot:** graded WEAK and stated in full; the planning playbook is kept.
- **Propagation:** each instance is re-graded on its own evidence (KILLED §7).
- **New mechanisms:** "instrument it" removed from WEAK.
- **Confidentiality:** the repository table is kept private.
- **Reading other repositories:** scripts are read-only with output outside every repository; scouts use a closed schema.
- **Instance messages:** they carry only canon change sets and graded evidence. The dormant estates and the slash commands are the User's act.
- **Conformance:**
  - counts lines on slice records;
  - every STRONG grade checked first-hand;
  - the denominator method stated;
  - variance enumeration at slice 0 and a falsifier for the grading;
  - the 3A debt/excision variant;
  - sizing corrected and the repository order stated.
- **First slice:** a cheaper slice 1 on the canon and this estate only.
- **Writing:** the contrast constructions restated.

Approved by the User, 2026-10-06.

## Slice record

**Slice 0 (2026-10-07).** The User took the session's leans and added one ruling.

- **Live estates.** One repository of unknown status is a live, dormant estate, owned by the writing workstream. The other is a retired predecessor product, excluded as lineage evidence. The names are held privately.
- **The User's slash commands** are inventoried and graded. Any change to them is his own act.
- **The grade table** is kept as written, for the pilot to test.
- **Ownership (the User):** "ultimately i am owner of all". He assigns assistants per estate:
  - **rooms:** rooms/dev holds Memento there. Other Rooms sessions are product and content threads and receive no reshape messages.
  - **build-protocols and agent-messaging:** their dev roles.
  - **Proportion:** a Memento governance thread the User runs alongside its dev thread, which acts when he next opens it.
  - **cartographer and the writing estate:** the User, while they are dormant.

**Slice 1, sweep (2026-10-07).** A read-only script swept 77 Markdown files in the canon and this estate for references that resolve to nothing; its output is held at `~/.memento/reshape/`.
- **Banked memos:** 11 hits in 4 files. These are records and are not graded.
- **Living files:** 13 hits in 9 files, none of them a real dangling path.
  - The template paths in the framework are written relative to their installed place, which the canon's README states.
  - The rest are false positives (a branch-name pattern, role names, an instance's map path).
- **One genuine stale reference** found in passing: the working context named the wording reviewer's role wrongly. It was fixed as a refinement.

The canon carries no dangling-reference debt. Next: grades on about ten elements the User chooses.

**Slice 1, pilot grades (2026-10-07).**
- **The grades.** Ten elements were graded:
  - no STRONG grades;
  - MODERATE for the git-operations, incremental-execution and documentation playbooks, for CD #9's marker clause, and for the four held trigger rows (consolidate or slim);
  - WEAK or NO-EVIDENCE, and keep, for knowledge gardening, the planning playbook, CD #8, the estate spine and resource routing.
- **The User's verdict:** "basically ok". No grade was overturned, so the grading stands.
- **The standards rule (the User, "yes"):** where an element carries a standard, the standard moves somewhere permanent, and only the procedure around it goes. The git and documentation playbooks are, in the User's words, "basically standards manuals".

**The User's guidance for slice 2 (2026-10-07).**
- **The history.** Playbooks began, about eighteen months earlier, as behavioural and procedural guard rails for less predictable models, with a playbook always loaded in a governed session. As models misbehaved less, they became rarely invoked.
- **Three homes for what remains:**
  - standards and conventions (always true);
  - skills (procedures used when the task fits);
  - directives or hooks (rules that must always hold).

  Each slice 2 proposal names which home its remaining content goes to.
- **Skills** are a feature of both Claude Code and Codex. Memento ought to work with Codex as well. The User has used Codex little inside Memento: he holds a Plus licence, and its automatic compaction is less predictable and harder to manage. So the canon describes on-demand procedures in neutral terms, with a binding per agent, as the tier map does. Compaction-related parts carry a setting assumption that differs between harnesses.
- **A trial of the planning playbook packaged as a skill** (alongside the playbook, nothing removed) is an option for the User's ruling and has not been started.

**Slice 2, batch 1: the canon's framework folder (2026-10-07).** Banked as `design-reshape-batch1-2026-10-07.md` after one adversarial review (NEEDS-CHANGES, every finding accepted).
- **The proposals:**
  - CD #1 refined: a playbook is loaded only when the work needs one;
  - the git, documentation and incremental-execution playbooks consolidated, every section to a named home in `framework/conventions/`, then banner-and-archived;
  - the READMEs updated.

  Thirty-three elements are kept, CD #9 among them.
- **The User approved all five rows,** and ruled that his statement supersedes the clause, so the CD #1 change is permanent.
- **Execution:** with the canon's other batches as one change set in slice 3.

**Slice 2, batch 2: the rest of the canon (2026-10-07).** The User ruled "your leans are fine". The changes follow from batch 1:
- the README's playbook line and framework row;
- the site page, kept as a mirror and synced;
- a dated note on row 4 of the part register (annotated, since the register records the July audit);
- getting started, step 2;
- the graduation ladder, rung 2.

Kept: the story, the epochs, the spirit page, the enforcement-surface note and CONTRIBUTING. The killed-mechanisms page is a record, not graded. Adding the sort's and the trial's findings to the public story is deferred to the sort's own follow-through. The batch's adversarial review is folded into slice 3's review of the canon change set, as stated to the User.

**Slice 2, batch 3: this estate (2026-10-07).** The User ruled "they are good":
- CD #1 refined to match the canon, with CURRENT_FOCUS's heading becoming "Active plan";
- the four held-trigger rows in the register slimmed to one line pointing to the sort's decision record.

Everything else is kept: CD #2 to #14 (CD #9f whole, since this estate ships the gate), the planning playbook, the charter, resource routing, the knowledge archive, the READMEs, the working context and every tool. **Slice 2 is complete;** slice 3 writes the canon change set.

**Slice 3: canon change set 1 (2026-10-08).** Committed and pushed as `113be89` on the User's approval ("approve, push"), after one adversarial review (NEEDS-CHANGES, every finding accepted).
- **The playbooks moved with their history.** The three playbooks were moved with `git mv` into `framework/conventions/`, each with a dated provenance note, and were not archived as copies. This was flagged to the User before approval.
- **The error-handling line in the change standards was kept,** because no other home exists in the canon.
- **Three small additions followed from the rulings** and were stated to the User.
- **Astra (`astra/reviewer`) has the diff for a wording review.** Any change comes back as a follow-up.

**Slice 4: this estate (2026-10-08).**
- CD #1 is refined to match the canon.
- CURRENT_FOCUS's heading is "Active plan", and the working-context README is aligned.
- The four held-trigger rows in the register are slimmed to one row pointing to the sort's decision record.

