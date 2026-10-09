---
description: governs improving a working system (its cost, speed or mechanism) while keeping the quality it already delivers; the phases, the disciplines that keep the work honest, the learning loops it runs on, and a checklist of the traps this kind of work falls into
type: governing
date: 2026-10-10
governs: [optimisation-undertaking, evidence-first-experimentation]
last_verified: 2026-10-10
status: template
---

# Governed Optimisation Playbook

*Governed optimisation: improving something that already works, and proving it still works.*

> **Where this comes from:** a live project's playbook for improvement campaigns, written in 2026 from its own cost-reduction work and used in its later campaigns. Imported 2026-10-10; de-identified; cleared by the User, 2026-10-10. Changes on import: written afresh in this repository's words; the learning loops, which the source keeps in other documents, are stated here; independent review, the User's approval and routing point to the core directives (CD #14, CD #2, CD #12); the change standards and the planning playbook are named as the canon's homes for small changes and for plans; the four records may be kept as one plan file, as the source's recent campaigns do.

**What this is.** A procedure for improving a working system, for example cutting its cost or its running time or replacing a mechanism inside it, while keeping the quality it already delivers. Work of this kind goes wrong in familiar ways. An old figure gets reused without anyone checking it. A green run on test data gets read as proof. Whoever made the change marks their own homework. The explanation for a result keeps changing sides. Each trap has a named guard below.

**How the guards hold.** Most of the guards depend on people applying them well. They hold through three mechanisms, from least to most reliable: independent review (CD #14), the User's approval at each gate (CD #2), and a deterministic machine check wherever one genuinely exists, such as a comparison against known-good output, a change applied all or nothing, a checksum, or a restore point.

**When to use it.** When all of these hold: the system works and its quality must be kept and shown to be kept; there is earlier work to learn from; cost or risk makes the rigour worth paying for; and the answer is not yet known. Build a small, well-specified change in small steps under the change standards (`CHANGE_STANDARDS.md`).

## 1. The records

The undertaking keeps four records. A small undertaking may keep them as sections of one plan file (`PLANNING_PLAYBOOK.md`):

1. **A charter:** purpose, premise, targets and what counts as done, scope, disciplines, boundaries, the quality standard, governance, and the gates.
2. **A plan:** the phases in order, each with its gate.
3. **An inventory:** what already exists, sorted into categories; it is the worklist for the re-checking in Phase 0.
4. **A backlog,** plus a results trail that is only ever added to.

The User approves each phase's gate before the next phase starts, and the charter has the final word on the undertaking. The detailed plan for later phases is written once the early phases have produced the evidence for it.

## 2. The phases

**Phase 0: harvest what is already known.**
- **Re-check every earlier conclusion against its original evidence.** Mark each one confirmed, corrected (with the corrected value), discarded (no evidence survives), or open.
- **Fix the baseline** from measured telemetry.
- **Recover the method of any earlier success,** its learning loops, and separate what can be reused from what this undertaking must correct.

Output: the re-checked facts, the baseline, a list of paths already tried that are not to be walked again, and the recovered methods. Gate: the User's sign-off.

**Phase 1: map the options.** List every feasible option from the ground up and neutrally. Give each:
- a hypothesis;
- the outcome that would disprove it;
- the cheapest test;
- a priority;
- a pointer to any re-checked evidence.

Choosing waits for the tests. The phase produces the backlog, and its gate is a map that is complete and even-handed.

**Phase 2: test.**
- **How:** take options by priority, the riskiest assumption first, one at a time, each within a time limit. Test each away from the live system against the quality standard, review it independently, and measure it from telemetry.
- **Output:** each tested result, banked in the trail (see §6).
- **Gate, for each option:** it counts only once it has been tested against the standard and reviewed.

**Phase 3: assemble and prove on real cases.**
- **How:** combine the options that passed. Show that the standard holds on real cases, the hard ones included, beyond the test fixtures. Measure the combined result against the baseline.
- **Gate:** the target is met, the standard holds on real cases, and the old mechanism remains available as an instant fallback.

## 3. The disciplines

- **Evidence over recollection.** An earlier conclusion counts in planning only once it has been re-checked against its original evidence. Summaries and remembered figures do not count as evidence.
- **Independent adversarial review before banking (CD #14).** No conclusion that others will rely on is banked on its author's own check. The reviewer attacks the result. When it finds a miss that a machine check could catch, add that check to the gate, so the gate improves over time.
- **Presume a mechanism broken until it has passed a self-test.** Measure cost and performance from telemetry; a figure worked out by arithmetic is an estimate, and an estimate is a hypothesis to measure. Check that two factors are not simply moving together before claiming one causes the other.
- **Options stay neutral until tested.** The detail of the solution is earned by the tests.
- **One view, revised openly.** Hold a single proportionate view with its uncertainty stated. A recorded verdict changes when new evidence requires it, and the change is recorded with its reason.
- **Protect what creates the quality.** Look for savings first in the mechanical stages. A stage that produces the quality is made cheaper only in ways that keep its judgement intact.
- **Define the standard first.** The current system's accepted output is the reference. Deterministic output must match it exactly; written or judged output must reach equivalent quality. Saving money at the cost of quality is a failed test. This is the one discipline with a genuine machine check: a comparison against the reference covers the deterministic part. A judge covers the judged part.
- **A cost test alongside every correctness test.** Each test carries a result that would show it wrong on cost as well as on correctness. The cheapest option that meets the standard, with the User's acceptance, is the one that ships. This is the lesson of optimising for effectiveness alone.
- **Run in parallel before replacing.** A new mechanism runs alongside the old one, on copies, and must beat it on real cases before the old one is retired. The old one stays as the fallback.
- **Keep what worked as a reusable asset.** A validated mechanism is recorded with its settings and a log of its runs, so the capability builds up and is reused.
- **Route the work (CD #12).** Broad, repetitive work that ends in a conclusion goes to cheaper agents. Judgement stays with one strong main thread. Work running unattended is checked when it finishes.
- **Keep to the boundaries.** Confidential content stays in its permitted home, and only descriptions of it travel. Copy before moving anything, and keep a restore point so every step can be undone.

## 4. The learning loops

The method runs on five loops:

1. **Gated discovery.** Discovery moves through two gates the User approves. The first fixes the model of the problem. The second fixes the decisions and the shape of the solution. A spike may run between the two when a question blocks the second gate. Building starts after the second gate.
2. **Spike discipline.** A spike tests a decision and builds nothing that ships. It starts only when a question blocks a decision and the User has approved its scope. Before it runs, write down a countable result that would show the idea wrong. At its end, each finding gets its own verdict: keep, revise, add, drop or open. Each verdict cites its evidence and states its confidence, and open items stay flagged.
3. **A build-and-check harness.** Three roles run in order, then the User's gate:
   - **a builder** assembles the material the work starts from;
   - **an analyst** works blind: it is not told it is being tested and has no answer key, and it only proposes, writing nothing into the project's records;
   - **a verifier** checks adversarially, trusting none of the analyst's citations and finding every claimed source again itself.

   Whoever runs the harness never grades their own output. The worst failure is a single false tick, a claim marked verified that is wrong. Each run is logged in a register.
4. **A ladder of throwaway experiments.** Each rung is a small, staged experiment on one service or mechanism, with a countable result that would show it wrong written down first. Tackle the riskiest unknown first. Throw each experiment away, and record what it taught as a constraint on what follows.
5. **Parallel running before replacement.** A new mechanism runs alongside the old one, on copies, and must beat it on real cases. The old one is retired only then, and it stays available as the fallback.

## 5. Traps and their guards

These guards are checked at the User's gates and by review. A few have a deterministic machine check, and where one exists it is the stronger guard.

| Trap | Guard |
|---|---|
| An old number reused unchecked | Phase 0 traces it to its evidence before any plan depends on it |
| Trusting a single run, or test data | Proof comes from a range of real cases meeting the standard |
| Marking your own homework, or stacking the result | Independent review first, and no result banked on its author's own check (CD #14) |
| An explanation that keeps changing sides | A single stated view, revised on new evidence, with the revision recorded |
| Taking a mechanism on trust | A first-hand check of the mechanism before any reliance |
| Hovering over unattended runs | Check an unattended run once, when it finishes |
| Building ahead of the evidence | One option at a time, the cheapest test first, and each build after its gate |
| Deciding the answer before the tests | Options stay even-handed until tested |

## 6. Verdicts

- **Re-checking an earlier conclusion:** confirmed, corrected (with the value), discarded, or open.
- **Each finding of a spike:** keep, revise, add, drop or open, with its evidence and confidence.
- **Banked:** a conclusion is banked, meaning recorded as one the work may rely on, only once it has passed independent review and the User has signed it off.
