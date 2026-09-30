# The Enforcement Surface (an honest note, mid-2026)

What actually holds an agent to the rules? This note sets out the answer as the projects where Memento developed have measured it, so adopters start with realistic expectations. The summary: automation has proved itself in a real but narrow area, rules that need judgement remain written guidance with a human as the backstop, and every claim below is backed by the list of [killed mechanisms](../story/KILLED_MECHANISMS.md) or by the projects' validation ledgers.

## What automation has shown it can do

- **Automated checks at commit time.** Type checks, tests, lints, confidentiality scans: decided by the machine, cheap, and, in one project's measured verdict, the real protection underneath a human approval prompt that was approved every time it was asked.
- **Approval checks on one-way doors,** the actions that are irreversible or costly to undo. A check on production pushes proved its worth in a validation ledger; a pre-compact check (a marker file checked by a hook in the harness) protects against the framework's main failure, losing state at compaction. Checks belong on the one-way doors, and reversible work stays fast.
- **Records of what runs.** Logs of every run and dashboards answering one question: did the control actually run? The warning example is in the list of killed mechanisms: a tool that stayed in test mode its whole life, and was found only by a deep audit. Silence is not health.
- **Checks that a tier is named when delegating (added 2026-09).** An automatic gate blocks a sub-agent launch unless it names a rank on the project's tier map and supplies a written reason when that rank is frontier. It never asks whether the tier fits the work; that judgement stays with the agent. It was added after an incident: one afternoon of helper agents inheriting the parent's frontier model spent what a fortnight of helper agents with named tiers would, and the shared logs showed it only afterwards. The same check reads workflow scripts call by call, because a script is a second way to launch agents, and the harness's own guidance leaves it without a named tier by default. Its failure criterion is set in advance for each project: no launch refused across a measured period, in a project whose named agents already fix the tier on every launch, retires it there, with the evidence recorded.

The line between that last entry and the first item under "What stays written guidance" is the allocation test, and it is worth stating because the two look alike from a distance. The routing hook that was removed measured **fit** (how much work stayed in the main session, and whether the tier was right), which a machine cannot judge. The tier check measures **presence** (whether a tier is named at all), which a machine can decide in one comparison. The attempts described here to enforce judgement through hooks failed to demonstrate useful protection. A rule that a machine can check can be skipped as work continues when it relies entirely on written guidance. Ask which kind of rule you have before choosing how to enforce it, and build only the kind of control that rule allows.

## What stays written guidance, on evidence

Three separate attempts to automate rules that need judgement failed their own tests, and the failures are recorded:

- **Routing each turn:** a hook counted tool calls, and a count cannot show whether the right worker handled each part. Removed, having done more harm than good. (The routing LOOP stays written guidance. The TIER, whether one is named at all, can be checked automatically and is now enforced before launch; see above.)
- **Keeping the working context current:** deciding whether content is stale needs an understanding of the content that a hook does not have. That part of the check was removed, and the rule continues as a core directive.
- **Reciting rules at restart:** a checklist the agent ticked about itself, quoting rules as proof it had loaded them. Retired on firm evidence (an agent restated a rule in the same message in which it broke it); the useful quarter survived as an automated comparison of recorded claims against the files and git state.

The pattern, stated as the projects' working rule: **keep rules that need judgement as written guidance with a human as the backstop, let machines enforce only what machines can actually decide, and treat a misleading measure as worse than none.**

## The honest status of the current generation

The available tools still struggle to enforce rules that require broad judgement (see Epoch 5 in [`../story/EPOCHS.md`](../story/EPOCHS.md)). Current agents follow written rules imperfectly, even when they recite them; hooks are narrow, and fragile in ways their green status lights do not show. Memento claims an honest map, backed by evidence, of which controls work, which failed and which questions remain open. The resulting protection comes in layers: checks based on fixed rules, approval gates on one-way doors, records showing whether controls ran, and the human's final authority over the work.

## The Memento files behind this repository

This repository practises what this note describes. It is governed by its own live Memento files (`memento/`), working on Rung 2 of the graduation ladder, with tools added when their triggers occur. Its first wired control, the pre-compact check, records its status honestly in the repository's register of tools: observed running at its first real compaction, with its blocking behaviour unverified until an incident or a deliberate test shows it working. The rule applies most of all to the people writing it down.
