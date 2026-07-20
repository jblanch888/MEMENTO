# MEMENTO

**A meta-framework for long-running AI-assisted development. It lives inside the repository of the product it governs, and it has always had two arms: a memory prosthesis, which carries truth between sessions, and operational protocols, which govern conduct within them.**

An AI agent working autonomously for eight hours is impressive. Nobody has watched one develop a product for eight months. Once real work stretches across months and hundreds of separate agent sessions, a different set of problems takes over:

- Which source represents the current truth?
- Which earlier decisions still stand, and why did the architecture change?
- What has already been tried and rejected?
- What did the user actually validate, and what merely *looks* finished?
- What happens when a confident agent inherits only part of that history?

Individual sessions can each feel like progress while the product quietly loses coherence between them. Memento is the system around the agents, and its two arms divide the work:

- **The memory prosthesis** carries current state and accumulated evidence between sessions, preserves the reasons behind decisions, and recovers safely after context loss: tiered externalised memory for a collaborator that cannot form its own.
- **The protocols** govern how each session behaves while it runs: the human's sovereignty over what counts as done, evidence before claims, structured planning before consequential work, incremental execution with validation gates, investigation separated from implementation, and hard limits on what an agent may change without approval.

Continuity is the headline problem, but conduct is half the answer: a perfectly remembered session that behaved badly is preserved damage. The goal is not autonomy for its own sake. The goal is that **each bounded session adds something useful without damaging what the previous hundred sessions established.**

## Born in the field, receipted

Memento was not designed on a whiteboard. It crystallised in June 2025 inside the repository of a working product (a team-capacity roadmapping tool) and by that August was running in three production implementations, including a client-programme knowledge assistant that became its most mature early deployment. The public canon was abstracted from those three that same month. Then the field kept moving while the canon stood still: the original repository (still running the framework today) and two further estates founded in 2026 (a multi-person workstream memory system and an organisational cartography instrument) carried the framework into a genuinely new era: **falsifiable governance**. Enforcement mechanisms that carry pre-registered kill conditions, telemetry that witnesses whether they actually fire, and a documented roll of the mechanisms that died.

This repository is the mid-2026 form of the framework, rebuilt from a receipted audit of that whole lineage. The August 2025 canon is preserved verbatim in [`archive/canon-2025/`](archive/canon-2025/): the framework's own continuity discipline, applied to itself.

One boundary stated plainly: the receipts trace to the deployments' private histories. The claims are genuinely receipted for the author, and an outside reader cannot independently reproduce them; what is published in full is the audit's method, its verdicts, and what it corrected.

## The repository

| Where | What |
|---|---|
| [`story/`](story/) | The receipted narrative: the six epochs, the organ registry (32 traced mechanisms), and the killed-mechanism roll |
| [`framework/`](framework/) | What an adopter installs: the directive template, playbooks, memory-prosthesis templates, conventions |
| [`adoption/`](adoption/) | How to start, including the graduation ladder: begin with the spirit, earn the apparatus |
| [`archive/canon-2025/`](archive/canon-2025/) | The Epoch 4 exhibit: the 2025 framework, preserved verbatim |
| `memento/` | The live governance estate that produced this rewrite: the framework governing work on itself |

## The shape of the framework

- **A memory prosthesis.** Four tiers of externalised memory, from a working context measured in lines to an immutable evidence archive of dated, receipted memos. The agent is treated as what it is: amnesiac between sessions, and never the same collaborator twice within them (sometimes a savant, sometimes a journeyman, sometimes a narrowly focused apprentice). The prosthesis handles the amnesia; the protocols handle the variability.
- **Core directives.** A minimal set of always-active rules; the human's sovereignty over "done" is the first of them.
- **Playbooks.** Situational procedure, selected per task through the working context.
- **Gates and receipts.** Irreversible operations belong to the human; claims trace to evidence; delegated work is a claim until verified.
- **Falsifiable governance.** The new epoch's rule: a mechanism that cannot show receipts of working is retired, and its death is documented. See `story/KILLED_MECHANISMS.md`.

Start with `adoption/GETTING_STARTED.md`. You do not adopt all of this on day one; the framework itself didn't. That's the graduation ladder (`adoption/GRADUATION_LADDER.md`).

---

*The working metaphor since the beginning: collaborating with a gifted colleague who cannot form new long-term memories, and who is not the same colleague every day (savant one day, journeyman the next, narrowly focused apprentice the day after). The framework is the system of notes, protocols and gates that makes that collaboration compound instead of decay. It is named accordingly.*

**Licence:** MIT.
