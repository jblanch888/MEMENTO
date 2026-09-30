---
description: template for the register of tools added on evidence; each tool is built when its recorded trigger occurs, and every wired tool carries an honest enforcement status and a plan for checking that it runs
type: governing
date: 2026-07-20
governs: [earned-tooling, mechanisation]
last_verified: 2026-07-20
status: template
---

# TOOLING_TRIGGERS.md

> **Where this comes from:** the practice of adding tools only on evidence reached its strongest form in a project started in 2026 (some tools built by founding decision, triggers recorded for the rest), and was gathered into a single register by the Memento files that produced this repository. The evidence for the practice is the list of killed mechanisms: controls installed before anyone needed them were removed once their protection proved unsupported.

**The approach:** automated enforcement is added when an incident shows it is needed. Each row below names a tool the project might one day build, and the trigger that would justify building it. Until the trigger occurs, the rule is followed by discipline alone. Once a tool is wired in, its row carries an honest enforcement status (WIRED / RUNS VERIFIED / UNVERIFIED for each of its functions) and a plan for checking and recording that it runs, because a tool with no record of running cannot be told apart from one that has stopped.

| Tool | Trigger that justifies it | Status |
|---|---|---|
| [Pre-compact check (a hook)] | [Wired at the start if losing state at compaction is your main failure, or at the first compaction that loses state] | [Not built / WIRED + enforcement status + plan for checking it runs] |
| [Pattern-search tool] | [The Memento files pass about 30 documents, or a manual search demonstrably misses something that is there] | [Not built] |
| [Health checks ("doctor"): frontmatter, links, freshness] | [The first incident of a broken cross-reference, or the first full compaction cycle] | [Not built] |
| [Restart comparison (restart-diff packet)] | [The first mismatch, after a compaction, between the working context's claims and the live project] | [Not built] |
| [Generated indexes / governance map] | [The evidence archive grows too big to scan by hand, about 15 records] | [Not built] |
| [Logs of each tool's runs (telemetry)] | [The first time a tool's effectiveness is disputed and written argument cannot settle it] | [Not built] |
| Spawn-tier check + tier map (`memento/tools/agent-tier-gate.py`, `framework/conventions/TIER_MAP.json`, `generate_agents.py`) | A session limit or allowance used up by sub-agents that inherited the parent's frontier model (occurred 2026-09-05 in the Rooms project: 346 frontier-model requests from one afternoon of helper agents left on the default tier) | BUILT in this repository 2026-09-06 (plan-spawn-tier-control-across-estates-2026-09-06). It checks two kinds of launch: the Agent tool and Workflow tool scripts. It fails closed. Test suite `agent-tier-gate-witness.sh`: 82 synthetic cases and 3 deliberately broken variants (mutants); `tier-map-check.py` detects changes between releases (a model family in the logs that the map does not cover, a change in the harness, the map's age) and is run by each project's health checks; each project that wires it still owes a live test of a real launch (the synthetic tests cannot see the harness stop supplying a field the hook reads). Enforcement per project: Rooms WIRED (version 1, with tier aliases hard-coded; the switch to version 2 is slice 2), Proportion NOT WIRED (slice 3, waiting on activity there). Failure criterion: no launch refused across the measured period in a project whose named agents already fix the tier on every launch; it is then retired there, with the evidence recorded. It differs from the removed routing-enforcement hook: it checks a fact that can be detected (whether a model tier is named) and never judges fit. |

**Rules of the register:**

- Adding a tool before its trigger has occurred needs the User's explicit approval and a failure criterion written down in advance.
- Every wired tool gets a plan on its row for recording every run, whatever the outcome, and its first real run is recorded there as a verdict.
- A tool that meets its failure criterion is retired to the project's record of removed controls, with its lesson; its row notes the removal.
