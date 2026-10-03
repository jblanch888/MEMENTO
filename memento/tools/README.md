---
description: the framework's shipped tools: pre-compact gate, confidentiality sweep and its hooks, and the spawn-tier gate (tier map, gate, generator, witness)
type: reference
date: 2026-10-03
---

# memento/tools (framework canon)

Deterministic tools, built on the standard library, that an instance copies in. Each instance's doctor hash-checks
its copies against this canon.

- `pre-compact-gate.sh`: the compaction-loss gate (see THE_ENFORCEMENT_SURFACE).
- `confidentiality-sweep.sh`: the confidentiality sweep. Four hooks in `.githooks/` run it (pre-push,
  pre-commit, pre-merge-commit, commit-msg); standalone it takes `--range`, `--published` (the
  published history against a hashes-only baseline) and `--show-redacted`. Its lists and baseline live
  outside the repository. `test-confidentiality-sweep.sh` is its suite: run it before any change and
  commit when it exits 0. `sweep-binary-allow.txt` lists the binary files reviewed by eye.
- **The spawn-tier control** (plan-spawn-tier-control-across-estates-2026-09-06):
  - `../../framework/conventions/TIER_MAP.json`: the ladder of Claude Code model aliases, top down,
    and the roles pinned to RANKS on it, so a renamed model leaves every role in place. Human-edited, John-verified. A new model
    family is classified once here; the copies follow.
  - `agent-tier-gate.py`: PreToolUse hook on the **Agent** and **Workflow** tools. Fail closed: a
    spawn with no ladder alias (and no map-listed named agent) is denied; frontier ranks and forks
    need a `TIER-JUSTIFICATION:` line; a workflow script is refused unless every `agent()` call
    carries a string-literal model on the ladder or a map-listed `agentType`. Missing map, garbage
    input, or an exception all deny. Every decision logs to `.claude/agent-tier.log`.
    Wire it: `{"PreToolUse":[{"matcher":"Agent|Workflow","hooks":[{"type":"command","command":"python3 \"$CLAUDE_PROJECT_DIR\"/memento/tools/agent-tier-gate.py"}]}]}`
    with the estate copy of the map at `memento/TIER_MAP.json` (or `$TIER_MAP`).
  - `generate_agents.py`: derives `.claude/agents/<name>.md` frontmatter (model = ladder[rank],
    effort per role, tools) from the map; the charter body is preserved, or seeded from
    `framework/conventions/agents/<name>.md`. `--check` exits 1 on drift (doctor use).
  - `tier-map-check.py`: the release-cadence detectors: model identifiers in the machine-wide Loki
    telemetry whose family matches no ladder alias (fails open with a WARN if Loki is down); the
    interactive CLI version against the binding's `verified_against`; the map's age. It prints OWED lines for
    John, and every re-tiering is his to make. Prints the LogQL for a dashboard panel.
  - `agent-tier-gate-witness.sh`: 82 cases across both matchers, the map, the generator and the detectors, plus
    three mutants that must be killed. Run it before any swap, and commit when it exits 0.

**Shape of the map (schema 2).** `policy` is agent-agnostic: ranks, frontier ranks, the
justification rule, roles (rank + effort), and named agents with their role, description and
`guarantees` split into `enforced` (by tool scope) and `behavioural` (kept by compliance).
`bindings.<runtime>` holds what one agent runtime needs: the alias ladder, what inherits, effort
level names, hook field names, and per-agent tool lists. The gate and generator select a binding by
`$TIER_BINDING` (default `claude-code`); a second runtime gets a second binding in the same map.

**An honest limit.** The gate reads `tool_input.model` on the Agent tool, a field the hooks
documentation does not list. The witness builds its own hook payloads, so it proves the gate's
logic. Whether the runtime still delivers that field is a separate question. If the harness stopped sending it, the synthetic
witness would stay green while every real spawn was denied as "no model". A live-dispatch witness
(one real Agent call on haiku whose log line must appear) is the check that catches that, and it is
owed in each estate that wires the gate.
