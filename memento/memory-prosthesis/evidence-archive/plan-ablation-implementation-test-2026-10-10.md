---
description: plan for the ablation trial's implementation test, a revision of the 2026-10-06 pilot; each arm (full Memento, Memento without the planning playbook, no Memento) plans and then builds one feature in its own copy of Proportion, judged on working software by deterministic checks fixed in advance
type: plan
date: 2026-10-10
genre: investigation (3B), with build/change (3A) for the harness
size: M (four slices)
status: APPROVED 2026-10-10 (the User: "yes to all but lets make sure we are not doing any fable calls and we use frontier agents only when strictly necessary"); slice 0
related: [plan-memento-ablation-trial-2026-10-06, decision-bitter-lesson-sort-2026-10-06, plan-planning-skill-trial-2026-10-09]
---

# Plan: the ablation trial's implementation test

## Origin and authority

On 2026-10-06 the User proposed the stronger test: "take a set of three plans and have an agent in each repo actually start to carry them out". He chose to wait. The pilot closed with the rule that a resumed trial needs a recorded revision first, and named the implementation test as the leading candidate.

On 2026-10-10, after the Kent Beck analysis, the User made it the next undertaking: "ok both". The analysis found that every other measure Memento keeps is of effort or output. This test measures outcome: working software.

## Pattern Search Results

**The pilot** (`plan-memento-ablation-trial-2026-10-06.md`, closed) left:
- **three templates** in `~/abl-trial/` (t1 no playbook, t2 none, t3 full), with a private key;
- **isolation** by a witness of hook logs, `/tmp`, and Proportion's git state, taken before and after;
- **the run flags:** `claude -p`, Opus 5.5, project settings only, strict MCP config, an allow list, and a spending cap per run.

**What the pilot learned:**
- **Features must be checked against the code before they are chosen.** Feature 5's bug was absent from the code.
- **Agent judging disagreed** by about the size of the effects measured.
- **The judging pipeline** cost several times the runs.
- **Parallel frontier judges** spent the allowance in minutes. The lesson "Run agents in sequence by default" is recorded in the knowledge archive.
- **The permission system** refused edits to the templates' settings and deletions inside them. The User ran those steps as scripts.
- **The User's blind guesses** were all correct, so blinding was partial.

**The pilot's planning results (directional):** full Memento ranked first on both features. The no-playbook arm did no better than no Memento.

**The templates can run checks offline:**
- dependencies are installed;
- a Jest unit suite of about 100 test files;
- a TypeScript type check, lint, and `next build`.

The end-to-end tests need Proportion's live database, so they are excluded. Each arm's copy has no credentials and no network.

**Proportion** has been dormant since 2026-09-19 (HEAD b140e06), so the templates match its current code.

## Problem / purpose

**The question.** Does Memento change what gets built, judged on working software? Specifically:
- full Memento against no Memento (the framework's claim);
- full Memento against Memento without the planning playbook (the sort's unit 4b).

## Posture

Adaptive, at pilot scale.
- **The scale:** one feature, one run per arm.
- **The feedback point:** the result goes to the User before any second feature. He decides whether to scale up.

## Design

**The feature.** One real feature from Proportion's backlog, chosen by the User at slice 0. It must:
- be checked against the current code before it is chosen (the pilot lesson);
- be of medium size, with logic that unit tests can reach without the database;
- have an observable contract the brief can state: the module, function or component, and its behaviour.

The contract makes acceptance testing possible. It also makes the task more specified, a limit recorded below.

**The runs, each in a fresh copy of its template:**
1. **Plan.** The pilot's fixed prompt, with the brief: "write a plan, save it, do not implement".
2. **Build.** In the same copy, after the plan is saved: "The plan is approved. Implement it, run the type check and the unit tests, and stop when you consider it done." The prompt is identical for every arm. It gives the approval that the full arm's directives require, so no arm waits for a person.

**The tools:**
- Read, Grep, Glob, Edit and Write, confined to the copy;
- Bash under the harness's sandbox, with writes confined to the copy and no network.

The pilot ran without Bash. Here Bash is needed to run the checks, so the sandbox is witnessed in slice 1 before any real run.

**Spending caps:** planning $5 per run; building $15 per run; $70 in all, including judging. Runs go in sequence, one at a time.

**Acceptance tests, fixed in advance and hidden from the arms:**
- **Who writes them:** one smart-tier agent, from the brief, its contract and the current code, before any run.
- **Hidden:** they are stored outside the copies, with their hash recorded, and copied into each copy only after its build run ends.
- **Reviewed first:** a second agent checks that the tests follow from the brief alone, and that they pass against neither the current code nor a stub.

**Judging, by deterministic checks run by script after each build:**

| Measure | Kind |
|---|---|
| Type check clean | gate |
| Existing unit suite: failures above the template's baseline (regressions) | gate, and a count |
| Acceptance tests passed, out of the total | primary score |
| Lint errors added | count |
| Size of the change (files, lines), and cost of the run | reported, not scored |

**One smart-tier review, run once,** after the scores are fixed. It reads all three changes, in random order with the arms unlabelled. It reports defects the tests miss, and conformance with the product's patterns. It is reported beside the scores and never changes them.

## Decision rule (fixed before any run)

**The primary measure:** acceptance tests passed. It counts only when the type check is clean and there are no regressions. A failed gate scores zero.

**The comparisons:**

| Comparison | The finding | Read as |
|---|---|---|
| Full against None | Full passes at least 20 percentage points more, with gates held | Memento helps build working software, at pilot scale |
| Full against None | Full passes the same or fewer | No measurable help on this feature |
| Full against None | Anything in between | Inconclusive |
| Full against No playbook | The same rule | It reads on unit 4b |

**Limits:** one feature and one run per arm is a direction, never a verdict. The result is reported with that limit, and with the run-to-run noise unknown. The User decides whether a second feature runs, or a second run of each arm.

## Scope and slices

**Slice 0: the User's choices.**
- **The feature,** checked against the code first. I propose three candidates from Proportion's backlog, each verified read-only.
- **Its brief and contract.**
- **His confirmation** of the caps and the decision rule.

**Slice 1: the harness.**
- **Refresh the templates:** confirm they match Proportion's HEAD, and record the baseline unit-suite result for each.
- **Sandbox witness:** in a scratch copy, Bash cannot write outside the copy or reach the network, and the isolation witness passes.
- **The acceptance tests,** with their review.
- **Setup steps the permission system refuses** go to the User as a script he runs. He has been told why.

**Slice 2: the runs.** Three arms, plan then build, in sequence, each with the isolation witness and a receipt (cost, session, files written).

**Slice 3: judging and the report.**
- the deterministic checks by script;
- the single smart-tier review;
- the decision rule applied;
- the result to the User, with the scores first.

**Consciously out of scope:**
- end-to-end tests and anything needing the database;
- any change to Proportion itself;
- more than one feature before the User's word;
- the skills trial (it runs separately and stays unmentioned in every arm).

## Risks

- **The arm leaks or is identifiable.** Templates and paths stay neutral, as in the pilot. The no-Memento arm's README and residue were cleaned in the pilot.
- **Bash escapes the copy.** The sandbox witness comes before any real run. There are no credentials, so a reach for the database fails closed.
- **The acceptance tests favour one arm.** They are written blind to the arms from the brief alone, reviewed, and pass against neither the current code nor a stub.
- **The contract makes the task one-shot.** A specified contract narrows how much planning can matter. Recorded as a limit. The no-contract alternative would need the database for end-to-end checks.
- **Cost.** Caps per run and in all, sequential runs, judging by script, and one smart-tier review.
- **Noise.** One run per arm. The decision rule claims direction only.
- **The full arm waits for approval.** The build prompt grants it identically to all arms.

## Routing (the User's ruling, 2026-10-10)

- **No Fable** anywhere in the trial.
- **Frontier only where strictly necessary.** The three arms run Opus 5.5, because the trial measures the main-thread model the User works with; that is the one necessary frontier use.
- **Everything else on cheaper agents:**
  - the feature scouting: smart or recon tier, re-grounded first-hand by the main thread;
  - the acceptance-test writer and its reviewer: smart tier;
  - the final review: smart tier.
- **Judging** is by script.
- **The main thread** keeps orchestration and the rulings put to the User, and works one agent at a time.

## Verification discipline

| Slice | Witness |
|---|---|
| 0 | the feature checked against the code (file and line receipts); the brief approved by the User |
| 1 | template hashes; baseline suite results; sandbox witness output; acceptance tests' hash and review record with counts line |
| 2 | isolation witness before and after each run; run receipts; Proportion's git state unchanged |
| 3 | the check outputs; the review's report; slice counts lines |

## Estimated Effort

M:
- slice 0: S;
- slice 1: M (the sandbox and the tests);
- slice 2: S, but the longest wait;
- slice 3: S.

## The User's approval gate

**Rulings sought:**
1. this plan;
2. the caps: $5 a plan, $15 a build, $70 in all;
3. the decision rule, a 20-point gap with the gates held;
4. that I propose three feature candidates, checked against the code, for slice 0.

Awaiting user approval of this plan before detailed design or implementation.
