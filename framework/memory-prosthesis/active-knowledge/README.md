# Active Knowledge

Frequent-reference material spanning sessions: the estate's governing documents and current principles. An agent descends here from working context when a decision needs grounding.

## Typical contents (from the live deployments)

- **CHARTER.md** — what the endeavour is, its stances, its open pivots.
- **RESOURCE_ROUTING.md** — the routing law (template in `framework/conventions/`).
- **ESTATE_SPINE.md** — frontmatter and naming convention (template in `framework/conventions/`).
- **BACKLOG.md** — prioritised work and the NOTE_FOR_LATER collection.
- **Principles and system-context files** — architecture principles, domain overviews.

## Disciplines

- **Svelte.** Larger than working context, and every file still scannable in one read. When a file grows past that, graduate the durable pattern down a tier and cut.
- **Governing docs carry spine frontmatter** with `governs:` and `last_verified:` fields, so staleness is visible and a governance map can be generated when tooling is earned.
- **The context-plunge pattern.** Where a host system is complex enough that post-compact sessions fumble, write a rapid-context file for that domain: system purpose in a sentence, core architecture scannable, key operations with concrete examples. The cost of one page here repays itself every restart.
