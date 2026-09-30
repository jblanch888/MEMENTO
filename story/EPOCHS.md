# The Six Epochs

Memento's history records successive beliefs about keeping long-running AI-assisted work consistent, each held sincerely, and the evidence that led the author to revise them. The six stages, or epochs, are numbered 0 to 5. (The 2025 version numbered them 1 to 5; the current numbering moves those to 0 to 4 and adds a sixth. The [2025 version](../archive/canon-2025/) carries a note matching the two.)

Epochs 0 to 3 are retold from the 2025 version's account. They come from before Memento kept records of its evidence, so they rest on the author's experience. Epochs 4 and 5 are backed by records: their files are in this repository and in the projects' own archives.

## Epoch 0: The Undefined Problem

Long-running AI-assisted work loses its way and nobody can say why. Sessions feel productive while the product drifts. Decisions come back as open questions; solved problems get solved again, differently; the assistant confidently rebuilds things it cannot remember having rejected. The failure is real before it has a name.

## Epoch 1: Documentation-as-Memory

The first belief: *write everything down and the problem is solved.* The result is a library that fails as a memory: finding things fails exactly when it matters, because the volume grows faster than anyone can navigate it, and nothing marks which facts are current and which are out of date. The lesson that survives: an assistant needs memory kept outside itself, and an undifferentiated pile of documents does not supply it.

## Epoch 2: Quantified Compliance

The second belief: *measure how closely the rules are followed, and quality will follow.* Checklists, scores and compliance figures. The numbers improved with no change in the underlying behaviour, because the measures rewarded following the process and failed to establish whether the project stayed consistent. The lesson that survives: a measure of governance is no substitute for governance. It later sharpened into a rule: *check both whether a measure captures what it claims to capture and whether the control achieves its purpose.*

## Epoch 3: Programmatic Enforcement

The third belief: *make the rules mechanical and the assistant cannot break them.* This stage failed in two ways. The tools barely existed (there was almost nothing to attach automatic rules to), and what could be built amounted to fighting the assistant. The lesson that survives: enforcement imposed without evidence that it fits becomes friction, and friction gets routed around.

## Epoch 4: The Memento Framework

The turn: accept the assistant's nature and work with it. The assistant does not reliably carry memory from one session to the next, and its performance varies within them: savant one day, journeyman the next, narrowly focused apprentice the day after. That nature needs two things, and the framework had both parts from its first commit: a **memory prosthesis** (project notes kept in tiers, for the forgetting) and **operational protocols**, for the variation: rules that always apply, playbooks for particular tasks, the human deciding what counts as done, and evidence before claims. The framework took shape in June 2025 inside a working product's repository, was in use in three production projects by that August, and was drawn from them into the first published version, preserved unchanged in [`archive/canon-2025/`](../archive/canon-2025/) as this stage's record.

What Epoch 4 could not yet do was *enforce* anything beyond written rules and habit. It worked: thirteen days under the framework took a demonstration system from nothing to a walking skeleton (a basic system working end to end, with most of the work still to do). The 2025 version called that "a complete organisational intelligence system built in 13 days"; the correction is the author's own honest review, and checking even the framework's published claims about itself is the discipline this repository exists to teach. Every rule, though, lived in text the assistant had to choose to follow.

## Epoch 5: Falsifiable Governance *(current, and still early)*

In 2026 the tools finally arrived: hooks in the harness, approval steps, logs of what runs. For the first time there was something real to enforce rules with. The obvious risk was a return to Epoch 3 with better tools. What makes this stage new is the rule the projects adopted:

> **Before relying on a control, write down the result that would show it is failing its purpose, and when you will check. When that result appears, retire the control and record what it taught.**

In the projects this produced a validation ledger (a record of each control's planned test, review date, evidence and verdict); logs that record whether each control actually runs ("silence is not health": one control was found to have done nothing its entire life, and the finding is recorded); a ladder of enforcement levels (block, ask, advise, watch, written guidance) on which a control moves up only when incidents show the need; and a growing list of controls honestly retired. See [`KILLED_MECHANISMS.md`](KILLED_MECHANISMS.md).

The honest status: **early days.** The available tools still struggle to enforce rules that require broad judgement, and several rules remain written guidance because every attempt to automate them failed its own test. Epoch 5 claims an honest map, backed by evidence, of which controls work, which failed and which questions remain open. Testing each control, and retiring the ones that fail, is what separates this stage from Epoch 3.

---

*The full account of how the framework moved through these stages, including the months when the published version went unchanged, is in [`THE_STORY.md`](THE_STORY.md).*
