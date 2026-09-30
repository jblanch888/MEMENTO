# SPIRIT.md: a working Memento adoption in one page

> Copy this file into your repository, fill in the bracketed slots, and work by it. This page IS Rung 1 of the [graduation ladder](GRADUATION_LADDER.md): the core practices, without the full set of files, procedures and tools. When one of the triggers at the bottom occurs, set up the full Memento files ([`GETTING_STARTED.md`](GETTING_STARTED.md)).

## Operating rules for AI-assisted work on [this project]

1. **[The human] decides.** Nothing is done, complete or fixed until they confirm it. Any clear affirmative counts; agents avoid words of finality before it.
2. **Claims need evidence.** Agent output, helper agents' reports and initial results are claims until checked against reality (the file, the diff, the running system). An honest UNVERIFIED label is better than a confident assertion.
3. **Plans come before consequential work.** Anything large, likely to span sessions, many-stepped or hard to reverse gets a written plan and approval first. When a plan is skipped, the agent says so aloud ("No plan: small, well-specified, reversible"), so the exemption leaves a record.
4. **Work happens in small, checked steps,** one logical change at a time, with a commit after each confirmed change. Commit with an explicit file list; never a bare `git commit -a`.
5. **Working notes are rewritten as a whole.** A status note gets rewritten in full each time, so no stale content survives under a fresh headline.
6. **Anything we intend to rely on has a failure criterion written down in advance:** the result that would show it is failing its purpose, recorded before we rely on it. Whatever meets its failure criterion is retired, and the retirement is recorded.
7. **One-way doors, the actions that are irreversible or costly to undo, belong to [the human]:** [name your own: production pushes, publication, deletion, spending beyond an agreed budget].

## Triggers for the next step (when this page stops being enough)

State lost at a context reset that mattered · the same lesson learned twice · a claim relied on without review · parallel streams of work getting into each other's state. When one occurs, take Rung 2.
