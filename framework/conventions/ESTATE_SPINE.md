---
description: the file convention for a project's Memento files; YAML frontmatter on every file, naming standards, and generated indexes; the convention applies at once, and the tools are built when a need is recorded
type: governing
date: 2026-07-20
governs: [frontmatter, naming, indexes]
last_verified: 2026-07-20
status: template
---

# ESTATE_SPINE.md

*The estate spine: the file metadata, naming rules and generated indexes for a project's Memento files.*

> **Where this comes from:** the metadata convention and the files generated from it started in the original project (a roadmapping tool for team capacity, 2026-06-21); a newly started project adopted it from its first day, with the tools installed at the start because the User revised the plan to include them (2026-07-06 form). Changes on this import: the table of tools reduced to the shapes proven in use, with project-specific commands removed; the split between the convention and its tools stated as the rule for adopting it. The commit-level evidence is in the projects' private histories. Practices imported 2026-10-08 from the workstream project: precedence, find-before-creating, health checks and gardening in pre-compact, one list of the User's operations, verification fields, the retirement of lessons. De-identified; cleared by the User, 2026-10-08.

## Frontmatter convention (every Memento file, from the start)

```yaml
---
description: one line saying what this file is and does
type: governing | plan | design | finding | assessment | discovery | reference | status | handover | working-context
date: YYYY-MM-DD          # creation date
governs: [domain, ...]     # governing docs only
last_verified: YYYY-MM-DD  # bumped when content is re-checked against reality
verified_by: who re-checked it, and against what evidence   # governing docs only, optional
status: governing | governing-stale | awaiting-approval | approved | decided | hypothesis | superseded | historical | template | live
---
```

- `last_verified` is a claim about freshness: content that describes the live state and has not been re-checked visibly goes stale.
- `governing-stale` marks a governing document whose domain has moved since it was last verified. It keeps its authority, and its claims are re-checked before high-stakes work relies on them.
- A governing document holds a jurisdiction. Its `last_verified`, `verified_by` and `status` carry the trust signal.
- `status: hypothesis` marks imported material not yet proven, labelled honestly from the moment it arrives.
- `status: template` marks a form distributed by this repository and not yet fitted; it becomes `governing` on install (`live` for working-context files, the one tier whose status belongs to the session, with `type: working-context`).
- A file with `status: superseded` gets a banner pointing to its successor: for governing text, a banner and an archived copy take the place of deletion (CD #4).

## Naming

- Evidence-archive records: `{type}-{topic}-YYYY-MM-DD.md`, lowercase.
- Governing documents: the usual uppercase names (CHARTER.md, CORE_DIRECTIVES.md, …).
- Cross-references: relative Markdown links where navigation matters; a wiki-style `[[name]]` convention inside the Memento files if your tools support it.

## Generated indexes and health checks (built when needed)

The frontmatter is machine-readable on purpose: it can drive generated files and health checks. The shapes proven in the projects:

| Tool | Role |
|---|---|
| Probe | A pattern-first search of the Memento files, with its results saved as evidence (PLANNING §1) |
| Doctor | Health checks: frontmatter coverage and keys, freshness, links, the state of the working context, confidentiality, naming |
| Index | A generated index of the evidence archive, built from each record's frontmatter |
| Governance map | A generated map built from the `governs:` fields |
| Restart packet | A summary of the live state for the restart protocol (CD #8) |

Generated files end in `*.generated.md` and are never edited by hand.

**The rule for adopting it: the convention at once, the tools when needed.** Write the frontmatter from the project's first Memento file; it costs one block per document and makes every later tool possible. Build the tools when a trigger occurs (the Memento files outgrowing a manual search, a first broken link, a disputed freshness claim), and record the triggers so the decision is visible. One project installed the full set of tools at the start, because the User explicitly revised the plan to include them; another runs the convention with no tools at all. Both are honest positions. Tools installed by default and never observed running are the failure the list of killed mechanisms records.
