---
description: canon rewrite R0 — the architecture spec: file-by-file dispositions, new repo layout, epoch-narrative proposal (pivot π1), naming application, and the P2-ripeness flag
type: design
date: 2026-07-20
status: approved
---

# design-canon-architecture-2026-07-20

> **APPROVED 2026-07-20 (the User's R0 gate).** Rulings: π1 = **option (a), six epochs 0-indexed** (archive banner carries the renumbering note) · tone = **option (i), professional lead with light noir accents** (logo kept; homage image archived; amnesiac-genius kept as one framing device) · demo product + the User's handle = **keep**. P2 posture remains flagged, decision deferred to pre-push.

**R0 of `plan-canon-rewrite-2026-07-20`.** Inventory taken first-hand this session (38 files, canon side only). Decisions marked **[USER]** are for the gate; everything else is proposed disposition under the ruled P1.

## 1. Disposition table (every canon file)

| File(s) | Disposition | Destination / successor |
|---|---|---|
| `README.md` | ARCHIVE + author fresh | R2 — new README: continuity thesis, origin story (generic names), map of the repo |
| `MEMENTO_FIELD_GUIDE.md`, `FIELD_GUIDE_NOTES.md` | ARCHIVE | Surviving ideas (three rhythms, token-investment philosophy, gardening cadence) absorbed into R2 story + R5 notes, each with a receipt to the archived original |
| `CONTRIBUTING.md` | ARCHIVE + author fresh (small) | R5 |
| `LICENSE` | KEEP IN PLACE | unchanged (MIT) |
| `docs/index.md`, `style.css` | ARCHIVE | R6 rebuilds the site on the new narrative |
| `docs/assets/` (logo, film-reference image, demo screenshot) | KEEP logo; **[USER]** film-reference image (tone question, §4); ARCHIVE demo screenshot | R6 |
| `protocols/CORE_DIRECTIVES.md` | ARCHIVE + R3 transplant | The 2026 **14-form directive template** (generic "the User" throughout — this estate's fitted set is the source; its provenance chain: trv3 15-form → cartographer 14-form fresh-estate fitting → this estate) |
| `protocols/playbooks/PLANNING_PLAYBOOK.md` | ARCHIVE + R3 transplant | The 2026 multi-genre form (property trigger, posture, spine, genre annexes) |
| `GIT_OPERATIONS_PLAYBOOK.md` | ARCHIVE + R3 transplant | 2026 form (explicit pathspecs, restore points, honest-annotation) |
| `INCREMENTAL_EXECUTION_PLAYBOOK.md` | ARCHIVE + R3 transplant | 2026 form (validation gates, adversarial-review step) |
| `DOCUMENTATION_PLAYBOOK.md` | ARCHIVE + R3 transplant | 2026 form (evidence-archive conventions, frozen memos) |
| `DEBUGGING_PLAYBOOK.md`, `CRISIS_MODE_PLAYBOOK.md`, `REFACTORING_PLAYBOOK.md` | ARCHIVE + carry as **2025-form with honest annotation** | No field-hardened 2026 successor exists in the lineage (the audit's receipt); each carries a banner: "2025 form; its discipline partly lives on as harness skills; field status unverified since". Successor path noted in R5 |
| `protocols/playbooks/README.md`, `protocols/README.md` | ARCHIVE + author fresh (small) | R3 |
| `memory-prosthesis/**` — all 11 files enumerated: root README; working-context/{README, CURRENT_FOCUS, STATUS}; active-knowledge/{README, ARCHITECTURE_PRINCIPLES, BACKLOG, SYSTEM_OVERVIEW_TEMPLATE}; institutional-memory/{README, KNOWLEDGE_ARCHIVE, KNOWLEDGE_ARCHIVE_MATURE_EXAMPLE}; evidence-archive/README | ARCHIVE (verbatim, as the 2025 exhibit — all were published as sanitised adopter templates in Aug 2025; CURRENT_FOCUS/STATUS are placeholder templates, archived as such, not as usage examples) + R4 rebuild | 2026-form templates incl. every tier README (evidence-archive tier README explicitly in R4 scope), spine frontmatter, coherent-replacement rule, pre-compact protocol with gate-marker convention, restart v2 (behavioural); mature-archive example refreshed with a de-identified 2026 exemplar |
| `.gitignore` | KEEP IN PLACE | `.DS_Store` already covered (line 2); the four filesystem `.DS_Store` artefacts are untracked litter — nothing to move, nothing to add |
| **New additions (no predecessor):** | AUTHOR FRESH | R2: story doc, public organ registry, killed-mechanism roll, epochs doc, adoption ladder. R3: routing law (new to canon), spine conventions. R5: earned-tooling stance + enforcement-surface note |

## 2. New repo layout (adopter-facing)

```
README.md                      # thesis + origin story + map (R2)
LICENSE  CONTRIBUTING.md
story/                         # the receipted narrative (R2)
  THE_STORY.md                 # substrate → canon → dormancy → field evolution → mid-2026
  EPOCHS.md                    # π1 (§3)
  ORGAN_REGISTRY.md            # the 32 organs, origins, estate spread
  KILLED_MECHANISMS.md         # the falsifiable-or-dead roll
framework/                     # what an adopter installs (R3/R4)
  directives/CORE_DIRECTIVES_TEMPLATE.md
  playbooks/                   # transplants + annotated 2025 carries
  memory-prosthesis/           # 2026 templates (R4)
  conventions/                 # spine, evidence archive, routing law
adoption/                      # how to start (R2/R5)
  GRADUATION_LADDER.md         # spirit → estate → mechanised (the rooms exhibit)
  GETTING_STARTED.md
archive/canon-2025/            # the era exhibit, entire Aug 2025 canon, banner README (R1)
docs/                          # site (R6)
memento/                       # this estate (see §5)
```

## 3. Pivot π1 — the epoch narrative **[USER]**

The Aug 2025 canon lists "five evolutionary epochs" as a 1-indexed list ending at "5. MEMENTO Framework"; the User speaks 0-indexed ("epoch 3" = programmatic enforcement); the story now continues past the old endpoint. Options:

- **(a) Six epochs, 0-indexed (RECOMMENDED):** 0 Undefined Problem · 1 Documentation-as-Memory · 2 Quantified Compliance · 3 Programmatic Enforcement · 4 The Memento Framework (the documentation-discipline era — the archived canon is its artefact) · **5 Falsifiable Governance (declared in its early days, honestly)**. Matches the User's own usage; the renumbering is itself a small exhibit of the canon correcting its own record; Epoch 5's distinguishing rule — every mechanism carries a pre-registered kill condition; killed mechanisms are shown — is receipted by the roll. The `archive/canon-2025/` banner MUST carry the cross-reference: "these epochs were 1-indexed in the original; the 2026 canon renumbers them 0–5" (review finding 5).
- **(b) Keep 1-indexed, append Epoch 6** — minimal change, preserves published numbering, perpetuates the mismatch with the User's usage.
- **(c) Drop numbers, named eras** — kills the ambiguity permanently, loses the "epochs" device the published canon and the field guide both trade on.

## 4. Tone **[USER]**

The 2025 canon runs a detective/noir register (the film homage, "amnesiac genius", the assets). The public thesis now has a professional register (the LinkedIn arc). Options: **(i)** professional lead, light noir accents retained (logo stays, homage image archived; the amnesiac-genius metaphor kept as one framing device inside the story) — RECOMMENDED; **(ii)** full noir continuity; **(iii)** fully professional, noir retired to the archive.

## 5. Structural flag — the P2 door is closer than assumed **[USER — flag only, no decision needed yet]**

Corrected by this memo's review: `memento/` is **already tracked in this repo's git history** — every commit since the founding contains the estate. Pushing any branch that includes those commits publishes it. Partial-push mechanisms DO exist (a clean publish branch built without the estate; `git rm --cached` + gitignore going forward; both leave local history intact), so the honest statement is: **before any push, the User chooses one of three postures** — (i) publish the estate with the canon (the repo becomes its own live demonstration; estate is publication-safe by construction — generic naming and two-lane sweeps since founding); (ii) publish via a clean branch that excludes the estate (main stays private); (iii) strip the estate from history (conflicts with the endeavour's history-preservation values; not recommended). R1–R5 proceed identically under all three. The decision blocks only the push — but it is nearer than the charter's "one day" framing assumed.

## 6. Naming application (the ruled generic vocabulary)

| Real referent | Public name |
|---|---|
| The origin repo lineage (v2→v3→temporal) | "a team-capacity roadmapping tool" / "the origin repo" |
| The client-programme assistant | "a client-programme knowledge assistant" |
| The personal knowledge assistant | "a personal knowledge assistant" |
| The multi-person workstream product | "a multi-person workstream memory system" |
| The organisational-cartography product | "an organisational cartography instrument" |
| The client organisation, vendors, people | never named; "the client organisation" only where unavoidable |
| Estate codenames (trv3-temporal, cartographer, rooms) | not used in canon text; canon speaks in the generic product descriptions above |
| The framework's pre-Memento name (in the origin repo) | "an earlier internal name" — not spelled out in canon text |
| The public demo product + the User's own handle (both in the 2025 README, both already public and non-client) | **[USER]** keep (recommended — they are the User's own published identity/product) or genericise |

**Provenance:** R0 of the approved canon-rewrite plan; inventory first-hand (38 files); dispositions are proposals under P1; §3–§5 are the gate's decisions/flags. Two-lane sweep before commit.
