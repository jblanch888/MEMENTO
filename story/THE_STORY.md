# The Story

This is the history of the framework, with the evidence behind it: where it began, how it spread, what happened while the published version stood still, and why this version exists. Dates come from the commit histories of the projects' repositories; the audit records behind every claim are kept in this repository's own evidence archive. Product and client names are kept generic by policy.

## 2025: born in a working repository

Memento began as survival tactics inside the repository of a roadmapping tool for team capacity, where long-running AI-assisted development kept losing its way between sessions. In late June 2025 those tactics took shape as a named structure with two parts: a memory prosthesis (project notes kept in tiers) and operational protocols (core directives, playbooks, and the human deciding what counts as done). The first commit of that structure describes it as it still is: a memory-prosthesis and protocols architecture.

It spread the way it would keep spreading: by deliberate transplant, copied into a new project and fitted to it there. Within a fortnight a personal knowledge assistant received the framework by migration; within a month a knowledge assistant for a client programme was started with the framework already installed. That third project matured fastest and went furthest: several people used it, and it guided roughly a year of a team's delivery work (the author's own account; its commit history runs well into 2026). When the author drew a public version, with private details removed, out of the projects in early August 2025, it used all three. The notes from that extraction survive, dated the day before the published version's first commit.

The August 2025 version is preserved unchanged in [`archive/canon-2025/`](../archive/canon-2025/). It was honest about its time: a framework built on documentation habits, enforced by written rules and routine, because nothing else existed to enforce with.

## The dormant months

Then the published version froze. For roughly nine months between its release and May 2026 it received almost no changes; its last change of that period was a one-line fix to its own count of epochs. A reader of the public repository would have concluded the project was finished or abandoned.

The original repository kept using the framework the whole time, and the client-programme assistant kept guiding a team's work deep into those same months. Those months were an incubation period in private: the framework was building up exactly the kind of history its own thesis says must not be lost, including failures that would later become its most valuable teaching material.

## 2026: the automated wave

In May 2026 the original repository began a modernisation that defines the current stage. The tools that Epoch 3 had lacked now existed: hooks in the harness, approval steps, session logs. The first hook arrived in early May. By mid-June the project had built a validation ledger (each control given a failure criterion and a review date), a routing rule (the strongest model handles judgement, cheaper tiers handle bounded work, and ordinary code handles everything code can decide), logging of its controls with the rule that silence is never read as health, and standard file metadata from which navigation and governance maps are generated automatically.

Then the transplants resumed, faster and more deliberate than in 2025:

- **Late June 2026:** a shared memory system for a team's business workstreams was started: the first project whose *product* is itself shared memory for a team's business workstreams. (It was not the framework's first multi-person use; the client-programme assistant had been serving a team since 2025.) Its founding text holds the clearest statement of how Memento is meant to be adopted: start with the framework's core practices, and add the full set of files, procedures and tools when the work's own weight demands it. What the record shows, honestly stated: the text describing that gradual path and the full set of files entered the repository together, in its first commit, and the text records (in the author's own dating, a few days earlier) the decision that the fuller structure would be added only as needed. Prediction and fulfilment arrived together, and the founding text explains why.
- **Early July 2026:** the planning rules were rewritten in the original repository from a study of its working sessions (the planning rules' own record of where they came from counts ninety-four of them), and two days later a tool for mapping an organisation was started with the modern framework installed from its first commit. There the review practice became a standing rule: important work faces an independent review, by a reviewer asked to find its faults, before it is presented at all.
- **Mid July 2026:** a deep health audit of the original project found, among much that was healthy, a control that had done nothing its entire life while appearing to run. The finding, and the lesson it produced ("silence is not health"), are recorded in [`KILLED_MECHANISMS.md`](KILLED_MECHANISMS.md).

## The rewrite you are reading

On 20 July 2026 this repository was reopened under a decision the framework's own logic demanded: work on the governance framework must itself be governed. A modern set of Memento files was set up inside this repository (in `memento/`), and the work since, including this document, has followed its requirements for planning, independent review, automated confidentiality checks and the author's approval at defined boundaries.

The next step was an audit of the whole history. A fixed registry of thirty-two parts (practices and controls that could each be adopted, traced or removed on their own) was traced through all three projects still using Memento, part by part and project by project, with evidence down to individual commits and every verdict made by the auditor at first hand. The audit corrected the record in both directions. It moved the framework's birth earlier than the published version knew, to June 2025 in the original repository. And it corrected the published version's claims about itself, including a promotional "complete system in thirteen days" that the author's honest review revised to a walking skeleton (a basic system working end to end, with most of the work still to do).

The result is this version: a new account where none existed, working documents transplanted with a record of where each came from, and the 2025 version archived whole as the record of its stage.

## What the story teaches

1. **Frameworks born in real projects survive being transplanted.** Every part in the [registry](ORGAN_REGISTRY.md) traces to a working repository and a need someone felt. None began as a whiteboard exercise.
2. **Cross-pollination between projects is a method, and it needs a carrier.** The parts moved between projects deliberately, fitted on arrival, with a record of where each came from. The projects even share their removals: one project's founding backlog declines a control because another had already shown it did not work.
3. **A quiet published version can hide an active idea.** The published version went quiet for months while the framework kept growing in private. The gap between the two is why this rewrite exists, and why this version treats its own claims as claims to check.
4. **Test whether each control achieves its purpose, and record what the test shows.** The current stage's character is in its list of removed controls. Read it next: [`KILLED_MECHANISMS.md`](KILLED_MECHANISMS.md).
