# The framework

This directory is what an adopter installs: the operational-protocol arm (directives and playbooks), the memory-prosthesis tier templates, and the conventions that hold both together.

**A note on paths:** relative paths inside these documents (`../../memory-prosthesis/…`, `../CORE_DIRECTIVES.md`) are written for the documents' installed locations in an estate (`memento/protocols/`, `memento/protocols/playbooks/`), not for their position in this directory. Install first, then follow the links.

Everything here is a **2026 transplant**: a field-hardened form imported from the framework's live deployments, carrying a provenance note that records the source estate (named generically), the source date, and the fitting changes made on import. These are the forms that survived a year of field evolution and the lineage's kill discipline. The 2025 canon documents that did not survive it were ruled vestiges and live only in the era exhibit at [`archive/canon-2025/`](../archive/canon-2025/).

## Fitting

Every deployment in the lineage fitted these documents to its host: renamed the referents, dropped inapplicable sections, and recorded the changes. The provenance notes on these files are worked examples of that practice. Copy the form, fit it to your product, and write your own fitting note; the note is what makes the next fitting auditable.

On install, files take their conventional estate names and locations: `CORE_DIRECTIVES_TEMPLATE.md` becomes `memento/protocols/CORE_DIRECTIVES.md`, playbooks go to `memento/protocols/playbooks/`, and the conventions files usually live in `memento/memory-prosthesis/active-knowledge/`. The documents' internal cross-references assume those installed names.

## Layout

| Path | Contents |
|---|---|
| [`directives/`](directives/) | The 14-form core-directive template |
| [`playbooks/`](playbooks/) | Planning, git operations, incremental execution, knowledge gardening, documentation |
| [`conventions/`](conventions/) | The routing law, the estate spine (frontmatter, naming, derived indexes), and the earned-tooling register template |
| [`memory-prosthesis/`](memory-prosthesis/) | The four-tier architecture: tier READMEs, working-context templates, knowledge-archive template and mature example, evidence-archive conventions |

## Words used here

Memento names some of its parts. These are the names you will meet across the repository, with what each one means.

| Term | Meaning |
|---|---|
| **memory prosthesis** | The project's saved notes and evidence, organised into four tiers by how often the assistant needs them, so work can continue across sessions. Lives in `memento/memory-prosthesis/`. |
| **working context** | The first tier: two short files, `CURRENT_FOCUS.md` and `STATUS.md`, holding the current task, constraints, next actions, session progress and questions awaiting the User. Read at the start of every session. |
| **active knowledge** | The second tier: project rules and reference material used across tasks. |
| **institutional memory** | The third tier: lessons from past work, selected because they will help future work. A lesson is added once the User approves it. |
| **evidence archive** | The fourth tier: dated records of plans, findings, decisions and handovers, with their supporting evidence. A record's body is kept as written; its status field is updated when its status changes. |
| **operational protocols** | Rules for how the assistant works: the core directives, which always apply, and the playbooks, for particular tasks. |
| **core directives** | The short set of rules that applies throughout the work. "CD #8" means core directive 8, the Session Restart Protocol, which tells the assistant how to resume from the current project records. |
| **playbook** | Steps for a particular kind of work, such as planning or committing. |
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
