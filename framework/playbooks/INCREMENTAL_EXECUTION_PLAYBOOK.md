---
description: governs carrying out approved changes in small steps that can each be checked, with the User's approval at each step and an adversarial review before presentation, across code, documentation and configuration
type: governing
date: 2026-07-20
governs: [incremental-execution, validation-gates, increments]
last_verified: 2026-07-20
status: template
---

# INCREMENTAL_EXECUTION_PLAYBOOK.md

> **Where this comes from:** the original project's 2026-07-04 form (a roadmapping tool for team capacity), by way of a newly started project's fitting (a tool for mapping an organisation, 2026-07-09 form), which contributed the adversarial-review step in its settled form (§3-bis). The commit-level evidence is in the projects' private histories. Changes on this import: the project's own verification checklist (§6) turned into a slot, showing the two shapes proven in use; project-specific sections (a protocol for restarting the development server) dropped; phrasing fitted to this repository's writing rules.

**Objective:** carry out approved changes in small steps that can each be checked, with the User checking each one, across all implementation work (code, prompts, schemas, documentation, configuration, refactoring).

---

## 1. One Logical Change Rule

**Rule:** Each implementation response addresses ONE small, logical, testable part of the approved plan or task in `../../memory-prosthesis/working-context/CURRENT_FOCUS.md`. Announce the specific sub-task before beginning:

```
Sub-task: [what]
Scope: [which files/components, what change]
```

**Why:** it prevents scope creep, makes debugging easier, and lets each step be checked on its own.

---

## 2. Theory & Test Plan First (for non-trivial changes)

**Rule:** Before implementing a sub-task, state: `HYPOTHESIS: [brief theory of change] based on EVIDENCE: [plan approval/requirement]`. Then: `TEST_PLAN: Change [X] in [File Y] should result in [Observable Outcome Z]. The User to verify by [Action W]`.

---

## 3. User Validation Before Commit

**Rule:** After presenting the implementation, state: 'Changes implemented for [specific change]. Please test [Y and Z]. Expected outcome: [A, B].' Wait for confirmation; any clear affirmative is enough. **Never use words of finality** ("Done", "Complete", "Fixed") before the User has explicitly confirmed.

### 3-bis. Adversarial Review Gate (CD #14)

**Rule:** Non-trivial steps (anything that counts as a finding, a verdict, a prompt change, a pipeline change or an edit to a governing document) go through an independent adversarial review BEFORE they are presented for the User's check. The reviewer starts by assuming the work has faults and is chosen per RESOURCE_ROUTING (smart tier by default). The presentation records a decision on each of the reviewer's findings. Trivial mechanical edits declare the exemption aloud: "No review: trivial mechanical edit".

---

## 4. Mandatory Commit Step

**Rule:** After the User confirms a change, commit that logical unit straight away, per `GIT_OPERATIONS_PLAYBOOK.md`:

a. Run [your pre-commit checks: confidentiality check, type-check, tests; any failure stops the commit].
b. Stage only the files of this logical unit (an explicit file list).
c. Commit message: `type(scope): concise summary`, in [your language standard].
d. If the step changed the project's Memento files, keep the working context coherent (CD #11).
e. State: "Logical change committed. Safe to proceed to next increment."

**Why:** each commit is a restore point for safe step-by-step work; it protects the work against context loss, and makes rollback possible.

---

## 5. No Scope Creep

**Rule:** Address only the current sub-task. Note related improvements as `NOTE_FOR_LATER: [detail]` and leave them unimplemented. At the end of the session, move the NOTE_FOR_LATER items to `../../memory-prosthesis/active-knowledge/BACKLOG.md` for systematic review.

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
