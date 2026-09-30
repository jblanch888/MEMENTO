---
description: the routing policy for every turn of work; types of worker and tiers of model; the reference behind the routing directive (CD #12)
type: governing
date: 2026-07-20
governs: [model-routing, executor-routing]
last_verified: 2026-07-20
status: template
---

# RESOURCE_ROUTING.md

> **Where this comes from:** the User's routing rule, stated word for word in the original project on 2026-06-14 (a roadmapping tool for team capacity; the operating rules below condense that project's later refinements to delegation, each backed by evidence in its validation ledger), by way of a newly started project's compact form on 2026-07-06 and the fitting by this repository's own Memento files on 2026-07-20. Changes on this import: the routing table's kinds of work turned into a slot with worked rows; project-specific evidence identifiers removed; the note on naming retold in general terms.

**The law (as the User set it in the original project):** the frontier model carries judgement, not exhaust. The smart tier carries bounded implementation, extraction and review. The recon tier carries search and noise. Deterministic code carries everything code can decide. The User carries sovereignty.

*In plain words: use the frontier tier for judgement, and keep routine high-volume work off it; the smart tier for bounded implementation, extraction and review; the recon tier for searching and sifting; and deterministic code for work that fixed rules can decide. The User retains final authority.*

**Naming note: tie tiers to roles.** Model names go out of date; roles last across model generations. Tie your table to roles (frontier / smart / recon) and record which model filled each role, with the date, checking it against the live session each time, since the recorded line can be out of date. The projects have evidence of both ways that tying a table to model names fails: a governing document stated a recollection about a model family that a later live session contradicted, and a smart-tier reviewer, able to see only its own model, mistook its tier for the whole session's. Tying to roles avoids both. Where the tool that launches agents offers tier names that resolve to the newest model in a tier, prefer them: the table then needs no edit when new models are released.

## The decision loop (every turn of work, CD #12)

1. **Break** the turn into parts.
2. **First question:** does this start an undertaking that is large, likely to span sessions, many-stepped or consequential? If so, a saved plan comes first (PLANNING §0); if not, say the fixed exemption phrase: "No plan: small, well-specified, reversible".
3. **Assess** how much judgement each part actually needs.
4. **Choose** the worker by type AND tier, for fit first and then for cost.
5. **State the reason before acting.** Keeping work in the main session is a legitimate outcome. The failure is skipping the loop, in either direction: delegating without thinking and keeping everything without thinking both count.

## Routing table (fit the kinds of work to your project)

| Kind of work | Route |
|---|---|
| Wide searches: sweeping the repository for patterns, scanning long documents or logs, surveying reference material | scout (recon tier); move up to the smart tier for surveys that need synthesis or must prove something is absent (a confident but false "not found" is a known recon-tier failure) |
| Mechanical execution from a settled specification; boilerplate; sweeps of renames or formatting | implementer (smart tier) |
| Adversarial review before presentation (the reviewer starts by assuming the work has faults) | reviewer (smart tier); frontier review only if the User asks |
| Judgement where things are unclear: design trade-offs, drafting governing documents, writing the working context, the final synthesis for a human reader | the main session (frontier) only |

**NEVER delegate:** the User's approvals and verdicts · judgement about governing documents · writing the working context · destructive operations · clearing material for confidentiality or removing identifying details (these go to the User) · the final synthesis for a human reader.

**A named waste:** frontier after the specification is settled, meaning the frontier model doing mechanical execution once the design is decided. Catch it yourself.

**Exceptions** (log as `ROUTING-EXCEPTION: <class>`): design-not-settled · trivial-single-edit · incident · User-directed.

## Operating rules (condensed from the projects' refinements to delegation)

1. **Name the model and the tools in every launch of an agent.** No inheriting from the parent, ever. Since 2026-09 this rule has a mechanism: the tier map (`framework/conventions/TIER_MAP.json`, which fixes each role to a rank on a ladder of tier names, with a policy that applies to any agent runtime plus a binding for each runtime) and the spawn check (`memento/tools/agent-tier-gate.py`, a hook on the tools that launch agents, which refuses any launch without a named tier and requires a reason for a frontier rank or a fork; workflow scripts are inspected call by call). Agent definitions are generated from the map (`memento/tools/generate_agents.py`). Each project carries identical copies and checks their hashes against this repository. The decision loop above stays a discipline; only the naming of the tier is enforced.
2. **Specification in, contract out.** Every agent returns: files or findings with paths, evidence of verification, assumptions and risks. Save outputs that later work depends on as files the main session can retrieve and check.
3. **Check a sub-agent's work before relying on it:** its verification evidence includes the raw output, word for word, and the main agent repeats at least one verification step itself before relying on it. Returned work is a claim until checked (CD #6). Prompts to scouts ask for evidence plus an explicit "not found", and leave the verdict out: the prompt itself keeps judgement with the main session.
4. **Disagreements go to the User:** a reviewer's NEEDS-CHANGES blocks by default; the main session may override it only with the User's explicit approval, and the override is logged.
5. **Split work across agents only when it divides cleanly; keep connected reasoning in the main session.** Every handover loses information, so sequential reasoning, and reasoning that depends on bringing many parts together, stays in one agent.
6. **Background outputs are claims you must fetch before relying on them.** Prefer delegating in the foreground when the output feeds a judgement or a commit.
7. **Do trivial one-off lookups directly in the main session:** the cost of launching an agent is greater than the task.

**Measurement tools are added when needed:** the original project measures how well the law is followed with logging (routing panels, the trend in the frontier model's share of work); adopt the written discipline first, and add the dashboards when the scale of the work calls for them.
