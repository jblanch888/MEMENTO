---
description: governs writing documentation and fitting it into the memory prosthesis, including the frozen-memo convention (the pattern the original project reports using most)
type: governing
date: 2026-07-20
governs: [documentation, evidence-memos, cross-references]
last_verified: 2026-07-20
status: template
---

# DOCUMENTATION_PLAYBOOK.md

> **Where this comes from:** the original project's 2026-07-04 form (a roadmapping tool for team capacity), whose §8 convention for discovery records is, by that project's account, the pattern it uses most. The commit-level evidence is in the projects' private histories. Changes on this import: the discovery-record convention widened into the frozen-memo convention, which covers every substantial kind of record; examples from the project's own product removed; the pre-compact section cut to a pointer (CD #9 owns it); phrasing fitted to this repository's writing rules.

**Objective:** create and update clear, accurate documentation that fits into the project's Memento files.

---

## 1. Style Adherence

**Rule:** Follow [your language standard and the User's writing rules] (CD #5) and the project's formatting standards: Markdown with anchor links (`{#section-name}`), code examples that name their language, consistent emphasis (**bold** for importance, *italic* for terms).

---

## 2. Purposeful Updates

**Rule:** State `DOC_PURPOSE: [e.g. update STATUS with slice completion]` at the start of documentation work. Categories: progress update · knowledge capture · process documentation · architecture documentation.

---

## 3. Knowledge Capture Integration

**Rule:** When documenting new patterns or lessons, propose adding them to institutional memory explicitly: `KNOWLEDGE_CAPTURE_PROPOSAL: Add [summary] to institutional-memory/KNOWLEDGE_ARCHIVE.md#[section]`. Triggers: solutions to new problems · new development patterns · architectural decisions · anti-patterns identified · debugging procedures refined.

---

## 4. Cross-Referencing

**Rule:** Link to the relevant Memento documents and sections: playbooks by name and anchor, the knowledge archive for lasting patterns, the working context for the current task, the evidence archive for history. Keep the paths between memory tiers navigable. Avoid hard-coding paths and line numbers for implementation files (code, prompts, configuration, schemas) in Memento documents; those belong in code comments, which move with the code, or in commit messages, which record them at that point in history.

---

## 5. Pre-Compact Documentation

**Rule:** CD #9 owns pre-compact consolidation (reviewing the session's lessons, resetting the working context, finalising the status). This playbook adds one thing: all pre-compact drafts are presented for the User's review before any write.

---

## 6. Keeping the Memento Files Tidy

All documentation work respects how the Memento files are arranged to fit in the assistant's limited context. These rules prevent the bloat and stale state that make agents less effective over time.

- **Working context updates:** this session only. No implementation history, no detail of finished slices, no growing lists of past work. If it is done, move it out.
- **Lessons for institutional memory:** general patterns only. Extract the reusable principle, and leave the session's specifics behind.
- **Status documentation:** the current state and next actions only. STATUS.md tells an agent what is true *now*.
- **Links kept intact:** keep the paths between documents working whenever content moves. Moving a file without updating the links to it creates a silent failure.

## 7. Documentation Quality Standards

Use this as a checklist when creating or reviewing Memento documents:

- **Behavioural requirements:** does the document say what to do and when? Clear triggers ("do X when Y") work better than vague guidance ("consider X").
- **Decision points:** are the triggers and the criteria for choosing explicit? An agent should know when a rule applies without having to interpret ambiguous conditions.
- **Load on the reader:** can the document be scanned? Summary first, detail below, works better than a wall of text. If an agent needs 80 lines to find the current task, the document is too long.
- **Tier separation:** procedures in the protocols, evidence in the archive, the current state in the working context.

## 8. The Frozen-Memo Convention {#frozen-memo-convention}

**Rule:** Every substantial session (a discovery, an investigation, a design decision, a completed slice) saves a dated record in `../../memory-prosthesis/evidence-archive/{type}-{topic}-{YYYY-MM-DD}.md`. Lasting insights are proposed for the right active-knowledge or institutional-memory document, following the selection and approval rules for that tier. **The record itself stays as written**, as evidence of how the insight was reached, and it is left unrewritten as understanding changes. New sessions produce new records that refer to earlier ones.

**Why this exists:** insights that emerge in the middle of a conversation (reframings, corrections, market evidence, the reasons for decisions) are lost at compaction unless they are written down. The convention began in the original project in May 2026, when a discovery session produced three insights that substantially changed the product's direction, and it became the pattern that project uses most.

**Sections of a record** (fitted to its type): header (date, mode, active playbooks) · the question, and the view held going in · the approach, and why · what emerged · the options considered and rejected · the decision and the reasoning · pointers to the evidence · open questions and next steps · status (open / converged / superseded).

**Where insights go:** lasting insights → active knowledge · facts tied to the current moment → working context · work items that follow from it → the backlog, cross-referenced to the record. An ERRATUM note may be ADDED to a saved record when a claim in it is later disproved (so no one inherits the error); that is the one permitted addition to the body.

---

## Additional Guidelines

- **Current focus:** documentation work supports the current task and its success criteria.
- **User check:** significant documentation changes are presented for review: "Documentation updated for [X]. Please review and confirm accuracy."
- **Version control:** documentation follows the same commit standards as code (`docs(scope): …`), with related changes grouped together.
- **Maintenance:** keep documentation in line with reality; remove outdated information promptly; update cross-references when the structure changes.
