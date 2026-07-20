---
description: governs git operations — single-home convention, push posture by repo class, branch confirmation, commit standards, user-executed merges, honest annotation of corrections
type: governing
date: 2026-07-20
governs: [git-operations, push-posture, commit-discipline]
last_verified: 2026-07-20
status: template
---

# GIT_OPERATIONS_PLAYBOOK.md

> **Provenance:** the origin estate's 2026-07-04 form (a team-capacity roadmapping tool), whose branch conventions carry incident-receipted lessons, via a fresh-founded estate's compact fitting 2026-07-06, which adopted those lessons as founding convention rather than retrofit. Commit-level receipts live in the deployments' private histories. Fitting changes on this import: deployment identifiers generalised; push posture restated as a decision by repo class (the three classes are receipted across three live deployments and this public canon repo); the honest-annotation practice promoted to its own section; 2025-era filler sections (branch-type glossary, CI coordination boilerplate) dropped in favour of the compact form.

**Objective:** Clean, safe, understandable git history through systematic branch management and user-controlled operations.

---

## 1. Single-Home Convention

**One branch is the single source of truth for product AND estate, from birth.** This is the lineage's hard-won lesson: one deployment once split its truth across two homes (docs on one branch, code on a worktree branch), routing artefacts by *medium* rather than by *product*. The estate forked, the working context split into two divergent "truths", and the split was held together only by a manual session-start merge ritual, which lapsed within a day. Consolidation cost a slice; the convention costs nothing.

- Feature branches (`type/short-description`, kebab-case) are for explicitly opened separate lines of work only, NOT the default.
- A production or deployment branch, where one exists, is a different class of thing: see §2.
- The estate is edited on the single home ONLY. A copy nobody edits is an archive. A copy two threads edit is a fork waiting to happen.

## 2. Push Posture (by repo class)

Posture follows what a push *does*, decided per branch and written down:

| Repo/branch class | What a push is | Posture |
|---|---|---|
| Private, deployment-unbound | Off-machine backup | **Push freely and often.** Target a push at the end of every working session. *(Lineage receipt: a two-week, ~300-commit unpushed backlog once lived only on local disk.)* |
| Deployment-bound branch | A deploy | **Gated:** the User's explicit approval per push, ideally mechanically enforced (the lineage's prod-push gate earned its keep on the validation ledger). |
| Public repository | Publication — the one-way door | **User-only, no exceptions.** No mechanism substitutes for the human holding this gate. |

The rule of thumb underneath: push the safe branch freely; gate every branch where a push has consequences beyond backup.

## 3. Branch Confirmation & Commit Standards

- **Confirm the active branch** before branch-specific operations; state the expected branch and verify on any ambiguity. Never assume branch state after context switches or long sessions.
- Format: `type(scope): concise summary` — imperative mood, [your language standard]. Types: feat / fix / docs / refactor / test / chore. Where multiple threads or surfaces share the repo, the scope declares which one.
- **Stage with explicit pathspecs built from the work's own file list.** Never a bare `git commit -a`, and never a pathspec derived from `git status`: the lineage's near-miss was a dirty-state glob that swept a concurrent thread's files into a commit.
- [Your pre-commit checks here: confidentiality lint, type-check, test suite — whatever your estate's evidence constitution names. A hit is a hard stop.]

## 4. User-Executed Merges

The agent prepares branches for merge: clean history, checks green, strategy proposed. **The User executes `git merge`.** History rewrites (rebase, amending pushed commits, force-push) are User-only (CD #4).

## 5. Stashing

Context switch mid-work → `git stash push -m "[description]"`; communicate what was stashed and why, and remind on return.

## 6. Emergency Recovery

Never attempt destructive git operations autonomously. Present recovery options with risks; the User decides.

## 7. Honest Annotation of Corrections

When a rule in this playbook is found wrong or overtaken, correct it **in place, dated, with the reason**: *"(§N corrected YYYY-MM-DD — the old wording predated convention X and contradicted §M.)"* The lineage's git law carries several such annotations, and they are why its history of self-correction is auditable at all. A silently rewritten rule reads as if it were always right, which is exactly the record a governance document must not fake.
