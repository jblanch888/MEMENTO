---
description: census of which Memento parts the governed estates exercise, measured from counts and identifiers in session records, git history and telemetry; evidence for the Bitter Lesson sort of the parts
type: finding
date: 2026-10-03
status: banked 2026-10-03 on the User's clearance
related: [ORGAN_REGISTRY, finding-lineage-verdicts-2026-07-20, plan-leak-hardening-2026-10-03]
---

# Finding: what the governed estates actually exercise

**Provenance.** Source: the governed Memento estates (rooms, proportion, cartographer and build-protocols) and this repository, read on 2026-10-03 by scripts that emit counts, dates and part identifiers. Fitting: estate-specific procedure names and sub-project names removed; calendar months replaced by positions in the window; monthly activity reported as trends and ratios. De-identified; cleared by the User, 2026-10-03 ("yes clear").

**Origin.** build-protocols/dev proposed (2026-10-02) sorting the parts into three kinds: parts that make up for current model capability, parts that hold the record, parts that keep authority with the User. The User observed that his "used" playbook count is falling, and asked (2026-10-03) for a review of recent governed sessions to see which parts are exercised. The July lineage audit (`finding-lineage-verdicts-2026-07-20.md`) inventories the parts in each estate. This census counts their use.

## Method

- **Session records**, about 30 days (transcripts are kept that long): tool calls reduced to part identifiers by signature (file effects such as a plan written or the working context edited; agent spawns with their model tier; tool scripts run; compaction boundaries; the User's approval and pause signals by pattern). This session is excluded. Subagent records are counted through the call that spawned them.
- **Prompt history**, back to the start of each estate: sessions and the User's prompts per month, from Claude Code's prompt history (session, project and time; prompt text matched by pattern for approvals and pauses).
- **Git history** of each estate's `memento/` folder, as far back as it goes: new evidence-archive records by type, working-context and lesson changes, and the playbook named as active in the working context over time.
- **Claude Code telemetry**, about 90 days: tool calls, agent spawns and request tiers per estate, joined to estates through the prompt history. It carries no file paths and likely includes subagent calls.
- **Governance hook telemetry**, 30 days: runs and outcomes per hook, with days-with-data as the check that the instrument was alive.
- Rooms sessions were split by the share of file operations on governance paths, at a threshold of half: 41 sessions of product work under governance, 2 of governance maintenance (6 sessions recorded no tool calls).
- The extractor was checked against a session whose actions are known. Known inflations: rewrites count as writes; tool-run counts include commands that mention a tool; the restart signal shows the protocol's reads came early in a session, which a prompted restart also satisfies; commit-style counts are unreliable. Counts were taken at slightly different times while a rooms session was live, so totals differ by one or two between tables.

## Results

**Rooms has 43 sessions in the window and supports a verdict.** The other estates have one to three sessions each, which is too few; their longer view comes from prompt history, git and telemetry. Almost all rooms sessions are product work under governance.

| Part | What the records show | Reading |
|---|---|---|
| Playbook system | In rooms product sessions, framework playbooks are read about once per three sessions; in the two governance-maintenance sessions, about fifteen times per session. In proportion, the playbook named as active in the working context went from as many as six at the start of governed work, to two the next month, to the line being absent, to the planning playbook as the one name since. That decline runs alongside a steep fall in proportion's activity, and an absent line can also be a template change. Cartographer's working context mostly carried no active-playbook line | **Fading**, as the User observed, with the activity confound unresolved |
| Planning rules | In rooms, about two dozen plans in a month, 25 of 27 in product sessions; the other estates' archives show plans written while they were active (git) | Exercised |
| Routing rule | Rooms spawns name a model tier 97 percent of the time, mostly the middle tier; a spawn-tier gate enforces naming a tier, so this measures compliance with a mechanical rule. Proportion and cartographer evidence comes from telemetry request tiers: proportion spreads requests across tiers and spawns its named agents; cartographer leaned on the frontier tier and general-purpose agents | Exercised, partly by enforcement |
| Adversarial review | Review spawns routine in rooms product sessions, present in proportion | Exercised |
| Pre-compact consolidation | Rooms sessions show compaction boundaries and pre-compact commands; proportion banks pre-compact snapshots through the period (git) | Exercised |
| Session restart protocol | The protocol's reads come early in most rooms session starts and compactions | Exercised (prompted and spontaneous restarts are indistinguishable here) |
| Working-context discipline | Edited often in rooms; in proportion and cartographer the edit rate follows activity bursts (git) | Exercised where the estate is active |
| Lesson selection | Lesson changes cluster in activity bursts, then fall to a trickle in proportion and cartographer (git) | Light outside bursts |
| Evidence-archive conventions | Typed records (plans, findings, handovers, designs, snapshots) written throughout; one estate also writes large untyped batches (git) | Exercised |
| Doctor health checks | Run in rooms at about thirteen per product session and about eighty per governance-maintenance session | Exercised (rooms) |
| Validation ledger | Active in proportion's peak months, then a few changes a month (git) | Light |
| Confidentiality checks | Token sweeps run routinely in rooms | Exercised |
| The User decides | Approval signals appear in every estate with sessions in the window; pause signals in rooms and build-protocols. In proportion, approvals were about a fifth of the User's prompts early and about three in ten late, on small late counts | Exercised |
| Claim-status discipline, controls model, shadow-first development, safety charter, economic doctrine, proportionate confidentiality, language standard, evidence constitution | No signature reaches them | The method cannot see these parts, so their use is unknown |

**Activity.** Proportion's governed work peaked in the first two months of the five-month window and has fallen steadily since; cartographer was active early in the telemetry window and is now dormant; rooms carries the current practice.

**Tool calls per prompt.** In proportion, tool calls per User prompt rose about threefold between the first and last month of the telemetry window, on a shrinking and small prompt count, with tool calls from telemetry divided by prompts from the prompt history. Cartographer's ratio fell over the same months, so this is a per-estate pattern. The User's approval signals continue alongside the higher rate.

**Hook telemetry health.** Two scheduled jobs report on 29 or 30 days of 30. Every other hook reports on one to three days. Whether that is under-reporting or logging only when a hook fires is open; until it is settled, silence in the hook telemetry is a missing reading.

## Reading for the Bitter Lesson sort

1. **Step-by-step playbooks are the part that is fading,** in the counts and in the User's experience, with the confound of falling activity still to separate. Product-specific procedure is in use, and it behaves like record.
2. **Several parts filed as compensating are exercised heavily in product work:** planning, tier routing, adversarial review, restart and the working context. Being exercised shows they are done, which in a governed estate includes compliance and, for gated parts, enforcement. They may be durable engineering practice. The sort should test that per part, with a falsifier.
3. **The User's authority gates still operate. His prompts per unit of work fell in one estate.** That fits the Bitter Lesson's prediction for method and the build-protocols reading for authority, on thin late data.
4. **The measurement gap is itself a finding:** the parts the census cannot see are mostly the authority and doctrine parts, and the hook telemetry may under-report.

## Limits

- Being exercised is evidence of doing, which under governance includes compliance and enforcement; it is weaker evidence of need.
- Work done inside delegated agents is counted through the spawning call, so reads and writes inside agents are undercounted, playbook reads and plans included.
- Thirty days of session records, dominated by rooms; the product and governance split rests on two governance sessions and a threshold of half.
- Rates per session and absolute counts tell different stories where session counts differ; rates are given where they matter.
- Tool calls per prompt divides two instruments, telemetry and prompt history.
- Rows marked (git) come from file effects over the longer window and were not re-checked against session records.
- The playbook decline coincides with a fall in activity.
- Counts are signatures, and a part can shape work without leaving one. Raw tables are held outside the repository.
