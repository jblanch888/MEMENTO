---
description: decision record of the Bitter Lesson sort: the User's ruling on each of 37 units of Memento's parts, by kind, with the review clock, the tests and the trials each carries
type: decision
date: 2026-10-06
status: banked 2026-10-06 on the User's rulings
related: [plan-bitter-lesson-sort-2026-10-03, design-sort-alternatives-2026-10-03, design-sort-slice2a-2026-10-06, design-sort-slice2b-2026-10-06, finding-exercise-census-2026-10-03, finding-longitudinal-evidence-2026-10-03, ORGAN_REGISTRY]
---

# Decision: the Bitter Lesson sort of Memento's parts

**Origin.** build-protocols/dev's proposal of 2 October 2026 and the User's observation that his used playbooks were falling. The plan is `plan-bitter-lesson-sort-2026-10-03.md`. The User chose F with G at slice 0, and agreed the kinds, units and clocks at slice 1. The options per unit, their evidence and their tests are in `design-sort-slice2a-2026-10-06.md` and `design-sort-slice2b-2026-10-06.md`. The User ruled every unit on 2026-10-06, accepting the session's reading in four batches.

## The result

37 units from the registry's 32 parts (parts 4, 6, 9, 11 and 19 split).

| Kind | Units | Count |
|---|---|---|
| Prescribed procedure, capability (expected to fade at a model change) | 4a step-by-step playbooks, 4b planning playbook, 15 file metadata and generated maps | 3 |
| Prescribed procedure, setting (expected to fade when the harness keeps state) | 11b consolidation steps, 12 session restart protocol | 2 |
| Judgement practice, capability (expected to hold or grow) | 5 planning rules, 6a routing fit, 7 adversarial review, 8 claim status, 13 lesson selection, 18 controls model, 27 economic doctrine | 7 |
| Judgement practice, setting | 9a working-context tier, 10 working-context discipline | 2 |
| Independent of the model: authority | 1 the User decides, 2 protected operations, 6b tier pin (spend), 11a compaction approval, 19a authority hooks, 28 founding charter | 6 |
| Independent of the model: record | 3 core directives (the project's constitution), 9b archive tiers, 14 archive conventions, 17 validation ledger, 24 git discipline | 5 |
| Independent of the model: engineering | 16 doctor, 19b compliance hooks (provisional), 20 shadow-first, 21 telemetry, 22 test harnesses, 25 tools added on evidence, 26 safety charter | 7 |
| Independent of the model: confidentiality | 23 confidentiality checks, 30 proportionate confidentiality | 2 |
| Independent of the model: language standard | 31 language standard | 1 |
| Independent of the model: authority and record | 32 evidence constitution | 1 |
| Deferred | 29 dual-thread governance | 1 |

**Reading.** The Bitter Lesson's prediction falls on five units, the ones sorted as prescribed procedure. Three of them answer to model capability: the step-by-step playbooks, the planning playbook and generated maps. Two answer to the harness: the consolidation steps and the restart protocol, which fade when sessions keep their state. Nine units are judgement practices that the evidence shows holding or growing as models improve. Twenty-two of the 37 units are independent of the model; they answer to the User's authority, the record, engineering practice, confidentiality and the language standard.

## Clocks

- **Capability units:** reviewed at each change of main-thread model generation, dated by telemetry, with a census re-run. Units 7 and 8 use the delegate tier's generation.
- **Setting units:** reviewed at a harness release that touches their assumption. The release-cadence check flags new versions; the judgement whether a release touches an assumption is put to the User.
- **Independent units:** checked at the census re-run on 2027-01-03. They trigger no review at a model change.
- **Threshold:** a change of a half against the 2026-10-03 baseline, per active session, ten sessions a side. Where a baseline is zero, ten percent of items counted. Exact baselines are held in the private receipts index at `~/.memento/census/`.

## Conditional rulings

- **19b:** a compliance hook whose would-have-blocked rate in shadow falls to near zero moves to prescribed procedure.
- **24:** if its trial shows the explicit-file-list rule fading, that rule splits off as prescribed procedure.
- **21 and 25:** revisited once ten silent failures, or ten tools, are recorded.

## Tests and trials available

- **Trials, each its own undertaking, on outcomes the User names in advance:** 4b (the planning playbook, the first named at slice 0), 5, 6a, 10, 11a, 14, 24, 26, 27, 30. Any trial that removes a safety, approval or confidentiality control runs on a scratch copy.
- **Shadow tests:** 6b (the tier pin, fourteen days, ten percent frontier share) and 19b (each compliance hook, fourteen days, now and at the next generation change).
- **Instruments owed before their tests can run:** protected-operation blocks by gate (2), directive reads apart from restart (3), findings per review (7), corrections per scout report (8), the shadow restart diff in this estate (12), lesson rejection share and citations (13), failures to find records (15), findings per doctor run (16), falsifier audits and ledger citations (17), shadow mode per hook (19a, 19b), defects found in shadow (20), silent failures by authoring generation (21), faults per new control (22), sweep logging per incoming item (23), uses of history (24), scope pivots (28), writing-rule breaches (31), unsupported claims per memo (32). Eight of these are counts from review and plan records (7, 8, 20, 22, 25, 28, 31, 32).

## What the ruling changes

Every part stays as it is. The sort sets what each part is expected to do as models and the harness change, and how that expectation will be checked. Retiring or changing a part follows a test result, under a plan of its own. Canon text describing the parts changes under a plan of its own (plan scope).

---

**AMENDMENT (2026-10-10): the first evidence on outcome for unit 4b, the planning playbook.** The ruling above is unchanged; this note records evidence for the unit's trial.
- **The test:** `plan-ablation-implementation-test-2026-10-10.md` (closed). Two features in Proportion, three arms each, Opus 5.5, one run per arm. Each arm planned and then built in one session, and was judged on working software by hidden tests fixed in advance, plus a blind smart-tier review.
- **The result:**
  - **Outcome:** the arm without the playbook matched the full arm on both features. Every arm passed every gate.
  - **Design quality:** it varied in both directions. The full arm was rated lowest on feature 1 and highest on feature 2.
- **The reading:** this leans towards the unit's prescribed-procedure reading, a procedure expected to fade, at pilot scale. It neither meets the slice 2a clock's threshold nor settles the unit. The test cannot see value across sessions.
- **The next step:** any change to the playbook goes through a plan of its own, under the ruling above.
