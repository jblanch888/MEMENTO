---
description: per-turn routing policy — executor types and model tiers for the mid-2026 canon endeavour; CD #12's canonical reference, fitted from the trv3-temporal routing law via cartographer's compact form
type: governing
date: 2026-07-20
governs: [model-routing, executor-routing]
last_verified: 2026-07-20
status: governing
---

# RESOURCE_ROUTING.md

**The law (inherited, User-mandated in the lineage):** the frontier model carries judgement, not exhaust. The smart tier carries bounded implementation, extraction and review. The recon tier carries search and noise. Deterministic code carries everything code can decide. The User carries sovereignty.

**Naming note — tiers are roles, not model names.** Observed bindings as of 2026-07-20 (harness-attested in the founding session): frontier = Fable 5, smart = Sonnet 4.6, recon = Haiku 4.5. Bindings drift with model generations — re-verify against the live session every time; never trust this line's date. Worked evidence for why: the trv3 source doc's 2026-06-16 naming note asserts a model-family recall that this founding session's live harness contradicts — and the founding review's smart-tier reviewer, seeing only its own binding, mistook its tier for the whole session's (finding 13, part-refuted with receipts). Role-binding survives both failure modes; name-binding survives neither.

**Harness note (verified live 2026-07-20):** spawn pins are tier ALIASES — `sonnet` / `haiku` / `opus` / `fable` — each resolving to the newest model in its tier; a live probe pinned to `sonnet` reported `claude-sonnet-4-6`. A new generation in a tier is picked up by the same alias automatically on release; exact-version pinning is not offered by the spawn surface, so the routing table needs no edit when models rev.

## The decision loop (every work turn, CD #12)

1. **Decompose** the turn into parts.
2. **First question:** does this start an undertaking that is large / long-horizon / many-stepped / consequential? → extant plan first (PLANNING §0), or say the fixed exemption phrase: "No plan: small, well-specified, reversible".
3. **Assess** the judgement each part actually needs.
4. **Select** executor across type AND tier, fit-first then cost.
5. **Surface the why before acting.** Keeping work in main is legitimate; skipping the loop is the failure — in either direction (blind delegation AND blind self-reliance).

## Routing table (fitted to this endeavour)

| Work class | Route |
|---|---|
| Cross-estate recon: deployment-estate sweeps, repo pattern search, lineage tracing at breadth, large doc/log scanning | scout (recon-tier); bump to smart-tier for synthesis-heavy or absence-proving recon (confident-false absence is a known recon-tier failure) |
| Mechanical transplants from a settled spec; boilerplate; rename/format sweeps | implementer (smart-tier) |
| Pre-presentation adversarial review (assume-failure posture) | reviewer (smart-tier); frontier review only if the User asks |
| Canon judgement — epoch narrative, directive fitting, adoption-ladder design, trade-offs under ambiguity; governing-doc drafting; working-context writes; final human-facing synthesis | main (frontier) only |

**NEVER delegate:** the User's gates and verdicts · governing-doc judgement · working-context writes · destructive ops · de-identification/confidentiality clearance (surfaces to the User) · the final human-facing synthesis.

**Named waste event:** frontier-after-spec — the frontier model doing mechanical execution after design is settled. Self-catch it.

**Exception classes** (log as `ROUTING-EXCEPTION: <class>`): design-not-settled · trivial-single-edit · incident · User-directed.

## Operating rules (inherited, condensed)

1. **Pin model + tools in every spawn.** No inheritance, ever.
2. **Spec-in, contract-out.** Output contract for all agents: files/findings with paths, verification evidence, assumptions, risks. Load-bearing outputs are preserved as artefacts, not just folded into conversation.
3. **Subagent work is verified, not trusted:** verification evidence includes raw output verbatim; the main agent independently reproduces at least one verification step before relying on it. Delegated output is a claim until re-grounded (CD #6). Scout prompts ask for evidence + an explicit "not found", never a verdict — judgement stays with the primary, honoured in the prompt.
4. **Disagreement routes to sovereignty:** a reviewer NEEDS-CHANGES blocks by default; the primary may override only with the User's explicit approval, logged.
5. **Fan-out only decomposable work; keep coherent reasoning in main.** Every handoff loses information; sequential/integration-heavy reasoning stays in one agent.
6. **Async outputs are claims you must retrieve before relying.** Prefer foreground delegation when the output feeds a judgement or a commit.
7. **Trivial one-shot lookups are done directly in main** — spawn overhead exceeds the task.

**Provenance:** fitted 2026-07-20 from trv3-temporal's RESOURCE_ROUTING (the User's verbatim mandate 2026-06-14; the seven operating rules condense that estate's delegation refinements and sub-agent fitness codifications — receipts live in the trv3 estate under its V13/M-010 identifiers) via cartographer's 2026-07-06 compact form. Telemetry-backed measurement (routing panels, frontier-share trend) is earned tooling, not yet built here.
