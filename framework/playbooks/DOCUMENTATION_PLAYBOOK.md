---
description: governs documentation authoring and its integration with the memory prosthesis, including the frozen-memo convention (the pattern its origin estate calls its most-exercised)
type: governing
date: 2026-07-20
governs: [documentation, evidence-memos, cross-references]
last_verified: 2026-07-20
status: template
---

# DOCUMENTATION_PLAYBOOK.md

> **Provenance:** the origin estate's 2026-07-04 form (a team-capacity roadmapping tool), whose §8 discovery-memo convention that estate calls its most-exercised pattern. Commit-level receipts live in the deployments' private histories. Fitting changes on this import: the discovery-memo convention generalised to the frozen-memo convention covering all substantive memo types; host product examples removed; the pre-compact section reduced to a pointer (CD #9 owns it); phrasing fitted to the canon's writing rules.

**Objective:** Create and update clear, accurate documentation that integrates with the Memento knowledge system.

---

## 1. Style Adherence

**Rule:** Follow [your language standard and the User's writing rules] (CD #5) and the estate's formatting standards: markdown with anchor links (`{#section-name}`), code examples with language specification, consistent emphasis (**bold** for importance, *italic* for terms).

---

## 2. Purposeful Updates

**Rule:** State `DOC_PURPOSE: [e.g. update STATUS with slice completion]` at the beginning of documentation work. Categories: progress update · knowledge capture · process documentation · architecture documentation.

---

## 3. Knowledge Capture Integration

**Rule:** If documenting new patterns or lessons, propose graduation explicitly: `KNOWLEDGE_CAPTURE_PROPOSAL: Add [summary] to institutional-memory/KNOWLEDGE_ARCHIVE.md#[section]`. Triggers: novel problem solutions · new development patterns · architectural decisions · anti-patterns identified · debugging procedures refined.

---

## 4. Cross-Referencing

**Rule:** Link to relevant estate documents and sections: playbooks by name and anchor, the knowledge archive for durable patterns, working context for the current task, the evidence archive for history. Maintain navigation paths across memory tiers. Avoid hard-coding implementation file paths and line numbers in estate docs; those belong in code comments or commit messages, where they move with the code.

---

## 5. Pre-Compact Documentation

**Rule:** Pre-compact consolidation (learnings review, working-context reset, status finalisation) is owned by CD #9; this playbook adds only that all pre-compact drafts are presented for the User's review before any write.

---

## 6. Estate Hygiene Compliance

All documentation work respects the estate's attention architecture. These rules prevent the bloat and stale-state problems that degrade agent effectiveness over time.

- **Working context updates:** session-focused only. No implementation history, no completed-slice detail, no accumulating lists of past work. If it's done, move it out.
- **Knowledge graduation:** abstract patterns only. Extract the reusable principle, discard the session specifics.
- **Status documentation:** current state and next actions only. STATUS.md tells an agent what is true *now*.
- **Cross-reference integrity:** maintain navigation paths during any content moves. Moving a file without updating its inbound links creates a silent failure.

## 7. Documentation Quality Standards

Use as a checklist when creating or reviewing estate documentation:

- **Behavioural requirements:** does the document specify what to do and when? Clear triggers ("do X when Y") outperform vague guidance ("consider X").
- **Decision points:** are triggers and choice criteria explicit? An agent should know when a rule applies without interpreting ambiguous conditions.
- **Cognitive load:** is the document scannable? Progressive disclosure beats wall-of-text. If an agent needs 80 lines to find the current task, the document is too long.
- **Tier separation:** procedural guidance in protocols, evidence in the archive, current state in working-context.

## 8. The Frozen-Memo Convention {#frozen-memo-convention}

**Rule:** Every session of substance — a discovery, an investigation, a design decision, a completed slice — banks a dated memo in `../../memory-prosthesis/evidence-archive/{type}-{topic}-{YYYY-MM-DD}.md`. Durable insights graduate from the memo into the appropriate active-knowledge or institutional-memory document. **The memo itself stays frozen** as evidence of how the insight was reached; it is never rewritten as understanding matures. New sessions produce new memos that reference earlier ones.

**Why this exists:** insights that emerge mid-conversation (reframings, corrections, market evidence, decision rationale) evaporate on context compaction if not captured. The convention was established in the origin estate in May 2026 when a discovery session surfaced three insights that materially reshaped product direction, and it became that estate's most-exercised pattern.

**Memo spine** (fit to the memo's type): header (date, mode, active playbooks) · the question and the prior held coming in · approach and why · what emerged · options considered and rejected · the decision and reasoning · evidence anchors · open questions and next steps · status (open / converged / superseded).

**Graduation rule:** durable insights → active knowledge · time-bound facts → working context · derived work items → the backlog, cross-referenced to the memo. An ERRATUM note may be ADDED to a frozen memo when a claim in it is later disproven (so the error cannot be re-inherited); that is the one permitted touch.

---

## Additional Guidelines

- **Current-focus integration:** documentation work aligns with the current task and success criteria.
- **User validation:** significant documentation changes are presented for review: "Documentation updated for [X]. Please review and confirm accuracy."
- **Version control:** documentation follows the same commit standards as code (`docs(scope): …`), with related changes grouped.
- **Maintenance:** keep documentation current with reality; remove outdated information promptly; update cross-references when structure changes.
