---
description: governs planning for UNDERTAKINGS of any kind, builds and beyond; when a plan is required (set by the work's properties), how predictable the plan claims to be, the sections every plan carries, extra sections for four kinds of work, and pointers for larger work
type: governing
date: 2026-07-20
governs: [planning, undertakings]
last_verified: 2026-07-20
status: template
---

# PLANNING_PLAYBOOK.md

> **Where this comes from:** rewritten on 2026-07-04 in the original project (a roadmapping tool for team capacity) from a classification of that project's pieces of work across its whole session history, in a frame the User agreed: a trigger based on the work's properties, a stated position on how predictable the plan is, a common set of required sections, and extra sections for four kinds of work drawn from what actually happened. Imported almost word for word by a newly started project on 2026-07-06, where it was classed as universal; fitted by this repository's own Memento files on 2026-07-20. The commit-level evidence is in the projects' private histories. Changes on this import: §1's list of places to search turned into slots; project-specific measurement hooks dropped; phrasing fitted to this repository's writing rules. This file's own history (one rewrite, then a series of transplants, each with a record of how it was fitted) is an example of the cross-pollination the story describes.

**Objective:** set out the scope, the approach, how predictable the plan is, the risks and the success criteria, and get the User's approval, before any qualifying UNDERTAKING (a piece of work of any kind), whatever it produces: code, a survey, a design, a decision, research, a campaign.

---

## 0. When a plan is required (the trigger)

**Rule:** A plan must exist before any undertaking with ANY of these properties:

- **Large:** many parts, or a wide area of the project;
- **Long-horizon:** likely to span sessions or longer arcs of work;
- **Many-stepped or complicated:** ordered steps whose sequence can go wrong;
- **Consequential or hard to reverse:** [your one-way doors, the actions that are irreversible or costly to undo: production systems, governing documents, published content, decisions about evidence records, deletions].

**A plan is always a saved file:** a `plan-*.md` saved in the evidence archive. A plan set out only in the conversation does not qualify: the conversation is lost at compaction while the work continues. If the work qualifies for a plan, the plan qualifies for a file.

**The smallness exemption (explicit):** if none of the properties is present, proceed directly WITHOUT a plan, and say so with the FIXED phrase: **"No plan: small, well-specified, reversible"** (character for character; the exact phrase makes the exemption searchable in transcripts, so the trigger leaves its own evidence). Skipping the trigger silently is the failure. Saying the exemption aloud shows the discipline working.

---

## 0-bis. How predictable the plan is (the predictive↔adaptive spectrum)

**Rule:** Every plan states where it sits between PREDICTIVE (the steps can be known up front) and ADAPTIVE (the steps are worked out as earlier work supplies the information). **The default is the cone of uncertainty:** near work planned in detail, later work as direction only, with **named review points built in**, where what has been learned may legitimately change the plan.

- Directions are commitments. Predictions are estimates, refined by the phases that inform them; the detailed plan for execution comes from the early phases, and nobody assumes it up front.
- **Changes of direction are recorded, with the evidence behind them.** Revising the plan at a named review point is the approach working as designed. Abandoning it without a recorded change of direction breaks the discipline.
- A fully predictive plan is the special case. Claim it only when the work is genuinely deterministic.

---

## 1. Pattern-First Research

**Rule:** Before proposing solutions, search the places where earlier work on this project is recorded (by hand, until a search tool is justified by a recorded need):

- **your project's Memento files:** evidence archive, active knowledge, institutional memory;
- **[your product's own documentation and history]**;
- **[any reference collections your work names]**: reading is free; anything IMPORTED goes through your confidentiality and source-recording checks (CD #4, CD #13).

State: `Pattern Search Results: [summary]`, citing the findings acted on or ruled out.

---

## 2. The required sections (every plan, every kind of work)

**Rule:** Every plan carries these sections, in whatever prose shape fits the kind of work:

1. **Pattern Search Results** (§1);
2. **Problem / purpose:** what this undertaking is for, and why now;
3. **Predictability** (§0-bis): its position on the spectrum, and the named review points;
4. **Scope and slices:** what is in, what is deliberately out, and the order of work, one slice at a time;
5. **Risks:** what could go wrong, dependencies, how reversible it is;
6. **Verification:** how each part gets checked (evidence, review, the User's own look, as the kind of work requires);
7. **Estimated Effort, relative sizing only (§2.5)**;
8. **the User's approval step (§5).**

### 2.5 Relative sizing (absolute)

**Rule:** Sizing MUST be relative. Estimates in absolute time (hours, days, weeks) are **PROHIBITED** in plans, slice scopes, per-slice tables and slice records.

**Valid sizing measures** (any combination): **S** (1 to 3 sub-tasks, additive only, one increment) / **M** (4 to 8 sub-tasks, moderate structural impact, several increments with the User looking between them) / **L** (9 or more sub-tasks, structural change or reach across several areas, must be sliced) · the number of sub-tasks · comparison with a known slice · structural impact (additive / structural / breaks an existing contract) · the increment-and-check pattern.

**Why:** guesses at absolute time are unreliable (the speed of AI-assisted work varies enormously from session to session) · absolute time anchors decisions wrongly · relative sizing brings the structural complexity into view · calendar dates differ from duration estimates ("ships this week" can be observed and is allowed; "takes ~12 hours" is not).

**Permitted exceptions (rare):** fixed time constraints imposed from outside the project; historical reporting only; NEVER estimates for planning ahead.

---

## 3. Extra sections by kind of work

Pick the set that fits; work that mixes kinds takes from each.

### 3A. Build / Change

The strict structured-proposal format is MANDATORY for build plans: `## Problem Statement` · `## Proposed Solution Overview` · `## Key Components/Changes` (specific files, components, systems) · `## Potential Risks` (breaking changes, dependencies, reversibility) · `## Verification Strategy Overview` · `## Estimated Effort (relative sizing only, §2.5)`.
**Removal variant** (removals, retirements, migrations) adds: a search for everything that refers to the thing before removing it (what the removal would affect) · migrate tests of live behaviour, and do not delete them (learned from an incident in the projects) · verification in stages · **a banner and an archived copy in place of deleting governing text** (CD #4).

### 3B. Investigation (surveys, audits, censuses, forensics, root-cause analyses)

Adds: **a machine-derived total** (what full coverage means: a file count, a registry, a list of clauses; no hand-waved totals) · **method and routing** (what helper agents sweep, and what the main session judges at first hand; never cite a helper agent's reported total as evidence: derive and verify the citable total directly from the underlying records) · **the verdict labels declared up front** (e.g. CONFIRMED / CORRECTED / DISCARDED / OPEN) · **evidence for every verdict, without exception** · slice boundaries, with a review at each. Where the work is a survey only: list the resulting actions, and never carry them out during the survey.

### 3C. Design / Decision (short experiments, models, options, policies)

Adds: **list the real-world variation WITH the User before designing any structure** (the variety the domain actually has comes first; if the list is long, run a modelling experiment first) · **options kept neutral** until tested, with no language that commits to one early · **a failure criterion for each option, with dates where an option could be dropped** · at design moments for governing concepts, consider one bounded round of widening the options before narrowing (the process tends to settle too early) · the decision itself is the User's; the plan prepares it.

### 3D. Research / Synthesis (outside practice, bodies of material, putting ideas into words)

Adds: **a list of sources with the verification status of each kind** (read at first hand, relayed by a helper agent, or a lead not yet fetched, each labelled) · **claim-status discipline** (everything delegated is a claim until checked; an UNVALIDATED banner where it applies) · one voice across a set of documents by a single author · the finished product named up front (what document, for whom).

---

## 4. Pointers for larger work (kinds of work with their own homes)

- **Campaign or multi-session arc** (phases with approval steps, a standard, a backlog of options, exit criteria) → adopt the governed-optimisation form from the projects where Memento developed when the first campaign starts; this playbook's required sections still apply to each phase's plan.
- **Operational batch at scale** (sweeps, backfills, changes to many records at once) → the RUNBOOK form: a fixed vocabulary, a procedure for each batch, conditions for stopping, and a manifest. Create it at the batch slice.

---

## 5. User Approval Gate

**Rule:** End with: 'Awaiting user approval of this plan before detailed design or implementation.' **No implementation work begins until explicit user approval is received.** (CD #2: the User alone decides; any clear affirmative counts.)

---

## 6. Iterative Slicing (for L-sized undertakings of any kind)

**Rule:** L-sized undertakings propose a breakdown into smaller slices, each with clear success criteria: identify the smallest useful increment · define the layers that add to it · each slice delivers value that can be checked · checkpoints between slices · one slice in progress at a time.

---

## Additional Guidelines

- **Working context:** refer to `../../memory-prosthesis/working-context/CURRENT_FOCUS.md`; align with its current constraints; raise conflicts openly, and do not quietly absorb them.
- **Risk prompts (required section 5):** structural: [your project's structural risks, e.g. confidentiality of imports, irreversibility of anything pushed or deployed, one thread's changes leaking into another's]; project: scope creep, dependencies, conflicting priorities; and, per §0-bis, say which risks a named review point can absorb and which threaten the plan itself.
- **[Language standard]** throughout (CD #5).
- **Knowledge capture:** note new patterns for the knowledge archive; record decisions for future reference.
