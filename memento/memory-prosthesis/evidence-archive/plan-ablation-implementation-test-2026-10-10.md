---
description: plan for the ablation trial's implementation test, a revision of the 2026-10-06 pilot; each arm (full Memento, Memento without the planning playbook, no Memento) plans and then builds one feature in its own copy of Proportion, judged on working software by deterministic checks fixed in advance
type: plan
date: 2026-10-10
genre: investigation (3B), with build/change (3A) for the harness
size: M (four slices)
status: APPROVED 2026-10-10 (the User: "yes to all but lets make sure we are not doing any fable calls and we use frontier agents only when strictly necessary"); feature 1 DONE 2026-10-10, result inconclusive by the rule; the next step is the User's
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

## Implementation record

### Slice 0 (2026-10-10)

- **The feature:** U-007 part (a), marking roadmap blocks that are not drawn to scale. It is a priority-1 defect.
  - **Chosen by the User** from three candidates. A smart-tier scout proposed them, and the main thread re-checked them against the code first-hand.
- **Brief and contract:** approved by the User. They are held privately at `~/abl-trial/impl/brief-u007a.md` (sha256 33d80b74).

### Slice 1 (2026-10-10, in progress)

- **The templates:** the product code is identical to Proportion's current working tree in all three.
- **The baseline:** 101 suites and 1,146 tests pass, the type check has no errors, and lint has warnings only.
- **The sandbox witness** (a recon-tier agent on a scratch copy, $0.06), confirmed on disk first-hand:
  - writes inside the copy were allowed;
  - writes to the parent folder, to `/tmp` and to Proportion were blocked;
  - the network was blocked;
  - Jest and tsc ran;
  - Proportion's git state was unchanged.
  - **Settings:** `~/abl-trial/impl/trial-settings.json`.
- **The acceptance tests** were written by a smart-tier agent working from the brief alone.
  - **First proof:** they fail on today's code and pass on its reference implementation.
  - **Fairness review r1 (smart tier): NEEDS-CHANGES, every finding accepted.**
    - **Weighting:** an arm that never touches the canvas would score 88%.
    - **Over-strict:** some checks would fail a legend or a reworded title.
    - **The gap:** no fixture block sits near the 24-pixel boundary.
    - **Five minor loosenings.**
  - **Revision r2:** 81 cases in nine named groups. U1 to U6 cover the function. C1 covers canvas marking, including probes at the 24-pixel boundary. C2 covers to-scale blocks left unmarked. G is the regression gate.
  - **Re-proof (re-run first-hand):**
    - the reference implementation passes 81 of 81, the full suite passes, and tsc is clean;
    - on the base, the function suite cannot load, and 9 C1 cases fail;
    - the stub fails the U groups and C1;
    - two mutants are caught: a halved scale, and a floor tested with `<=`.
  - **Frozen:** test sha256 f149decd and d546a0e7.
- **The scorer** (`~/abl-trial/impl/score.py`, sha256 c90172b1) runs by script.
  - **Check:** a clean reference copy scores 100, and an untouched copy scores 0, with all gates passing on both.
  - **One bug, found and fixed:** a test-path flag overrode the project's ignore list.
- **No Fable:** a PreToolUse hook in the run settings refuses any Agent call naming Fable, identically for every arm. Witnessed with a recon-tier agent ($0.05): it was refused at the gate. The arms' named agents use only Haiku and Sonnet. The Workflow tool is disallowed.
- **The run script** (`run-arm.sh`) runs each arm in a fresh copy:
  - **Plan:** Opus 5.5, no shell, a $5 cap.
  - **Build:** the same session continued, with sandboxed Bash and a $15 cap.
  - **Isolation check:** before and after.
- **Slice 1 is complete.** Slice 2 started with run i01.
- **The scoring rule, revised before any arm runs** (the User, 2026-10-10: "ok your lean on the scoring"):
  - **Gates (any failure scores 0):**
    - the type check is clean;
    - the existing suite has no regressions;
    - the regression group passes (nothing moves, key title facts kept).
  - **The score out of 100:**
    - **Half for the function:** the mean pass share across its six behaviour groups.
    - **Half for the canvas:** the pass share of marking not-to-scale blocks, multiplied by the pass share of to-scale blocks left unmarked.
  - **The thresholds are unchanged:** Full at least 20 points above the comparison means it helps; the same or lower means no measurable help; anything between is inconclusive.

### Slice 2: the runs (2026-10-10)

**Two void runs, recorded.**
- **i01:** never started. The prompt was swallowed by a tool-list flag. No model was called and nothing was spent.
- **i11:** cost $1.35 and is void. The main thread wrote the permission rule with a single slash. Absolute paths need `//`, and file-path rules apply through `Edit(...)` to every writing tool. So every write was refused.
  - **The arm's behaviour:** it stopped and reported the refusal. It declined to work around it through the shell.
  - **The fix:** witnessed with a recon-tier agent ($0.03) before re-running.

**Valid runs,** each a plan then a build in the same session. Every run used Opus 5.5 only, had no permission refusals, and left the isolation witness unchanged.

| Run | Arm | Plan | Build | Cost |
|---|---|---|---|---|
| i21 | without the playbook | 23 turns | 26 turns | $2.20 |
| i22 | no Memento | 11 turns | 29 turns | $1.95 |
| i23 | full Memento | 13 turns | 23 turns | $2.15 |

### Slice 3: judging (2026-10-10)

**Scores, by the frozen scorer.** Every gate passed in every arm: tsc clean, 1,146 of 1,146 existing tests, and the regression group 30 of 30.

| Arm | Function (U1 to U6) | C1 | C2 | Score |
|---|---|---|---|---|
| Full Memento | 33/33 | 12/13 | 5/5 | 94.4 |
| Without the playbook | 33/33 | 11/13 | 5/5 | 89.5 |
| No Memento | 33/33 | 11/13 | 5/5 | 89.5 |

**The decision rule, applied as written:** Full leads both comparisons by 4.9 points. That is under 20 and above zero, so both comparisons are **inconclusive**.

**What the difference is.** Every C1 miss concerns the rebaseline R-pill, which the contract left ambiguous; the fairness review flagged it beforehand.
- **What all three arms did:** each put the marker and a title on the rebaseline rectangle, and none marked the pill.
- **What separated them:** the two other arms also wrote the note into the pill's tooltip, and that is what the accounting test penalised.
- **With the two pill tests set aside,** the three arms are level.

**The single smart-tier review** (blind: unlabelled, in random order, unblinded after):
- **Full Memento: 3 of 5.** A material defect: its rebaseline note sits on a rectangle that cannot receive hover, so mouse users never see it. This is the same choice that won it the extra test.
- **Without the playbook: 4 of 5.** The best structure (one source of truth for height) and the strongest tests. It cites the project's August finding on the area invariant. The reviewer took that for a dangling path because it looked in the no-Memento template; the record exists in the Memento arms. Project memory showed up in the code.
- **No Memento: 4 of 5.** Correct and minimal, with weaker library tests and one comment edited outside scope.
- **Shared by all three:** the signal is a tooltip only, with nothing for keyboard or screen-reader users; no arm tested start-side clipping.

**The reading.** On a feature with a specified contract, Memento made no measurable difference to working software. Taking the review into account, full Memento did no better. This is the limit recorded in advance: a stated contract narrows how much planning can matter. One feature and one run per arm, so this is a direction and not a verdict.

**Spend:** $6.30 for the valid runs and $1.35 void. The recon-tier witnesses cost $0.14; the smart-tier agents' cost is unmetered here. Total frontier spend is about $8, against a $70 cap.

**Next:** the User's choice.
- stop here;
- a second feature with a less-specified design, scored by tests on behaviour plus a blind review;
- more runs of this feature, to measure run-to-run noise.

Slice counts (2026-10-10, author claude-opus-5-5, scout claude-sonnet-5-5): new controls 1 · faults by suite or mutants 2 · defects in shadow - · unsanctioned scope changes 0 · scout reports 1 · scout reports corrected 0

## Feature 2 (approved by the User, 2026-10-10: "push and a second feature test, one that touches more parts of the code"; then "approve both")

- **The feature:** H-040, a fiscal-year and quarter filter on the Start Sprint dropdowns in the Add and Edit Initiative windows.
  - **Parts it touches:** the two windows, the team page (which must supply the fiscal-year anchor from its time-period framework), and the calendar logic.
  - **The brief:** held privately at `~/abl-trial/impl/brief-h040.md` (sha256 586ec8d9).
- **Less specified by design.** The tests rely only on:
  - an optional `fyAnchor` input on both windows;
  - two selects labelled "Fiscal year" and "Quarter", each defaulting to "All", with FY labels in the product's format and quarters Q1 to Q4;
  - filtering to the chosen period;
  - no change when the anchor is absent;
  - the team page passing the anchor.

  Where the logic lives, and how the anchor reaches the page, are each arm's own design.
- **Scoring for feature 2, approved before any run:**
  - **The gates are unchanged.**
  - **Hidden tests:** 75%, as the mean pass share across behaviour groups.
  - **The blind smart-tier review:** 25%. A rating r of 5 contributes (r - 1)/4 × 25.
  - **The thresholds are unchanged.**
- **The pipeline and caps are as for feature 1.** Opus 5.5 for the arms only, no Fable, smart tier for tests and reviews.

### Feature 2 results (2026-10-10)

**Tests:** 77 cases, revised after fairness review r1 (smart tier, NEEDS-CHANGES, every finding accepted).
- **The material fix:** sprints that straddle a boundary are isolated, so a disputed period rule costs 4 tests, down from 42 under the old fixtures.
- **Also:** label regexes loosened, empty-combination cases pruned, and fresh renders for the reset states.
- **Re-proof:** the reference passes 77 of 77; the base fails 64 of 64 feature tests and passes the 13 gate tests; the mutants are all caught.
- **Frozen:** sha256 a1af7d58 and d987eae0.
- **The scorer** `score2.py` (c1ebba80): a clean reference scores 75 test points, and a fresh untouched copy scores 0. One fault was found and fixed: Add and Edit cases with identical names had collapsed into one key.

**Runs, in sequence:**
- **One launch failed on a shell quirk** and ran nothing.
- **The three runs** used Opus 5.5 only, with no refusals, and left Proportion unchanged.
- **The witness's `/tmp` count rose by one** in two runs. Every entry created in the window was a Rooms lab-test folder from a concurrent session; none came from an arm (whose shell cannot write to `/tmp`, as witnessed). The `/tmp` count is a noisy witness while other sessions run.

| Arm | Tests (75) | Blind review (25) | Score | Cost |
|---|---|---|---|---|
| Full Memento | 75 | 5, giving 25 | 100 | $2.63 |
| Without the playbook | 75 | 4, giving 18.75 | 93.75 | $2.33 |
| No Memento | 75 | 4, giving 18.75 | 93.75 | $2.12 |

**The decision rule:** Full leads both comparisons by 6.25 points. That is under 20 and above zero, so both are **inconclusive**.

**What separated them** (the blind review, unblinded after):
- **Common to all three:** each wired the page to the product's single anchor seam (`resolveTeamFYAnchor`), reused `deriveFYAndQuarter`, cleared a hidden selection, and left an empty period recoverable.
- **Full Memento:** no duplication (a shared hook and component), logic in `lib/calendar`, a filter reset on close, and the most thorough tests.
- **The other two:** about 20 lines duplicated in each window. The no-Memento arm also placed its helper outside `lib/calendar`, hand-rolled its labels, and did not reset the Edit filter on close.

**Reading across both features.** All six builds produced working software that passed every gate and nearly every hidden test. The arms differed only in design quality, as judged by a single blind smart-tier review, and the direction split:
- **feature 1:** full Memento was rated lowest, on a real defect;
- **feature 2:** full Memento was rated highest, on structure.

**The conclusion at pilot scale:** no measurable effect of Memento, or of its planning playbook, on whether the software works. Design quality varied in both directions. The run-to-run noise is unknown, and one review per feature is thin.

**Spend for feature 2:** $7.08 for the arms. The smart-tier agents' cost is unmetered here.

**Next:** the User's call.
