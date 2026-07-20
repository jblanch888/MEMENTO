---
description: publication-readiness verification under the User's P2 posture-(i) ruling — full-tree and unpushed-history sweeps, one finding (redacted), cleared-class inventory
type: finding
date: 2026-07-20
status: approved
---

# finding-publication-readiness-2026-07-20

**Context:** the User ruled P2 = **posture (i)** (estate publishes with the canon on main) with the confidentiality bar restated: deployment codenames (trv3-temporal, cartographer, rooms) and private commit hashes are **cleared** for publication; **actual client identifiers are banned absolutely, anywhere** ("just can't have any actual client names like sky for example anywhere"). This memo banks the verification run at that ruling. Method note: grep exit codes were read from the grep itself, with counts, never from a downstream pipe (lineage grep-pitfall lesson applied).

## Sweep 1 — full working tree, client-identifier lane

Pattern: the client token list minus the cleared codenames; case-insensitive; short tokens (mam, cam, fgf) word-bounded separately. Scope: entire repo including `memento/`, `archive/`, `.claude/`, tools.

**Result: one hit.** `archive/canon-2025/memory-prosthesis/active-knowledge/SYSTEM_OVERVIEW_TEMPLATE.md:52` — "Sky-KA", a client identifier that survived the August 2025 sanitisation and has been **publicly visible on origin/main since then** (verified: `git grep -in "sky" origin/main` returns the same line in the live public repo). Every other client token: zero hits.

**Disposition (executed under the User's "anywhere" ruling):** redacted in place with a visible dated marker; the archive banner README gains a redaction note so the exhibit's "verbatim" claim stays honest (verbatim, minus one marked redaction). The token remains in origin's pre-existing public history, which no posture short of history-rewriting (ruled out) can retract; the redaction stops the current tree repeating it.

## Sweep 2 — unpushed history (what a push newly publishes)

25 commits ahead of origin/main; their full diffs (4,324 lines) swept with both lanes. **Result: zero client-token matches.** The unpushed history is publication-clean.

## Cleared-class inventory (for the record, per the ruling)

- **Deployment codenames** appear in 19 estate files at the final pre-push tree (directives, playbooks, recon memos, audit memos, working context; the count includes this memo and was re-derived at commit time after the reviewer caught a stale earlier count) — cleared by the User at this ruling.
- **Private commit hashes** appear in estate evidence memos as audit receipts — cleared (they reference repositories only the User can access; the codenames' clearance removes the linkage concern that kept them out of canon text; canon text stays hash-free per the R3 ruling regardless).
- **"Vercel" as a platform name** in one recon memo, hostname already scrubbed — platform-stack naming, no client identification.
- **"coach"/"coaching"** hits are all in the archived 2025 canon: the User's own published words about his own products. Already public since 2025.
- The User's public handle and demo product name: KEEP per the R0 ruling.

## Adversarial review (hostile-outsider lane)

A smart-tier reviewer read every estate document hunting identifying material beyond the token list. Verdict findings, dispositioned: sequencing (files uncommitted at review time) — resolved by the commit batch; the stale file count — corrected above; the precursor framework name ("Focused Guidance Framework", genealogy memo) and the `trv4` branch name — the User's own internal names, same class as the cleared codenames, KEEP, flagged for the User's eyeball at the push gate; operational room-count specificity (rooms recon) — genericised with a dated de-identification note, restorable at the User's choice. The reviewer found no other identifying material beyond the cleared classes.

## Standing consequence

Under posture (i), **every estate write is public at the next push.** The publication-depth sweep is standing discipline for all estate documents from this date (recorded in the CHARTER's seam doctrine). Pushes remain the User's alone (CD #4a).
