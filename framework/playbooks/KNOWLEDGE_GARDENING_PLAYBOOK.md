---
description: governs estate knowledge maintenance — tier boundaries, gardening triggers and actions, machine readability, cross-reference repair, User-gated dispositions
type: governing
date: 2026-07-20
governs: [knowledge-gardening, tier-boundaries, dispositions]
last_verified: 2026-07-20
status: template
---

# Knowledge Gardening Playbook

> **Provenance:** the gardening method originated in a client-programme knowledge assistant (2025), was adapted into the origin estate in May 2026 after evidence of working-context bloat during a compaction investigation (2026-07-04 form), and was fitted for a young estate by a fresh-founded deployment 2026-07-06: hygiene from birth rather than retrofit. Commit-level receipts live in the deployments' private histories. Fitting changes on this import: host tool commands generalised; the fuller universal sections (machine readability, anti-patterns, cross-reference repair) restored from the origin form; phrasing fitted to the canon's writing rules.

**Objective:** Keep the estate useful for AI-assisted development rather than letting it become a documentation burden. Deliberately light for a young estate; the playbook grows with evidence, not ambition.

## 1. When To Garden

Garden when there is evidence the estate is becoming harder to use:

- The agent or the User cannot quickly find the relevant current plan, principle, or evidence.
- `CURRENT_FOCUS.md` has accumulated stale session history instead of current task focus.
- Active-knowledge files duplicate or contradict each other.
- Slice numbering or near-term sequence has become ambiguous.
- Links or file references point to missing or renamed files.

Secondary triggers: after several compact/session handoffs · after importing lessons from another estate · before a broad report or major refactor · after creating several new skills, hooks, or assessment artefacts.

**Do not garden merely because the documentation could be neater.** The work must reduce a real coordination, recall, or safety risk.

## 2. Tier Boundary Rules

Keep each tier doing one job.

| Tier | Intended content | Gardening action |
| --- | --- | --- |
| `working-context/` | Current task, active constraints, immediate next actions, live status | Remove stale detail once captured elsewhere (CD #11 discipline) |
| `active-knowledge/` | Multi-session plans, current principles, governing docs, backlog | Consolidate or cross-link when navigation degrades |
| `institutional-memory/` | Durable lessons and reusable patterns (KNOWLEDGE_ARCHIVE.md) | Graduate only patterns likely to be reused |
| `evidence-archive/` | Dated memos: plans, findings, designs, assessments (frozen once banked) | Primary store for investigation and design artefacts from birth |
| `protocols/` | Operating rules and playbooks | Add only procedures with demonstrated value and clear triggers |

Filename standard: lowercase `.md` for evidence-archive memos (`{type}-{topic}-YYYY-MM-DD.md`); governing docs keep their conventional uppercase names. See ESTATE_SPINE.md (in this canon under `framework/conventions/`; estates typically install it under `active-knowledge/`).

## 3. Lightweight Audit Before Structural Edits

Gather evidence before editing structure. Read-only checks:

```bash
find memento -maxdepth 4 -type f | sort
git ls-files memento | sort
grep -rn "TODO\|TBD\|Pending" memento
git status --short
```

Use the results to identify concrete issues: stale current-focus entries · inconsistent slice labels · duplicate plans · unresolved validation status · broken relative links · oversized working context · missing cross-references. Where the estate has doctor/index tooling, run it here and regenerate derived artefacts after structural changes.

## 4. Gardening Actions

Use the smallest action that fixes the observed problem.

Allowed: working-context refresh (CD #11) · cross-references between related plans · status corrections that are true · moving completed evidence to the archive (User-gated, §7) · short indexes when navigation degrades · consolidating duplicate guidance only after confirming no useful distinction is lost.

Avoid: bulk-copying another estate's files · renaming or moving many files in one slice · turning completed implementation detail into active guidance · creating new protocols without a clear trigger and failure mode · pruning historical evidence because it is old.

## 5. Machine Readability

Structure estate files so agents can extract meaning efficiently.

- **Consistent structure:** same heading hierarchy, field order and formatting across similar files. Agents pattern-match; inconsistency wastes context.
- **Progressive disclosure:** summary first, detail below. Working context should be comprehensible within a single read.
- **Semantic grouping:** related information lives together, not scattered across five sections.
- **Clear tier boundaries:** each tier has one job; content serving a different job belongs in a different tier.
- **Navigable cross-references:** links between related files so agents can follow context chains without guessing paths.

The test, when gardening: "Would an agent landing here cold understand what to do within one read?" If not, restructure; adding more content will not help.

## 6. Cross-Reference Repair

When links break, fix them systematically:

1. **Detect:** run link validation where the estate has it, or grep for markdown links and verify targets exist.
2. **Classify:** renamed, moved to another tier, or genuinely deleted?
3. **Repair:** update the link; if the target was deleted, remove the reference or note what replaced it.
4. **Verify:** re-run detection after repairs.

Common causes: files renamed during gardening · content graduated between tiers without updating references · temporary names later normalised.

## 7. User Approval

Gardening changes how future agents understand the project. Treat it as governance work. **The User's approval is required before:** moving content between tiers · deleting or superseding estate files · changing core directives · adding mandatory process · converting a recommendation into a hard rule. Routine status updates and cross-references may be drafted first, then committed after the User validates the slice.

## 8. Anti-Patterns

- **Information loss:** aggressive consolidation that destroys institutional knowledge; discarding lessons and debugging patterns; removing the specific context that made guidance applicable.
- **Over-gardening:** gardening functional architecture that doesn't need it; merging conceptually distinct files; false simplicity; moving content between tiers without clear justification.
- **Under-gardening:** cosmetic fixes that dodge structural problems; leaving broken links unresolved; tolerating working-context bloat because "it's all relevant"; letting stale claims persist because no trigger explicitly fired; waiting for full degradation before acting.

## 9. Validation Gates & Success Criteria

Before presenting gardening work: `git diff --check`, `git status --short`, and verify that product files were not changed without approval, that inherited dirty state is untouched, that CURRENT_FOCUS and STATUS agree on the active slice, and that new references point to files that exist.

A successful gardening slice makes the next development action easier or safer: current focus shorter and more accurate · the next slice unambiguous · related documents cross-referenced · stale status corrected · future agents able to tell current evidence from historical.
