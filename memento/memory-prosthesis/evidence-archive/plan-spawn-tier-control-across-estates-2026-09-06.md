---
description: plan to bring the sub-agent tier control to one shape across the Memento estates (Rooms, Proportion, the framework canon), layering named agent definitions with a fail-closed spawn gate, keyed on a single tier map that survives model releases and is watched by the shared telemetry stack
type: plan
date: 2026-09-06
genre: build (3A) with a 3B probe as slice 0
size: M (five slices, each S; slice 3 touches a live hook estate in a shared worktree)
status: APPROVED (John, 2026-09-06); replicated variant for the framework; slice 1 COMPLETE here (canon tools banked, witness 72/3); slice 4 (canon wording) pending John's eyeball
related: [CORE_DIRECTIVES, ARCHITECTURE_PRINCIPLES, SAFETY_CHARTER, cli-upgrade-runbook, handover-state-layer-first-day-2026-09-05]
---

# Plan: one spawn-tier control across the Memento estates

> **Replicated variant (John, 2026-09-06: "replicate a variant to each").** This undertaking spans
> three estates and is banked in each. This copy is the **framework** variant and owns slice 1 (the tier map, pinned by rank, and its generator) and slice 4 (the canon: THE_ENFORCEMENT_SURFACE, KILLED_MECHANISMS §4, convention rule 1).
> The other two copies: Rooms `~/rooms/memento/memory-prosthesis/evidence-archive/plan-spawn-tier-control-across-estates-2026-09-06.md`
> (slices 0, 2, and the Rooms half of 5; the probe finding and script live there);
> Proportion `~/trv3-temporal/memento/memory-prosthesis/evidence-archive/plan-spawn-tier-control-across-estates-2026-09-06.md`
> (slice 3 and its half of 5); framework `~/MEMENTO/memento/memory-prosthesis/evidence-archive/plan-spawn-tier-control-across-estates-2026-09-06.md`
> (slices 1 and 4, tier-map ownership). Status lines are maintained per estate; the slice text is
> identical at replication and any later divergence is a deliberate, noted amendment.

> Framework notes: the tier map is owned here and copied outward; each instance's doctor hash-checks its copy against this canon. The canon change in slice 4 is the piece that resolves the tension between the killed routing-enforcement hook and the live pin-check gate; it is wording John eyeballs before it lands.


## 1. Pattern search (what the estates already know)

Searched: Rooms (`memento/tools/agent-tier-gate.sh`, its README entry, `lab/agent-tier-gate/`,
CORE_DIRECTIVES #6), Proportion at `~/trv3-temporal` (`.claude/settings.json`, `.claude/agents/`,
`RESOURCE_ROUTING.md`, CORE_DIRECTIVES #15 and #16, KNOWLEDGE_ARCHIVE, CONTROL_MAP, commit
`f4a3981`), the framework at `~/MEMENTO` (`framework/conventions/RESOURCE_ROUTING.md`,
`adoption/THE_ENFORCEMENT_SURFACE.md`, `story/KILLED_MECHANISMS.md`), the user-level Claude Code
settings, and the Loki store behind the Grafana dashboard.

Found:
- **Rooms** has a PreToolUse gate on the Agent tool (2026-09-05). Fail-closed decision table: no
  model, deny; haiku or sonnet, allow; opus, fable or fork, allow only with a 40-character
  `TIER-JUSTIFICATION:` line; unknown alias, deny. Logged per decision; 16 witness cases, 2 mutants.
  Rooms has NO named agent definitions, so every spawn is a built-in type and the gate is the only
  control.
- **Proportion** has three named agent definitions with the model pinned in frontmatter (scout on
  haiku, implementer and reviewer on sonnet, tools scoped) and the prose rule "pin model and tools
  in every spawn, no inheritance, ever" (RESOURCE_ROUTING rule 1). It has NO spawn gate. Built-in
  types (`general-purpose`, `Explore`) inherit the parent model unchecked; rule 6 names
  `general-purpose` an escape hatch, in prose only.
- **Proportion killed Control 7** (2026-06-14): a Stop hook that counted main-thread tool calls to
  enforce routing. It metered volume when the discipline is about fit, fired without enforcing, and
  was blind to the over-match direction. The lesson hardened into "not a hook's job" in
  RESOURCE_ROUTING and into the knowledge-archive entry "judgement enforcement is not
  mechanisable", whose closing line is "stop proposing hooks that enforce judgement".
- **The framework canon prices that kill everywhere.** `KILLED_MECHANISMS.md` §4 records the
  routing-enforcement hook as dead, and a later entry praises a new estate for declining to import
  it. `THE_ENFORCEMENT_SURFACE.md` lists per-turn routing under "what stays prose". The framework
  convention carries rule 1 (pin model, no inheritance) with no mechanism behind it.
- **The same canon supplies the test that separates the two mechanisms.** The knowledge archive's
  allocation frame: a judgement rule wired as a hook becomes theatre; a detectable rule left as
  prose degrades under momentum. Control 7 tried to measure fit (judgement). The Rooms gate checks
  two machine-observable facts: is a model field present, and does a frontier spawn carry a written
  justification (detectable). By the canon's own frame the gate belongs on the mechanised side. No
  memo in either estate ran this test for a spawn gate; the absence in Proportion is a gap, not a
  decision.
- **Telemetry is machine-wide, not per estate.** `~/.claude/settings.json` sets the OTEL exporter
  for every Claude Code session; the collector, Loki and Grafana run natively under launchd. Loki
  holds api_request events by model for all sessions, Fable included (548 Fable requests in the
  24-hour bucket covering 2026-09-05). It saw the Rooms incident as a count, after the fact. Loki's
  indexed labels are `service_name`, `hook`, `hook_event`, `kind`, `outcome`; model is structured
  metadata; whether a session can be attributed to an estate is unverified (slice 0).
- **Two incidents, one cause.** Proportion's forcing incident (June 2026: a five-hour allowance in
  two hours on frontier threads) produced the routing law, the named agents and the telemetry
  panels. Rooms' incident (2026-09-05: five default-tier scouts exhausting a session limit)
  produced the gate. Each estate repaired the incident it had.

## 2. Problem and purpose

One failure class, default-tier inheritance on sub-agent spawns, is mitigated by half a control in
each estate. Proportion makes the right choice the default and cannot refuse the wrong one. Rooms
refuses the wrong one and has no right-choice default. The framework, whose job is to carry
lessons between instances, carries the prose rule and a grave marker that reads as a ban on the
very mechanism Rooms now runs. Left alone, the next instance founded from the canon inherits the
gap, and the next model release silently re-tiers both estates.

Purpose: one control, two layers, one tier map, in all three places, with a mechanical way of
noticing when the model landscape moves under it.

## 3. Posture

Predictive on the mechanism (the gate exists and is witnessed; the agent definitions exist and are
in use). Adaptive on two points, each with a named pivot:
- **Estate attribution in telemetry** (slice 0). If sessions cannot be attributed to an estate,
  the per-estate frontier-share panel is dropped and the machine-wide view stands.
- **The gate's value in Proportion** (slice 3 falsifier). If the gate never fires a deny in
  Proportion across one measured window, the named agents alone were sufficient there, and the
  gate is retired from Proportion with a receipt. It stays in Rooms regardless until Rooms has
  named agents in routine use.

## 4. Scope and slices (WIP of one, in this order)

**Out of scope, consciously:** the engine's stage pins (`claude-opus-4-8`, `claude-sonnet-5`) and
the CLI pin. Those are versioned identifiers, pinned and hashed by design, and change only through
the CLI upgrade runbook. This plan concerns the interactive agent's spawns. Also out: any change
to what the tiers MEAN for routing (the law in RESOURCE_ROUTING stands).

**Slice 0, probe (3B).** Machine-derived denominator: every distinct model identifier in Loki over
the last 30 days, with request counts, and the set of session identifiers that carry them. Verdict
vocabulary: ATTRIBUTABLE / NOT-ATTRIBUTABLE for estate, per event class. Output: one finding memo
with the query text and result, and a baseline frontier share for the seven days before and after
2026-09-05 (the day the Rooms gate armed). Zero model spend; read-only.

**Slice 1, the tier map, pinned by rank.** One small file, `TIER_MAP.yaml`, owned by the framework
at `~/MEMENTO/framework/conventions/`. Two parts:
- **The ladder:** the ordered list of Claude Code model aliases, top down (today: `fable`, `opus`,
  `sonnet`, `haiku`), plus `fork` as its own row with tier `inherits`. Human-edited, John-verified,
  with `last_verified` and the harness version. Nothing outside the list is ever allowed.
- **The roles:** each role binds to a RANK on the ladder and an effort, never to a name. Today:
  judgement at rank 0 (the main thread; never spawned without a justification line), review and
  build at rank 2 with effort `medium`, recon at rank 3 with effort `low`. Rank 0 and rank 1 are
  the frontier band; a spawn there needs the justification line.
The agent definitions and the gate's allow-list are GENERATED from the map by a small generator in
`memento/tools/`, the way the estate index is generated; no alias is hand-written anywhere else.
When a new family lands above or between existing ones, the ladder is edited once and the estates
regenerate. Each estate carries a copy of the map; the doctor compares the copy's hash against the
canon and flags drift as OWED. Unknown alias stays deny, and the deny message names the map so the
fix is one line.

Facts this rests on (Claude Code docs, checked 2026-09-06 by a sonnet guide agent, read-only):
- Agent definition frontmatter accepts `model` (alias, full identifier, or `inherit`) AND `effort`
  (`low`, `medium`, `high`, `xhigh`, `max`; default inherits the session's effort). So effort lives
  in the map per role. Today no agent definition in either estate sets effort, which means every
  sonnet scout has been running at the parent session's effort level, a hidden cost this slice
  removes.
- Aliases "point to the recommended version for your provider and update over time". There is no
  relative token ("one below the top") in the harness; the ladder supplies it.
- A per-call model resolves in this order: the call's own `model`, the definition's frontmatter,
  the `CLAUDE_CODE_SUBAGENT_MODEL` environment variable, then the main conversation's model. That
  third rung is a cheap structural default neither estate uses: set it to the rank-2 alias in each
  estate's `settings.json` env block and a built-in spawn that slips past everything else lands on
  sonnet instead of Fable. It is a backstop under the gate, not a replacement: the gate still
  demands an explicit model because the variable is invisible in the call and in the log.

**Slice 2, Rooms gets the default layer.** Port Proportion's three agent definitions into
`.claude/agents/` (scout on haiku, implementer and reviewer on sonnet, tools scoped as in
Proportion; the reviewer read-only, which also honours the standing rule that review agents never
write in the shared tree). Gate re-pointed at the tier map. Witness extended: a named agent passes,
a named agent whose frontmatter model is missing is denied, a map with a new alias is honoured
without a script change. Doctor gains the map-hash check.

**Slice 3, Proportion gets the refusal layer.** Develop the gate on a copy in `.claude/hooks/`,
drill it against Proportion's trial suite to reviewer PASS, then swap it in as one atomic
settings.json change (the knowledge-archive lesson: never hot-edit a live hook in a shared
worktree). Register it in the control map with an unconditional "I ran" witness so silence is
impossible. Amend RESOURCE_ROUTING's "Not a hook's job" paragraph: the routing LOOP stays
discipline; the PIN is a detectable fact and is now gated. Precondition: Proportion's working tree
clean (it carries three uncommitted modifications today).

**Slice 4, the canon.** `THE_ENFORCEMENT_SURFACE.md` gains the spawn gate under "what
mechanisation has earned", with the allocation reasoning in one paragraph. `KILLED_MECHANISMS.md`
§4 gains one sentence distinguishing the dead fit-meter from the live pin-check, so the grave marker
stops reading as a ban. Convention rule 1 gains a pointer to the mechanism and the tier map. The
Rooms and Proportion copies of the gate are byte-identical to the canon's, hash-checked by the
doctor.

**Slice 5, keeping up with model releases.** Three detectors, cheapest first:
1. `agent-tier.log` (both estates) carries a deny with reason `unknown`: a new alias reached the
   Agent tool before the map knew it. Doctor surfaces the last such line as OWED.
2. Loki: any model identifier seen in the last seven days that maps to no alias in the tier map.
   One saved query on the dashboard plus the same check in the doctor (bounded curl, fails open
   with a WARN if Loki is down, since the doctor must not depend on the telemetry stack).
3. The map's `last_verified` older than the CLI pin's date: OWED.
None of these re-tiers anything automatically. A new model is classified by John, once, in the
canon map, and the copies follow. Fail-closed on the unknown is the correct direction: work
pauses on a spawn until a human names the tier, and the message says exactly what to do.

## 5. Risks

- **Re-running Control 7's funeral.** Mitigated by writing the allocation test into the canon
  (slice 4) and by the slice 3 falsifier. If the gate cannot pass its own falsifier in Proportion,
  it is retired there with a receipt, as the canon prefers.
- **The gate depends on an undocumented field.** The hooks documentation does not list `model` in
  the Agent tool's `tool_input`; the Rooms gate reads it and the witness plus the live log prove it
  is there today. That is a dependency we do not control: pin it by a witness case that fails loudly
  if the field disappears, and record the harness version it was proven on in the tier map.
- **Hook contract drift between harness versions.** Rooms runs the interactive CLI at 2.1.261;
  Proportion's version is unverified. The gate's JSON contract (PreToolUse `hookSpecificOutput`)
  is checked by each estate's witness before the swap.
- **Fork denial.** The gate treats `fork` as frontier. Any skill in Proportion that forks by design
  would need a justification line. Slice 0 greps both estates' skills and agents for fork use.
- **Live hook in a shared worktree.** Slice 3 follows the copy, drill, atomic-swap rule. No
  in-place edits.
- **Telemetry cannot attribute estates.** Absorbed by the posture pivot; the machine-wide view is
  still sufficient for the release-cadence detector.
- **Over-reach into the engine.** Excluded by scope. The engine's versioned pins are a different
  cadence with its own runbook and are not touched.

## 6. Verification discipline

Every slice: harness witness with at least one case that proves the check can FAIL for the right
reason; a mutant per gate branch; an independent adversarial review (sonnet, read-only, isolated,
never a fork) before presentation; John's eyeball on any governing-doc wording. Slice 0's numbers
are re-derived by a second method (Loki query and the raw `agent-tier.log` count) before being
cited. No delegated total is citable. Commits gated on witness exit codes.

## 7. Sizing

M overall. Slices 0, 1, 2, 4 and 5 are each S (one to three sub-tasks, additive). Slice 3 is S in
code and M in ceremony because of the live-hook discipline and the dirty-tree precondition.

## 8. Approval gate

Awaiting John's approval of this plan before detailed design or implementation.

Decided by John (2026-09-06):
1. **Where the plan lives:** a variant of this plan is replicated to each estate. The Rooms copy
   (this file) carries slices 0, 2 and the Rooms half of 5. The Proportion copy carries slice 3 and
   its half of 5. The framework copy carries slices 1, 4 and the tier-map ownership. Each variant
   names the other two so the three files stay one undertaking. Replication happens at slice 0 close,
   when the probe's numbers are known and identical in all three.
2. **Slice 3 falsifier window (recommended, adopted):** fourteen calendar days of Proportion
   sessions or twenty logged Agent spawns in Proportion's `agent-tier.log`, whichever comes LATER.
   Both conditions must hold so a quiet fortnight cannot pass the gate by default. Read from the
   log, re-derived from Loki. If zero denies in that window, the gate is retired from Proportion
   with a receipt.
3. **Fork is its own row in the tier map**, tier `inherits`, never `cheap` or `frontier`. A fork
   always runs on the parent model by construction (the harness ignores a model override on a
   fork), so it cannot be tiered by choice; its cost is whatever the parent costs. A fork is
   legitimate only when the sub-task needs the whole conversation context, and that need is what
   the justification line must state. Treating it as frontier-by-default was a proxy for "usually
   expensive"; the honest row says what it is.

## 9. Amendments from slice 0 (2026-09-06)

The probe ([[finding-spawn-tier-probe-2026-09-06]]) changes three things:
- **Attribution is available.** All 194 sessions in 30 days join to an estate through the transcript
  store. Slice 5's detectors and the dashboard panel can be per estate. The posture pivot on
  attribution is closed unused.
- **The Workflow tool is a fourth spawn path.** `agent:builtin:workflow-subagent` rows (777
  machine-wide, all Opus 5) never pass the Agent-tool hook. Slice 1 must give workflows a row in
  the tier-map design: a hook on the Workflow tool inspecting `agent()` model arguments, or a
  standing rule that workflows run in these estates only at John's word. **Decided (John,
  2026-09-06): the hook.** The gate gains a second matcher on the Workflow tool: it reads the script
  text, finds every `agent()` call, and refuses the run if any call lacks a model, names an alias
  outside the ladder, or names a frontier rank without a justification line in the script. A saved
  or named workflow whose script cannot be read is refused (fail closed). Witnessed like the Agent
  matcher. Lands in slice 1 (canon) and is wired in slice 2 (Rooms).
- **Slice 3 is gated on Proportion activity.** Proportion has had two sessions in 30 days and none
  since 21 Aug. The falsifier's twenty-spawn condition is what makes the window meaningful; slice 3
  waits for Proportion to wake, and the calendar alone never passes it.
Baseline for the measured window: frontier share on Rooms spawns was 98.6% by requests in the seven
days before the gate and 0.0% after it. It must stay at zero.

## 10. Slice 1 record (2026-09-06)

**COMPLETE in the framework canon.** Delivered: `framework/conventions/TIER_MAP.json` (ladder fable,
opus, sonnet, haiku; frontier ranks 0 and 1; fork as `inherits`; roles judgement 0, review 2 medium,
build 2 medium, recon 3 low; three named agents); `memento/tools/agent-tier-gate.py` (both matchers,
fail closed); `memento/tools/generate_agents.py` (frontmatter from the map, body preserved, `--check`);
`memento/tools/agent-tier-gate-witness.sh` (72 cases, 3 mutants killed, exit 0); canon charter bodies
under `framework/conventions/agents/`; a row in TOOLING_TRIGGERS (for John's eyeball); a tools README.
Format deviation, noted: the map is JSON, not YAML, because the gate must read it from Python's
standard library and from jq without a parser dependency.

**Adversarial review, three rounds (sonnet, read-only, isolated, never a fork).** Round 1
NEEDS-CHANGES: a decoy `model: "sonnet"` inside a prompt string beat the real option; aliasing
`agent` to another name hid the call. Both accepted; the matcher was rewritten to mask strings,
templates, comments and regex literals before reading, to read options only from the second argument
at depth 1, and to deny any bare reference to `agent` that is not a call and any dynamic access.
Round 2 NEEDS-CHANGES: duplicate keys (JavaScript keeps the last, the gate read the first) and a
unicode-escaped identifier. Both accepted; quoted, computed or duplicate keys deny, and any escape
outside a string denies. Round 3 PASS with one caveat, a third argument never inspected; accepted,
the gate now requires exactly two arguments. Self-found in between: a regex literal containing a
quote desynchronised the masker (fixed, unterminated literals deny) and a value expression such as
`"sonnet" && "opus"` (fixed, the literal must end the property). Every finding has a witness case
(W17 to W42). What no reviewer could verify: the Workflow runtime's exact semantics for escaped
identifiers and extra arguments; the gate denies both regardless, which is the safe direction.

**Not done in this slice, by design:** nothing is wired anywhere. The live Rooms hook is still v1.
Slice 2 swaps Rooms to v2 atomically with the Agent|Workflow matcher, adds the estate copy of the
map, the generated agents, and the doctor's hash and drift checks.
