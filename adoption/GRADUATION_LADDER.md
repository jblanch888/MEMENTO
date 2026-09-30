# The Graduation Ladder

How to adopt a governance framework without being crushed by it: start with the core practices, add the full set of files, procedures and tools as the work needs them, and take each step only when the real weight of the work demands it. A working complex system grows from a working simpler one (Gall's Law). The projects where Memento developed applied that law to the framework itself, and then watched the ladder play out in practice.

## Rung 1: the core practices (the spirit)

Adopt the practices in a page or two inside the project itself, without the full set of files, procedures and tools: framing the work around the problem, the human's approval on completion (nothing is done until the human says so), a failure criterion written down in advance for anything you intend to rely on, grading evidence (a claim stays a claim until evidence supports it), running a new approach in test mode alongside anything that works before replacing it, and rewriting the working notes as a whole. A page ready to copy is provided: [`THE_SPIRIT.md`](THE_SPIRIT.md).

This step is a real way of working, with a dated example. One project started in 2026 (a shared memory system for a team's business workstreams) began under an explicit decision: the practices adopted inside its own directory, the fuller structure declined by name (no tiers, no archive of records, no hooks), and the path to the next steps written down the same day, on the view that the light version grows into the structured one only when its own weight demands it.

## Rung 2: the full Memento files (the estate)

Set up `memento/` inside the repository: core directives fitted from the 14-directive template, the four memory-prosthesis tiers, frontmatter on every file from the start, playbooks that apply by kind of work, dated records kept as written as the trail of evidence, and the pre-compact and restart protocols followed by discipline.

Examples, each a different honest route onto this step:

- The practices-first project above **reached this step in five days.** Its "spirit, not structure" decision is dated 2026-06-22, during its discovery phase; on 2026-06-27 it set up its full Memento files in a single day. The honest record, told in [the story](../story/THE_STORY.md), is that the text describing the gradual path and the fuller structure entered the repository together, in its first commit, with the text carrying the decision, made days earlier, that the fuller structure would be added only as needed. Prediction and fulfilment arrived together.
- A second project (a tool for mapping an organisation) started on this step **on its first day, by deliberate choice**, importing another project's fitted documents with notes on where each came from, and with health-check tools installed at the start because its owner explicitly revised the plan to include them.
- The Memento files governing this repository were set up on this step and run it as written: approval steps, dated records kept as written, and tools added on evidence.

## Rung 3: automated checks (mechanised governance)

Hooks, approval checks, logs of what runs, test harnesses, a validation ledger. This step adds automated enforcement, and the price of entry is the practice of removing what fails: every tool carries a failure criterion written down in advance, a record of every run, whatever the outcome, and a recorded removal, with the reason, if it fails. The original project works at this step, with a set of hooks, logs of every run, dashboards and a ledger of honest verdicts; most of the [killed mechanisms](../story/KILLED_MECHANISMS.md) this repository publishes come from it.

## Rules of the ladder

- **The weight of the work decides when to climb.** Triggers seen in real projects: state lost at a context reset that mattered; the same lesson learned twice; a claim relied on without review; parallel threads of work getting into each other's state. When a trigger occurs, take the next step; until then, stay where you are.
- **The ladder runs both ways.** Automated controls go back to written guidance when they meet their failure criteria; the list of [killed mechanisms](../story/KILLED_MECHANISMS.md) records those steps down, and holds some of the most valuable lessons from the projects.
- **Add controls when evidence shows they are needed, and check what protection they provide.** The projects' ledger shows controls installed without a demonstrated need: an approval prompt approved 154 times out of 154, and a tool that never delivered anything in its whole life. Both are in the list of killed mechanisms.
- **Each step prepares the next.** The one-page practices become the founding core directives; the recorded tool triggers of the full Memento files become the plan for automation. Nothing is thrown away by climbing.
