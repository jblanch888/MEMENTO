---
description: plan — 3B investigation: audit the lineage's organs across the three deployment estates (origin, transplant path, mutations, incident receipts), producing the canon's provenance backbone
type: plan
date: 2026-07-20
governs: []
status: complete
---

# plan-lineage-audit-2026-07-20

> **CLOSED COMPLETE 2026-07-20 (the User's Slice D gate).** All four slices delivered. Deviations ratified at gates: verdicts banked as one consolidated memo; Slice C folded into Slice B's evidence pass. Deliverables: `reference-organ-registry-2026-07-20.md` (frozen, origins amended) · `finding-lineage-verdicts-2026-07-20.md` (82C/8X/6D) · `reference-provenance-backbone-2026-07-20.md` (proposed backbone). Open successors: pivot P1; the substrate question.

## Pattern Search Results

Estate: the four `reference-recon-*` memos (banked Slice 1) name the candidate organs and the open contradictions; `CHARTER.md` stance 2 defines what this audit must substantiate (portability via deliberate cross-pollination, transplant provenance as part of the artefact); PLANNING §3B supplies the genre discipline. Deployment estates (read-only): trv3's ledger and evidence archive are the receipt trove; cartographer's provenance headers model per-transplant records; rooms holds the posture-vs-practice contradiction. **Acted on:** 3B annex in full (machine-derived denominator, verdict vocabulary, receipts-per-verdict, scout totals never citable). **Ruled out:** starting canon prose from the audit's partial results (P1 not yet decided; audit is deliberately P1-independent).

## Problem / Purpose

The canon will claim that one deliberately cross-pollinated line of governance organs survived three heterogeneous hosts. That claim currently rests on scout-relayed reconnaissance. This audit grounds it: for every organ, WHERE it originated, WHEN and HOW it was transplanted, WHAT mutated at each transplant, and WHICH incidents receipted it — producing the organ registry that becomes the canon's provenance backbone under either P1 outcome. **Why now:** every canon claim currently rests on scout-relayed reconnaissance alone; this audit is the pre-condition for the P1 decision context and for any canon prose — nothing downstream is safe to write until it reports.

## Posture

Predominantly predictive: the denominator freezes in Slice A and the per-organ method is uniform. Adaptive at the edges: tracing may surface unknown organs or kill claimed ones. **Named pivot:** if the frozen denominator exceeds ~25 organs, the User chooses between full coverage and a canon-load-bearing subset before Slice B proceeds.

## Method + Routing (3B)

- **Denominator (Slice A, two steps — honest about where the judgement sits):** (A1) deterministic extraction of every named mechanism/discipline from closed sources — this estate's fitted documents (14 CDs, routing law, planning genres, charter concepts) and the four recon memos, which name mechanisms in findings-form prose, NOT ready-made organ lists; (A2) an editorial entity→organ mapping (what counts as a discrete organ vs a sub-feature) performed in main — frontier judgement, owned rather than laundered as mechanical — and presented to the User for approval. The 3B requirement is served by the **frozen, numbered, User-approved registry**: after freeze the total is fixed and auditable — no hand-waved totals. *(Reworked per this plan's own adversarial review, finding 3/15: the original "machine-derived" claim overclaimed.)*
- **Access + exposure model:** the primary has direct read access to all three source estates on this machine — Slice C is a genuine first-hand primary read, and reading confidential source material in-session is permitted (CD #4e gates imports, not reads). The confidentiality boundary is **anything written into this repository** (memos, registry, working context): nothing from any source estate or scout output is quoted into a written artefact without the two-lane sweep (deterministic banned-token grep + judgement review), and de-identification is performed to **publication depth** — pivot P2 could one day make this archive public, so today's de-identification must already survive that.
- **Verdict vocabulary (declared up front):** per organ per estate — CONFIRMED (first-hand receipt located) / CORRECTED (exists, but the recon claim was wrong in a stated way) / DISCARDED (claimed organ does not exist there) / OPEN (not yet traceable). Receipts-per-verdict: source-estate file path + date + commit (the source estates are git-tracked — the commit is determinable, not optional), no exceptions.
- **Routing:** scouts sweep per estate (recon-tier; **smart-bump for absence-proving** — DISCARDED verdicts are judgement-adjacent recon); scout prompts request evidence + explicit "not found", never verdicts. **Scout-only support can never yield CONFIRMED:** the primary verdicts every registry organ first-hand before it carries CONFIRMED; per-scout spot-reproduction (RESOURCE_ROUTING rule 3) is the floor for everything else, and anything not yet primary-verified stays OPEN. Scout fan-out is decomposable work — parallel where beneficial (User-endorsed).
- **Survey-only integrity:** dispositions listed, never executed mid-survey — no source estate is modified; nothing is imported during the audit. Findings are banked de-identified (CD #4e applies at banking).

## Scope and Slices (WIP of one)

- **Slice A — registry freeze:** enumerate and number the organs; bank `reference-organ-registry-2026-07-*.md` (the denominator). Present count to the User (pivot check).
- **Slice B — per-organ tracing:** per estate, per organ: origin/transplant/mutation/receipt. Scout fan-out per estate; primary verdicts. Banked as `finding-lineage-<estate>-2026-07-*.md` series. If tracing surfaces an organ absent from the frozen registry, the User decides: re-freeze (a numbered Slice A increment) or hold as an OPEN addendum — never a silent mid-audit addition.
- **Slice C — rooms re-grounding:** first-hand read of rooms' founding documents to resolve the posture-vs-practice contradiction (spirit-only self-description vs full estate observed). Explicit verdict with receipts.
- **Slice D — synthesis:** the audited registry as one memo — organ × estate matrix with verdicts, the transplant timeline, and the killed-mechanism roll (the "falsifiable or dead" exhibits). This is the **proposed** provenance backbone — subject to CD #13's epistemic contract and the User's approval before any canon use; deliverable of record for pivot P1's decision context.
- **Consciously out:** any canon edit; any import of source text; the epoch-numbering and adoption-ladder design decisions (3C, separately planned after this audit reports).

## Risks

- **Confidentiality at banking** — all written artefacts pass the two-lane sweep at publication depth (see access + exposure model) before commit (posture-absorbed; the Slice 1 pattern is the template). P2 is the named risk multiplier: de-identification insufficient for eventual publication would have to be re-done across the whole archive.
- **Scout confident-false absence** — mitigated by smart-bump on absence-proving and primary spot-reproduction; residual risk named.
- **Registry explosion** — the named pivot absorbs it.
- **Source-estate drift during the audit** (they are live repos) — receipts carry dates; plan-threatening only if a source estate restructures mid-audit, in which case re-freeze with the User.

## Verification Discipline

Receipts-per-verdict (path+date+commit, spot-reproduced); adversarial review of each findings memo before banking (CD #14); the two-lane confidentiality sweep on every artefact; the User's eyeball at each slice boundary; Slice D's deliverable additionally subject to CD #13 before any canon use.

## Estimated Effort (relative — §2.5)

Slice A: **S** (registry compile from banked sources, single increment). Slices B: **L** — the audit's bulk; sliced per estate, scout fan-out inside each. Slice C: **S**. Slice D: **M**. Overall: **L**, comparable to Slice 0+1 combined.

## Approval Gate

Awaiting user approval of this plan before detailed design or implementation.
