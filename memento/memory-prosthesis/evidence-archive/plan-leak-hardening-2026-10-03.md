---
description: plan to harden the estate against confidential material reaching the public repository, now that other Memento instances send lessons and messages into these sessions; the sweep is rebuilt to cover everything a push publishes and to fail closed, and CD #4e is amended to name the new channels
type: plan
date: 2026-10-03
genre: build/change (3A) with a design/decision step (3C) for the directive
size: L (four slices: 1a, 1b, 1c, 2)
status: CLOSED 2026-10-06 on the User's word ("close"); APPROVED 2026-10-03; all slices implemented and validated by the User 2026-10-03
related: [CORE_DIRECTIVES, PLANNING_PLAYBOOK, TOOLING_TRIGGERS, KNOWLEDGE_ARCHIVE, CURRENT_FOCUS, finding-publication-readiness-2026-07-20, handover-publication-and-hardening-2026-07-21, plan-truth-and-presentation-2026-07-21]
---

# Plan: leak hardening

**APPROVED 2026-10-03** (the User: "approve", on draft r3 with decisions D1 to D4 as proposed: D1 yes, D2 yes, D3 deferred with the manual `gh` sweep in the meantime, D4 cleared). D5 is ruled at slice 2.

## Origin and authority

- **The User, 2026-10-03, confirming posture (i):** "no absent a good reason lets stick with the original decision. however we need to be vigilant wrt potential data leaks as heavy parallel development is ongoing in memento instances". He added that there is much to learn from those instances and apply here, and that confidential material from them must stay out of the public repository.
- **The User, 2026-10-03:** asked whether the hardening needs a plan under the playbook; on the answer (one plan), "yes".
- **Evidence inputs**, read first-hand this session: `memento/tools/confidentiality-sweep.sh`, `.githooks/pre-push`, the sweep's row in `TOOLING_TRIGGERS.md`, the two July publication memos, the knowledge-archive entry *The sweep runs last, on the final tree*, `CURRENT_FOCUS.md` (its constraint on the sweep), and Rooms' `memento/tools/token-sweep.py` (read only).
- **Review record:** two adversarial review rounds (smart tier) on 2026-10-03: 16 findings on r1 and 8 new findings on r2, all accepted. The load-bearing ones were re-checked first-hand before acceptance. Dispositions are in § Review record.

## Pattern Search Results

- **The sweep's own history:** earned by incident on 2026-07-21, when banned literals were published inside the memo that documented their banning. Register row: the allow arm is live-witnessed. The block-on-hit arm is bench-proven and awaits a live witness.
- **The July practice swept history by hand:** `finding-publication-readiness-2026-07-20.md`, Sweep 2, swept the full diffs of every unpushed commit (25 commits, 4,324 lines), because a push publishes history as well as the tree. The tool greps the working-tree copy of tracked files. This plan mechanises what July did by hand.
- **Rooms' token-sweep.py (2026-09-19)** carries three design choices worth adopting: output limited to counts, paths and line numbers; a second, case-sensitive list (`~/.memento/banned-tokens-cs.txt`); and a separate exit code for "cannot run". Adopting the design is an import from a deployment estate (CD #4e). The file holds no confidential material, its lists live outside the repository, and the code here is written fresh. Clearance is asked for explicitly at the approval gate (decision D4).
- **Knowledge archive:** *The sweep runs last, on the final tree* is the lesson this plan widens. A push publishes the final tree, the commit history, commit and tag messages, author names and ref names.
- **The July ruling on pushed history:** history rewriting was ruled out (`finding-publication-readiness-2026-07-20.md`); the standing recommendation is leave, and reopening is the User's alone (`handover-publication-and-hardening-2026-07-21.md`). This plan leaves that ruling as it stands.

## Problem Statement

Gaps found on 2026-10-03, each with its receipt. Commit hashes for the published residue stay out of this file (the July memos give none, and a hash here would point a reader at it); they are held in the session record.

1. **The sweep reads the working tree.** A token committed and later removed passes the sweep and is published in history; a cleaned working copy also hides a committed token. Receipt: the July publication-memo commit carries four matching added lines in pushed history, and older 2025 commits carry more.
2. **Commit messages, tag messages, author names and ref names go unswept.** Receipt: published 2025 commit messages match the list.
3. **The sweep fails open on a bad pattern.** `confidentiality-sweep.sh:29` discards grep's errors (`2>/dev/null || true`); a list with an unbalanced bracket reports clean with exit 0.
4. **The case-sensitive list is unread here.** Rooms reads it.
5. **A hit prints the matched line**, which puts the token in the terminal and the session transcript, where it can be copied into the next document.
6. **Binary and non-UTF-8 files are skipped silently.** The likeliest shape of a work leak is an office document, a PDF or a UTF-16 file.
7. **CD #4e names imports from the deployment estates.** The channels that now carry material into these sessions are unnamed: agent-messaging messages from other instances, lessons relayed from them, and tool copies passed between them.
8. **The banned lists have no refresh step.** They were last changed on 2026-09-19, and new instances now feed in.

The sweep matches listed words. A judgement pass covers paraphrase, unlisted names and figures, and the directive is what governs that pass.

## Proposed Solution Overview

Four slices, WIP of one.

- **Slice 1a (the push gate and its tests):** rebuild the sweep to cover everything a push publishes, fail closed on every error, read both lists, and print no matched content.
- **Slice 1b (further modes):** the commit-time sweeps (D1), the sweep of what is already published (D2) and the redacted view, each with its tests. Slice 1b shrinks to the redacted view alone if D1 and D2 are declined.
- **Slice 1c (the documents):** bring the hook comment, tools README, register row, CURRENT_FOCUS constraint and knowledge-archive entry into line with the new tool.
- **Slice 2 (the directive):** amend CD #4e to name the new channels and a list-refresh step; the User chooses among options and rules the wording.

## Key Components/Changes

### Slice 1a: the push gate and its tests

`memento/tools/confidentiality-sweep.sh`, rewritten in place (same path, same hook entry point):

- **Modes, explicit.** `--pre-push <remote> <url>` (called by the hook, which passes git's arguments through) and `--range <rev-range>` for standalone runs. Mode detection uses the flag only; a run without a mode flag prints usage and exits 2. If the hook's first argument is a URL, it is resolved to a configured remote name, and an unresolvable URL exits 2.
- **Outgoing set, scoped to the push's remote.** For each stdin ref line: deletions skipped; the outgoing commits are `git rev-list <local_sha> --not --remotes=<remote>`, also excluding `remote_sha` when it is known locally (a remote-tracking ref can be stale). An unknown remote sha (a force push) leaves the remote-scoped form in place. All-zero shas are recognised at both lengths (SHA-1 and SHA-256). Exit codes accumulate across refs as the maximum (2 above 1 above 0).
- **What is swept:**
  - **file content, whole-blob semantics:** every blob that an outgoing commit adds or changes, taken per commit from `git diff-tree -r -m --no-renames` (so merges, renames and add-then-delete are covered and each hit names its commit), read with `git cat-file`, and swept in full. Whole-blob is the chosen semantic: a token anywhere in a new version of a file blocks, whether on a changed line or an unchanged one. The current tree holds no listed token, so already-published residue sits only in old blobs and does not re-block;
  - commit messages, author and committer names and emails of every outgoing commit;
  - annotated-tag messages and tagger, ref names and tag names on the stdin lines;
  - every path an outgoing commit adds or changes, taken from the same `diff-tree` listing (this covers a new path that points at an already-published blob).
- **One regex engine and one locale, pinned.** Blob content and text fields go through `/usr/bin/grep -E` (`-i` for the first list, case-sensitive for the second) under an explicitly set UTF-8 `LC_ALL`. Patterns reach grep by process substitution (`-f <(…)`), so they stay off the command line, out of process listings and error messages, and off disk.
- **Fail closed.** `set -euo pipefail`; grep's exit 1 (no match) and exit 2 (error) are kept distinct; any git or grep error gives exit 2. Exit codes: 0 clean, 1 hit, 2 cannot run. The hook blocks on any non-zero.
- **Lists.** The first list is required. The second is required by default, with `MEMENTO_NO_CS_LIST=1` as the explicit opt-out. Comment lines, blank lines, CR and trailing space are stripped (a blank line in a pattern file matches every line), and the count after filtering must equal the count of patterns loaded. Every run prints "N case-insensitive and M case-sensitive patterns loaded" and the count of commits and blobs swept, so a run that swept nothing shows it.
- **Output, by default:** commit, path index and line number (paths that themselves match print as `path#<index>`). Standard error from every grep is captured and summarised as a count, so a failing grep cannot echo a pattern.
- **Binary and non-UTF-8 blobs.** A blob counts as binary if it holds a NUL byte or fails `iconv -f UTF-8 -t UTF-8` (this catches Latin-1 and UTF-16 text, which grep under a UTF-8 locale would pass silently). Each one in the outgoing set is listed by path and blocks the push, unless its path is in `memento/tools/sweep-binary-allow.txt` (a tracked list of reviewed paths, which holds paths only). The three PNGs already tracked are allow-listed at the start.

**The test suite** (`memento/tools/test-confidentiality-sweep.sh`, run in a fresh scratch repository with a bare remote and throwaway lists, every case asserting its exit code):

- through a real `git push` via `.githooks/pre-push`: clean (allow); token in an outgoing commit (block);
- range: token added in the first of three outgoing commits and removed in the third (block, naming the first); a commit that deletes an already-public token (allow); a new version of a file with a token on an unchanged line (block, by the whole-blob semantic);
- merges: a token added in the merge itself (block); the same, removed later (block);
- refs: two refs with the blocking one second (block); a deleted ref (allow); a tag push with a token in the tag message (block); a new branch; an unknown remote sha (remote-scoped range, or exit 2; a silent pass fails the case); no upstream in standalone mode (exit 2); two remotes, with a commit known only to the other one (block); a stale remote-tracking ref ahead of the real remote (block); a URL as the remote argument (resolved, or exit 2);
- surfaces: token in a commit message, an author name, a path name, a ref name (each block); an already-published blob copied under a token-named path (block);
- lists: a `\b`-bounded pattern through every code path (blob, message, path); case-sensitive token in the right case (block) and lower case (allow); an accented token in both cases; a blank line in a list (stripped, counts unchanged); bad pattern in either list, missing list, empty list, missing case-sensitive list without opt-out (each exit 2);
- failures: a failing grep and a failing git (each exit 2);
- binaries: an added binary not on the allow list (block), and one on it (allow); a Latin-1 text blob and a UTF-16 text blob carrying a token (each block, as binary);
- echo: for every case above, captured stdout and stderr contain no throwaway token and no pattern;
- **mutation check:** seven deliberate weakenings (drop `--not`, read the working tree, skip messages, restore `|| true`, swap in `git grep -E`, drop the case-sensitive list, unset the locale), each run against the suite; each must make at least one case fail.

**On real data, in this repository:** a standalone run over the outgoing range and the current tree must report clean. A `--range` run over all published history is the positive control. It must flag every commit in the known set (four commits by added lines and five by commit message, measured independently by added-line grep and held in the session record). Whole-blob semantics may flag further commits that carried an earlier hit forward; each such extra is listed and traced to a known hit before the control passes, and an extra that traces to no known hit fails it.

### Slice 1b: further modes

Each mode reuses slice 1a's engine and comes with its own tests in the same suite.

- **`--pre-commit` and `--commit-msg`** (D1): sweep the staged blobs and paths, and the message being written; wired as `.githooks/pre-commit` and `.githooks/commit-msg`.
- **`--published <ref>`** (D2): sweeps the full history of `<ref>` after a fetch and compares the hits with a baseline of known historic hits held outside the repository (`~/.memento/sweep-baseline.txt`, hashes only). Known hits are counted; any new hit is reported. Run by the session as part of the restart protocol.
- **`--show-redacted`:** prints each hit line with every matched span masked, for use when fixing a hit.

### Slice 1c: the documents

- `.githooks/pre-push`: comment updated; passes its arguments to `--pre-push`. The new hooks from slice 1b, if D1 is accepted.
- `memento/tools/README.md`: the sweep's line.
- `TOOLING_TRIGGERS.md`: the sweep's row replaced with the new scope, falsifier and witness plan.
- `CURRENT_FOCUS.md`: the constraint on the sweep (currently "covers tracked files only") replaced coherently (CD #11).
- `KNOWLEDGE_ARCHIVE.md`: *The sweep runs last, on the final tree* widened to everything a push publishes, with this plan as its receipt.

### Slice 2: the directive

**Options, held neutral until the User chooses:**

- **A. Amend CD #4e** to list the new channels beside the deployment estates. Falsifier: within the next three imports from another instance, one reaches a tracked file without a recorded de-identification and clearance.
- **B. A new CD #4g** for cross-instance material, leaving 4e as written. Falsifier: as A, plus a session that reads 4e and misses 4g.
- **C. A or B, plus a quarantine rule:** material from another instance is drafted in the session scratchpad and reaches a tracked file only after the de-identification pass. Falsifier: as A; and the rule is dropped if it proves unused across three imports.

**Content common to every option:**
- agent-messaging messages from other instances, lessons drawn from other instances (whoever relays them), and tools or documents copied between instances count as imports, each de-identified and cleared by the User before reaching any tracked file;
- the sweep is a backstop for listed words, and the judgement pass governs the rest;
- remediation of a sweep hit uses `--show-redacted`, and the hit location is opened raw only after the User clears it;
- list refresh: when a new instance starts feeding material into these sessions, the User adds its identifiers to the banned lists.

The User rules the option and the wording (CD #4c makes directive changes his).

## Potential Risks

Structural:
- **A rebuilt gate could be weaker than the one it replaces** (plan-threatening). Mitigation: the suite, including the mutation check, runs before the hook is trusted, and the positive control on real history must flag every known hit.
- **The tests could themselves leak.** Mitigation: throwaway tokens and lists in the session scratchpad; the real lists run only against this repository, and only counts and hashes are reported.
- **The tool could echo a token while being fixed.** Mitigation: patterns by file, stderr captured, redacted mode, and the directive line on remediation.
- **This plan is public on the next push.** It names no employer, client or confidential instance detail, and no hash of the published residue; the sweep and a judgement read run on it before any ready-to-push claim.
- **Unhooked outbound channels** stay open (see Scope, out).

Project:
- **A hit in an unpushed commit needs that commit rewritten before pushing,** and local history rewrites are the User's to approve (CD #4c). Posture-absorbed: decision D1 offers earlier hooks.
- **The directive could over-reach** and slow ordinary lessons. Posture-absorbed: the User chooses the option and rules the wording.
- **Scope creep** from the outbound channels. Posture-absorbed: each is named in Scope, out, with its decision.

Reversibility: everything is local until the User pushes; each slice reverts cleanly.

## Verification Strategy Overview

- **Slice 1a:** the test suite and mutation check above, then the real-data runs; an independent adversarial review (smart tier, assume-failure) of the script, the suite and its record, dispositioned finding by finding; then the User's eyeball. The first real push after the change gives the live allow-arm witness.
- **Slice 1b:** the same pattern, scoped to the new modes and their tests.
- **Slice 1c:** a CD #5 pass (em dashes, contrast framing in every form) over every changed document and the tool's own output strings, by the reviewer; then the User's eyeball.
- **Slice 2:** an adversarial review of the chosen option's wording for over-reach, gaps and the writing rules; then the User's ruling.

## Scope

**In:** slices 1a, 1b, 1c and 2.

**Out, each with its reason:**
- **Edits on GitHub's website** (two so far: the July divergence merge, and the 2026-10-01 STATUS edit). A check at GitHub would need the banned list stored there, which puts confidential names somewhere new. Decision D2 offers a local detective sweep of what is already published.
- **`git push --no-verify`, and fresh clones** where `core.hooksPath` is unset. Decision D3.
- **Text published through `gh`** (pull requests, issues, comments, repository description and topics, release notes). Decision D3.
- **Claude Docs, Artifacts and agent-messaging.** Each starts private, and the User gates any sharing or publishing from them. The directive (slice 2) governs what goes into them.
- **Images.** Judgement covers them: each reviewed image is recorded on the binary allow list.
- **Rewriting pushed history.** Ruled out in July.
- **Refreshing tool copies in Rooms and Proportion.** A separate open item.

## Decisions for the User at approval

- **D1. Earlier hooks:** a pre-commit sweep of staged content and a commit-msg sweep (slice 1b), so a hit is caught before it enters history and needs no rewrite. Proposed: yes.
- **D2. Detective sweep of what is published:** `--published origin/main` (slice 1b), the only check that sees web edits, with the baseline of known historic hits kept outside the repository so the known residue reads as counted and only new hits are reported. Proposed: yes, run at every restart.
- **D3. Claude Code guard on unhooked channels:** a PreToolUse hook that runs the sweep over text sent through `gh` and blocks `git push --no-verify`. Proposed: defer to a follow-up plan, since it changes harness settings. Until then, the session runs the sweep by hand over any text before publishing it through `gh`.
- **D4. Import clearance (CD #4e):** clear the adoption of Rooms' token-sweep design (no text or code copied; Rooms' tool credits this repository's sweep as its origin). Proposed: yes.
- **D5. Directive option (slice 2):** held neutral in the plan; ruled at slice 2. The session's lean, for the record: C on A (one place for import rules, and the judgement pass happens in the scratchpad before anything touches a tracked file, which is where the July leak got in).

## Posture and feedback points

Mostly predictive: the tool and the gaps are known. Two feedback points:

1. **After slice 1a's suite, mutation check, real-data runs and review:** the User's eyeball before the hook is trusted and slice 1b begins. Slices 1b and 1c follow on his word.
2. **At slice 2:** the User chooses the option and rules the wording. A pivot at either point is recorded on this plan.

## Estimated Effort (relative sizing only)

- Slice 1a: L by sub-task count (the script, about thirty test cases, the mutation check, the real-data runs, the review). Kept as one slice because the gate is one file whose parts are only meaningful together; a partial gate would be trusted while weaker. Its feedback point is the eyeball before trust.
- Slice 1b: M (three modes, their tests, one review).
- Slice 1c: M (five documents, one review pass).
- Slice 2: S (one option chosen, one paragraph, one review, the User's ruling).
- Overall: L, sliced as above.

## Seam

Estate only: `memento/tools/`, `memento/protocols/`, `memento/memory-prosthesis/`, and `.githooks/`. `.githooks/` sits at the repository root, which CD #1 assigns to the canon. It is treated as estate tooling on the precedent of `126ca36`, which committed it as `fix(estate)`. No canon content changes. Commits are `fix(estate)` or `docs(estate)` with explicit pathspecs.

## Implementation record

**Slice 1a pivots (recorded at the time, 2026-10-03):**
- **Published set read from the remote itself.** The hook takes the outgoing commits as those unreachable from any ref the remote holds, read with `git ls-remote <url>` (git's second hook argument), in place of local remote-tracking refs plus `remote_sha`. A stale tracking ref can no longer hide an unpublished commit, a URL push needs no name lookup, and a failed `ls-remote` exits 2. Commits the remote holds that are absent locally cannot be excluded, so they are swept again (fail-safe).
- **The hook passes its arguments in slice 1a**, moved forward from 1c: the rebuilt script refuses to run without a mode, so the old hook would have blocked every push.
- **Unexpected-failure handling** is an exit handler in place of an ERR trap: an ERR trap inherited into command substitutions turned grep's ordinary "no match" into a failure (found at the first smoke run).
- **Positive control, run 2026-10-03 over all published history:** recall 9 of 9 known commits. Eight extras, each traced: five are later versions of a file already carrying a known hit (ancestry confirmed), three are the 2025 images at their original paths before they moved under `archive/` and `docs/`.

**Slice 1a review, round 1 (smart tier, adversarial):** 17 findings, all accepted; the gate was rebuilt around them.
- Blockers, each reproduced to exit 0 by the reviewer and accepted: a failure inside the scan read as "no hit" (errexit is suspended under `if`); invalid UTF-8 hid a following token from grep, in text fields and in some blobs `iconv` accepts; a pushed ref at a blob, a tree or a tag chain swept nothing; replace refs made the sweep read a different history from the one sent.
- Majors: a list BOM disabled its first pattern; awk echoed list bytes on invalid UTF-8; commit headers beyond author and committer went unswept; `i18n.logOutputEncoding` changed what was swept; malformed or unterminated push lines read as clean; about 40 processes per file; 40 surviving one-line mutants and several weak cases.
- Minors: newline paths defeated the seen-set and allow list; binary dedupe hid a disallowed path; `bash -x` echoed patterns; the locale name was macOS-only; control bytes in displayed paths; five CD #5 items.
- The rebuild reads raw objects with `git cat-file`, judges validity with grep itself (and `iconv`), treats invalid text as a hit and invalid blobs as binary, follows tag chains to commits, trees and blobs, sets `GIT_NO_REPLACE_OBJECTS`, strips a BOM, validates push lines, checks binaries at every path with an exact allow-list match, and handles every failure explicitly.

**Slice 1a review, round 2:** 14 of 17 fixed, 3 partly, and two new holes, both accepted and fixed:
- `cut` under a UTF-8 locale dropped lines holding certain invalid bytes, so a text field with those bytes still read as clean. `cut` now runs byte-wise, and grep's output goes down a pipe, so matched lines never touch disk.
- A NUL byte in a commit object hid the rest of its line from awk. A NUL in a commit or tag object is now a hit.
- Signature lines are swept like any other header. A character rule cannot tell base64 from a word, and the round-2 test showed a token-only continuation line passing. The control over real signed history showed no false positive.
- Accepted as design: a tag on a tree sweeps the whole tree (fail-safe); empty push stdin exits 0; a text blob is written to `$WORK` while it is checked (it is repository content already on disk).
- Known limit: about 50 ms per file (1,500 files in 77 s, down from 122 s); a first push of thousands of files is slow. Batching the git reads is a later improvement.

**Slice 1a validated** by the User, 2026-10-03 ("commit ad push").

**Slice 1a evidence at hand-over to the User:** suite 167 of 167, verified first-hand; 26 mutants, each killed; positive control over all published history recalls the 9 known commits, with 11 extras traced (later versions of a file already carrying a known hit, and the 2025 images at earlier paths); a simulated pre-push against the real remote is clean.

**Slice 1b validated** by the User, 2026-10-03 ("approve all").

**Slice 1b (2026-10-03):** `--pre-commit` (wired as `.githooks/pre-commit` and, after review, `.githooks/pre-merge-commit`), `--commit-msg` (`.githooks/commit-msg`), `--published` with a baseline in `~/.memento/sweep-baseline.txt`, and the `--show-redacted` view.
- **Review round 1** (fresh smart-tier reviewer): 12 findings, all accepted. Majors: overlapping matches of one pattern left a token tail unmasked; a known leak copied to a new path read as known; a list change left the baseline blind; merges, cherry-picks and reverts ran no content check; the suite never ran the real hook files. Fixes: per-pattern spans found to a fixed point, per-commit dedupe under `--published` with `--topo-order`, baseline keys that include a digest of both lists, a `pre-merge-commit` hook with the remaining gaps named in the hook comments, real hook files in the suite, control bytes shown as `?`, segment-built masks, baseline writes that keep a symlink and refuse a directory.
- **Review round 2:** a scissors cut added in round 1 let `git commit -m` publish text below a scissors line unswept, and a test had enshrined it; chained alternation inside one list line could leave a middle fragment unmasked. Fixes: the whole message file is swept (the `-v` false positive stays, with a hint that now prints only for hits in `#` lines); an exhaustive pass enumerates every match start, pattern by pattern, on line suffixes (over-masking only), alongside the fixed point.
- **Known limits:** amend, cherry-pick, revert and rebase are covered by pre-push only; the mask keeps each span's byte length; a long line built from one repeated character against a short pattern takes about 20 s per 100 KB in the redacted view and is then withheld; bidi control characters (such as U+202E) pass through the redacted view.
- **Evidence:** suite 248 of 248, verified first-hand; slice 1b mutants each killed (21 across the rounds), with one equivalent (the baseline directory check: the write fails and exits 2 regardless); the real baseline holds 25 known hits, each traced (the 20 of slice 1a, plus per-commit republications in an archive copy and two merges); `--published origin/main` reads clean against it.

**Slice 1c (2026-10-03):** the sweep's register row replaced (the October firing, the rebuild, the live witnesses, the unwitnessed arms, a new falsifier); the tools README entry rewritten and its em dashes turned to colons; the knowledge-archive entry retitled *The sweep runs last, on everything a push publishes* (anchor kept) and widened; STATUS's unwitnessed-arms line updated. CURRENT_FOCUS's constraint was already replaced in slice 1b. No instance holds a copy of the sweep (Rooms has its own `token-sweep.py`), so the rebuild leaves no copy to refresh. Review (smart tier): 6 findings, all accepted: two overstatements (two equivalent mutants claimed where the record has one; the 2025 count reintroduced into public text against the r2 ruling), three contrast frames in new text and script comments, a duplicated phrase in the README. Six contrast frames that pre-dated this slice in the README's spawn-tier text, and two "commit only on exit 0" lines, were restated on the User's ruling ("restate them").

**Slice 2 (2026-10-03):** CD #4e replaced, CD #13's import bullet replaced, a § Imports procedure added to `memento/tools/README.md`, the CHARTER's import doctrine and gates line and the estate PLANNING_PLAYBOOK's §1 bullet brought into line. The User's rulings: option A with C (D5); scope widened to any confidential source; every import cleared, with no standing clearance; the procedure in the tools README with changes to it the User's; the r3 wording approved ("approve").
- Drafted outside the working tree (the quarantine it introduces), reviewed in two rounds (smart tier): 14 findings, then 4 new and 2 wording, all accepted. Main changes from the plan's sketch: the destination list widened to everything a commit, a push or a shared document carries; the clearance recorded in the provenance line, which makes option A's falsifier testable; the trigger defined (instance material always, other material when confidential or of unknown status); a lower bound on "lesson"; reading and replying free; the long policy moved out of the directive into § Imports.
- Remediation of a sweep hit, listed in this plan's risks and scope as a directive line, lives in § Imports, which the directive points to.

## Review record (draft r1, 2026-10-03)

Sixteen findings from the adversarial reviewer, all accepted. The load-bearing ones were re-checked first-hand: `git grep -E` misses `\b` patterns on this machine's git (Apple Git 2.50.1; `grep -E` and `git grep -P` match); the fail-open line; the history counts by hash; the absence of the residue's hash from every tracked file.

1. Regex engine: pinned to `/usr/bin/grep -E` with patterns by file; `\b` test added.
2. Fail-open: added as Problem 3; fail-closed design and failure tests added.
3. Merges: blob-level sweep via `rev-list --objects`; merge tests added.
4. Multiple remotes: scoped to the push's remote; two-remote test added.
5. Mode detection and force pushes: explicit flags, remote-scoped fallback, worst exit code kept.
6. Unswept surfaces: tags, refs, authors, path names and binaries added.
7. Understated receipts: full counts stated; the positive control is an exact set.
8. Echo routes: patterns by file, stderr captured, redacted mode, directive line.
9. Missing case-sensitive list: required by default, counts always printed.
10. Test gaps: suite extended through a real push, with a mutation check.
11. Outbound channels: named in Scope, out, with decisions D2 and D3.
12. 3C conformance: options with falsifiers; list refresh added.
13. Hash pointer: removed from this file; clearance made explicit (D4); "C4" shorthand dropped.
14. Sizing and conformance: slice 1 split; CURRENT_FOCUS added; risks labelled; seam precedent stated; CD #5 pass widened.
15. Contrast framing: the ten instances restated.
16. Smaller points: the list-shape hint removed. Pre-commit and commit-msg hooks are offered as D1. "Proportion" already appears in eight published files.

## Review record (draft r2, 2026-10-03)

The reviewer verified the r1 fixes (9 fixed, 6 partly, 1 not) and raised eight new findings, all accepted.

- N1. Blob scan against tests and control: whole-blob semantics chosen and stated; commits named per commit via `diff-tree`; the contradictory context-line case replaced; the control redefined as recall over the known set, with every extra traced.
- N2. Paths: taken from `diff-tree` per commit; test for a published blob under a token-named path.
- N3. Non-UTF-8 and locale: `LC_ALL` pinned; NUL and `iconv` detection route such blobs to the binary rule; Latin-1, UTF-16 and accented-token tests.
- N4. Stale ref and URL argument: `remote_sha` excluded when known; URL resolved or exit 2; tests.
- N5. Pattern files: process substitution; blanks and comments stripped with a count check.
- N6. Suite: three mutations added; worst exit defined; D1 and D2 modes tested in slice 1b; no-mode runs exit 2.
- N7. Sizing: further modes split into slice 1b; slice 1a kept whole with its reason stated.
- N8. Contrast framing: three instances restated. The 2025 counts dropped from the public text.

Awaiting user approval of this plan before detailed design or implementation.
