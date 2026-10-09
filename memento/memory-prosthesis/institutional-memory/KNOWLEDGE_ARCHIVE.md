---
description: graduated, durable, reusable lessons for the MEMENTO estate — patterns earn entry via the pre-compact quality gate (CD #9a/9b); session detail stays out
type: reference
date: 2026-07-20
status: live
---

# KNOWLEDGE_ARCHIVE

Entries graduate through the pre-compact consolidation gate (CD #9), maximum three per session, each justifying long-term reuse. Navigation anchors use `{#kebab-case}`.

## Canon craft

### Published receipts can be inflated claims {#published-receipts-can-be-inflated}

*(Graduated 2026-07-20.)* The 2025 canon's "complete system in 13 days" was promotional prose; the author's honest retrospective was a walking skeleton in about that time. A receipt that is itself marketing proves only that the claim was made. When the canon quotes its own past claims, re-ground them with the User before republishing. Sharpens CD #13, and applies to every claim the rewrite inherits from Epoch 4 documents.

### Superlative claims are the highest-risk class in relayed evidence {#superlative-claims-highest-risk}

*(Graduated 2026-07-20.)* "First multi-person use anywhere in the lineage" survived scout relay, primary verdicting and adversarial review, and was still wrong: a 2025 deployment served a team for about a year. "First-ever", "only", and absence claims need explicit re-grounding with the User before canon use. When one is caught, correct the canon AND add an ERRATUM to the source memo so the error cannot be re-inherited.

### A kill's value scales with the quality of the failed design {#kill-value-scales-with-design-quality}

*(Graduated 2026-07-20.)* The restart-v1 kill was first retold as naive recital; the User's correction revealed a thoughtful three-layer design (checklist with evidence, quote-as-proof, situational synthesis gate) that still failed its evidence test. A well-designed mechanism dying teaches far more than a silly one. Tell the strongest version of what died, with its receipts.

## Publication discipline

### The sweep runs last, on everything a push publishes {#the-sweep-runs-last}

*(Graduated 2026-07-21.)* A confidentiality check is a property of the final tracked tree, so it runs as the last act before exposure. Receipted the hard way: the publication-readiness memo introduced banned literals AFTER the full-tree sweep had run, and the fix of the first leak introduced a second, caught only at bench by the mechanised sweep. Now enforced by the pre-push hook; the discipline is to trust nothing swept earlier than the final state.

*(Widened 2026-10-03.)* The final tree is one part of what a push publishes. History, commit and tag messages, author names, paths and ref names go out too, and a token removed in a later commit still ships in the earlier one. Receipted: the July tool read the working copy, so history and commit messages went unswept (the July memo's leak and earlier commit messages sat in published history), and it reported clean on a list it could not parse. The rebuilt sweep (`plan-leak-hardening-2026-10-03.md`) checks everything a push sends, each commit as it is made, and the published history against a baseline at restart. A check that cannot run blocks.

### Committed working context cannot assert publication state {#working-context-cannot-assert-push-state}

*(Graduated 2026-07-21.)* A claim about a push cannot survive the push that publishes it: the public copy is false precisely when it matters. Receipted twice in one day, including a fix that reasserted remote state in the same sentence as the rule banning it. Remote state is derived from git at read time; working context carries decisions and history only. Now in the canon's working-context template.

## Git craft

### Pathspec commits take working-tree state {#pathspec-commits-take-worktree-state}

*(Graduated 2026-07-21.)* `git commit -- <path>` commits the working-tree content of the named paths, silently reversing a staged deletion of a file that still exists on disk. Receipted: the settings untrack failed invisibly and republished the file with broader content. For index-only operations, commit with the file absent from the worktree, or commit a controlled index without pathspec. Sharpens CD #10's pathspec rule with its one sharp edge.

## Tooling craft

### A check fails open in its plumbing, so test the gate by breaking it {#check-fails-open-in-plumbing}

*(Graduated 2026-10-06.)* The rebuilt confidentiality sweep went through five rounds in which a hit read as clean for reasons unrelated to its logic: errexit is suspended inside an `if`; `cut` under a UTF-8 locale drops lines that hold invalid bytes; grep stops matching at an invalid byte; awk stops reading a line at a NUL; macOS `git grep -E` has no `\b`; a hook that always exits 0 fails silently when its script breaks. Each was found by an adversarial reviewer or a deliberate mutation, none by the happy-path tests. Receipted: `plan-leak-hardening-2026-10-03.md` (implementation and review records). The discipline: a gate ships with a suite that a set of mutants must fail, and a check that cannot run blocks.

### Run agents in sequence by default; parallel frontier work spends the allowance in minutes {#sequential-agents-by-default}

*(Graduated 2026-10-08.)* On 2026-10-06 about eleven frontier agents overlapped (judges, calibration judges, yardstick builders) and used roughly a fifth of the User's session allowance within minutes; most of their output was stopped unused. The same scoring as two sequential single-agent passes cost a fraction and gave the same judgement. Default to one agent at a time, frontier only where judgement needs it, and say the cost before a fan-out. Receipt: `plan-memento-ablation-trial-2026-10-06.md` (scope correction).

### Witness a harness with a cheap model before spending frontier runs on it {#witness-harness-cheaply}

*(Graduated 2026-10-10.)* The implementation test's harness failed in ways only a real run could show: a tool-list flag swallowed the prompt; an absolute path in a permission rule needs `//`, and file rules apply through `Edit(...)` to every writing tool; the shell does not split a variable into words; a test key collapsed same-named cases. One Opus run was void ($1.35). Recon-tier probes at $0.03 to $0.06 each then proved the sandbox, the Fable block and the write rule before the real runs. Before a frontier run, witness each control with the cheapest model on a scratch copy, and check the result on disk first-hand, never only from the agent's account. Receipt: `plan-ablation-implementation-test-2026-10-10.md` (slices 1 and 2).

## Evidence craft

### Measure use without reading content, and treat scouts as leads {#measure-use-without-content}

*(Graduated 2026-10-06.)* Session transcripts, prompt history, telemetry, hook logs, git file effects and co-author trailers answer "which parts are used, under which model" as counts, identifiers and dates, with no content leaving a script; that kept confidential estates out of the session while still dating the playbook decline across model generations. Recon scouts found the sources, and several of their figures were wrong (dates, coverage, a shell-history count with no timestamps), so the load-bearing ones were re-grounded first-hand and every public claim carries a receipt code to a private index. Receipted: `finding-exercise-census-2026-10-03.md`, `finding-longitudinal-evidence-2026-10-03.md`.

### Read counts understate habitual use; non-use alone never justifies removal {#read-counts-understate-use}

*(Graduated 2026-10-08.)* In one estate a git standard read in 4 of 94 sessions was used at every push through a fixed pre-push command set, without the file being opened. Transcript read counts measure opening a file, and habits, hooks and command sets use rules without opening them. Non-use is MODERATE evidence at most and needs a second, independent source before it supports any action. Receipt: `plan-reshape-memento-2026-10-06.md` (slice 5).

### A cheap evidence script leans towards removal until it is reviewed {#evidence-scripts-lean-to-removal}

*(Graduated 2026-10-10.)* The Rooms level 2 grading script searched for references only in `memento/`, keyed reads by file name so three README files collided, and counted reads of the doctor's source as doctor runs. Every fault undercounted use, so the first-draft grades proposed removing elements in use. First-hand re-grounding found two of the faults and an independent review three more; after the fixes no element qualified for removal. Before a removal grade rests on scripted counts, re-ground a sample first-hand and have the script reviewed: its blind spots fall on the side of removal. Receipt: `plan-reshape-rooms-level2-2026-10-10.md` (slices 1 and 2).

### Count an alarm's firings against the actions it caused {#count-alarm-firings-against-actions}

*(Graduated 2026-10-10.)* Rooms' consolidation tripwire fired about 38 times across 9 sessions with its action taken zero times, and CHECK 13's "owed" state could not tell a rise from a standing count, so one regression sat unseen for a day. An alarm whose action never runs decides nothing, as the killed commit prompt did, and trains people to ignore it. When reviewing a control, count firings against the actions that followed: a standing alarm needs a decision (act, quieten or retire), and a count that must only fall needs a ratchet. Receipts: the Rooms playbook review of 2026-10-10 and rooms/dev's answer on thread t-20261010-090951-ddc840.
