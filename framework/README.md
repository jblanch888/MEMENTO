# The framework

This directory holds what you install in a project: the operational protocols (core directives and playbooks, installed in `memento/protocols/`, plus standards installed in active knowledge), the templates for the four memory tiers, and the conventions that connect them. Memento's own terms are explained in [Words used here](#words-used-here) at the end of this page.

**A note on paths:** relative paths inside these documents (`../../memory-prosthesis/…`, `../CORE_DIRECTIVES.md`) are written for where the documents sit once installed in a project (`memento/protocols/`, `memento/protocols/playbooks/`, and `memento/memory-prosthesis/active-knowledge/` for the conventions and standards), which differs from their place in this directory. Install first, then follow the links.

Everything here is a **2026 transplant**: a form tested in real projects and imported from them, with a note recording where it came from (the source project, named generically), the source date, and the changes made to fit it on import. These are the forms that survived a year of use in the projects and their practice of removing what fails. The 2025 documents that did not survive were ruled out of date and remain only in the preserved [2025 version](../archive/canon-2025/).

## Fitting

Every project fitted these documents to itself: renamed the things they refer to, dropped the sections that did not apply, and recorded the changes. The notes on where each file came from are worked examples of that practice. Copy the form, fit it to your product, and write your own fitting note; the note is what lets the next person check how the document was fitted.

On install, files take their usual names and locations in a project: `CORE_DIRECTIVES_TEMPLATE.md` becomes `memento/protocols/CORE_DIRECTIVES.md`, playbooks go to `memento/protocols/playbooks/`, and the conventions files usually live in `memento/memory-prosthesis/active-knowledge/`. The documents' internal cross-references assume those installed names.

## Layout

| Path | Contents |
|---|---|
| [`directives/`](directives/) | The 14-directive core directives template |
| [`playbooks/`](playbooks/) | Planning, and maintaining project notes (knowledge gardening): procedures used when the work calls for them |
| [`conventions/`](conventions/) | The routing rule, the estate spine (file metadata, naming rules and generated indexes), the git, documentation and change standards, and a template for the register of tools to add on evidence |
| [`memory-prosthesis/`](memory-prosthesis/) | The four tiers: a README for each, working-context templates, a knowledge-archive template with a mature example, and the evidence-archive conventions |

## Words used here

Memento names some of its parts. These are the names you will meet across the repository, with what each one means.

| Term | Meaning |
|---|---|
| **memory prosthesis** | The project's saved notes and evidence, organised into four tiers by how often the assistant needs them, so work can continue across sessions. Lives in `memento/memory-prosthesis/`. |
| **working context** | The first tier: two short files, `CURRENT_FOCUS.md` and `STATUS.md`, holding the current task, constraints, next actions, session progress and questions awaiting the User. Read at the start of every session. |
| **active knowledge** | The second tier: project rules and reference material used across tasks. |
| **institutional memory** | The third tier: lessons from past work, selected because they will help future work. A lesson is added once the User approves it. |
| **evidence archive** | The fourth tier: dated records of plans, findings, decisions and handovers, with their supporting evidence. A record's body is kept as written; its status field is updated when its status changes. |
| **operational protocols** | Rules for how the assistant works: the core directives, which always apply; the playbooks, which the assistant reads and follows when that kind of work begins; and the standards in the conventions. |
| **core directives** | The short set of rules that applies throughout the work. "CD #8" means core directive 8, the Session Restart Protocol, which tells the assistant how to resume from the current project records. |
| **playbook** | A procedure the assistant follows for a particular task, such as preparing a plan. The assistant reads and follows the relevant playbook when that kind of work begins. |
| **conventions** | Shared rules for how the Memento files and the work are organised: file metadata and naming, the routing rule, and the standards. Installed in active knowledge. |
| **standard** | A standing rule for how the project handles work such as commits, documentation or changes. It applies whenever that activity occurs, whichever assistant or model performs it. Standards sit with the conventions. |
| **skill** | A package of task instructions, sometimes with scripts or reference files, that a supporting assistant (Claude Code, Codex) can load when relevant. A playbook can be packaged as a skill. |
| **undertaking** | A piece of work; the [planning playbook](playbooks/PLANNING_PLAYBOOK.md) states when one needs a saved plan. |
| **the User** | The person in charge of the project. The User alone decides the task's scope and quality and confirms when it is complete. |
| **governing document** | A document that sets rules for work on the project. |
| **harness** | The application that runs the assistant and its tools. |
| **hook** | Code the harness runs at a specified event, such as before a tool call. |
| **frontmatter** | The structured fields at the start of a file. |
| **compaction** | The harness condensing a long conversation to free space. Details can be lost; notes saved in project files remain available. |
| **adversarial review** | An independent reviewer starts by assuming the work has faults and tests its claims against evidence before the work is presented to the User. |
| **routing** | The rule for choosing who or what performs each part of the work. The model tiers (frontier, smart, recon) are capability and cost categories, set out in [RESOURCE_ROUTING.md](conventions/RESOURCE_ROUTING.md). |
| **falsifiable governance** | The name of Memento's current stage. Before relying on a control, write down the result that would show it is failing its purpose (its *failure criterion*) and when you will check; retire the control when that result appears, and record the lesson. |
| **epoch** | One of the six stages of Memento's history, set out in [EPOCHS.md](../story/EPOCHS.md). |
| **organ registry** | The catalogue of Memento's 32 parts and where each came from ([ORGAN_REGISTRY.md](../story/ORGAN_REGISTRY.md)). |
| **killed mechanisms** | Controls that were tried and removed, with the reason each was removed ([KILLED_MECHANISMS.md](../story/KILLED_MECHANISMS.md)). |
| **graduation ladder** | The steps for adopting Memento gradually, adding structure as a project needs it ([GRADUATION_LADDER.md](../adoption/GRADUATION_LADDER.md)). |
| **estate spine** | The file metadata, naming rules and generated indexes for a project's Memento files ([ESTATE_SPINE.md](conventions/ESTATE_SPINE.md)). |
| **knowledge gardening** | Maintaining project notes and rules when evidence shows they are becoming hard to use. |
