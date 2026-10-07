<link rel="stylesheet" type="text/css" href="style.css">

<img src="assets/memento-logo.png" alt="MEMENTO logo" class="logo">

# MEMENTO

**Memento keeps project notes, evidence and working rules in your repository. They help an AI assistant continue work consistently across months and hundreds of sessions.**

It has two parts: the *memory prosthesis*, saved notes and evidence the assistant reads to pick up where earlier sessions left off, and the *operational protocols*, rules for how the assistant works during each session.

AI agents can now work on their own for hours. Building a real product takes months and hundreds of separate sessions, and work at that length brings a different set of problems:

- Which account of the project's current state can we rely on?
- Which earlier decisions still stand, and why did the architecture change?
- What has already been tried and rejected?
- What did you actually check and accept, and what only *looks* finished?
- What happens when a confident assistant inherits only part of that history?

Each session can feel productive while the project drifts: earlier decisions are forgotten, parts stop fitting together, and solved problems return. Memento gives the assistant two kinds of support: the **memory prosthesis** records the current project state, the reasons behind decisions and the supporting evidence, so the assistant can use them when a session starts or its conversation context is lost; the **operational protocols** set out how each session works, including your authority to decide what counts as done. The goal: each session adds something useful while preserving what the previous hundred sessions established.

Memento's own terms are explained in [Words used here](https://github.com/jblanch888/MEMENTO/blob/main/framework/README.md#words-used-here).

## Developed in real projects

Memento took shape in June 2025 inside the repository of a working product, and by August it was in use in three production projects. The first published version was drawn from those three that same month. That version then stayed almost unchanged for roughly nine months while the projects kept developing. The original repository, which still uses Memento today, and two further projects started in 2026 developed the approach the history calls **falsifiable governance**. It requires a failure criterion and a review date for each control, evidence of whether the control runs and works as intended, and a recorded reason when a control is removed.

This repository holds the mid-2026 version, rebuilt from an audit that traced Memento's 32 parts through the three projects still using it. The 2025 version is preserved unchanged: Memento keeps its own history the way it asks a project to keep one.

## The honest status

Automatic enforcement is still developing in these projects. Several rules remain written guidance because attempts to automate them failed their tests. Memento records which controls have demonstrated results, which attempts failed and which questions remain open; the list of [killed mechanisms](https://github.com/jblanch888/MEMENTO/blob/main/story/KILLED_MECHANISMS.md) shows those claims being tested.

The historical account draws on records in the projects' private repositories, which readers cannot inspect here. [The story](https://github.com/jblanch888/MEMENTO/blob/main/story/THE_STORY.md) and the [organ registry](https://github.com/jblanch888/MEMENTO/blob/main/story/ORGAN_REGISTRY.md) set out the audit's method, its conclusions and the claims it corrected.

## Start here

| | |
|---|---|
| [Getting started](https://github.com/jblanch888/MEMENTO/blob/main/adoption/GETTING_STARTED.md) | Start with a few core practices; add files, procedures and tools as the project needs them |
| [The graduation ladder](https://github.com/jblanch888/MEMENTO/blob/main/adoption/GRADUATION_LADDER.md) | The three steps of adoption (the core practices, a full set of Memento files, automated checks), with dated examples from real projects |
| [The story](https://github.com/jblanch888/MEMENTO/blob/main/story/THE_STORY.md) | How Memento developed, in [six stages](https://github.com/jblanch888/MEMENTO/blob/main/story/EPOCHS.md) |
| [The organ registry](https://github.com/jblanch888/MEMENTO/blob/main/story/ORGAN_REGISTRY.md) | Memento's 32 parts, each traced through the projects where it developed |
| [Killed mechanisms](https://github.com/jblanch888/MEMENTO/blob/main/story/KILLED_MECHANISMS.md) | Controls that were removed, and the lesson from each |
| [The enforcement surface](https://github.com/jblanch888/MEMENTO/blob/main/adoption/THE_ENFORCEMENT_SURFACE.md) | What automated enforcement has shown it can do, as of mid-2026 |
| [The framework](https://github.com/jblanch888/MEMENTO/tree/main/framework) | The templates you install: rules, playbooks, the four tiers of project notes, conventions and standards |
| [The 2025 version](https://github.com/jblanch888/MEMENTO/tree/main/archive/canon-2025) | The original framework, preserved unchanged |

---

*The working picture since the beginning: collaborating with a gifted colleague who cannot form new long-term memories and whose performance varies from day to day (sometimes a savant, sometimes a journeyman, sometimes a narrowly focused apprentice). Memento is the system of notes, rules and approval steps that lets that collaboration build on itself over time. The name comes from the film* Memento, *whose hero cannot form new memories and works from the notes he leaves himself.*

[Repository](https://github.com/jblanch888/MEMENTO) · [Contributing](https://github.com/jblanch888/MEMENTO/blob/main/CONTRIBUTING.md) · Licence: MIT
