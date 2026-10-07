# MEMENTO

**Memento keeps project notes, evidence and working rules in your repository. They help an AI assistant continue work consistently across months and hundreds of sessions.**

It has two parts: the *memory prosthesis*, saved notes and evidence the assistant reads to pick up where earlier sessions left off, and the *operational protocols*, rules for how the assistant works during each session.

AI agents can now work on their own for hours. Building a real product takes months and hundreds of separate sessions, and work at that length brings a different set of problems:

- Which account of the project's current state can we rely on?
- Which earlier decisions still stand, and why did the architecture change?
- What has already been tried and rejected?
- What did you actually check and accept, and what only *looks* finished?
- What happens when a confident assistant inherits only part of that history?

Each session can feel productive while the project drifts: earlier decisions are forgotten, parts stop fitting together, and solved problems return. Memento gives the assistant two kinds of support:

- **The memory prosthesis** records the current project state, the reasons behind decisions and the supporting evidence, so the assistant can use them when a session starts or its conversation context is lost. It is organised in four tiers, from short notes on the current task to an archive of dated records.
- **The operational protocols** set out how the assistant works. You decide the scope and the quality, and work counts as finished when you confirm it. Claims come with evidence. Work that is large, likely to span sessions, has a complicated sequence of steps or has consequential effects starts with a saved plan, which you approve before implementation. Changes happen in small steps, each checked before the next. Investigating a problem stays separate from changing the code. Some actions need your approval first.

Records of earlier decisions, results and mistakes help the assistant continue the project. Memento also sets rules for how the assistant works, because a well-kept record of careless work still leaves the project damaged. The goal: **each session adds something useful while preserving what the previous hundred sessions established.**

Memento's own terms, such as *memory prosthesis* and *working context*, are explained in [Words used here](framework/README.md#words-used-here).

## Developed in real projects

Memento took shape in June 2025 inside the repository of a working product (a roadmapping tool for team capacity). By August it was in use in three production projects, including a knowledge assistant for a client programme, which became its most mature early use. The first published version was drawn from those three projects that same month.

That published version then stayed almost unchanged for roughly nine months while the projects kept developing. The original repository, which still uses Memento today, and two further projects started in 2026 (a shared memory system for a team's business workstreams, and a tool for mapping an organisation) developed the approach the history calls **falsifiable governance**. It requires a failure criterion and a review date for each control, evidence of whether the control runs and works as intended, and a recorded reason when a control is removed.

This repository holds the mid-2026 version, rebuilt from an audit that traced Memento's 32 parts through the three projects still using it ([how the audit worked](story/THE_STORY.md#the-rewrite-you-are-reading)). The 2025 version is preserved unchanged in [`archive/canon-2025/`](archive/canon-2025/): Memento keeps its own history the way it asks a project to keep one.

One limit, stated plainly: the historical account draws on records in the projects' private repositories, which readers cannot inspect here. [The story](story/THE_STORY.md) and the [organ registry](story/ORGAN_REGISTRY.md) set out the audit's method, its conclusions and the claims it corrected.

## The repository

| Where | What |
|---|---|
| [`story/`](story/) | **History and lessons:** how Memento developed in six stages, a catalogue of its 32 parts and where each came from, and the controls that were tried and removed |
| [`framework/`](framework/) | **Use it in a project:** templates for the rules, the playbooks, the four tiers of project notes, and the conventions and standards that connect them |
| [`adoption/`](adoption/) | **How to start:** begin with a few practices and add structure as the project needs it |
| [`archive/canon-2025/`](archive/canon-2025/) | **The original 2025 version,** preserved unchanged |
| `memento/` | **Memento's own project notes:** the rules and records used to maintain this repository, including this rewrite |

## The shape of the framework

- **The memory prosthesis.** Four tiers of saved notes, from short working-context files for the current task to an evidence archive of dated records whose bodies are kept as written. The assistant does not reliably carry memory from one session to the next, and its performance can vary between tasks; together, the notes and the working rules help it continue the project consistently.
- **Core directives.** A short set of rules that always apply, including your authority to decide what counts as done.
- **Playbooks and standards.** Playbooks are procedures for particular kinds of work, such as planning, used when the work calls for them. Standards for commits, documentation and changes sit with the conventions. Assistants that support skills can bring a procedure in that way.
- **Approval and evidence.** Actions that publish or deploy the project need your approval; claims come with evidence; work handed to another agent is checked before anyone relies on it.
- **Falsifiable governance.** The rule of the current stage: before relying on a control, record the result that would show it is failing its purpose and when it will be checked; retire the control when that result occurs, and record the lesson. See [`story/KILLED_MECHANISMS.md`](story/KILLED_MECHANISMS.md).

Start with [`adoption/GETTING_STARTED.md`](adoption/GETTING_STARTED.md). You do not need all of this on day one; Memento itself grew into it. The [graduation ladder](adoption/GRADUATION_LADDER.md) sets out the steps.

---

*The working picture since the beginning: collaborating with a gifted colleague who cannot form new long-term memories and whose performance varies from day to day (sometimes a savant, sometimes a journeyman, sometimes a narrowly focused apprentice). Memento is the system of notes, rules and approval steps that lets that collaboration build on itself over time. The name comes from the film* Memento, *whose hero cannot form new memories and works from the notes he leaves himself.*

**Licence:** MIT.
