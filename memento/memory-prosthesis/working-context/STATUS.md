---
description: current-session state snapshot for the MEMENTO estate — session-scoped only, replaced coherently per CD #11
type: working-context
date: 2026-07-21
status: live
---

# STATUS — session of 2026-07-21 (external re-review fixes)

## What this session did (commit ledger)

- **Truth-and-presentation pass** executed and pushed per its plan (`4ad0183` canon, `a2eb174` estate): gate v2, statuses trued, spirit one-pager, evidentiary boundary, site metadata.
- **External re-review round 2, all five findings verdicted first-hand:** THREE CONFIRMED and fixed: the banned identifier's literals removed from the memo and this file (the memo carries a dated de-identification note; the literals persist in pushed history); `settings.local.json` untracked for real (`21902df`; the first attempt's staged deletion was silently reversed by explicit-pathspec commit semantics, which commit working-tree state); working context redesigned to derive publication state from git rather than assert it. ONE closed as bookkeeping (this plan's status now complete). ONE REFUTED with receipt (the live site serves a single h1; curl receipt).
- **New mechanism, trigger fired by the incident:** confidentiality sweep over the tracked tree with the token list held outside the repo, wired as a pre-push hook; register row carries falsifier and witness plan.

## Graduation candidates for the next pre-compact (CD #9)

The sweep runs last, on the final tree (a per-artefact sweep misses what later artefacts add) · explicit-pathspec commits take working-tree state and silently reverse staged deletions · committed working context cannot assert push state.

