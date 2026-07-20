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
| Pre-compact gate hook (`memento/tools/pre-compact-gate.sh`) | — (wired at Slice 1: compaction loss is the framework's core failure mode, pre-earned by the lineage) | **v2 WIRED 2026-07-21** (external-review finding 1: repo-scoped marker, consumed on use; one approval = one compaction). v1 history: RUNS VERIFIED 2026-07-20 at the first live `/compact` (harness executed the hook, fresh marker, compaction proceeded); its block arm was never witnessed. v2 bench-tested at wiring (both paths exercised directly: block JSON correct with computed path, allow consumed the marker); a bench test is not a harness witness, so v2 re-arms both live statuses: **allow-and-consume arm UNVERIFIED** (witness at the next live `/compact`: compaction proceeds AND the marker is gone afterwards), **block arm UNVERIFIED** (witness at a `/compact` without the protocol, or a User-approved stale-marker test). Falsifier: if the marker survives a successful compaction, or a sibling directory's marker unlocks this repo, v2 has failed its purpose |
| Pattern-search probe (`memento-probe`) | Estate exceeds ~30 documents, or a §1 pattern search demonstrably misses something present | Not built |
| Doctor (structure / frontmatter / link / staleness checks) | First broken cross-reference incident, or the first full compaction cycle — whichever first | Not built |
| Restart-diff (claims-vs-reality packet) | First post-compact mismatch between working-context claims and live state | Not built |
| Generated indexes / governance map | Evidence archive exceeds ~15 memos | Not built |
| Telemetry of mechanism fires | The first time a mechanism's effectiveness is disputed and prose can't settle it | Not built |

Adding a mechanism without a fired trigger requires the User's explicit approval and a pre-registered kill condition (charter stance 4).
