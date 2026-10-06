---
description: plan for the first trial of Memento as a whole: fresh sessions in three disposable, isolated copies of Proportion (full Memento, Memento without the planning playbook, no Memento) each plan the same real features, and the User judges the plans blind against criteria fixed in advance
type: plan
date: 2026-10-06
genre: investigation (3B) with a decision step (3C); the template build follows 3A's debt/excision variant
size: L (five slices)
status: CLOSED at the pilot stage 2026-10-06 on the User's word ("3. we can pick it up later if it seems like a good idea"); two features run and judged, results banked; resumable
related: [decision-bitter-lesson-sort-2026-10-06, design-sort-slice2a-2026-10-06, finding-exercise-census-2026-10-03, finding-longitudinal-evidence-2026-10-03, plan-spawn-tier-control-across-estates-2026-09-06]
---

# Plan: the Memento ablation trial

**Provenance.** The design draws on Proportion's layout as read by path and line on 2026-10-06 (another instance; structural facts only, no product content). Drafted outside the working tree; cleared by the User's approval of draft r2, 2026-10-06 (CD #4e).

## Origin and authority

The Bitter Lesson sort (`decision-bitter-lesson-sort-2026-10-06.md`) named a trial without the planning playbook as its first test. Discussing its design on 2026-10-06, the User proposed the wider form: fresh sessions with and without Memento asked for the same plan, in a copy of a real product with Memento excised. He chose Proportion, a deterministic product without probabilistic features, so plans can be judged on their merits. He confirmed that no experiment of this kind has been run or conceived before, and asked for this plan ("yes plan it, use the playbook").

## Pattern Search Results

- **This estate.** The census and longitudinal findings count use. The sort records use as weak evidence of need and names trials as the direct test. This trial gives sort unit 4b (the planning playbook) its reading, and gives unit 5 (planning rules) a reading on Memento's planning support as a whole.
- **Method precedent.** On 2026-10-06 rooms/dev ran a toggle test in fresh headless sessions (`claude -p`, project settings only, a scratch project) after finding that agent definitions are cached at session start. Fresh headless sessions are the method here for the same reason: each one starts with whatever priming its copy carries.
- **Shadow and isolation.** The spawn-tier plan's shadow mode and falsifier windows. KILLED §2, a shadow control that never delivered, is the reason every isolation measure here is witnessed before it is relied on.
- **Proportion's layout, read for this plan by path and line only.** Memento is woven through the product as well as its governance folders. The adversarial review found:
  - the worktree's `.git` file pointing at a shared git directory with the real remote;
  - settings files allowing writes to Proportion's absolute paths and `git push`;
  - live credentials in `.env.local`;
  - eleven hook scripts, several writing outside the repository (telemetry, `/tmp` markers, a backup push);
  - Memento references in `package.json` scripts, `scripts/`, `.codex/`, `.githooks/`, the README, docs and source comments.
- **Ruled out.** Proportion's `independent-memento-evaluation/` folder; the User confirmed it holds no earlier experiment of this kind.

## Problem / purpose

Does Memento make a fresh session's plans better, and does the planning playbook add anything once the rest of Memento is present? The answers feed sort unit 4b directly. They also give the first evidence of Memento's value measured by outcome.

## Options for the trial design (3C)

| Option | Shape | Falsifier for choosing it |
|---|---|---|
| A. Three-arm ablation in copies of a product (this plan; the User's choice) | Full, no playbook, none; fresh headless sessions | The pilot shows the arms cannot be isolated, or the None arm cannot be made Memento-free without altering the product |
| B. Live A/B in an active estate | Alternate sessions with and without the playbook in rooms | Ruled out: another estate's live work, hard to judge fairly |
| C. Replay of this estate's past plans | Nine past requests re-planned with and without the playbook | Narrower: tests the playbook only, on governance work rather than product work |
| D. Spawned agents in this session | Agents with different contexts | Ruled out: agents skip the session-start priming the trial measures |

The User chose A on 2026-10-06. B and C remain fallbacks if A's falsifier fires.

## Posture

Mostly predictive, with three feedback points:
1. **after slice 0:** features, criteria, decision rule, the definition of "no Memento", and the spend envelope;
2. **after slice 1's pilot:** the User checks the removals, the reference sweep and every isolation witness;
3. **after slice 3's judging,** before anything is banked.

If A's falsifier fires at the pilot, the plan pivots to B or C, or stops, and records why.

## Design

### Templates (3A, debt/excision variant)

Three templates under `~/.memento/trials/ablation/`, with neutral names (`t1`, `t2`, `t3`) so a path does not reveal its arm. Each is copied from Proportion's working tree read-only.

**Applied to every template, identically:**
1. **Git.** The `.git` file is removed and `git init` run, with no remote. Witnessed: `git rev-parse --git-common-dir` resolves inside the template, and `git remote -v` is empty.
2. **Secrets.** `.env.local` and every other `.env*` holding values are removed. A product plan needs no credentials.
3. **Settings.**
   - Both `.claude/settings.json` and `.claude/settings.local.json` lose their `permissions` blocks. Permissions are the User's working setup, outside Memento.
   - In their place goes one trial permissions block: deny `Bash(git push:*)`, writes outside the clone, and network tools.
   - The harness's sandbox mode is enabled where it can confine Bash to the clone with no network. The pilot witnesses that it does.
4. **Hooks** (Memento arms only). Every hook that writes outside the repository is rewritten to write inside the clone, or made inert:
   - telemetry and the hook log, through the hooks' own environment variables where they exist (`MEMENTO_HOOK_JSONL_DIR`, `MEMENTO_HOOK_LOKI`);
   - `/tmp` markers;
   - the backup push;
   - the telemetry-stack start.

   The full hook list and the change to each go into the slice 1 record.
5. **Run flags.**
   - `claude -p`, Opus 5.5 at the default effort level;
   - `--setting-sources project` and `--strict-mcp-config`, so no user-level hook, OTEL export, plugin or MCP server reaches any arm;
   - a fixed `--permission-mode`, the trial's allow and deny lists, and `--max-budget-usd` per run.

**The arms:**

| Template | Arm | Contents |
|---|---|---|
| One | Full | Proportion with its Memento intact, plus the changes above |
| One | No playbook | As Full, with the planning playbook removed. References to it (about 99 files, including core directive 12's pointer) are left in place. The playbook's content is absent, and the trigger to plan survives in the directives. Whether Full sessions read the playbook at all is logged from their transcripts. |
| One | None | Memento's governance surface excised (see below) |

**"No Memento" (decided with the User at slice 0; the session's lean).** The excision covers:
- `memento/`;
- `CLAUDE.md` and `AGENTS.md` (wholly Memento);
- `.claude/` (hooks, agents, agent memory, tier log);
- `.codex/`;
- the Memento `package.json` scripts and the `prepare` hook;
- the `scripts/memento-*` files and their checker;
- `.githooks/` lines that call Memento;
- the README's Memento section;
- the docs that describe Memento;
- `independent-memento-evaluation/` and `telemetry/`.

Product code stays as it is. Source comments and migrations that mention Memento are left, counted and recorded as a residual limit, because editing product code would change what is being planned against.

**The alternative:** scrub those references too.

**The witness:** `grep -ril memento` in the None template finds zero hits outside the recorded residual set.

### Runs

- **Features:** six real, deterministic features from Proportion's backlog, chosen by the User in slice 0. None may already have a plan or design in Proportion's records. A feature brief of two or three sentences is written once by the User, or drafted by the session and approved by him. The same brief goes to every arm.
- **Runs:** two per feature per arm, making 36. Each run uses a fresh APFS clone of its template, deleted after the plan is collected.
- **Prompt (fixed):** the brief, then "Write a plan to implement this. Save it as a file. Do not implement anything."
- **Receipts:** a manifest records arm, feature, run, session id, cost, plan hash, whether the playbook was read, and every path written.

### Judging

- **Blinding.** The plans are given random labels. Frontmatter and absolute paths are stripped, and nothing else. Memento's headings stay, since removing them changes the artefact. For each plan, the User records which arm he guesses wrote it, and his guessing accuracy is reported as the measure of how blind the judging was.
- **The User's scores.** He scores each plan on criteria he names in slice 0, plus an overall score from 1 to 5. The suggested criteria:
  - would he approve it as written;
  - does it name the right components;
  - does it slice and sequence the work sensibly;
  - does it name real risks and how to verify;
  - concision at equal quality;
  - fit with the project's existing decisions.

  The last criterion favours Full by construction, because those decisions live in Memento. It is scored and reported separately, as the effect of the record.
- **Factual errors** (3B). Each plan's checkable claims (named files, components, functions, tables, behaviours) are listed. A smart-tier reviewer checks each one against the clone and records a verdict:
  - CONFIRMED (it exists as stated);
  - ERROR (it does not, or differs);
  - UNCHECKABLE.

  Each verdict carries its receipt: the path, or the search run. The denominator is the plan's count of checkable claims, and the reading is errors per claim. The main thread re-checks a sample of one in five verdicts first-hand before any count is cited.

### Decision rule (fixed before any run)

The unit is the feature, since two runs of one feature are not independent.

**Per feature:**
- An arm *wins* the feature when its mean overall score across its two runs is higher by at least one point.
- A smaller gap is a *tie*.

**For each comparison, with wins, ties and losses all reported:**

| Comparison | Clear result | Opposite result | Otherwise |
|---|---|---|---|
| Full against None | Memento helps: Full wins at least 5 of the 6 features | No measurable help: Full wins at most 1, with the rest ties or losses | Inconclusive |
| Full against No playbook | The playbook carries weight: Full wins at least 5 of the 6 | A retirement candidate: Full wins none, and No playbook wins or ties at least 5 | Inconclusive, re-run at the next main-thread generation |

**Strength of the rule.** Under the null of a fair coin and no ties, 5 or more of 6 occurs about 11 percent of the time for each comparison. There are two comparisons, so a false result on either is about one in five. The result is reported as a directional reading at pilot scale, with that rate stated.

**What each result refutes in sort unit 4b:**
- *the playbook carries weight* refutes 4b's Option A (prescribed procedure, expected to fade);
- *retirement candidate* refutes Option B (judgement practice, expected to hold).

A retirement-candidate result goes to its own plan before anything changes.

## Scope and slices

0. **With the User** (3C, variance before schema).
   - The six features and their briefs.
   - The judging criteria.
   - The decision rule, confirmed or amended.
   - The definition of "no Memento".
   - The spend envelope (CD #4f), with the pilot's cost per run as the basis for the full estimate.

   S.
1. **Templates, isolation and pilot** (3A).
   - **Key changes:** the three templates and the five changes applied to every template, per file. The hook list with each change. The None excision list and its reference sweep.
   - **Witnesses:**
     - git confined to the clone;
     - no `.env*` values;
     - a deliberate write outside the clone refused;
     - a deliberate `git push` refused;
     - no network call beyond the model's own;
     - no user hook, OTEL export or MCP server active;
     - hook output landing inside the clone.
   - **Pilot:** one run per arm on a dummy feature. It measures cost per run and gate behaviour headless (including the Stop gate's extra turns), and confirms the None session reads no Memento path.
   - **Allowed writes outside the clone:** Claude Code's own session files under `~/.claude/` (transcripts and prompt history). These are recorded by session id so the census can exclude them.

   Feedback point: the User checks all of it. M.
2. **The runs** (operational batch).
   - 36 runs from one script, recorded in the manifest.
   - **Halt conditions:**
     - any write outside the clone beyond the allowed set;
     - any push attempt;
     - any read of a secrets file;
     - any network call to a product service;
     - spend reaching the envelope;
     - a run that hangs.

   M.
3. **Judging.**
   - The blinding pass.
   - The User's scores and arm guesses.
   - The factual-error verdicts, with the one-in-five first-hand re-check.
   - Unblinding, and the decision rule applied.
   - A review of the arithmetic.

   Feedback point: the User sees the result before banking. M.
4. **Banking and clean-up.**
   - A findings memo of de-identified results:
     - wins, ties and losses per comparison;
     - score distributions;
     - error rates;
     - blinding accuracy;
     - residual references;
     - the verdicts and their limits.

     It carries no product content and no feature names. It is reviewed and cleared by the User (CD #4e).
   - Unit 4b of the decision record updated.
   - `~/.memento/trials/ablation/` deleted on the User's word. Until then it is kept out of any backup or sync.

   S.

**Out of scope:**
- implementing any feature;
- any change to Proportion itself;
- retiring or changing any Memento part;
- trials of other units;
- the shared review-and-plan-record counter, which is the next undertaking.

## Risks

- **Escape from the clones (plan-threatening).** The shared git directory, absolute-path permissions, the push hook, hooks writing to `/tmp` and telemetry, and network access through Bash. Mitigations: changes 1 to 5 above, each witnessed in the pilot before any run, and the halt conditions.
- **Secrets.** Removed from every template. A read attempt halts the run.
- **Contamination of the None arm (plan-threatening).** The reference sweep with its recorded residual set, neutral paths, project-only settings, and a transcript check that the None session reads no Memento path.
- **The record favours Full by construction.** This is the tested effect. It is scored and reported separately.
- **The playbook arm's dangling references.** Left identical in kind, so the arm measures the playbook's content. A session that remarks on the missing file is recorded.
- **Statistics.** Six features at pilot scale, with false-result rates stated. Report wins, ties and losses.
- **Partial blinding.** Measured by the User's guess accuracy. The error rate is a reading the blinding cannot sway.
- **Stale working context.** Proportion has been dormant since 19 September, so the Full arm primes from it. This is realistic for a returning project, and recorded.
- **Gates when headless.** The pilot shows each gate's behaviour. Stop-gate extra turns are measured as cost.
- **Spend.** A per-run budget cap, and the envelope from slice 0. The pilot sets the estimate.
- **Confidentiality.** The trial folder stays outside both repositories, is excluded from backup and sync, and is deleted at the end. Only de-identified results enter this estate.
- **Posture-absorbed:** feature choice, criteria wording, the definition of "no Memento", and the blinding list.

## Verification

- An independent adversarial review of each revision of this plan (CD #14).
- The pilot's witnesses, with receipts (command and output) in the slice 1 record.
- The manifest as the receipt per run.
- The User's blind scores and guesses.
- Factual-error verdicts with receipts, and a first-hand re-check sample.
- A review of the result arithmetic and of the findings memo before banking.

## Routing (CD #12)

- **The main thread:** the plan, the templates, the isolation, the scripts, the sampled re-checks and the arithmetic. Scripts are deterministic code.
- **The runs:** fresh headless frontier sessions, by design.
- **Factual-error verdicts and reviews:** smart tier.
- **The User:** features, briefs, criteria and judging.

## Estimated effort (relative)

| Slice | Size | Sub-tasks or shape |
|---|---|---|
| 0 | S | Five decisions with the User |
| 1 | M | About eight sub-tasks within disposable copies, each with a witness |
| 2 | M | A batch of 36 runs from one script |
| 3 | M | Blinding, two judging lanes, a re-check sample, arithmetic |
| 4 | S | One memo and a clean-up |

Overall: L, sliced as above, WIP of one.

## Seam

Estate side only: this plan and the findings memo are `docs(estate)`. Nothing touches the canon. Trial materials live outside both repositories.

## Review record (r1, 2026-10-06, smart tier): NEEDS-CHANGES; every finding accepted

- **Isolation:**
  - **Git:** the worktree's `.git` pointer and the real remote are handled by removing the pointer and running `git init`, witnessed.
  - **Permissions:** the absolute-path allow rules and the allowed `git push` are replaced by a trial permissions block, with the sandbox enabled.
  - **Secrets:** `.env.local` and its credentials are removed.
  - **Hooks:** all eleven are inventoried, and the outside-writing ones rewritten or made inert.
  - **User-level configuration:** OTEL, the hooks, the plugin and MCP are excluded by flags and witnessed.
  - **Allowed writes:** the outside-clone write set is defined, so the halt rule is workable.
  - **Paths:** templates are given neutral names.
- **The None arm:** the excision widened to Memento's whole governance surface, with a reference sweep and a recorded residual set. Its definition goes to the User at slice 0.
- **Arm 2:** the claim that "the rule survives" is restated precisely. The prompt orders a plan, so the trigger is moot, and the arm removes the playbook's content. Playbook reads are logged in Full.
- **Statistics:** the feature is now the unit. Six features, wins, ties and losses all reported, false-result rates stated, and a stricter retirement rule.
- **Record advantage** named as the tested effect, and the fit-with-decisions criterion reported separately.
- **Briefs:** one brief, written or approved by the User, goes to every arm.
- **Blinding:** measured by guess accuracy.
- **Factual errors:** defined with a verdict vocabulary, a denominator, receipts and a first-hand re-check.
- **Playbook conformance:**
  - 3B: denominator, vocabulary, receipts, re-check, review per slice.
  - 3C: options held with falsifiers, the User's choice recorded.
  - 3A: key changes per file, the excision sweep.
  - The link to 4b's options is stated.
- **Safety:** a per-run budget cap and a pilot-based estimate, wider halt conditions, secrets and permission choices flagged for the User, and retention and backup exclusion stated.
- **Writing:** the four contrast constructions restated.

Approved by the User, 2026-10-06.

## Slice record

**Slice 0 (2026-10-06).** The User chose six features (named in the private trial folder only), approved their briefs, and took the session's leans on the criteria, the decision rule, the definition of "no Memento" (the governance surface; product code untouched) and a pilot cap of three runs at $5 each.

**Slice 1 and the first feature (2026-10-06).** Pivots, on the record:

- **Pilot.** On the User's word, the first real feature replaces the dummy pilot, one run per arm, judged before more runs.
- **Bash.** Every arm runs without Bash, web tools or MCP servers. Tools are Read, Grep, Glob, Agent and TodoWrite, plus Edit confined to the run's clone. This replaces the planned sandbox.
- **Who ran what.** The permission system refused the session's edits to the templates' settings and hooks, and its deletions in the templates. Those steps ran as scripts the User read and ran himself. The build itself excluded every `.env*` file and the git pointer at copy time. A name-only scan found no live credentials.
- **The isolation witness passed on both runs.** The hook-fires log, `/tmp`, and Proportion's git state and HEAD were unchanged before and after.
- **Contamination found and fixed.** In the first no-Memento run, the README still carried Memento framing and the trial root's path named Memento. The README was cleaned, the root was moved to a neutral path, and the arm was re-run. The superseded run is kept on record.
- **The clean re-run read no Memento path.**
- **Cost.** Four runs cost about $7.80 in all, within the $15 pilot cap.

**Judging pivot (2026-10-06, the User: "do it").** The plans are too long for the User to score by hand, so agents judge them under a protocol he approved:

- **Yardsticks, built blind to the plans and frozen before judging.** For each feature: requirements from the brief and the code; the regression surface computed from the code; product conformance (the value statement, the design system, the architectural patterns) from the product's own sources; and recorded decisions from Memento's record, scored and reported separately.
- **Neutralisation.** Each plan is rewritten into a fixed neutral form, and a second agent checks the rewrite for fidelity.
- **Judges.** Two blind judges per plan, Opus 5.5 and Fable 5.1, score each checklist item met, partial or missing, with the plan's words quoted and codebase claims checked in the clone. Plans are judged one at a time, in two orders. A third judge settles disagreements, and the disagreement rate is reported.
- **Headline score.** Weights: requirements 30%, regression surface covered by tests or verification 30%, product conformance 20%, sequencing and migration soundness 10%, factual accuracy 10%. The headline score replaces the User's overall mark in the decision rule.
- **Calibration.** Before the scores are trusted, the rubric is run on past Proportion plans with known outcomes.
- **Outcome test for the two small features.** Each plan is implemented by an identical implementer with no Memento, then the type check, the test suite, the end-to-end tests and acceptance tests fixed in advance are run.
- **The User's blind guesses** for feature 1 are recorded privately: he identified the no-Memento plan confidently, and was unsure between the other two.

**Scope correction (2026-10-06).** The User asked only for an impartial scoring of the first feature's three plans. Calibration on past plans was dropped. Its yardsticks and rewrites are parked, and five of its six judges were stopped unfinished. Six parallel frontier judges were stopped for cost and replaced by two sequential passes: one Opus 5.5 judge, then one Fable 5.1 judge, each scoring all three plans with a sample of ten code claims per plan. *Lesson for the knowledge archive:* running many frontier agents in parallel spent a large share of the User's session allowance in minutes. Judging runs in sequence, one agent per model family.

**Pilot result, first feature (banked on the User's word, 2026-10-06).** De-identified; product content stays in the private trial folder.

| Arm | Opus 5.5 | Fable 5.1 | Mean |
|---|---|---|---|
| Full Memento | 0.79 | 0.77 | 0.78 |
| Memento without the planning playbook | 0.70 | 0.77 | 0.73 |
| No Memento | 0.71 | 0.68 | 0.69 |

- **Headline score.** Weighted: requirements 30%, regression surface 30%, conformance 20%, sequencing 10%, factual accuracy 10%.
- **Judge agreement.** The two judges agreed on 71 to 82 percent of checklist items and never split as far as MET against MISSING.
- **Full Memento ranked first with both judges.** Its lead came from regression-surface coverage and factual accuracy, with no errors in twenty sampled claims, and from dealing with the product's real current state.
- **No Memento ranked last with both judges.** It had the weakest regression coverage and two errors in each judge's sample.
- **The no-playbook arm is split.** Opus put it level with No Memento, mainly on sequencing; Fable put it near Full. The playbook's effect is unresolved on one feature.
- **Recorded-decisions scores barely separated the arms.** A no-Memento session recovered most of those decisions from the code.
- **The User's blind guesses of arm were all correct,** so the blinding was partial.
- **Limits.** One feature, one run per arm, one pass per judge, ten-claim samples. This is a direction, not a verdict, and the decision rule does not apply until more features are run.

**Next (the User, 2026-10-06):** a second feature, chosen to differ from the first, run the same way.

**Pilot result, second feature (banked on the User's word, 2026-10-06).** A small bug fix, chosen to contrast with the first feature's large build. The bug turned out to be absent from the current code. The session chose it from a stale backlog entry without checking the code first. That made it a test of whether each arm checks the real state of the code.

| Arm | Opus 5.5 | Fable 5.1 | Mean |
|---|---|---|---|
| Full Memento | 0.57 | 0.63 | 0.60 |
| No Memento | 0.61 | 0.43 | 0.52 |
| Memento without the planning playbook | 0.52 | 0.46 | 0.49 |

- **All three arms found the bug absent** and stopped for the User's ruling instead of inventing a fix.
- **All three missed the deeper reason the bug cannot exist:** a data store was retired earlier.
- **Recorded-decisions scores were identical** across arms.
- **The judges disagreed sharply on No Memento.** Opus scored it first; Fable scored it last, with four errors in ten sampled claims. Item agreement ranged from 12 to 17 of 19.
- **Across both features,** Full Memento ranked first on the mean (0.78 and 0.60), about 8 to 9 points above No Memento. The no-playbook arm did no better than No Memento in either feature. That hints the playbook carries more planning value than the sort's slice 2a assumed, and it is not yet separable from noise.
- **Limits** as for the first feature, plus wider disagreement between the judges.
- **Cost.** The second feature's three planning runs cost $1.37.

**The User's idea for a stronger test (2026-10-06, not yet planned):** each arm carries out its own plan in its own copy, measured by type check, build, existing tests and acceptance tests. The User is not ready to start it.

**Closure (2026-10-06).** After two features the User reassessed the plan and chose to stop the trial at the pilot stage, to be picked up later if it seems worthwhile. The reassessment found that practice had moved from the approved design in four ways:
- one run per arm, not two;
- agent judging against frozen yardsticks on a 0 to 1 scale, not the User's 1 to 5 scores, which leaves the decision rule unusable as written;
- features need checking against the code before they are chosen;
- the judging pipeline costs several times the planning runs.

Judge disagreement was about the size of the effects being measured. A resumed trial needs a recorded revision first. The User's implementation test is the leading candidate for that revision. The trial folder (`~/abl-trial`) and the review copies are kept outside both repositories until the User rules on them; they hold product work and stay out of any synced or shared location.
