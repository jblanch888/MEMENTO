---
description: the estate-wide file convention — YAML frontmatter on every estate file, naming standards, and the derived-index principle; convention immediate, tooling earned
type: governing
date: 2026-07-20
governs: [frontmatter, naming, indexes]
last_verified: 2026-07-20
status: template
---

# ESTATE_SPINE.md

> **Provenance:** the spine and its generated derivatives entered the lineage in the origin estate (a team-capacity roadmapping tool, 2026-06-21); a fresh-founded estate adopted it day-one with tooling installed at founding by the User's revision (2026-07-06 form). Fitting changes on this import: the tool table generalised to the proven shapes with host commands removed; the convention/tooling split stated as the adoption rule. Commit-level receipts live in the deployments' private histories.

## Frontmatter convention (every estate file, from birth)

```yaml
---
description: one line — what this file is and does
type: governing | plan | design | finding | assessment | discovery | reference | status | handover | working-context
date: YYYY-MM-DD          # creation date
governs: [domain, ...]     # governing docs only
last_verified: YYYY-MM-DD  # bumped when content is re-checked against reality
status: governing | awaiting-approval | approved | decided | hypothesis | superseded | historical | template | live
---
```

- `last_verified` is a freshness claim: content asserting live state that has not been re-checked goes visibly stale.
- `status: hypothesis` marks imported-but-unproven artefacts, honest from the moment of import.
- `status: template` marks a canon-distributed form awaiting fitting; it becomes `governing` on install (`live` for working-context files, which are the one tier whose status is the session's, with `type: working-context`).
- `status: superseded` files gain a banner pointing at their successor: banner-and-archive over deletion for governing text (CD #4).

## Naming

- Evidence-archive memos: `{type}-{topic}-YYYY-MM-DD.md`, lowercase.
- Governing docs: conventional uppercase names (CHARTER.md, CORE_DIRECTIVES.md, …).
- Cross-references: relative markdown links where navigation matters; a wiki-style `[[name]]` convention within estate prose if your tooling supports it.

## Derived indexes and health tooling (the earned tier)

The frontmatter is machine-readable on purpose: it can drive generated artefacts and health checks. The proven shapes in the lineage:

| Tool | Role |
|---|---|
| Probe | Pattern-first estate search with a banked receipt (PLANNING §1) |
| Doctor | Health checks: frontmatter coverage and keys, freshness, links, working-context state, confidentiality, naming |
| Index | A generated evidence-archive index built from memo frontmatter |
| Governance map | A generated map built from `governs:` fields |
| Restart packet | A live-state packet for the restart protocol (CD #8) |

Generated files are suffixed `*.generated.md` and never hand-edited.

**The adoption rule: convention immediate, tooling earned.** Write the frontmatter from the estate's first file; it costs one block per document and makes every later mechanism possible. Build the tools when a trigger fires (an estate outgrowing manual search, a first broken link, a disputed freshness claim), and register the triggers so the decision is visible. One deployment installed the full toolset at founding by the User's explicit revision; another runs the convention with no tooling at all. Both are honest positions. Tooling installed by default and never witnessed running is the failure the killed-mechanism roll documents.
