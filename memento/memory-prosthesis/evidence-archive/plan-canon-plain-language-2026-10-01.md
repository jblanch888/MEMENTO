---
description: plan for a plain-language pass over the published canon, at the source, after a newcomer review found the text written for its maintainer; vocabulary ruled first, then the front door, the story, the framework and the adoption path, each slice reviewed by Astra and worded finally by the User
type: plan
date: 2026-10-01
genre: build/change (3A) with a design/decision step (3C) as slice 0
size: L (five slices; slice 3 splits in two)
status: APPROVED (the User, 2026-10-01); slice 0 in progress
related: [CORE_DIRECTIVES, PLANNING_PLAYBOOK, KNOWLEDGE_ARCHIVE, plan-canon-rewrite-2026-07-20, plan-truth-and-presentation-2026-07-21]
---

# Plan: a plain-language pass on the canon

**APPROVED 2026-10-01** (the User: "d1 yes d2 yes d3 yes d4 ok d5 yes. approve plan"). All five decisions ruled as proposed; see § Decisions for the User.

## Origin and authority

- **The User, in the build-protocols session (relayed in its brief):** "i think we need to fix at the source, memento is riddled with self referential and arcane phrasing and terminology, it is very unfreindly for anyone but me and itself." He chose this estate's session to do it.
- **The User, in this session (2026-10-01):** "yes draft the plan follow memento protocols also astra reviewer agent can review any wording changes but route final wording decisions through me".
- **Evidence inputs** (read first-hand for this plan, both in `~/build-protocols/memento/evidence-archive/`):
  - `review-astra-page-language-2026-10-01.md`: Astra's newcomer review of the Memento explainer page, 41 items;
  - `brief-memento-plain-language-2026-10-01.md`: the build-protocols brief mapping the flagged phrases to canon file:line at `3d12138`, with a starting glossary.

## Pattern Search Results

- **Slice pattern:** `plan-canon-rewrite-2026-07-20.md` ran the whole canon rewrite on draft, two-lane sweep (banned-token grep plus judgement), adversarial review, dispositions, the User's gate, seam-scoped commits. Adopted here, with Astra as the reviewer and a line-by-line wording gate added at the User's direction.
- **External review as input:** `plan-truth-and-presentation-2026-07-21.md` verified each external finding first-hand before planning. Here the brief's file:line table is relayed: four rows were spot-checked (README.md:3, 13, 20, 26, all match), and every row is re-located first-hand at its slice's start (3D claim-status discipline).
- **Knowledge archive, lessons acted on:**
  - *Published receipts can be inflated claims* and *superlative claims are the highest-risk class*: a simpler sentence is where an overclaim slips in, so fidelity is a review test in its own right.
  - *The sweep runs last, on the final tree*: the confidentiality sweep runs per draft and again on the final tree before any ready-to-push claim.
  - *Committed working context cannot assert publication state*: the close-out message to build-protocols states push status from live git.
  - *Pathspec commits take working-tree state*: commits use explicit pathspecs from each slice's file list.
- **Glossary precedent:** none in the canon (one unrelated hit in GIT_OPERATIONS_PLAYBOOK).
- **Ruled out:** the 2025 archive exhibit as a source of plain wording (it is frozen, and its register is older and no plainer).

## Problem / purpose

The published canon addresses its maintainer. Astra's review, written for a reader who knows AI-assisted software work and has never met Memento, found internal vocabulary used without explanation, several abstractions per sentence, filing history offered as explanation, and instructions to an agent reused as prose for a person. Its test for any sentence: **can a reader tell who does what, to which information, and why?**

The explainer page quotes the canon verbatim with line receipts, so the page can only become plain once the source does. Why now: the page is being built (CS-02), and the canon's first public readers arrive through it.

**Denominator (machine-derived, 2026-10-01, `3d12138`):** 34 tracked Markdown files outside `memento/` and `archive/`. Lines carrying an internal term, summed across those files: estate 124 (29 files), receipt 63 (24), earned 43 (24), graduat- 41 (20), canon 50 (23), lineage 48 (19), prosthesis 29 (14), epoch 27 (7), witness 22 (12), posture 20 (7), falsifi- 20 (11), artefact 19 (11), bank- 17 (10), organ 17 (9), sovereign 13 (10), undertaking 12 (4), theatre 11 (9), apparatus 9 (6). Astra's 41 items are a sample drawn from one page. The census is the full measure, re-run per slice for the before and after counts. Some hits are legitimate (a named concept, a file name, or a plain use of the word), so the target is a ruled disposition for every hit.

## Posture

Cone of uncertainty. Slice 0 and slice 1 are planned at high resolution; slices 2 to 4 are directional.

**Feedback and pivot points:**
- **After slice 0:** the vocabulary ruling sets every later slice. The User may widen or narrow it.
- **After slice 1:** the first real rewrite shows whether the ruling holds in sentences, how heavy a touch the User wants, and whether the front door alone is enough. Legitimate pivots: stop here, lighten or deepen the touch, add or drop a glossary, reorder the later slices.
- **After slice 2:** the killed-mechanism stories are where fidelity is hardest (facts first, case-specific lessons). What is learned there re-shapes slice 3's handling of the agent-facing templates.

Pivots are recorded in this plan as dated amendments on their receipts.

## Scope and slices

WIP of one; each slice closes on the User's wording gate and its commit before the next starts.

### Slice 0: vocabulary ruling and working context (S, 3C)

1. Draft a term table from the census: every internal term with a proposed disposition.
   - **KEEP AS NAME:** a real concept or a folder name. It stays and gets a plain explanation where it first appears in each entry-point file (for example working context, playbook, the four tier names, core directives).
   - **REPLACE:** a plain word chosen in context (for example estate, receipted, banked, graduated, apparatus, surface set). Starting point: the brief's glossary.
   - **KEEP:** already plain in its uses.
2. Astra reviews the table (newcomer test).
3. The User rules each row. The ruled table is banked as a slice record in this plan (§ Slice records).
4. Estate housekeeping, separate commit: CURRENT_FOCUS and STATUS replaced coherently (CD #11) to name this plan as active and to catch up the September spawn-tier work that never reached them.

### Slice 1: the front door (M)

`README.md` and `docs/index.md` (which mirrors it). Astra items 1 to 8, 18, 22, 24, 29 to 31, 40, 41 plus every census hit in both files. The opening definition says what Memento does before naming its parts. The reading links say why to open each one, with paths kept as secondary text.

### Slice 2: the story (M, directional)

`story/THE_STORY.md`, `EPOCHS.md`, `KILLED_MECHANISMS.md`, `ORGAN_REGISTRY.md`. Astra items 26, 34 to 39. Every killed-mechanism entry leads with its concrete facts, then its lesson, kept specific to the case. Memorable lines stay when a plain explanation follows them ("Silence is not health").

### Slice 3: the framework (L, split, directional)

- **3a:** `framework/README.md`, the memory-prosthesis READMEs and templates, `directives/CORE_DIRECTIVES_TEMPLATE.md`. Astra items 9, 10, 19 to 21. Directive headings per decision D2.
- **3b:** `framework/playbooks/` (README and each playbook), `framework/conventions/` (TOOLING_TRIGGERS, ESTATE_SPINE, RESOURCE_ROUTING). Astra items 23, 25, 38.

These files are templates an adopter copies into a project for an agent to obey. The plain pass keeps each rule's force: an imperative stays an imperative, a MUST stays a MUST, and the review asks of every change whether a rule became weaker or optional.

### Slice 4: the adoption path (S to M, directional; D5)

`adoption/` (GETTING_STARTED, THE_SPIRIT, GRADUATION_LADDER, THE_ENFORCEMENT_SURFACE) and `CONTRIBUTING.md`. Astra did not see these because the page does not quote them; they are the newcomer's first practical pages, so they carry the most weight per reader.

### Close

Confidentiality sweep on the final tree; census after-counts banked; working context updated; build-protocols/agent told the commits and their push status (from live git); the push stays the User's.

### Consciously out

- `archive/canon-2025/`: the frozen 2025 exhibit (CD #4d).
- `memento/`: this estate, including its own CORE_DIRECTIVES and banked memos (decision D3).
- **File and folder renames** (`ESTATE_SPINE.md`, `ORGAN_REGISTRY.md`, `memory-prosthesis/`): names get explained in place. Renames break inbound links and the page's receipts; they would be a separate undertaking.
- `framework/conventions/agents/*.md` and `TIER_MAP.json`: definitions read by the harness and the agent generator, addressed to agents. In scope only if the User widens it.
- The explainer page itself: build-protocols owns it and re-syncs from the commits.

## Per-slice procedure

1. **Re-locate** the slice's flagged lines and census hits first-hand at HEAD.
2. **Draft** in the working tree. Routing: main thread, frontier tier, since wording that stays faithful while getting plainer is judgement work and the context is already loaded here.
3. **Mechanical lane:** `memento/tools/confidentiality-sweep.sh` on the drafts (it reads the working tree of tracked files only, so any new untracked file gets a direct grep against the same token list); an em-dash grep; the census re-run on the slice's files.
4. **Judgement lane (self-check):** CD #5 contrast framing in every form; CD #13 fidelity (goals, procedures and demonstrated results stay distinct).
5. **Astra review** (CD #14), one agent-messaging thread per slice to `agent-messaging/astra-reviewer`, carrying the before and after text of every changed sentence. Two tests, both under an assume-failure posture:
   - **newcomer:** can a reader who knows AI-assisted software work and has never met Memento tell who does what, to which information, and why?
   - **fidelity:** does any plainer sentence claim more than the original or its evidence supports, merge a goal into a result, or weaken a rule?
   Routing note: CD #14 names a smart-tier reviewer by default; the User directed Astra (Codex), which also gives cross-vendor independence from the drafter.
6. **Dispositions:** each Astra finding is dispositioned explicitly (accepted, or refuted with a receipt). Astra's own suggested wording passes CD #5 before adoption; its review contains contrast frames, so adoption is checked phrase by phrase.
7. **The User's wording gate:** a table per slice with, for each changed sentence, the current text, the proposed text, and Astra's finding with its disposition. The User rules every row (accept, amend, reject). **No wording reaches a commit without his ruling.**
8. **Commit:** `docs(canon): plain language, slice N: …`, explicit pathspecs from the slice's file list, canon side only (CD #10; the gate in step 7 is the approval a canon commit needs).
9. **Slice record** added to this plan: ledger of rows ruled, census before and after, Astra thread id, commit hash.

**Messaging mechanics.** A review request is a new message, so it goes in a turn the User starts, quoting his instruction. Class: trivial (a read-only review request for text headed for a public repository), sent only after the sweep in step 3 passes. The User may re-class the first send C4 if he wants to see draft canon text before it reaches the Codex account.

## Risks

**Plan-threatening:**
- **Overclaim through simplification** (CD #13). A plain sentence drops the qualifier that kept it true. Mitigation: the fidelity test, then the User's line-by-line gate.
- **Rules weakened in agent-facing templates.** Formal wording like "EXTANT ARTEFACT" exists because agents skip plans. Mitigation: rule force preserved (slice 3 note); the review asks about it explicitly.
- **Confidentiality.** Plain retellings of the origin and the killed mechanisms invite concrete detail. Client names stay banned absolutely; codenames and private hashes follow the R3 ruling. Mitigation: the sweep per draft and on the final tree.

**Posture-absorbed (a pivot point exists):**
- **Voice loss.** The canon has a voice worth keeping. Mitigation: memorable lines stay with a plain explanation after them; the User calibrates the touch after slice 1.
- **Vocabulary divergence** between canon and estate (D3).
- **Scope creep** into the estate, the agent files or renames: all listed as out.

**Dependencies and reversibility:**
- **Push.** Main is 7 ahead and 1 behind origin (the User's web edit `ca22cb8` to STATUS.md, which will likely conflict with local `04d65e7`). The page's links point at GitHub, so re-sync waits on a push, and that push also publishes the six September canon commits. The push is the User's alone (CD #4a); this plan claims nothing about publication state.
- **Reversibility:** every change stays local and revertible per slice commit until the User pushes.
- **Anchors:** 0 internal anchor links in the in-scope files, so heading changes break nothing inside the canon; the page's receipts are pinned by commit and line.

## Verification

- Per slice: the census before and after; the sweep result; Astra's thread and dispositions; the User's ruled table; the commit. All recorded in the slice record.
- At close: the census across all 34 files with every remaining hit ruled; the sweep on the final tree; build-protocols confirms its quotes re-synced.
- Honest limit: Astra is a proxy for a newcomer. A real first-time reader after publication is the stronger test, and it is outside this plan.

## Decisions for the User

- **D1 (RULED: as proposed), named concepts.** Proposed: keep working context, playbook, the four tier names and core directives as names, explained where first used; replace the house vocabulary (estate, receipted, banked, graduated, apparatus, surface set and the like). Ruled row by row in slice 0.
- **D2 (RULED: as proposed), directive headings.** Proposed: keep each formal name and add a plain label beside it. Alternative: rename outright.
- **D3 (RULED: as proposed), estate vocabulary.** Proposed: the estate keeps its own terms for now, so canon and estate will read differently; a later estate pass would be its own undertaking.
- **D4 (RULED: as proposed), glossary.** Proposed: one short "Words used here" section in `framework/README.md` for the named concepts that stay. Alternative: none, relying on first-use explanations.
- **D5 (RULED: as proposed), adoption path.** Proposed: include slice 4, though Astra did not flag it.

## Estimated Effort (relative sizing only)

L overall. Slice 0: S (additive table plus housekeeping). Slice 1: M (two files, about 20 flagged items plus census hits). Slice 2: M (four files; the fidelity-heavy stories). Slice 3: L, split into two M halves (about 15 files, agent-facing). Slice 4: S to M (five files). Every slice has the User's eyeball between increments.

## Approval gate

Awaiting user approval of this plan before detailed design or implementation.

## Slice records

### Slice 0: the term table (PROPOSED 2026-10-01, awaiting Astra's review and the User's ruling)

Drawn from the census and a usage sample of every term across the 34 in-scope files. The plain wording is picked for each sentence in context; the "usually becomes" column is a starting point for that choice. A search-and-replace is off the table. **Entry-point files** (where a KEEP AS NAME term gets its first-use explanation): README.md, docs/index.md, framework/README.md, story/THE_STORY.md, adoption/GETTING_STARTED.md; the D4 glossary in framework/README.md holds them all in one place.

**KEEP AS NAME** (a real concept, a file or folder name, or a defined term; stays, explained where first used)

| term | plain explanation on first use |
|---|---|
| memory prosthesis (folder `memory-prosthesis/`) | the project's saved notes and evidence, which the assistant reads to pick up where earlier sessions left off |
| working context | the short notes on the current goal, task, status and open questions; read first in every session |
| active knowledge | project rules and reference material used across tasks |
| institutional memory | lessons from past work, selected because they will help future work |
| evidence archive | dated records of plans, findings, decisions and handovers, with their supporting evidence |
| core directives (and "CD #n") | the short set of rules that applies throughout the work; "CD #8" is core directive 8, given its plain label on first use |
| playbook | steps for a particular kind of work, such as planning or committing |
| compaction | the harness shortening a long conversation to free space; some detail is lost, and the saved notes remain |
| falsifiable governance, falsifier | each control comes with evidence, set in advance, that would show it is failing to help; when that evidence appears, the control is removed and the lesson recorded |
| epoch | one of the six stages of Memento's history (story/ only) |
| organ registry (file `ORGAN_REGISTRY.md`) | the catalogue of Memento's 32 parts and where each came from; "organ" in running prose becomes "part" |
| killed mechanisms (file `KILLED_MECHANISMS.md`) | controls that were tried and removed, with the reason each was removed |
| graduation ladder (file `GRADUATION_LADDER.md`) | the steps for adopting Memento gradually, adding structure as a project needs it |
| estate spine (file `ESTATE_SPINE.md`) | the standard layout and metadata for a project's Memento files |
| adversarial review | a second reviewer asked to look for faults in the work before it is presented |
| undertaking (PLANNING_PLAYBOOK only, where it is defined) | a piece of work of any kind; elsewhere it becomes "piece of work" |
| the User (templates only) | the person in charge of the project; prose for a reader uses "you" or "the person in charge" |

**REPLACE** (house vocabulary; the plain wording is chosen in context)

| term | lines, files | usually becomes |
|---|---|---|
| estate | 124, 29 | a project using Memento; the project's Memento files; this repository's own Memento files (when it means this one) |
| canon | 50, 23 | the published framework; this repository; "the 2025 version" for the 2025 canon |
| lineage | 48, 19 | the earlier projects; Memento's history |
| receipt, receipted | 63, 24 | evidence; supporting records; the source; "supported by evidence". "refuted with a receipt" becomes "rejected, with the evidence" |
| bank, banked | 17, 10 | save, saved, record |
| graduate (a lesson) | 41, 20 | move a lesson up a tier; select and keep a lesson. The template field "Graduated YYYY-MM-DD" becomes "Added YYYY-MM-DD" |
| earned, earn the apparatus | 43, 24 | added once real use showed it was needed. "Earned its keep" is an ordinary idiom and stays |
| teeth (enforcement) | in sample | automated enforcement |
| witness (noun or verb) | 22, 12 | a record that the control ran; "witness plan" becomes "how we confirm it runs" |
| posture | 20, 7 | approach. "Assume-failure posture": the reviewer starts by assuming the work is wrong. "Push posture by repo class": when to push, by type of repository |
| theatre | 11, 9 | a check that looks like protection and changes nothing (said concretely for each case) |
| apparatus | 9, 6 | the full set of files, procedures and tools |
| sovereignty, sovereign, sole arbiter | 15, 12 | you decide (reader prose); "the User decides the scope, whether the work is acceptable, and when it is finished" (templates) |
| seam | 2, 2 | the boundary between the published framework and a repository's own Memento files |
| recital | 4, 3 | having the assistant repeat the rules back |
| surface set | 1, 1 | the rules, current task and status files |
| extant artefact, extant plan | 4, 4 | a saved plan file (the MUST stays) |
| governance charter | 1, 1 | a set of governance instructions |
| host knowledge | 1, 1 | project-specific knowledge |
| in the field, born in the field | 6, 5 | in real projects; "developed in real projects" |
| meta-framework | 3, 3 | said as what it does (the opening definition in slice 1) |
| spine (outside the file name) | about 15 | the sections every plan carries (PLANNING); the standard metadata (governing docs) |

**KEEP** (ordinary English in its uses): artefact; killed, kill; "earned its keep"; frontmatter, commit, hook (standard software terms, per Astra's reader profile).

**Also in scope of slice 1, outside the repository:** the GitHub repo description ("A meta-framework for long-running AI-assisted development: continuity across hundreds of agent sessions, governed by evidence, gates and falsifiable mechanisms.") carries the same opening problem. A plain version will be proposed with slice 1 for the User to set in the GitHub UI (repository settings are his), alongside `docs/_config.yml`'s description.
