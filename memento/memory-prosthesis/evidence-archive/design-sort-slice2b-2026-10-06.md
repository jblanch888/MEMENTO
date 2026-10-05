---
description: slice 2, second half, of the Bitter Lesson sort: parts 17 to 32 of the registry, each with the kinds it could belong to, the evidence for each, one discriminating test and the record agreed at slice 1; held neutral for the User's ruling at slice 3
type: design
date: 2026-10-06
status: banked 2026-10-06 on the User's word ("1 y"), r3 after adversarial reviews r1 and r2; options held neutral for slice 3
related: [plan-bitter-lesson-sort-2026-10-03, design-sort-slice2a-2026-10-06, finding-exercise-census-2026-10-03, finding-longitudinal-evidence-2026-10-03, plan-exercise-census-2026-10-03, ORGAN_REGISTRY, KILLED_MECHANISMS, TOOLING_TRIGGERS, KNOWLEDGE_ARCHIVE, plan-leak-hardening-2026-10-03]
---

# Bitter Lesson sort, slice 2b: parts 17 to 32

**Provenance.** Built from the banked census and longitudinal findings, the registry, KILLED_MECHANISMS, the register, the knowledge archive and this estate's plan records. Figures follow the shapes the cleared findings publish. Banked on the User's word, 2026-10-06.

**What this is.** The second half of slice 2. The User assigns each unit at slice 3, or defers it.

## Conventions

- **Inherited from slice 2a** (`design-sort-slice2a-2026-10-06.md`):
  - the three kinds;
  - capability and setting assumptions and their clocks, with the delegate tier's generation used for parts that turn on delegated agents;
  - a falsifier is an observed outcome that contradicts an option's expected direction;
  - one discriminating test per unit;
  - the threshold: a half against the 2026-10-03 baseline, per active session, ten sessions a side;
  - authority options are refuted only by a dated decision of the User, visible in git;
  - instruments marked *owed* where they do not exist yet.
- **Added here:**
  - **Baselines** where the census has no reading: the rate measured with the part in place over the first quarter after its instrument exists.
  - **Absolute thresholds** where a baseline is zero or near zero, as in 6b: an occurrence in ten percent or more of the items counted (memos, undertakings, controls, documents).
  - **Low volume:** where incidents are too few for a rate, the unit records each incident and is revisited once ten are recorded.
  - **Trials** that remove a safety, approval or confidentiality control run on a scratch copy of the repository, with nothing pushed and the outcomes named by the User in advance.
  - **Shadow tests** count what a live control would have blocked, with the control in log-only mode. A live control deters attempts, so a fall in its blocks is also what a working control produces.
- **Engineering practice as a basis (ruled by the User, 2026-10-06).** Slice 1 defined *independent of the model* by the record, the User's authority, confidentiality and the language standard. The User added engineering practice whose need does not depend on who does the work as a fourth basis. Options here (18B, 19b, 20A, 21, 22, 25, 26) and one in slice 2a (16) rest on it and are marked *independent (engineering)*.

**Evidence for this half is thinner.** The census reaches parts 17 and 23 directly. The collector log, the governance-hook log and this estate's records reach 19, 21, 22 and 25. Of the census's eight parts with no signature, seven fall in this half (18, 20, 26, 27, 30, 31, 32), matching its finding that the parts it cannot see are mostly authority and doctrine. Evidence from this estate's own work is labelled as one estate's. Units 7, 20, 22, 28, 31 and 32 draw on the same review and plan records, so their readings move together.

---

## 17. Validation ledger

The registry lists the full ledger in one project and failure criteria in every project. This sort writes failure criteria into each unit. The unit here is the ledger form.

- **A. Independent of the model (record).** Assumption: none about the model; a record of each control's planned test and verdict serves later readers deciding whether to keep a control. Expected: holds.
- **B. Judgement practice (capability).** Assumption: setting a falsifier that can fire takes judgement, and the ledger keeps that judgement visible. Expected: holds or grows.
- **C. Prescribed procedure (capability).** Assumption: the ledger's fixed form compensates for a model that would claim a control works without a test. Expected: fades.
- **Evidence.** The ledger was active in proportion's peak months, then a few changes a month (census, git), alongside proportion's fall in activity and its later dormancy.
- **Test.** **Untestable now.** A test of the options needs the content of falsifiers audited for whether they can fire, at the next generation change (instrument *owed*), and later decisions about controls checked for citations of the ledger (instrument *owed*).
- **Signal:** ledger changes (git). **Ladder:** written guidance.

## 18. Controls model

- **A. Judgement practice (capability).** Assumption: choosing the level of enforcement for a rule takes judgement, guided by the allocation test of whether a rule needs judgement or a script can detect it. Expected: holds. Evidence: KILLED §4 and §5 record enforcement attempts on judgement rules that failed; §4's September note records the allocation test separating the removed fit hook from the spawn-tier pin.
- **B. Independent of the model (engineering).** Assumption: none about the model; enforcement matched to evidence is engineering doctrine. Expected: holds.
- **Test.** Both options expect it to hold, so no observation separates them. **Untestable now;** the User can assign by the reason he accepts.
- **Signal:** none. **Ladder:** written guidance.

## 19a. Hooks that guard the User's authority (part 19, split)

Part 19 pools hooks with different purposes. Its split follows what each hook enforces: the User's authority here (the push gate, the compaction gate), compliance with rules in 19b.

- **A. Independent of the model (authority).** Assumption: none about the model; the hook holds a decision that is the User's. Expected: holds.
- **B. Prescribed procedure (capability).** Assumption: the hook compensates for a model that would take the action unasked. Expected: fades.
- **Evidence.** In this estate every push waits for the User's word and passes the pre-push sweep. The compaction gate's allow-and-consume arm was live-witnessed on 2026-10-06 (register).
- **Test.** Attempts the hook would block, counted with the hook in shadow on a scratch copy at the next generation change (instrument *owed*). B is refuted if attempts hold within the threshold of the first quarter's baseline. A is refuted only by a dated User decision.
- **Signal:** none separated. **Ladder:** block.

## 19b. Hooks that enforce compliance (part 19, split)

- **A. Independent of the model (engineering).** Assumption: none about the model; a machine checks what it can detect. Expected: holds.
- **B. Prescribed procedure (capability).** Assumption: the hooks compensate for a model that skips rules, and better models comply unprompted. Expected: fades.
- **Evidence.** Rooms' gates block about once or twice a session under the newest models (R8); the count includes compliance enforcement such as the spawn-tier gate, and a live gate deters what it blocks. Proportion's gates asked the User often in June (validation about two checks in five, publication pushes about one in four) and by half or more less in July, on small July counts, alongside its fall in activity (R9). A commit-approval hook asked many times over thirty days and was approved every time, and was removed (KILLED §1).
- **Test.** Would-have-blocked rates per session, by hook, with each hook in shadow for fourteen days, first now to set the baseline and again at the next generation change (instrument: the governance-hook log, per-hook shadow mode *owed*; hooks guarding safety, approval or confidentiality run on a scratch copy). The rule is per hook. For each hook, B is refuted if its rate holds within the threshold, and A is refuted if its rate falls to near zero. Each hook can then be assigned on its own result.
- **Signal:** blocks and asks (R8, R9), confounded by deterrence. **Ladder:** block and ask by construction.

## 20. Shadow-first development

- **A. Independent of the model (engineering).** Assumption: none about the model; a new control is proven on a copy before it replaces the live one. Expected: holds.
- **B. Judgement practice (capability).** Assumption: judging when a shadow has shown enough takes judgement. Expected: holds.
- **C. Prescribed procedure (capability).** Assumption: the shadow stage compensates for a model that wires controls that break the live layer. Expected: fades.
- **Evidence.** A tool left in shadow mode logged about 450 test runs and delivered nothing, because nothing checked delivery; it was removed (KILLED §2).
- **Test.** Defects found in shadow per new control at the next generation change (instrument *owed*: counted from plan records). C is refuted if shadow stages keep finding defects within the threshold of the first quarter's baseline. A and B both expect it to hold, so no observation separates them. **Untestable now** for A against B.
- **Signal:** none. **Ladder:** written guidance.

## 21. Governance telemetry

- **A. Independent of the model (engineering).** Assumption: none about the model; controls fail silently through plumbing and configuration, whoever wrote them. Expected: holds.
- **B. Prescribed procedure (capability).** Assumption: logging compensates for a model that reports a control as running when it is not. Expected: fades. Evidence for this assumption: the first restart protocol was retired because the assistant graded its own checklist (KILLED §3); the 2025 notes name compliance theatre and premature success claims (R12, *scout reading*).
- **Evidence.** The tool in KILLED §2 failed through a setting never switched on. In this estate the confidentiality sweep went through five rounds in which a hit read as clean through the plumbing of shell, locale and text tools (KNOWLEDGE_ARCHIVE, *A check fails open in its plumbing*). Whether most hooks under-report or log only when they fire is open, so hook silence is a missing reading (R18; census).
- **Test.** **Untestable now at this volume.** Each silent failure found by telemetry or audit is recorded with its date and the generation of the model that wrote the control (instrument *owed*). The unit is revisited once ten are recorded. A cause can be both plumbing and model, so the test counts failures per control built, by authoring generation. B is refuted if that rate holds across a generation change, and A if it falls to near zero.
- **Signal:** days with data per hook (R18). **Ladder:** watch.

## 22. Test harnesses

- **A. Independent of the model (engineering).** Assumption: none about the model; a control is code, and code is tested before it is trusted. Expected: holds.
- **B. Prescribed procedure (capability).** Assumption: suites compensate for a model that writes controls with faults, and better models write them correctly. Expected: fades.
- **Evidence.** In this estate the rebuilt sweep's faults were found by mutants and adversarial review (KNOWLEDGE_ARCHIVE); its suite reached 248 cases (`plan-leak-hardening-2026-10-03.md`, slice 1b record; register). The tier-gate witness failed 7 of 82 cases after a path guard was added to the tools it tests, and the fix moved its fixtures inside the repository (commit `6ea1801`).
- **Test.** Faults found by suite and mutants per new control, at the next generation change of the authoring model (instrument *owed*: counted from plan records; baseline the first quarter). B is refuted if faults found hold within the threshold, or occur in ten percent or more of new controls where the baseline is zero. A is refuted if they fall to near zero while controls of similar size keep being built.
- **Signal:** none in the census. **Ladder:** block (a suite gates trust in a control).

## 23. Confidentiality checks

- **A. Independent of the model (confidentiality).** Assumption: none about the model; confidential material must not leave the project, and a mechanical check holds that line. Expected: holds.
- **B. Prescribed procedure (capability).** Assumption: checks compensate for a model that copies confidential names and material into published text. Expected: fades.
- A judgement option is left to part 30, which covers deciding what is confidential and sizing checks to it.
- **Evidence.** Token sweeps run routinely in rooms (census). In this estate the sweep was first earned on 2026-07-21, when banned literals were published inside the memo documenting their banning, after a manual sweep had run before the final writes. It fired again in October 2026, when other instances began feeding lessons into sessions (register). The second firing came from a new route for material. Neither firing is recorded as the model copying names unprompted.
- **Test.** Would-have-blocked hits per item of incoming material (per import, message or relayed lesson), the sweep run in log-only mode on a scratch copy over fourteen days at the next generation change, with the banned lists fixed for the period (instrument *owed*: the sweep logs nothing today). B is refuted if hits hold within the threshold of the first period's baseline. A is refuted only by a dated User decision. Confounds: the lists change as sources change (tools README, § Imports), and the published history already holds known hits counted in a baseline.
- **Signal:** sweep runs (census). **Ladder:** block.

## 24. Git discipline

- **A. Independent of the model (record).** Assumption: none about the model; commits with honest notes are the project's record and its restore points. Expected: holds. Falsifier: by the 2027-01-03 re-run, history is neither consulted nor used to restore (instrument *owed*: uses of history for audit or restore).
- **B. Judgement practice (capability).** Assumption: choosing checked boundaries and writing honest notes takes judgement. Expected: holds or grows.
- **C. Prescribed procedure (capability).** Assumption: the explicit-file-list rule compensates for a model that commits files it did not mean to. The rule was strengthened after an incident in which a broad pathspec swept another thread's files (registry; CD #10). Expected: fades.
- **Test.** A trial on a scratch copy seeded with another thread's uncommitted files, without the explicit-file-list rule or the guidance on boundaries and notes, at the next generation change. C is refuted if any commit carries the other thread's files. B is refuted if boundaries and notes stay as good without the guidance, by the User's measures. A has the falsifier above.
- **Signal:** none reliable (the census found commit-style counts unreliable). **Ladder:** written guidance.

## 25. Tools added on evidence

- **A. Independent of the model (engineering).** Assumption: none about the model; tools installed ahead of a felt need tend to die as theatre, so tools wait for evidence. Expected: holds.
- **B. Prescribed procedure (capability).** Assumption: the register compensates for a model that builds tooling ahead of need. Expected: fades.
- **Evidence.** In this estate four triggers have fired with nothing built. Nobody has missed the tools (register, 2026-10-06), and misses are not recorded, so this is an absence of evidence. The restart trigger and the sweep were each built after an incident. KILLED_MECHANISMS records eight entries; §1 and §4 were removed after firing without effect, and §2 never delivered.
- **Test.** **Untestable now at this volume.** Each tool built is recorded with whether a trigger had fired and whether it survives a year (instrument: the register and KILLED_MECHANISMS, by hand). The unit is revisited at ten tools. A is refuted if tools built without a trigger survive as often as tools built on one. B is refuted if, in a trial on a scratch copy without the register at the next generation change, the model proposes or builds tools ahead of a felt need. While every tool waits for a trigger, A has no comparison group.
- **Signal:** register entries (git). **Ladder:** written guidance.

## 26. Safety charter

- **A. Independent of the model (engineering).** Assumption: none about the model; additive, reversible changes with a working fallback protect any live system. Expected: holds.
- **B. Judgement practice (capability).** Assumption: judging when a sandbox has shown enough, and what a fallback must cover, takes judgement. Expected: holds or grows.
- **C. Prescribed procedure (capability).** Assumption: the charter compensates for a model that makes destructive or irreversible changes. Expected: fades.
- **Evidence.** None counted.
- **Test.** A trial on a scratch copy without the charter at the next generation change, counting changes that delete or overwrite with no restore point made by the session beforehand (a branch, stash or copy). C is refuted if any occur. A and B both expect it to hold, so no observation separates them. **Untestable now** for A against B.
- **Signal:** none. **Ladder:** written guidance.

## 27. Economic doctrine

- **A. Judgement practice (capability).** Assumption: choosing the cheapest tier that meets the evidence standard per stage takes judgement, and the doctrine keeps shaping it. Expected: holds or grows.
- **B. Prescribed procedure (capability).** Assumption: the doctrine compensates for a model that defaults to the strongest tier, and better models economise unprompted. Expected: fades.
- **C. Independent of the model (authority over spend).** Assumption: none about the model; spend is the User's (CD #4f). Expected: holds.
- **Evidence.** Rooms' upgrade trials found the newer frontier model passing review and the gates at about 55 to 70 percent of the cost, and a mid-tier model handling one stage at about half (R14, *scout reading*). A daily spend limit was designed and left unbuilt when a design that removed runaway spending arrived (KILLED §6).
- **Test.** A trial on staged work at the next generation change, with the doctrine absent and the tier pin (6b) switched to shadow, measuring frontier share by requests on bounded stages and the User's evidence standard. B is refuted if frontier share on bounded stages exceeds ten percent. A is refuted if it stays at or under ten percent with the evidence standard met. C is refuted only by a dated User decision.
- **Signal:** tier mix per stage (telemetry), partly. **Ladder:** written guidance; the tier pin (6b) enforces part of it.

## 28. Founding charter

- **A. Independent of the model (authority).** Assumption: none about the model; the mandate, approach and approval steps are the User's, fixed before work begins. Expected: holds.
- **B. Judgement practice (capability).** Assumption: drafting a charter that fits the undertaking takes judgement, and the charter keeps it visible. Expected: holds or grows.
- **C. Prescribed procedure (capability).** Assumption: the charter compensates for a model that drifts from its mandate. Expected: fades.
- **Evidence.** The registry marks it universal; this estate works under `CHARTER.md`. Nothing is counted.
- **Test.** Unsanctioned changes of scope per undertaking at the next generation change (instrument *owed*: scope pivots recorded in plan records; baseline the first quarter). C is refuted if they hold within the threshold, or, if the baseline is zero, if they occur in ten percent or more of undertakings. A is refuted only by a dated User decision. B cannot be separated from A by any instrument named here.
- **Signal:** none. **Ladder:** written guidance.

## 29. Dual-thread governance

- **A. Independent of the model.** Assumption: none about the model; the host keeps product and governance work in one working copy, so the threads are kept apart. Expected: holds while the arrangement holds. This basis (the host's organisation) is outside the slice 1 list and is raised with the engineering question above.
- **B. Judgement practice (capability).** Assumption: keeping the threads apart takes judgement about which thread a change belongs to. Expected: holds.
- **Evidence.** Host-specific (registry). In rooms, 2 of 43 sessions in the census window were governance maintenance, with playbook reads about fifteen and doctor runs about eighty a session, against about a third and thirteen in product sessions (census).
- **Test.** Both options expect it to hold, so no observation separates them. **Deferral proposed:** one host, two governance sessions in the window.
- **Signal:** session split by governance-path share (census). **Ladder:** written guidance.

## 30. Proportionate confidentiality

- **A. Independent of the model (confidentiality).** Assumption: none about the model; checks are sized to the risk of the material and its route out. Expected: holds.
- **B. Judgement practice (capability).** Assumption: sizing checks to risk takes judgement the model supplies. Expected: holds or grows.
- **C. Prescribed procedure (capability).** Assumption: the fixed schedule of light, periodic and pre-release checks compensates for a model that would not check at the right moments. Expected: fades.
- **Evidence.** Host-specific (registry). This estate's import procedure sizes its checks by source and route (CD #4e; tools README, § Imports).
- **Test.** A and B both expect it to hold, so no observation separates them. C would be refuted if, in a trial on a scratch copy without the schedule, checks were skipped at a pre-release point. **Untestable now** for A against B; A is refuted only by a dated User decision.
- **Signal:** none. **Ladder:** written guidance, with the sweep (23) as its mechanical floor.

## 31. Language standard

- **A. Independent of the model (language standard).** Assumption: none about the model; the language variety and writing rules are the author's. Expected: holds.
- **B. Prescribed procedure (capability).** Assumption: the written rules compensate for a model whose default style breaks them, and better models write that way unprompted. Expected: fades.
- The variety and the writing rules are both the author's, so the part is kept whole. A judgement option is left out: the rules fix the forms.
- **Evidence.** Reviews in this estate keep finding breaches in new text: three contrast frames in one slice of the leak-hardening plan (`plan-leak-hardening-2026-10-03.md`, slice 1c), and borderline constructions in reviews of this sort's slice 2.
- **Test.** Writing-rule breaches per reviewed document at the next generation change (instrument *owed*: counted from review records; baseline the first quarter). B is refuted if breaches hold within the threshold, or occur in ten percent or more of documents where the baseline is zero. A is refuted only by a dated User decision.
- **Signal:** none in the census. **Ladder:** written guidance, carried by review (7).

## 32. Evidence constitution

- **A. Independent of the model (authority and record).** Assumption: none about the model; published claims trace to records, and the human decides what the framework claims. Expected: holds.
- **B. Judgement practice (capability).** Assumption: judging what a record supports takes judgement. Expected: holds or grows.
- **C. Prescribed procedure (capability).** Assumption: the rule compensates for a model that overstates or invents support for claims. Expected: fades.
- **Evidence.** In this estate, reviews caught overstatements before banking. The census plan's review re-scoped the census (`plan-exercise-census-2026-10-03.md`). The longitudinal finding was banked at r2 after an independent review (its provenance line; commit `1793382`). The leak-hardening slice 1c review found two overstatements (`plan-leak-hardening-2026-10-03.md`).
- **Test.** Unsupported claims found by review per memo before banking, at the next generation change (instrument *owed*; baseline the first quarter). C is refuted if they hold within the threshold, or occur in ten percent or more of memos where the baseline is zero. A is refuted only by a dated User decision. B cannot be separated from A by any instrument named here.
- **Signal:** none in the census. **Ladder:** written guidance, carried by review (7).

---

## Across the half

- **Untestable now, or with options no observation separates:** 17, 18, 20 (A against B), 21 and 25 (until ten incidents), 26 (A against B), 28 (B against A), 29, 30 (A against B), 32 (B against A). The User can assign these by the reason he accepts, or defer them.
- **Tests needing no new counter:** the trials for 24, 26, 27 and 30. Every other test needs an instrument first.
- **Instruments owed:** 17, 19a, 19b (shadow per hook), 20, 21, 22, 23, 24 (uses of history), 25 (proposals), 28, 31, 32. Eight owed instruments, across both halves, are counts from review and plan records (7, 8, 20, 22, 25, 28, 31, 32). The same records feed several of them, so those readings move together.
- **Splits:** 19 (authority hooks, compliance hooks). 17 is kept to the ledger form; 31 is kept whole.
- **Deferral proposed:** 29.

## Review record

**r2 (2026-10-06, smart tier): NEEDS-CHANGES; every finding accepted.** 24's B falsifier fixed by removing the guidance on boundaries and notes in the trial, and its C made observable by seeding another thread's files. 26 names the outcome that counts. 19a's shadow confined to a scratch copy. 19b given a shadow baseline and a per-hook rule. 25's B measured with the register absent, and A's missing comparison group stated. A zero-baseline rule added and applied in 22, 28, 31 and 32. 23 normalised per item of incoming material. Proportion's unbanked gate figures replaced by the banked shapes; slice 2a's exact per-session rates were likewise brought to the banked shapes before publication, with the exact readings kept in the private receipts index as baselines. Summary lists corrected (tests needing no counter; eight record-based instruments; shared records; the engineering list). Writing: the seesaws in 17 and 23 and the mirrored phrase in 19b restated, and the setup sentence in 17 removed.

**r1 (2026-10-06, smart tier): NEEDS-CHANGES; every finding accepted.**

- **27:** the authority-over-spend option added, the pin put into shadow for its trial, and an absolute ten percent threshold set.
- **19 and 23:** tests moved to would-have-blocked counts in shadow, with the deterrence confound and the changing lists named. 19 split into 19a and 19b, and 23's evidence corrected (first firing July; the October firing came from a new route).
- **Baselines** defined where the census has none, and trials that remove safety, approval or confidentiality controls confined to a scratch copy.
- **21 and 25** marked untestable at this volume, with a count to revisit at ten incidents. 21 counts failures per control by authoring generation, which avoids a cause split.
- **17** marked untestable now, because counting verdicts measures compliance.
- **Raw counts** from the private receipts converted to banked shapes and rates. The same slip in slice 2a (unit 12) was corrected before publication.
- **Citations corrected:** the 248 cases (leak-hardening plan); the evidence for 32 (the census plan, commit 1793382, the leak-hardening plan); KILLED §2 (never delivered); the tier-gate fix (fixtures moved); hook telemetry (a missing reading). The unsourced sentence about the switch-over is removed.
- **Neutrality:** judgement options added to 24, 26, 28 and 32, and a prescribed option to 30. The evidence for B in 21 is added (KILLED §3, R12), the reasons for leaving options out are stated, and 26 and 28 are given evidence lines.
- **Units whose options cannot be separated** say so (18, 20, 26, 28, 29, 30, 32). The proposal to build a shared instrument is moved out of this neutral record.
- **The engineering stretch of "independent"** is raised as a question for the User, and 29's out-of-definition basis is flagged.
- **Shared records** across 7, 22, 31 and 32 are noted.
- **Writing:** the mirrored pair in 22, the embedded antithesis in 18 and the implied contrast in 20 are restated.
