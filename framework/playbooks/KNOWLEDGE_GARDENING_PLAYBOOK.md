---
description: governs maintaining a project's Memento files; what each tier is for, when and how to tidy them, keeping them easy for an agent to read, repairing links, and the changes that need the User's approval
type: governing
date: 2026-07-20
governs: [knowledge-gardening, tier-boundaries, dispositions]
last_verified: 2026-07-20
status: template
---

# Knowledge Gardening Playbook

*Knowledge gardening: maintaining the project's notes and rules when evidence shows they are becoming hard to use.*

> **Where this comes from:** the method began in a knowledge assistant for a client programme (2025), was adapted into the original project in May 2026 after a compaction investigation found the working context had grown too large (2026-07-04 form), and was fitted for a young set of Memento files by a newly started project on 2026-07-06, so that the tidying habits applied from its first day. The commit-level evidence is in the projects' private histories. Changes on this import: project-specific tool commands generalised; the fuller sections that apply everywhere (readability for agents, anti-patterns, repairing links) restored from the original project's form; phrasing fitted to this repository's writing rules.

**Objective:** keep the project's Memento files useful for AI-assisted development, and stop them becoming a documentation burden. Deliberately light for a young project; the playbook grows when evidence shows a need.

## 1. When To Garden

Garden when there is evidence the Memento files are becoming harder to use:

- The assistant or the User cannot quickly find the relevant current plan, principle or evidence.
- `CURRENT_FOCUS.md` has built up stale session history in place of a clear current task.
- Active-knowledge files repeat or contradict each other.
- Slice numbering or the near-term sequence has become unclear.
- Links or file references point to missing or renamed files.

Secondary triggers: after several compactions or handovers between sessions · after importing lessons from another project · before a broad report or a major refactor · after creating several new skills, hooks or assessment records.

**Garden only when the work reduces a real risk** to coordination, recall or safety. Documentation that could merely be neater is no reason to garden.

## 2. Tier Boundary Rules

Keep each tier doing one job.

| Tier | Intended content | Gardening action |
| --- | --- | --- |
| `working-context/` | Current task, active constraints, immediate next actions, live status | Remove stale detail once it is recorded elsewhere (CD #11) |
| `active-knowledge/` | Plans spanning sessions, current principles, governing documents, backlog | Consolidate or cross-link when things get hard to find |
| `institutional-memory/` | Lasting lessons and reusable patterns (KNOWLEDGE_ARCHIVE.md) | Add only patterns likely to be reused, with the User's approval |
| `evidence-archive/` | Dated records: plans, findings, designs, assessments (each body kept as written once saved) | The main store for investigation and design records, from the start |
| `protocols/` | Operating rules and playbooks | Add only procedures that have shown their value and have clear triggers |

File names: lowercase `.md` for evidence-archive records (`{type}-{topic}-YYYY-MM-DD.md`); governing documents keep their usual uppercase names. See ESTATE_SPINE.md (in this repository under `framework/conventions/`; projects usually install it under `active-knowledge/`).

## 3. Lightweight Audit Before Structural Edits

Gather evidence before changing the structure. Read-only checks:

```bash
find memento -maxdepth 4 -type f | sort
git ls-files memento | sort
grep -rn "TODO\|TBD\|Pending" memento
git status --short
```

Use the results to find concrete problems: stale current-focus entries · inconsistent slice labels · duplicate plans · unresolved checks · broken relative links · an oversized working context · missing cross-references. Where the project has health-check or index tools, run them here, and regenerate anything they generate after structural changes.

## 4. Gardening Actions

Use the smallest action that fixes the problem observed.

Allowed: rewriting the working context (CD #11) · cross-references between related plans · status corrections that are true · moving completed evidence to the archive (with the User's approval, §7) · short indexes when things get hard to find · consolidating duplicate guidance, only after confirming no useful distinction is lost.

Avoid: bulk-copying another project's files · renaming or moving many files in one slice · turning finished implementation detail into active guidance · creating new protocols without a clear trigger and failure mode · pruning historical evidence because it is old.

## 5. Readable for Agents

Structure the Memento files so an agent can find the meaning quickly.

- **Consistent structure:** the same heading hierarchy, field order and formatting across similar files. Agents match patterns, and inconsistency wastes context.
- **Summary first:** the summary at the top, detail below. The working context should make sense in a single read.
- **Related information together:** keep it in one place, and avoid scattering it across five sections.
- **Clear tier boundaries:** each tier has one job; content serving a different job belongs in a different tier.
- **Links that can be followed:** links between related files, so agents can follow a chain of context without guessing paths.

The test, when gardening: "Would an agent arriving here with no context understand what to do within one read?" If not, restructure; adding more content will not help.

## 6. Cross-Reference Repair

When links break, fix them systematically:

1. **Detect:** run link checks where the project has them, or search for Markdown links and confirm their targets exist.
2. **Classify:** renamed, moved to another tier, or genuinely deleted?
3. **Repair:** update the link; if the target was deleted, remove the reference or note what replaced it.
4. **Verify:** run the detection again after the repairs.

Common causes: files renamed during gardening · content moved between tiers without updating the references · temporary names later standardised.

## 7. User Approval

Gardening changes how future agents understand the project, so treat it as governance work. **The User's approval is required before:** moving content between tiers · deleting or superseding Memento files · changing core directives · adding a mandatory process · turning a recommendation into a hard rule. Routine status updates and cross-references may be drafted first, then committed after the User has explicitly accepted the slice.

## 8. Anti-Patterns

- **Losing information:** consolidation so aggressive that it destroys what the project has learned; throwing away lessons and debugging patterns; removing the specific context that made guidance applicable.
- **Over-gardening:** reorganising a structure that works; merging files that hold distinct ideas; false simplicity; moving content between tiers without a clear reason.
- **Under-gardening:** cosmetic fixes that dodge structural problems; leaving broken links unrepaired; tolerating an oversized working context because "it's all relevant"; letting stale claims stay because no trigger explicitly fired; waiting until everything has degraded before acting.

## 9. Checks Before Presenting, and Success Criteria

Before presenting gardening work: run `git diff --check` and `git status --short`, and confirm that product files were left unchanged unless approved, that uncommitted changes inherited from earlier work are untouched, that CURRENT_FOCUS and STATUS agree on the active slice, and that new references point to files that exist.

A successful gardening slice makes the next development step easier or safer: the current focus shorter and more accurate · the next slice unambiguous · related documents cross-referenced · stale status corrected · future agents able to tell current evidence from historical evidence.
