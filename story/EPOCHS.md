# The Six Epochs

Memento's history is a sequence of beliefs about how to keep long-running AI-assisted work coherent: each held sincerely, each abandoned on evidence. The epochs are numbered 0–5. (The 2025 canon published epochs 1–5; the current numbering shifts those to 0–4 and adds the sixth. The [archived canon](../archive/canon-2025/) carries a cross-reference note.)

Epochs 0–3 are retold here from the 2025 canon's account (they pre-date the framework's evidence discipline, so their receipts are experiential rather than archival). Epochs 4 and 5 are receipted: their artefacts are in this repository and in the lineage's evidence archives.

## Epoch 0: The Undefined Problem

Long-running AI-assisted work decays and nobody names the cause. Sessions feel productive; the product drifts. Decisions resurface as questions; solved problems get re-solved differently; the agent confidently rebuilds what it cannot remember rejecting. The failure is real before it has a name.

## Epoch 1: Documentation-as-Memory

The first belief: *write everything down and the problem is solved.* The result is a library rather than a memory: retrieval fails precisely when it matters, because volume grows faster than navigability and nothing distinguishes current truth from superseded truth. The lesson that survives: externalised memory is necessary, and undifferentiated documentation does not provide it.

## Epoch 2: Quantified Compliance

The second belief: *measure adherence and quality will follow.* Checklists, scores, compliance metrics. What it produced was measurement theatre: the numbers improved while the underlying behaviour did not, because the metrics measured performance of process rather than preservation of coherence. The lesson that survives: a measure of governance is not governance. It would later mature into a sharper rule: *measure-validity is not mechanism-effectiveness.*

## Epoch 3: Programmatic Enforcement

The third belief: *make the rules mechanical and the assistant cannot break them.* This era failed twice over. The tooling barely existed (there was no real enforcement surface to attach rules to), and what could be built amounted to fighting the assistant rather than collaborating with it. The lesson that survives: enforcement imposed without evidence of fit becomes friction, and friction gets routed around.

## Epoch 4: The Memento Framework

The turn: accept the collaborator's nature instead of fighting it. The collaborator is amnesiac between sessions and variable within them: savant one day, journeyman the next, narrowly focused apprentice the day after. That nature needs two things, and the framework was built two-armed from its first commit: a **memory prosthesis** (tiered external memory, for the amnesia) and **operational protocols**, which answer the variability: always-active directives, situational playbooks, human sovereignty over "done", evidence before claims. The framework crystallised in June 2025 inside a working product repository, ran three production implementations by that August, and was abstracted into the public canon preserved in [`archive/canon-2025/`](../archive/canon-2025/): this epoch's artefact, kept verbatim.

What Epoch 4 could not yet do was *enforce* anything except by prose and discipline. It worked: thirteen days under the framework took a demonstration system from nothing to a walking skeleton. (The 2025 canon called that "a complete organisational intelligence system built in 13 days"; the correction here is the author's own honest retrospective, and re-grounding even the framework's published claims about itself is precisely the discipline this repository exists to teach.) But every rule lived in text the agent had to choose to honour.

## Epoch 5: Falsifiable Governance *(current, declared in its early days)*

In 2026 the tooling finally arrived: harness hooks, gates, telemetry. A real enforcement surface. The obvious risk was a return to Epoch 3 with better weapons. What makes this epoch genuinely new is the rule the lineage adopted instead:

> **Every mechanism carries a pre-registered way to prove it worthless, and killed mechanisms are documented rather than buried.**

In the field this produced a validation ledger where governance mechanisms face falsifiers on a clock; telemetry that witnesses whether mechanisms actually fire ("silence is not health": one mechanism was discovered to have been dead its entire life, and the discovery is documented); an enforcement-tier ladder where teeth are earned by incident rather than installed up front; and a growing roll of mechanisms honestly retired. See `KILLED_MECHANISMS.md`.

The honest status: **early days.** The enforcement surface still mostly resists high-level behavioural control; several disciplines remain prose because every attempt to mechanise them has failed its own test. What Epoch 5 claims is the honest mapping of that surface, with receipts, and no more. That distinction (falsifiable-or-dead versus enforce-and-hope) is the entire difference between this epoch and Epoch 3.

---

*The full receipted narrative of how the framework moved through these epochs, including the months the canon stood still while the field moved, is [`THE_STORY.md`](THE_STORY.md).*
