---
description: the project's standards for making changes; one logical change at a time, a test plan before non-trivial changes, no scope creep, and a verification checklist fitted to the project
type: convention
date: 2026-10-07
governs: [implementation, change-discipline]
last_verified: 2026-10-07
status: template
---

# CHANGE_STANDARDS.md

> **Moved here on 2026-10-07** from `framework/playbooks/INCREMENTAL_EXECUTION_PLAYBOOK.md`, under the reshape plan recorded in this repository's own Memento files (`memento/memory-prosthesis/evidence-archive/plan-reshape-memento-2026-10-06.md`, batch 1). A playbook is put in front of the assistant when the work calls for it. This content is a standard, which holds whatever model does the work, so it lives with the conventions. Nothing of substance was dropped: the former sections 3, 3-bis and 4 restated core directives, so section 3 now points to them.

> **Where this comes from:** the original project's 2026-07-04 form (a roadmapping tool for team capacity), by way of a newly started project's fitting (a tool for mapping an organisation, 2026-07-09 form), which contributed the adversarial-review step in its settled form (now CD #14, pointed to from §3). The commit-level evidence is in the projects' private histories. Changes on this import: the project's own verification checklist (§6) turned into a slot, showing the two shapes proven in use; project-specific sections (a protocol for restarting the development server) dropped; phrasing fitted to this repository's writing rules.

**Objective:** carry out approved changes in small steps that can each be checked, with the User checking each one, across all implementation work (code, prompts, schemas, documentation, configuration, refactoring).

---

## 1. One Logical Change Rule

**Rule:** Each implementation response addresses ONE small, logical, testable part of the approved plan or task in `../working-context/CURRENT_FOCUS.md`. Announce the specific sub-task before beginning:

```
Sub-task: [what]
Scope: [which files/components, what change]
```

**Why:** it prevents scope creep, makes debugging easier, and lets each step be checked on its own.

---

## 2. Theory & Test Plan First (for non-trivial changes)

This is a procedure for a particular moment. Where your assistant supports skills (Claude Code and Codex both do), it suits packaging as a skill that comes into play when a non-trivial change begins.

**Rule:** Before implementing a sub-task, state: `HYPOTHESIS: [brief theory of change] based on EVIDENCE: [plan approval/requirement]`. Then: `TEST_PLAN: Change [X] in [File Y] should result in [Observable Outcome Z]. The User to verify by [Action W]`.

---

## 3. Checking, Review and Commit

These steps are set by the core directives: the User confirms before anything is called done (CD #2); non-trivial work goes through an independent adversarial review first (CD #14); each confirmed logical unit is committed straight away with an explicit file list (CD #10 and `GIT_STANDARDS.md`), after the pre-commit checks your project names (`GIT_STANDARDS.md` §3, where any failure stops the commit), and the working context is kept coherent (CD #11). After the commit, state: "Logical change committed. Safe to proceed to next increment." **Why:** each commit is a restore point for safe step-by-step work; it protects the work against context loss, and makes rollback possible.

*(Section 4 is retired: it restated CD #10, and its content is in §3 above.)*

---

## 5. No Scope Creep

**Rule:** Address only the current sub-task. Note related improvements as `NOTE_FOR_LATER: [detail]` and leave them unimplemented. At the end of the session, move the NOTE_FOR_LATER items to `BACKLOG.md` in active knowledge for systematic review.

---

## 6. Verification Checklist (fitted to your project)

**Rule:** After each step, run the checklist your project's evidence constitution (CD #13) names: small failures are failures you can trace to their cause. This section is a slot. Write the checklist for YOUR project, and add automated enforcement (pre-commit hooks, fixed test examples) when incidents or growth show it is needed.

The two shapes proven in use, for reference:

- **A web application:** type-check → full test suite (with a check on the intent of a test before anyone edits it) → lint → a visual or layout baseline for visual changes (a passing unit suite is no evidence that the layout is right) → a full build only when safe. The original project added the test step after a root-cause analysis of a broken test that had shipped; checklists grow by incident.
- **A data pipeline:** the schema check passes on a known-good test example → the confidentiality check is clean → for changes that affect extraction, re-run the fixed reference test (a gold-standard fixture) and compare the result with its saved output, reporting any regression to the User → row-level checks for changes to what is stored → style and repetition checks on generated output.

---

## Additional Guidelines

- **Working context:** refer to the current task and its success criteria; stay within the stated constraints; update progress after each sub-task.
- **[Language standard]** for all internal text.
- **Error handling:** on an unexpected failure, present the evidence and a hypothesis before proposing fixes (evidence-first debugging); do not continue implementation until the issue is resolved.
