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
