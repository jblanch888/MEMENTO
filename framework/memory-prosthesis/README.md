---
description: the memory prosthesis, the project's saved notes and evidence in four tiers so AI-assisted work can continue across sessions; 2026 form of the tier structure
type: governing
date: 2026-07-20
governs: [memory-tiers, information-flow]
last_verified: 2026-07-20
status: template
---

# The Memory Prosthesis

> **Where this comes from:** the four-tier structure comes from the 2025 version. This 2026 form keeps the structure and updates the practice to what the projects actually run: standard metadata (frontmatter) at the top of every file, dated records kept as written as the evidence discipline, and the tier rules carried by directives (CD #8, #9, #11). The notes at the end record what a year of use changed.

**Purpose:** the project's saved notes and evidence, organised into four tiers by how often the assistant needs them. The assistant starts each session with a short account of the current work and reads more detailed material when the task requires it, so knowledge survives context resets and builds up across hundreds of sessions without crowding the assistant's context. The other part of Memento, the operational protocols, installs from `directives/` and `playbooks/` into a project's `memento/protocols/`. The two are designed together: the working context names the Active Playbook, and the pre-compact directive sets the steps for proposing lessons and obtaining the User's approval before adding them to institutional memory.

## The structure

```
     [working-context]        ← read every session; smallest; rewritten as a whole each time
    ════════════════════
   [active-knowledge]         ← frequent reference: governing documents, principles, backlog
  ═══════════════════════
 [institutional-memory]       ← lasting lessons; selected, anchored, searchable
═══════════════════════════
[evidence-archive]            ← dated records kept as written; grows without limit
```

The assistant's context is limited, so the most-used information comes first. Each tier is sized to its job: the assistant reads the core directives and the short working context every session, then consults further guidance, past lessons and original evidence as the task requires.

## The tiers

| Tier | Job | Size | Core files |
|---|---|---|---|
| `working-context/` | What to work on now: the current state and the decisions still needed | Smallest; two files; rewritten as a whole per CD #11 | CURRENT_FOCUS.md, STATUS.md |
| `active-knowledge/` | Project rules and reference material used across tasks | Compact; each file readable in one pass | CHARTER, RESOURCE_ROUTING, BACKLOG, principles |
| `institutional-memory/` | Lessons selected from past work because they will help future tasks | Grows slowly; entries are added only through the selection step in CD #9 | KNOWLEDGE_ARCHIVE.md |
| `evidence-archive/` | Plans, findings, design decisions and handovers, with their supporting evidence | Unlimited; each record's body is kept as written once saved | `{type}-{topic}-YYYY-MM-DD.md` |

## How information moves (the disciplines that keep it useful)

- **Session start:** the restart protocol (CD #8) reads the rules, current task and status (CORE_DIRECTIVES.md, CURRENT_FOCUS.md and STATUS.md) and checks their claims against the live files and git state.
- **During work:** substantial sessions save dated records in the evidence archive (DOCUMENTATION_PLAYBOOK §8, the frozen-memo convention: a record's body is kept as written). The record is the evidence; verdicts and plans cite it.
- **Pre-compact (CD #9):** at most three genuinely reusable lessons are added to institutional memory once the User approves them; the working context is rewritten clean; everything specific to the session stays out of active knowledge and institutional memory.
- **Every working-context edit** rewrites the file as a whole (CD #11): the whole file re-read, and stale content removed from every section.

## What a year of use changed

- **Working context slimmed to two files everywhere.** The 2025 version allowed up to fifty lines across the tier; the projects settled on a short CURRENT_FOCUS and STATUS pair, with everything else moved down a tier.
- **The evidence archive became the projects' main store of knowledge.** One project's archive README says so plainly; another saved scores of typed records in its first weeks. The 2025 version treated this tier as a seldom-visited basement, and practice reversed that: the dated record is where governance work actually lands, and the upper tiers hold the distilled lessons.
- **Tier rules moved into directives.** Written guidance about keeping the notes tidy became CD #9 and CD #11, and the projects' practice of removing what fails pruned whatever did not prove useful. These tier READMEs exist for adopters; a running project carries the discipline in its directive set.

## Install

Copy this directory to `memento/memory-prosthesis/`, drop the `_TEMPLATE` suffixes (e.g. `CURRENT_FOCUS_TEMPLATE.md` → `CURRENT_FOCUS.md`), fill the slots, and give every file the standard metadata block (frontmatter) described in `framework/conventions/ESTATE_SPINE.md`.
