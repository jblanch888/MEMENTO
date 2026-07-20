---
description: per-turn routing policy — executor types and model tiers; the canonical reference behind the routing directive (CD #12)
type: governing
date: 2026-07-20
governs: [model-routing, executor-routing]
last_verified: 2026-07-20
status: template
---

# RESOURCE_ROUTING.md

> **Provenance:** the User's verbatim routing mandate in the origin estate, 2026-06-14 (a team-capacity roadmapping tool; the operating rules condense that estate's delegation refinements, receipted there on its validation ledger), via a fresh-founded estate's compact form 2026-07-06 and the auditing estate's fitting 2026-07-20. Fitting changes on this import: the routing table's work classes generalised to a fitting slot with worked rows; estate-specific receipt identifiers removed; the naming note retold generically.

**The law (User-mandated in the lineage):** the frontier model carries judgement, not exhaust. The smart tier carries bounded implementation, extraction and review. The recon tier carries search and noise. Deterministic code carries everything code can decide. The User carries sovereignty.

**Naming note: bind tiers to roles.** Model names go stale; roles survive generations. Bind your table to roles (frontier / smart / recon) and record the observed model bindings with a date, re-verifying against the live session rather than trusting the recorded line. The lineage has receipts for both failure modes of name-binding: a governing doc asserting a model-family recall that a later live harness contradicted, and a smart-tier reviewer that could only see its own binding and mistook its tier for the whole session's. Role-binding survives both. Where the spawn surface offers tier aliases that resolve to the newest model in a tier, prefer them: the table then needs no edit when models rev.

## The decision loop (every work turn, CD #12)

1. **Decompose** the turn into parts.
2. **First question:** does this start an undertaking that is large / long-horizon / many-stepped / consequential? → extant plan first (PLANNING §0), or say the fixed exemption phrase: "No plan: small, well-specified, reversible".
3. **Assess** the judgement each part actually needs.
4. **Select** executor across type AND tier, fit-first then cost.
5. **Surface the why before acting.** Keeping work in main is a legitimate outcome. The failure is skipping the loop, in either direction: blind delegation and blind self-reliance both count.

## Routing table (fit the work classes to your endeavour)

| Work class | Route |
|---|---|
| Breadth search: repo pattern sweeps, large doc/log scanning, reference-corpus recon | scout (recon-tier); bump to smart-tier for synthesis-heavy or absence-proving recon (confident-false absence is a known recon-tier failure) |
| Mechanical execution from a settled spec; boilerplate; rename/format sweeps | implementer (smart-tier) |
| Pre-presentation adversarial review (assume-failure posture) | reviewer (smart-tier); frontier review only if the User asks |
| Judgement under ambiguity: design trade-offs, governing-doc drafting, working-context writes, final human-facing synthesis | main (frontier) only |

**NEVER delegate:** the User's gates and verdicts · governing-doc judgement · working-context writes · destructive ops · de-identification/confidentiality clearance (surfaces to the User) · the final human-facing synthesis.

**Named waste event:** frontier-after-spec — the frontier model doing mechanical execution after design is settled. Self-catch it.

**Exception classes** (log as `ROUTING-EXCEPTION: <class>`): design-not-settled · trivial-single-edit · incident · User-directed.

## Operating rules (condensed from the lineage's delegation refinements)

1. **Pin model + tools in every spawn.** No inheritance, ever.
2. **Spec-in, contract-out.** Output contract for all agents: files/findings with paths, verification evidence, assumptions, risks. Load-bearing outputs are preserved as artefacts, not just folded into conversation.
3. **Subagent work must be verified before it is relied on:** verification evidence includes raw output verbatim; the main agent independently reproduces at least one verification step before relying on it. Delegated output is a claim until re-grounded (CD #6). Scout prompts ask for evidence plus an explicit "not found" rather than a verdict: judgement stays with the primary, honoured in the prompt itself.
4. **Disagreement routes to sovereignty:** a reviewer NEEDS-CHANGES blocks by default; the primary may override only with the User's explicit approval, logged.
5. **Fan-out only decomposable work; keep coherent reasoning in main.** Every handoff loses information; sequential and integration-heavy reasoning stays in one agent.
6. **Async outputs are claims you must retrieve before relying.** Prefer foreground delegation when the output feeds a judgement or a commit.
7. **Trivial one-shot lookups are done directly in main:** spawn overhead exceeds the task.

**Measurement is earned tooling:** the origin estate instruments the law with telemetry (routing panels, frontier-share trend); adopt the prose discipline first and let scale earn the dashboards.
