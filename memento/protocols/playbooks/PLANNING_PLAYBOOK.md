---
description: governs planning for UNDERTAKINGS of any kind (not just builds) — property-based trigger, predictive↔adaptive posture, one common spine, four genre annexes, two scale pointers; fitted 2026-07-20 from the trv3-temporal 2026-07-04 multi-genre rewrite via cartographer's 2026-07-06 Universal-tier import
type: governing
date: 2026-07-20
governs: [planning, undertakings]
last_verified: 2026-07-20
status: governing
---

# PLANNING_PLAYBOOK.md

**Objective:** Define scope, approach, posture, risks and success criteria — with the User's approval gate — ahead of any qualifying UNDERTAKING, whatever its product: code, a survey, a design, a decision, research, a campaign.

---

## 0. When a plan is required (the trigger)

**Rule:** A plan precedes any undertaking with ANY of these properties:

- **Large** — many parts or a wide surface;
- **Long-horizon** — likely to span sessions or arcs;
- **Many-stepped / complicated** — ordered steps whose sequencing can go wrong;
- **Consequential or hard to reverse** — canon content, governing docs, anything pushed public, evidence-archive dispositions, deletions.

**A plan is an EXTANT ARTEFACT, always:** a banked `plan-*.md` in the evidence archive — in-chat phases are not a plan (chat dies at compaction; the undertaking doesn't). If it qualifies for a plan, it qualifies for a file.

**The smallness exemption (explicit):** none of the properties present → increment directly WITHOUT a plan — and say so with the FIXED phrase: **"No plan: small, well-specified, reversible"** (character-for-character; the exact phrase makes the exemption transcript-greppable, so trigger discipline emits its own receipts). Silent skipping is the failure mode; a spoken exemption is the discipline working.

---

## 0-bis. Posture (the predictive↔adaptive spectrum)

**Rule:** Every plan declares where it sits between PREDICTIVE (steps knowable up front) and ADAPTIVE (steps earned by discovery). **The estate's default posture is the cone of uncertainty:** near work at high resolution, far work directional only, with **named feedback points and pivot opportunities built in** — gates where learning may legitimately re-shape the plan.

- Directions are commitments; predictions are not. The execution plan is EARNED by the early phases, not assumed up front.
- **Pivots are recorded as integrations on receipts, never silent reversals.** A plan revised at a feedback point is the posture working; a plan silently abandoned is a failure.
- A fully-predictive plan is the special case, not the norm — claim it only when the work is genuinely deterministic.

---

## 1. Pattern-First Research

**Rule:** Before proposing solutions, search this endeavour's research surface manually (probe tooling is earned when estate scale demands it, per the cartographer precedent):

- **this estate** — evidence archive, active knowledge, institutional memory;
- **the canon** at repo root — the Aug 2025 framework content being superseded;
- **the three deployment estates, read-only, as reference corpora** — trv3-temporal, cartographer, rooms. They are this endeavour's knowledge base; anything IMPORTED from them crosses the de-identification and provenance gates (CD #4e, CD #13). Reading is free; importing is gated.

State: `Pattern Search Results: [summary]`, citing the hits acted on or ruled out.

---

## 2. The Common Spine (every plan, every genre)

**Rule:** Every plan carries, in whatever prose shape fits the genre:

1. **Pattern Search Results** (§1);
2. **Problem / purpose** — what this undertaking is for and why now;
3. **Posture** (§0-bis — position on the spectrum + the named feedback/pivot points);
4. **Scope and slices** — what's in, what's consciously out, WIP-of-one ordering;
5. **Risks** — what could go wrong, dependencies, reversibility;
6. **Verification discipline** — how each part gets witnessed (receipts, review, the User's eyeball — per genre);
7. **Estimated Effort — relative sizing only (§2.5)**;
8. **the User's approval gate (§5).**

### 2.5 Relative sizing (absolute)

**Rule:** Sizing MUST be relative. Absolute time estimates (hours, days, weeks) are **PROHIBITED** in plans, slice scopes, per-slice tables and slice memos.

**Valid sizing dimensions** (any combination): **S** (1-3 sub-tasks, additive only, single increment) / **M** (4-8 sub-tasks, moderate structural impact, multiple increments with eyeball between) / **L** (9+ sub-tasks, structural change or cross-surface reach, requires slicing) · sub-task count · comparison to a known slice · structural impact (additive / structural / contract-collapse) · increment-and-validate pattern.

**Why:** speculative absolute time is unreliable (AI-assisted velocity varies by orders of magnitude session-to-session) · absolute time anchors decisions wrongly · relative sizing surfaces structural complexity rather than chronological optimism · calendar dates differ from duration estimates ("ships this week" is observable and allowed; "takes ~12 hours" is not).

**Permitted exceptions (rare):** external hard constraints; historical retrospective only; NEVER forward-planning estimates.

---

## 3. Genre Annexes (what each genre ADDS to the spine)

Pick the annex that fits; hybrids take from both.

### 3A. Build / Change

The strict structured-proposal format is MANDATORY for build plans: `## Problem Statement` · `## Proposed Solution Overview` · `## Key Components/Changes` (specific files/components/systems) · `## Potential Risks` (breaking changes, dependencies, reversibility) · `## Verification Strategy Overview` · `## Estimated Effort (relative sizing only — §2.5)`.
**Debt/excision variant** (removals, retirements, migrations) adds: reference sweep before removal (blast radius), migrate-don't-delete for live-behaviour tests (incident-receipted in the lineage; applies whenever a test suite exists here), staged verification, **banner-and-archive over deletion for governing and canon text** (CD #4d).

### 3B. Investigation (surveys, audits, censuses, forensics, RCAs)

Adds: **a machine-derived denominator** (what full coverage means — file count, registry, clause list; no hand-waved totals) · **method + routing** (what scouts sweep, what the primary verdicts first-hand — scout totals are never citable) · **verdict vocabulary declared up front** (e.g. CONFIRMED / CORRECTED / DISCARDED / OPEN) · **receipts-per-verdict, no exceptions** · slice boundaries with review per slice. Survey-only integrity where applicable: dispositions listed, never executed mid-survey.

### 3C. Design / Decision (spikes, models, options, policies)

Adds: **variance enumeration WITH the User before schema** (the domain's real-world variance precedes any structure; long list → modelling spike first) · **options held neutral** until tested — no pre-commitment language · **falsifiers per option, with dates where killable** · divergence-before-convergence considered at design moments for governing concepts (one bounded pass; the apparatus converges too eagerly) · the decision itself is the User's; the plan prepares it.

### 3D. Research / Synthesis (external practice, corpora, articulation)

Adds: **source inventory + verification status per class** (first-hand read vs scout-relayed vs unfetched lead — labelled) · **claim-status discipline** (everything delegated is a claim until re-grounded; UNVALIDATED banners where earned) · the one-voice rule for multi-artefact single-author corpora · synthesis deliverable named up front (what artefact, for whom).

---

## 4. Scale pointers (genres with their own homes)

- **Campaign / multi-session arc** (gated phases, standard, option backlog, exit criteria) → adopt the lineage's governed-optimisation form when the first campaign starts; this playbook's spine still applies to each phase's plan.
- **Operational batch at scale** (sweeps, backfills, mass mutations) → the RUNBOOK genre: closed vocabulary, per-batch procedure, halt conditions, manifest. Instantiate at the batch slice.

---

## 5. User Approval Gate

**Rule:** Conclude with: 'Awaiting user approval of this plan before detailed design or implementation.' **No implementation work begins until explicit user approval is received.** (CD #2: the User is sovereign; any clear affirmative counts.)

---

## 6. Iterative Slicing (for L undertakings of any genre)

**Rule:** L-sized undertakings propose a breakdown into smaller slices with clear success criteria each: identify the minimum viable increment · define enhancement layers · each slice delivers verifiable value · validation points between slices · WIP of one.

---

## Additional Guidelines

- **Working-context integration:** reference `../../memory-prosthesis/working-context/CURRENT_FOCUS.md`; align with current constraints; surface conflicts rather than absorbing them.
- **Risk scaffolding (spine item 5):** structural — seam leakage (estate↔canon), confidentiality on imports, irreversibility of anything pushed; project — scope creep, dependencies, priority conflicts; and per §0-bis, name which risks are posture-absorbed (a pivot point exists) vs plan-threatening.
- **British English** throughout (CD #5).
- **Knowledge capture:** note novel patterns for the knowledge archive; document decisions for future reference.

---

**Provenance:** rewritten 2026-07-04 in trv3-temporal from the 94-session undertaking taxonomy (User-agreed frame: property trigger, posture spectrum, spine + four empirically-derived genre annexes); imported near-verbatim to cartographer 2026-07-06 and classified Universal tier there; fitted to the MEMENTO estate 2026-07-20. **Fitting changes on record (founding review 2026-07-20):** §1 research surface refitted cross-estate with the read-free/import-gated rule, manual discipline until tooling earned; CD references repointed to this estate's set; trv3-specific measurement hooks dropped as unearned; §3A "Test Strategy Overview" renamed "Verification Strategy Overview" and its risks line trades "performance" for "reversibility" (this estate's product is governed text, not a performance-sensitive codebase; the seam makes reversibility the primary risk dimension); Additional Guidelines risk scaffolding relabelled "technical"→"structural" and re-populated with this estate's real risks (seam leakage, import confidentiality, push irreversibility). This file's own lineage — one rewrite, two transplants, each with fitting receipts — is itself a specimen of the cross-pollination the canon documents.
