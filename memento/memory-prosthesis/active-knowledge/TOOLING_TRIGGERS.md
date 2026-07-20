---
description: earned-tooling register — mechanisms are built when their trigger fires, not up front (charter P3); wired mechanisms carry an honest teeth status
type: reference
date: 2026-07-20
status: live
---

# TOOLING_TRIGGERS

The founding stance (CD footer, cartographer precedent): **teeth are earned by incident, not installed up front** — the lineage's ledger shows mechanisms installed without a felt need dying as theatre. Each entry names the trigger that earns the build.

| Mechanism | Trigger that earns it | Status |
|---|---|---|
| Pre-compact gate hook (`memento/tools/pre-compact-gate.sh`) | — (wired at Slice 1: compaction loss is the framework's core failure mode, pre-earned by the lineage) | **WIRED 2026-07-20; RUNS VERIFIED 2026-07-20** at the first live `/compact`: the harness executed the hook (PreCompact log line witnessed), the marker was fresh (14:23, within the 30-minute window), and compaction proceeded. The block arm (stale or absent marker producing a JSON block decision the harness honours) remains **UNVERIFIED**: it has never been asked to block. Witness it at the first `/compact` attempted without the pre-compact protocol, or via a deliberate stale-marker test if the User approves one |
| Pattern-search probe (`memento-probe`) | Estate exceeds ~30 documents, or a §1 pattern search demonstrably misses something present | Not built |
| Doctor (structure / frontmatter / link / staleness checks) | First broken cross-reference incident, or the first full compaction cycle — whichever first | Not built |
| Restart-diff (claims-vs-reality packet) | First post-compact mismatch between working-context claims and live state | Not built |
| Generated indexes / governance map | Evidence archive exceeds ~15 memos | Not built |
| Telemetry of mechanism fires | The first time a mechanism's effectiveness is disputed and prose can't settle it | Not built |

Adding a mechanism without a fired trigger requires the User's explicit approval and a pre-registered kill condition (charter stance 4).
