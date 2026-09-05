# The Enforcement Surface (an honest note, mid-2026)

What actually holds an agent to the rules? This note maps the answer as the lineage has measured it, so adopters arrive with working expectations. The summary: mechanisation has earned a real but narrow foothold, judgement disciplines remain prose with a human backstop, and every claim below is receipted in the [killed-mechanism roll](../story/KILLED_MECHANISMS.md) or the deployments' ledgers.

## What mechanisation has earned

- **Deterministic checks at commit time.** Type checks, tests, lints, confidentiality scans: machine-decidable, cheap, and in one deployment's measured verdict the real protective layer beneath a human approval gate that turned out to be theatre.
- **Gates on one-way doors.** A production-push gate earned its keep on the ledger; a pre-compact gate (a marker file checked by a harness hook) protects the framework's core failure mode, compaction loss. Gates belong on the one-way doors, and reversible work stays fast.
- **Witnesses and telemetry.** Fire logs and dashboards answering one question: did the mechanism actually run? The lineage's cautionary exhibit here is in the roll: a mechanism stranded in shadow its entire life, found only by a deep audit. Silence is not health.
- **Pin checks on delegation (added 2026-09).** A gate on sub-agent spawning that asks one detectable question: is this spawn pinned to a rank on the estate's tier map, and if the rank is frontier, is a written justification present? It never asks whether the tier fits; that stays with the agent. It earned its place by incident: one afternoon of scouts inheriting the parent's frontier model spent what a fortnight of pinned scouts would, and the shared telemetry saw it only afterwards. The same gate reads workflow scripts call by call, because a script is a second spawn path the harness's own guidance leaves unpinned by default. Its kill condition is pre-registered per estate: zero refusals across a measured window where named agents already pin every spawn retires it there with a receipt.

The line between this entry and the first item under "what stays prose" is the lineage's allocation test, and it is worth stating because the two look alike from a distance. The routing hook that died measured **fit** (how much main-thread work, was the tier right), which a machine cannot judge. The pin check measures **presence** (is a tier named at all), which a machine can decide in one comparison. A judgement rule wired as a hook becomes theatre; a detectable rule left as prose degrades under momentum. Ask which kind of rule you have before choosing the mechanism, and build only the mechanism that kind admits.

## What stays prose, on evidence

Three independent attempts to mechanise judgement disciplines failed their own tests, and the failures are documented rather than buried:

- **Per-turn routing:** a hook that counted tool calls was measuring volume when the discipline is about fit. Removed as net-negative. (The routing LOOP stays prose. The PIN, whether a tier is named at all, is detectable and is now gated; see above.)
- **Working-context coherence:** stale-content classification is content-aware in ways a hook cannot judge. The sub-gate was cut, and the rule survives as directive discipline.
- **Restart recital:** a checklist the agent ticked about itself, with quoted rules as proof of loading. Retired on hard evidence (an agent restated a rule in the message where it breached it); the load-bearing quarter survived as a claims-versus-reality diff checked against files and git state.

The pattern, stated as the lineage's operating rule: **keep judgement disciplines as prose with a human backstop, let machines enforce only what machines can actually decide, and treat a bad meter as worse than no meter.**

## The honest status of the current generation

The enforcement surface still mostly resists high-level behavioural control (see Epoch 5 in [`../story/EPOCHS.md`](../story/EPOCHS.md)). Prose rules are followed imperfectly by current-generation agents even when recited; hooks are narrow and fragile in ways their green status lights do not reveal. What this framework claims is the honest, receipted mapping of that surface: which controls are real, which died trying, and which questions stay open. The defence in depth that results is layered: deterministic checks at the bottom, gated one-way doors above them, witnessed mechanisms above those, and the human gate over everything.

## The estate behind this canon

This repository practises what this note describes: it is governed by its own live estate (`memento/`), running at the estate rung with tooling earned by trigger. Its first wired mechanism, the pre-compact gate, carries its status honestly on the estate's register: witnessed running at its first live compaction, blocking arm unverified until an incident or a deliberate test witnesses it. The rule applies most of all to the people writing it down.
