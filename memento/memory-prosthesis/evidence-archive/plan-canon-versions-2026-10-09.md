---
description: plan to mark the canon with fixed, never-moved version tags, each with a change note, so the site and build-protocols build against a stable version while active estates keep changing main; the first tag is v2026.10
type: plan
date: 2026-10-09
genre: build/change (3A)
size: S (three slices)
status: APPROVED 2026-10-09 (the User: "approve"); in progress
related: [plan-reshape-memento-2026-10-06, handover-memento-instances-2026-10-08, GIT_STANDARDS, PLANNING_PLAYBOOK]
---

# Plan: canon version tags

## Origin and authority

On 2026-10-09 the User described the Memento instances:
- the published canon;
- project estates ranging from very active, through dormant, to finished;
- the website and build-protocols, which are active but paused while the canon's shape changes.

I proposed tagging the canon. Build-protocols/dev gave its view on request (message m-20261009-154955-7766eb). The User replied "yes if we have a robust 'plan'".

## Pattern Search Results

- **The repository has no tags.** No changelog or release-note file exists in the canon either.
- **Build-protocols already pins one commit.** Its explainer page is pinned to `1c8adfc` (2026-10-03). Its links check compares the pin with `origin/main` and fails when a cited file changes. On 2026-10-08, 7 of the page's 11 cited files had changed.
- **Changes since `1c8adfc`:**
  - 11 commits outside `memento/` (5 `docs(canon)`, 4 `fix(canon)`, 2 that touch both);
  - 24 files, including the git hooks and `.claude/settings.json` from the leak hardening.
- **The pre-push gate already sweeps tags.** `memento/tools/confidentiality-sweep.sh --pre-push` sweeps every tag object on a pushed ref, and the tag's text with it.
- **CD #4a** makes every push the User's. **CD #4g** makes destructive git operations the User's, and moving or deleting a tag is one.

## Problem / purpose

The site and build-protocols need a canon that holds still while they write about it. The active estates need the canon to keep changing. A tag gives the site a fixed version. Main stays free to move. The site moves to a newer tag only when the User says so.

## Posture

Predictive: the work is small, mechanical and well specified. There is one feedback point: the User sees the change note at the push gate, before anything is published.

## Scope and slices

**In scope:**

1. **The tag convention and the first change note** (one `docs(canon)` commit).
   - **`framework/conventions/GIT_STANDARDS.md` gains a short section on version tags.** Tags are:
     - annotated, and named `vYYYY.MM`, with `.N` added for a second tag in the same month;
     - made at the close of a change set;
     - pushed by the User;
     - never moved or deleted (CD #4g), so a mistake is fixed by a later tag.
   - **A new root file `CHANGES.md`** lists each tag, newest first. The first entry, `v2026.10`:
     - summarises the reshape (three playbooks became standards, CD #1, the imported practices, CD #4g, directives dated and revisable, the tier-map fixes);
     - lists the changed canon files since `1c8adfc`, with one line on what changed in each.
2. **Independent review, then the tag.**
   - **Review:** one reviewer (smart tier, read-only), run in sequence. It checks every line of the note against `git diff 1c8adfc..HEAD`, and checks the new text for CD #5 breaches. The review record ends with its counts line.
   - **The tag:** after the fixes, I create the annotated tag `v2026.10` locally, on the commit that contains the note. The tag message is one line that points to `CHANGES.md`.
3. **The push and the hand-off.**
   - **The push:** the User pushes `main` and the tag (`git push origin main v2026.10`), and the pre-push sweep runs.
   - **Checks after the push:** I confirm the tag on the remote resolves to the intended commit.
   - **Build-protocols:** one message to build-protocols/dev with the tag and its commit hash.
   - **The estate:** CURRENT_FOCUS records the tag convention as a constraint.
   - **Records:** each slice record ends with its counts line.

**Consciously out of scope:**
- the change to build-protocols' links check (theirs, on the User's approval in their session);
- their re-sync of the page;
- the User's open ruling on `adoption/` for the page's How to start;
- the deferred dual-thread governance unit;
- tags in any other repository;
- GitHub releases;
- the untracked leftovers in this working tree.

## Risks

- **A wrong tag gets pushed.** A tag is never moved, so the fix is a later tag (`v2026.10.1`) whose note names the error. Two guards make this unlikely: the review, and the User seeing the note at the push gate.
- **The change note is inaccurate.** The review checks every line against the diff.
- **The note leaks private detail**, such as figures or names from private estates. It describes canon changes only, the sweep runs at commit and at push, and the imported practices are described as they already stand in the cleared canon text.
- **The tag also covers the estate.** The estate is published with the canon (posture (i)), so this adds no exposure.
- **The tag goes stale.** That is intended. A new tag at the next change set's close, on the User's word, refreshes it.

## Verification discipline

| Slice | Witness |
|---|---|
| 1 | pre-commit sweep clean; the diff shows only the two files; slice counts line |
| 2 | review record with its counts line; `git show v2026.10` names the intended commit and message |
| 3 | pre-push sweep clean; `git ls-remote --tags origin` shows `v2026.10` at the intended commit; build-protocols/dev confirms the tag resolves for them |

## Estimated Effort

S. Slice 1 is the largest, because the note's file list must be exact. Slices 2 and 3 are small.

## The User's approval gate

Awaiting user approval of this plan before detailed design or implementation.

## Implementation record

**Order changed from the plan, on the main thread's judgement:** the review ran before the canon commit, so its fixes land in the commit the tag names. That avoids a second commit after the tag.

### Slice 1 (2026-10-09)

**What was written:**
- `framework/conventions/GIT_STANDARDS.md`: §8 Version Tags; `governs` gains `version-tags`; `last_verified` 2026-10-09.
- `CHANGES.md` at the repository root: the `v2026.10` entry, covering the 24 changed paths since `1c8adfc` and itself.

Slice counts (2026-10-09, author claude-opus-5-5, scout -): new controls 0 · faults by suite or mutants - · defects in shadow - · unsanctioned scope changes 0 · scout reports 0 · scout reports corrected 0

### Review record (r1, 2026-10-09, smart tier, read-only): NEEDS-CHANGES; every finding accepted

**Completeness:** passed; all 24 paths are listed, with none extra.

**Material findings, fixed:**
1. §8 cited CD #4a for tag pushes, which CD #4a does not state, and contradicted §2's free push for private repositories. A tag now follows §2's rule for its repository.
2. "Never moved or deleted (CD #4g)" misstated CD #4g, which reserves those operations for the User and does not forbid them. A tag is now final, and only the User may move or delete one.
3. The CD #1 line did not say that the instruction to follow the named playbook strictly was removed.
4. The note did not say that "Immutable" and "fixed" were dropped from the title and closing line.
5. The settings line overstated the prompt hook, which fires only when a prompt asks for a restart.

**Wording findings, fixed:**
- **Line completeness:** the hooks line; the "moved" lines (type and paths); the objective and CD #9a lines; the estate spine line; the runtime-dependency line.
- **Accuracy:** an inexact quotation; the scope statement; the unverified "recorded there".
- **§8 itself:** the frontmatter; "change set" defined; a project-specific dated note made generic.
- **Contrast frames:** three in new text, restated.

Review counts (r1, 2026-10-09, author claude-opus-5-5, reviewer claude-sonnet-5-5): material findings 5 · accepted 14 · refuted 0 · unsupported claims 2 · writing-rule breaches 3
