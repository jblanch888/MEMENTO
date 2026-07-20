---
description: governs execution of approved changes in small verifiable increments with user validation gates and an adversarial-review step, across code, documentation and configuration
type: governing
date: 2026-07-20
governs: [incremental-execution, validation-gates, increments]
last_verified: 2026-07-20
status: template
---

# INCREMENTAL_EXECUTION_PLAYBOOK.md

> **Provenance:** the origin estate's 2026-07-04 form (a team-capacity roadmapping tool) via a fresh-founded estate's fitting (an organisational cartography instrument, 2026-07-09 form), which contributed the crystallised adversarial-review gate (§3-bis). Commit-level receipts live in the deployments' private histories. Fitting changes on this import: the host verification checklist (§6) generalised to a fitting slot with the two field-proven shapes shown; host-specific sections (dev-server restart protocol) dropped; phrasing fitted to the canon's writing rules.

**Objective:** Execute approved changes in small, verifiable increments with systematic user validation across all implementation work (code, prompts, schemas, documentation, configuration, refactoring).

---

## 1. One Logical Change Rule

**Rule:** Each implementation response addresses ONE small, logical, testable part of the approved plan/task in `../../memory-prosthesis/working-context/CURRENT_FOCUS.md`. Announce the specific sub-task before beginning:

```
Sub-task: [what]
Scope: [which files/components, what change]
```

**Why:** prevents scope creep, enables easier debugging, and allows incremental validation.

---

## 2. Theory & Test Plan First (for non-trivial changes)

**Rule:** Before implementing a sub-task, state: `HYPOTHESIS: [brief theory of change] based on EVIDENCE: [plan approval/requirement]`. Then: `TEST_PLAN: Change [X] in [File Y] should result in [Observable Outcome Z]. The User to verify by [Action W]`.

---

## 3. User Validation Before Commit

**Rule:** After implementation is presented, state: 'Changes implemented for [specific change]. Please test [Y and Z]. Expected outcome: [A, B].' Await confirmation — any clear affirmative suffices. **Never use finality terms** ("Done", "Complete", "Fixed") before explicit user validation.

### 3-bis. Adversarial Review Gate (CD #14)

**Rule:** Non-trivial increments — anything qualifying as a finding, verdict, prompt change, pipeline change, or governing edit — pass an independent adversarial review (assume-failure posture, smart-tier reviewer per RESOURCE_ROUTING) BEFORE presentation for user validation. Reviewer findings are dispositioned explicitly in the presentation. Trivial mechanical edits claim the exemption aloud: "No review: trivial mechanical edit".

---

## 4. Mandatory Commit Step

**Rule:** After the User confirms a change, immediately commit the logical unit per `GIT_OPERATIONS_PLAYBOOK.md`:

a. Run [your pre-commit checks: confidentiality lint, type-check, tests — a hit is a hard stop].
b. Stage only the files of this logical unit (explicit pathspecs).
c. Commit message: `type(scope): concise summary`, [your language standard].
d. If the slice changed estate files, keep working-context coherent (CD #11).
e. State: "Logical change committed. Safe to proceed to next increment."

**Rationale:** restore points for safe incremental development; preserves work against context loss; enables rollback.

---

## 5. No Scope Creep

**Rule:** Address only the current sub-task. Related improvements are noted as `NOTE_FOR_LATER: [detail]`, not implemented. Transfer NOTE_FOR_LATER items to `../../memory-prosthesis/active-knowledge/BACKLOG.md` at session close for systematic review.

---

## 6. Verification Checklist (host-fitted)

**Rule:** After changes, run the checklist your estate's evidence constitution (CD #13) names, per increment: small failures are attributable failures. This section is a slot; write the checklist for YOUR host and let it grow teeth (pre-commit hooks, fixtures) when incidents or scale earn them.

The two field-proven shapes, for reference:

- **Web-application host:** type-check → full test suite (with a test-intent gate before any test edit) → lint → visual/spatial baseline for visual changes (a passing unit suite is not evidence of spatial correctness) → full build only when safe. The lineage added the test step by root-cause analysis after shipping a broken test; checklists grow by incident.
- **Pipeline host:** schema gate green on a known-good fixture → confidentiality lint clean → for extraction-affecting changes, re-run the gold-standard fixture and diff against its banked output, surfacing any regression to the User rather than absorbing it → row-level verification for persistence changes → style/dryness lints on generated output.

---

## Additional Guidelines

- **Working-context integration:** reference the current task and success criteria; stay within stated constraints; update progress after each sub-task.
- **[Language standard]** for all internal text.
- **Error handling:** on unexpected failure, present evidence and hypothesis before proposing fixes (evidence-first debugging); do not continue implementation until the issue is resolved.
