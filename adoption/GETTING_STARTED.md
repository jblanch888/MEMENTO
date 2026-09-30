# Getting Started

You do not need all of this on day one; Memento itself grew into it. Pick your step on the [graduation ladder](GRADUATION_LADDER.md), the steps for adopting Memento gradually, and start there. For most projects that means Rung 1: a single page of core practices.

Memento's own terms are explained in [Words used here](../framework/README.md#words-used-here).

## Day one: the core practices

Copy [`THE_SPIRIT.md`](THE_SPIRIT.md) into your repository as `SPIRIT.md`, fill in its bracketed slots, and start working by it. It covers the essentials: you decide what counts as done; claims need evidence; plans come before consequential work; work happens in small, checked steps; the current-work notes are rewritten as a whole each time; anything you intend to rely on gets a failure criterion written down in advance; and your one-way doors (the actions that are irreversible or costly to undo) are named. That one page is a working adoption of Memento. Run it for a while before adding anything.

## When a trigger occurs: set up the full Memento files

The triggers seen in real projects: state lost at a context reset that mattered · the same lesson learned twice · a claim relied on without review · parallel streams of work getting mixed up. When one occurs, set up `memento/` in your repository from [`framework/`](../framework/):

1. **Core directives:** copy `framework/directives/CORE_DIRECTIVES_TEMPLATE.md` to `memento/protocols/CORE_DIRECTIVES.md`, fill the slots, and write your fitting note.
2. **Playbooks:** copy the playbooks you will actually use to `memento/protocols/playbooks/` and fit them (planning and git operations first; the rest as their kind of work arrives).
3. **Memory prosthesis:** copy the tier structure from `framework/memory-prosthesis/`, drop the `_TEMPLATE` suffixes, and write your first CURRENT_FOCUS.
4. **Conventions:** install the estate spine (file metadata and naming rules) and the routing rule into `memento/memory-prosthesis/active-knowledge/`, and give every Memento file its frontmatter from the start. It costs one block per document and makes every later tool possible.
5. **Save your founding record:** a dated plan in the evidence archive recording what you installed, what you fitted, and what you deliberately left out. It is the first piece of evidence in your project's Memento files.

## The rhythm of a session

In each session: the restart protocol reads the rules, current task and status (CORE_DIRECTIVES.md, CURRENT_FOCUS.md and STATUS.md) and checks their claims against the live files and git state · work proceeds in small steps, each with its check or approval, under the Active Playbook · substantial sessions save dated records whose bodies are kept as written · before compaction, the pre-compact protocol proposes at most three lessons for institutional memory, for your approval, and rewrites the working context clean.

## Automate only on evidence

Record the trigger that would justify each tool (`framework/conventions/TOOLING_TRIGGERS.md`), and build nothing until one occurs. When you do build: write down its failure criterion in advance, record every run of it, whatever the outcome, and record its removal, with the reason, if it fails. For an honest map of what automation can and cannot yet enforce, see [`THE_ENFORCEMENT_SURFACE.md`](THE_ENFORCEMENT_SURFACE.md).
