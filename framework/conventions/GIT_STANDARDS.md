---
description: the project's git standards; one branch as the single home, when to push by type of repository, confirming the branch, commit standards, merges carried out by the User, stashing, recovery, and dated notes on corrections
type: convention
date: 2026-10-07
governs: [git-operations, push-posture, commit-discipline]
last_verified: 2026-10-07
status: template
---

# GIT_STANDARDS.md

> **Moved here on 2026-10-07** from `framework/playbooks/GIT_OPERATIONS_PLAYBOOK.md`, under the reshape plan recorded in this repository's own Memento files (`memento/memory-prosthesis/evidence-archive/plan-reshape-memento-2026-10-06.md`, batch 1). A playbook is put in front of the assistant when the work calls for it. This content is a standard, which holds whatever model does the work, so it lives with the conventions. Nothing of substance was dropped.

> **Where this comes from:** the original project's 2026-07-04 form (a roadmapping tool for team capacity), whose branch conventions carry lessons learned from real incidents, by way of a newly started project's compact fitting on 2026-07-06, which adopted those lessons from its founding. The commit-level evidence is in the projects' private histories. Changes on this import: identifiers generalised; when to push restated as a decision by type of repository (the three types are backed by evidence from three projects and this public repository); dated notes on corrections given their own section; filler sections from 2025 (a glossary of branch types, boilerplate on coordinating with CI) dropped for the compact form.

**Objective:** a clean, safe, understandable git history, through systematic branch management and operations the User controls.

---

## 1. Single-Home Convention

**One branch is the single source of truth for both the product and its Memento files, from the start.** The projects learned this the hard way. One project once split its truth across two homes (documents on one branch, code on another branch in a separate working copy), sorting files by *type* when they belonged together by *product*. Its Memento files forked, the working context split into two conflicting accounts, and the split was held together only by a manual merge at the start of each session, which lapsed within a day. Consolidating cost a slice of work; the convention costs nothing.

- Feature branches (`type/short-description`, kebab-case) are only for separate lines of work that someone has explicitly opened. They are NOT the default.
- A production or deployment branch, where one exists, is a different kind of thing: see §2.
- The Memento files are edited on the single home ONLY. A copy nobody edits is an archive. A copy two threads edit is a fork waiting to happen.

## 2. When to push (by type of repository)

The rule follows what a push *does*, decided for each branch and written down:

| Repository or branch | What a push is | Rule |
|---|---|---|
| Private, not tied to a deployment | A backup off this machine | **Push freely and often.** Aim to push at the end of every working session. *(From the projects: a two-week backlog of about 300 unpushed commits once existed only on a local disk.)* |
| Tied to a deployment | A deploy | **Needs approval:** the User's explicit approval for each push, ideally enforced automatically (the projects' production-push check proved its worth in the validation ledger). |
| Public repository | Publication, whose disclosure cannot reliably be reversed | **For the User alone, no exceptions.** No automated check replaces the human making this decision. |

The rule of thumb underneath: push the safe branch freely, and require approval on every branch where a push does more than make a backup.

## 3. Branch Confirmation & Commit Standards

- **Confirm the active branch** before branch-specific operations; state the expected branch, and check whenever there is doubt. Never assume the branch after switching context or during a long session.
- Format: `type(scope): concise summary`, in the imperative mood, in [your language standard]. Types: feat / fix / docs / refactor / test / chore. Where several threads or areas share the repository, the scope says which one.
- **Stage with an explicit file list (pathspec) built from the work's own files.** Never a bare `git commit -a`, and never a list derived from `git status`: the projects' near-miss was a pattern matching the working tree's changed files, which swept another thread's files into a commit.
- [Your pre-commit checks here: confidentiality check, type-check, test suite, whatever your project's evidence constitution (CD #13) names. Any failure stops the commit.]

## 4. Merges Carried Out by the User (the User's operations, CD #4)

The assistant prepares branches for merging: a clean history, passing checks, a proposed strategy. **The User runs `git merge`.** History rewrites (rebase, amending pushed commits, force-push) are for the User alone (CD #4).

## 5. Stashing

When switching context in the middle of work, run `git stash push -m "[description]"`; say what was stashed and why, and mention it again on return.

## 6. Emergency Recovery (the User's operations, CD #4)

Never attempt destructive git operations on your own. Present the recovery options with their risks; the User decides.

## 7. Dated Notes on Corrections

When a rule in these standards is found to be wrong or out of date, correct it **in place, with the date and the reason**: *"(§N corrected YYYY-MM-DD: the old wording predated convention X and contradicted §M.)"* The original project's git rules carry several such notes, and they are why its history of correcting itself can be checked at all. A rule rewritten silently reads as if it had always been right, and a governing document must never give that false impression.
