# The Enforcement Surface (an honest note, mid-2026)

What actually holds an agent to the rules? This note maps the answer as the lineage has measured it, so adopters arrive with working expectations. The summary: mechanisation has earned a real but narrow foothold, judgement disciplines remain prose with a human backstop, and every claim below is receipted in the [killed-mechanism roll](../story/KILLED_MECHANISMS.md) or the deployments' ledgers.

## What mechanisation has earned

- **Deterministic checks at commit time.** Type checks, tests, lints, confidentiality scans: machine-decidable, cheap, and in one deployment's measured verdict the real protective layer beneath a human approval gate that turned out to be theatre.
- **Gates on one-way doors.** A production-push gate earned its keep on the ledger; a pre-compact gate (a marker file checked by a harness hook) protects the framework's core failure mode, compaction loss. Gates belong on the one-way doors, and reversible work stays fast.
- **Witnesses and telemetry.** Fire logs and dashboards answering one question: did the mechanism actually run? The lineage's cautionary exhibit here is in the roll: a mechanism stranded in shadow its entire life, found only by a deep audit. Silence is not health.

## What stays prose, on evidence

Three independent attempts to mechanise judgement disciplines failed their own tests, and the failures are documented rather than buried:

- **Per-turn routing:** a hook that counted tool calls was measuring volume when the discipline is about fit. Removed as net-negative.
- **Working-context coherence:** stale-content classification is content-aware in ways a hook cannot judge. The sub-gate was cut, and the rule survives as directive discipline.
- **Restart recital:** a checklist the agent ticked about itself, with quoted rules as proof of loading. Retired on hard evidence (an agent restated a rule in the message where it breached it); the load-bearing quarter survived as a claims-versus-reality diff checked against files and git state.

The pattern, stated as the lineage's operating rule: **keep judgement disciplines as prose with a human backstop, let machines enforce only what machines can actually decide, and treat a bad meter as worse than no meter.**

## The honest status of the current generation

The enforcement surface still mostly resists high-level behavioural control (see Epoch 5 in [`../story/EPOCHS.md`](../story/EPOCHS.md)). Prose rules are followed imperfectly by current-generation agents even when recited; hooks are narrow and fragile in ways their green status lights do not reveal. What this framework claims is the honest, receipted mapping of that surface: which controls are real, which died trying, and which questions stay open. The defence in depth that results is layered: deterministic checks at the bottom, gated one-way doors above them, witnessed mechanisms above those, and the human gate over everything.

## The estate behind this canon

This repository practises what this note describes: it is governed by its own live estate (`memento/`), running at the estate rung with tooling earned by trigger. Its first wired mechanism, the pre-compact gate, carries its status honestly on the estate's register: witnessed running at its first live compaction, blocking arm unverified until an incident or a deliberate test witnesses it. The rule applies most of all to the people writing it down.
