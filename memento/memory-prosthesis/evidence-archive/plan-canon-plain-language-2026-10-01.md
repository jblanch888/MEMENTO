---
description: plan for a plain-language pass over the published canon, at the source, after a newcomer review found the text written for its maintainer; vocabulary ruled first, then the front door, the story, the framework and the adoption path, each slice reviewed by Astra and worded finally by the User
type: plan
date: 2026-10-01
genre: build/change (3A) with a design/decision step (3C) as slice 0
size: L (five slices; slice 3 splits in two)
status: APPROVED (the User, 2026-10-01); slices 0 and 1 closed; slice 2 next
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

1. Draft a term table from the census: every term the vocabulary search finds, with a proposed disposition. Terms the search misses surface in each slice's prose review. File paths, field keys and tokens a tool reads stay verbatim and are counted separately.
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

Awaiting user approval of this plan before detailed design or implementation. **Satisfied 2026-10-01** (the User's approval is quoted under the title).

## Slice records

### Slice 0: the term table (RULED 2026-10-01: all rows accepted)

**Review:** Astra, thread `t-20261001-072651-ce74d1`, message `m-20261001-072853-2a95f8` (held as C7, released by the User). 21 rows questioned, 9 missing terms, 3 coverage notes. Every cited source line was checked first-hand: THE_SPIRIT.md:12, KILLED_MECHANISMS.md:43, CORE_DIRECTIVES_TEMPLATE.md:90-96 and :135, the evidence-archive README:8, CURRENT_FOCUS_TEMPLATE.md:24, TOOLING_TRIGGERS.md:29, PLANNING_PLAYBOOK.md:112, ESTATE_SPINE.md's naming and index sections. All support the findings. Astra did not reproduce the census counts; they stand as this session's own.

**Dispositions:** ACCEPTED (Astra's wording adopted, trimmed where marked); ACCEPTED IN PART (the part set aside is named, with its reason); CONFIRMED (Astra agreed the row as drafted). No finding was refuted outright.

**How the table is used:** wording is chosen per sentence in context, starting from the column below. Search-and-replace is off the table. File paths, frontmatter keys and status tokens a tool reads stay verbatim. Every in-scope file explains a named term where the file first uses it, with a short inline gloss and a link to the D4 glossary in `framework/README.md` (Astra's coverage note 1, accepted in part: the link keeps the glosses short).

#### KEEP AS NAME (stays; explained where each file first uses it)

| # | term | first-use explanation | disposition |
|---|---|---|---|
| 1 | memory prosthesis | the project's saved notes and evidence, organised into four tiers by how often the assistant needs them, so work can continue across sessions | ACCEPTED |
| 2 | working context | two short files, CURRENT_FOCUS.md and STATUS.md, holding the current task, constraints, next actions, session progress and questions awaiting the User; read at the start of every session | ACCEPTED |
| 3 | active knowledge | project rules and reference material used across tasks | CONFIRMED |
| 4 | institutional memory | lessons from past work, selected because they will help future work | CONFIRMED |
| 5 | evidence archive | dated records of plans, findings, decisions and handovers, with their supporting evidence | CONFIRMED |
| 6 | core directives, CD #n | the short set of rules that applies throughout the work; "CD #8" is core directive 8, given its plain label on first use | CONFIRMED |
| 7 | playbook | steps for a particular kind of work, such as planning or committing | CONFIRMED |
| 8 | operational protocols (new) | rules for how the assistant works: the core directives, which always apply, and the playbooks, for particular tasks | ACCEPTED |
| 9 | harness (new) | the application that runs the assistant and its tools | ACCEPTED |
| 10 | compaction | the AI application condensing the conversation to free space; details can be lost, and notes saved in project files remain available | ACCEPTED |
| 11 | falsifiable governance | kept as the name of the current era (headings, story/). Running prose explains it: before relying on a control, write down the result that would show it is failing its purpose and when you will check; retire the control when that result appears, and record the lesson | ACCEPTED |
| 12 | falsifier (in running prose) | becomes "failure criterion": the result, set in advance, that would show a control is failing its purpose | ACCEPTED |
| 13 | adversarial review | an independent reviewer starts by assuming the work has faults and tests its claims against evidence before the work is presented to the User. The operative rule keeps the main agent's explicit disposition of each finding | ACCEPTED |
| 14 | undertaking (PLANNING only) | a piece of work; a saved plan is required when it is large, likely to span sessions, has a complicated sequence of steps, or has consequential or hard-to-reverse effects. Elsewhere it becomes "piece of work" | ACCEPTED |
| 15 | epoch; organ registry; killed mechanisms; graduation ladder; estate spine | as drafted (epoch: one of the six stages of Memento's history; organ registry: the catalogue of Memento's 32 parts and where each came from, with "organ" in running prose becoming "part"; killed mechanisms: controls tried and removed, with the reason; graduation ladder: the steps for adopting Memento gradually; estate spine: see row 33). The counts (six, 32) are re-checked against their sources when their text changes | CONFIRMED |
| 16 | the User (templates only) | the person in charge of the project; prose for a reader uses "you" | CONFIRMED |
| 17 | frontmatter (moved from KEEP) | the structured fields at the start of a file | ACCEPTED |
| 18 | hook (moved from KEEP) | code the AI application runs at a specified event | ACCEPTED |
| 19 | governing document (new) | a document that sets rules for work on the project | ACCEPTED |
| 20 | knowledge gardening (new; playbook title) | maintaining project notes and rules when evidence shows they are becoming hard to use; the procedure states its approval requirements | ACCEPTED |
| 21 | routing (new; RESOURCE_ROUTING) | the rule for choosing who or what performs each part of the work. The model tiers (frontier, smart, recon) are explained separately as capability and cost categories, with their assignment rules kept | ACCEPTED |

#### REPLACE (house vocabulary; plain wording chosen in context)

| # | term | lines, files | usually becomes | disposition |
|---|---|---|---|---|
| 22 | estate | 124, 29 | a project using Memento; the project's Memento files; this repository's own Memento files (when it means this one) | CONFIRMED |
| 23 | canon | 50, 23 | the Memento framework and its documentation; "published" only where publication is established; "the preserved 2025 version" for `archive/canon-2025/`; "this repository" only when the sentence means the whole repository | ACCEPTED IN PART: Astra's "shared" dropped as vague |
| 24 | lineage | 48, 19 | the projects where Memento developed; the history of this rule and its adaptations; Memento's history | ACCEPTED |
| 25 | receipt, receipted | 63, 24 | supporting record, source reference or test evidence, saying what it supports. Reviewer findings: "shown to be incorrect, with supporting evidence" | ACCEPTED |
| 26 | bank, banked | 17, 10 | save, saved, record | CONFIRMED |
| 27 | graduate (a lesson) | 41, 20 | add a supported, reusable lesson to institutional memory once the User approves it. Template field: "Added to institutional memory YYYY-MM-DD". Other movements name their destination | ACCEPTED |
| 28 | earned, earn | 43, 24 | tooling: add the tool when its recorded trigger occurs; history: name the incident or scale threshold that justified it; planning: specify later steps as earlier work supplies the information. Stated founding exceptions stay. "Earned its keep" stays | ACCEPTED |
| 29 | teeth | in sample | automated checks or blocking controls; each status stated separately (installed, observed running, blocking behaviour unverified) as the evidence supports; status tokens a tool reads stay | ACCEPTED |
| 30 | witness | 22, 12 | execution: a record showing whether the control ran; behaviour: a test and its recorded result; witness plan: how execution and the required behaviour will be checked and recorded. The unconditional-observation requirement and every unverified status stay | ACCEPTED |
| 31 | theatre | 11, 9 | the observed failure, as the evidence permits: a check whose claimed protection was unsupported; an approval step accepted on every recorded occasion; a mechanism that ran only in test mode | ACCEPTED |
| 32 | sovereignty, sovereign, sole arbiter | 15, 12 | templates: "The User alone decides the task's scope and quality and confirms when it is complete. The assistant describes work as done, complete or fixed only after the User explicitly confirms it. Any clear affirmative counts." Reader prose: "you decide the scope and the quality, and work counts as finished when you confirm it" | ACCEPTED IN PART: Astra's wording taken for templates; reader prose keeps the second person with the completion gate intact |
| 33 | spine | about 15 | PLANNING: the required plan sections; ESTATE_SPINE: file metadata, naming rules and generated indexes | ACCEPTED |
| 34 | seam | 2, 2 | the specific boundary in each use: "the boundary between shared framework files and this project's own Memento files", or "the boundary of this task's authorised changes" | ACCEPTED |
| 35 | surface set | 1, 1 | CORE_DIRECTIVES.md, CURRENT_FOCUS.md and STATUS.md: the rules, current task and session status | ACCEPTED |
| 36 | extant artefact, extant plan | 4, 4 | a plan saved as `plan-*.md` in the evidence archive before work begins; the operative rule keeps the User's explicit approval before implementation | ACCEPTED |
| 37 | governance charter | 1, 1 | instructions for how the assistant must work on the project | ACCEPTED |
| 38 | gate (new) | new | a condition that must be met before work proceeds, naming the condition and who or what checks it | ACCEPTED |
| 39 | one-way door (new) | new | an action that is irreversible or costly to undo, with the actual action named | ACCEPTED |
| 40 | shadow mode, shadow-run (new) | new | running the mechanism in test mode, recording what it would do while live work stays unaffected; each historical use checked against the actual mechanism | ACCEPTED |
| 41 | frozen memo (new) | new | a dated record whose body is kept as written; its status field is updated when its status changes | ACCEPTED |
| 42 | validation ledger; kill condition (new) | new | ledger: a record of each control's planned test, review date, evidence and verdict; kill condition: the result, set in advance, that requires a control to be retired | ACCEPTED |
| 43 | posture; apparatus; recital; host knowledge; in the field; meta-framework | as drafted | posture: approach; apparatus: the full set of files, procedures and tools; recital: having the assistant repeat the rules back; host knowledge: project-specific knowledge; in the field: in real projects; meta-framework: said as what it does, in slice 1's opening | CONFIRMED |

#### KEEP (ordinary English in its uses)

artefact; killed, kill; "earned its keep"; commit. CONFIRMED, with Astra's note: the surrounding sentence names the item created, the mechanism removed or the value measured.

#### Coverage notes

1. First-use explanations in every in-scope file: ACCEPTED IN PART (see "How the table is used").
2. The census demonstrates the vocabulary search only: ACCEPTED. Slice 0 step 1 reworded; each slice's prose review catches what the search misses.
3. The approval gate sentence read as open after approval: ACCEPTED. Marked satisfied.

#### The User's ruling

**RULED 2026-10-01: all 43 rows accepted as revised** (the User: "accept all"). Slice 0 CLOSED. Slice 1 opens.

### Slice 1: the front door (RULED 2026-10-01: all rows accepted as drafted)

**Files:** README.md, docs/index.md, docs/_config.yml (site description), framework/README.md (the D4 glossary section only; the rest of that file is slice 3). The glossary landed in this slice so the front door's links resolve.

**Review:** Astra, thread `t-20261001-075225-100f13`, message `m-20261001-080839-20d49a`. 15 sentence findings (S1-01 to S1-15), 3 inherited issues, glossary polish. Sources checked first-hand: CORE_DIRECTIVES_TEMPLATE.md:48 (private backup pushes may be free) and the CD numbering (sovereignty is CD #2), THE_ENFORCEMENT_SURFACE.md:26 and :30, THE_STORY.md:33 (the audit covered the three living projects), GETTING_STARTED.md (no time promise). All support the findings. S1-10 caught a balanced antithesis this session's own CD #5 check had missed.

**Dispositions:** ACCEPTED: S1-02, 03, 05, 07, 08, 10, 11, 12, 13, 14, 15; inherited "in an afternoon"; glossary CD #8 label, undertaking row, clickable links. ACCEPTED IN PART:
- S1-01: Astra's two-sentence opening taken; "consistently across months and hundreds of sessions" kept, since it carries the framework's thesis.
- S1-04: the false condition removed and Astra's first sentence taken; the second sentence keeps the old point that conduct matters ("a well-kept record of careless work still leaves the project damaged"), because Astra's "works with those records" narrows the protocols to record-keeping.
- S1-06: scoped to "the three projects still using it", per THE_STORY.md:33; linked to the story's audit section.
- S1-09: "does not reliably carry memory from one session to the next" keeps the design reason Astra's wording dropped, without the universal claim.
- Inherited "Nobody has watched one develop a product for eight months": recast as "AI agents can now work on their own for hours. Building a real product takes months…", keeping the hours-to-months hook without the unsupported universal. **Flagged to the User as a taste call:** it is his public thesis line.
- Inherited closing metaphor: Astra's "whose new memories fade" set aside (it changes the metaphor); "cannot form new long-term memories and whose performance varies from day to day" removes the contrast frame instead.

**Census (in-scope terms, lines before and after):** README estate 2→0, receipt 7→0, lineage 1→0, epoch 3→0, witness 1→0, sovereign 2→0, apparatus 1→0, in the field 1→0, meta-framework 1→0; docs/index the same pattern. Remaining hits are names (memory prosthesis, falsifiable governance, organ registry, graduation ladder) and file paths (`archive/canon-2025/`, `EPOCHS.md`).

**Ruling:** RULED 2026-10-01, all 22 rows accepted as drafted, including row 2 (the hours-to-months opening). The User: "review-memento-slice-1-2026-10-01.md - accept all", then, asked whether that meant Astra's wording verbatim or the table with its partial acceptances, chose the table as drafted.
