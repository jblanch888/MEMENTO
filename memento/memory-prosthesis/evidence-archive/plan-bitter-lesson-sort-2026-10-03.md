---
description: decision plan for sorting the Memento parts by what they are for, opened on the census evidence; starts with alternatives to the sort itself, holds every option neutral with a dated falsifier, and prepares the User's ruling
type: plan
date: 2026-10-03
genre: design/decision (3C)
size: L (four slices; slice 2 in two halves)
status: APPROVED 2026-10-03 (the User: "approve plan"); slice 0 in progress
related: [finding-exercise-census-2026-10-03, finding-lineage-verdicts-2026-07-20, ORGAN_REGISTRY, KILLED_MECHANISMS, THE_STORY]
---

# Plan: the Bitter Lesson sort

## Origin and authority

- **build-protocols/dev, 2026-10-02:** proposed sorting the 32 parts into three kinds (parts that make up for current model capability, parts that hold the project's record, parts that keep authority with the User), with a failure criterion and review date for each part of the first kind that expect it to retire as models improve. The proposal is an input to this plan, held as one option among several.
- **The User, 2026-10-03:** observed that his "used" playbook count is falling; asked for the census; agreed to open the sort as its own decision plan once the census was banked.

## Pattern Search Results

- **Evidence:** `finding-exercise-census-2026-10-03.md` (use, with eight parts beyond its reach, and its own limits: use shows doing and compliance, the playbook decline is confounded with falling activity, the hook telemetry is thin) and `finding-lineage-verdicts-2026-07-20.md` (presence and lineage per estate).
- **Precedent:** `story/KILLED_MECHANISMS.md` records mechanisms that died and why, and its stage rule already asks every control for a failure criterion; the validation-ledger part carries criteria and review dates.
- **Stance already in the canon:** THE_STORY's advice to start with the core practices and add the rest when the work's own weight demands it.
- **The census instrument** is kept outside the repository (`~/.memento/census/`), so the census can be re-run on a named date.

## Problem / purpose

The Bitter Lesson holds that hand-built method gets outgrown as models improve. The census finds step-by-step playbooks fading, with falling activity as an unresolved confound, and several other method parts heavily exercised in product work. The User needs a way to tell, part by part, which parts a better model would make unnecessary, so that their review can be planned and their removal tested. Whether a sort is the right tool for that is itself the first question.

## Posture

Adaptive. Feedback points after slice 0 (whether to sort, and on what axis), slice 1 (the kinds and the unit), and slice 2 (the options).

## Scope and slices

0. **Alternatives to this sort (one bounded divergence pass).** The main thread sets out, for the User, these candidates with the evidence for each:
   - A. build-protocols' three kinds as proposed;
   - B. the three kinds with the first split in two: limits a better model outgrows (step-by-step playbooks), and structural limits it does not (the stateless session behind restart, compaction and the working context); with authority split into the User's gates and guardrails against model error, and a conventions kind (language standard, archive conventions);
   - C. a different axis: enforced by mechanism, or kept by prose discipline;
   - D. no sort: every part receives a failure criterion under the existing stage rule, and kinds shape what each criterion tests.
   Output: the User's choice of A, B, C, D or a variant.
1. **Kinds and unit with the User (variance before schema).** On the chosen option: the kinds the User accepts (added, merged, split, dropped or replaced), and the unit of the sort: the registry part, a sub-part (for example the playbook system split into step-by-step playbooks and the planning playbook), or the part per estate.
2. **Options per unit, held neutral.** For every unit, each kind it could belong to, the evidence for each, and a falsifier for each option, dated where it can be killed. Two test types are available:
   - **census re-run:** the census repeated on 2027-01-03 with the same instrument, reporting the same confounds (activity level, compliance, enforcement);
   - **without-the-part trial:** a bounded task run on a newer model with the part absent and with it present, comparing outcomes the User names in advance.
   Units no signature reaches are marked "untestable now: instrument first, or defer". Slice 2 runs in two halves (registry parts 1 to 16, then 17 to 32), each reviewed before the next.
3. **The User's ruling and the record.** The User assigns each unit, or defers it. The result is banked as a decision record. Criteria enter the validation-ledger form on the User's ruling and bind from then. Canon text that describes the parts changes under a plan of its own.

**Out:** retiring or changing any part (that follows a criterion firing, under its own plan); canon edits; running the without-the-part trials (each is its own undertaking).

## Falsifiers for the sort itself

- **Kinds drawn wrong:** at the census re-run on 2027-01-03, units sorted as durable show the same change the outgrowable units were expected to show, after correcting for activity. Units without a signature are excluded from this test.
- **Criteria drawn wrong:** a without-the-part trial for an outgrowable unit, run under its own plan, shows outcomes worse than with the part on the measures named before the trial.

## Risks

- **Pre-commitment** (posture-absorbed): the proposer's frame, the session's readings and the User's own observation of falling playbook use could all anchor the sort. Slice 0 sets alternatives side by side; slice 2 states evidence for every option.
- **Gaming the measure** (structural): criteria based on use invite parts being used to avoid retirement, the theatre the lineage has seen before. Use-based criteria are paired with a without-the-part trial wherever one is possible.
- **Evidence gaps** (posture-absorbed): eight parts are unseen by the census; their options rest on the registry text and the lineage audit, and say so.
- **Scope creep into retirement** (structural): the plan prepares criteria, and any retirement is an undertaking of its own.
- **Reversibility:** the decision record and the criteria are text, and a later ruling can revise them; nothing in the estates or the canon changes under this plan.

## Verification

An independent adversarial review (smart tier) of slice 0's alternatives and of each half of slice 2 before the User rules, checking evidence per option, the falsifiers' testability and the writing rules. The User's ruling is the decision.

## Routing (CD #12)

Judgement throughout, in the main thread; reviews at smart tier; the census re-run in deterministic code; the decision the User's.

## Estimated effort (relative)

Slice 0: S. Slice 1: S. Slice 2: L in two halves (32 units, options and dated falsifiers). Slice 3: S. Overall: L, sliced as above.

## Seam

Estate side. Commits `docs(estate)`.

Awaiting user approval of this plan before detailed design or implementation.
