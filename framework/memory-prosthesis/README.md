---
description: the memory-prosthesis arm — four-tier external memory for AI collaboration across sessions; 2026 form of the tier architecture
type: governing
date: 2026-07-20
governs: [memory-tiers, information-flow]
last_verified: 2026-07-20
status: template
---

# The Memory Prosthesis

> **Provenance:** the four-tier architecture is original to the 2025 canon. This 2026 form keeps the architecture and refits the practice to what the live deployments actually run: spine frontmatter on every file, frozen dated memos as the evidence discipline, and the tier rules carried by directives (CD #8, #9, #11). The field notes at the end record what a year of deployment changed.

**Purpose:** the framework's memory arm. Four tiers of external memory, sized by access frequency, so that knowledge survives context resets and accumulates across hundreds of sessions without burying the agent's attention. The other arm, the operational protocols, installs from `directives/` and `playbooks/` to an estate's `memento/protocols/`; the two arms are designed together (working context names the Active Playbook; the pre-compact directive drives graduation).

## The architecture

```
     [working-context]        ← every session; smallest; replaced, never appended
    ════════════════════
   [active-knowledge]         ← frequent reference: governing docs, principles, backlog
  ═══════════════════════
 [institutional-memory]       ← durable lessons; graduated, anchored, searchable
═══════════════════════════
[evidence-archive]            ← dated frozen memos; grows without limit
```

Attention is the scarce resource. The most-used information sits closest to the surface, each tier is sized to its job, and depth buys detail: an agent starts at the surface every session and dives only as far as the task requires.

## The tiers

| Tier | Job | Size discipline | Core files |
|---|---|---|---|
| `working-context/` | The current session's operating state | Smallest; two files; replaced coherently per CD #11 | CURRENT_FOCUS.md, STATUS.md |
| `active-knowledge/` | Multi-session governing and reference material | Svelte; each file scannable | CHARTER, RESOURCE_ROUTING, BACKLOG, principles |
| `institutional-memory/` | Durable, reusable lessons | Grows slowly; entries earn their place via the graduation gate | KNOWLEDGE_ARCHIVE.md |
| `evidence-archive/` | The receipted record: plans, findings, designs, handovers | Unlimited; memos are frozen once banked | `{type}-{topic}-YYYY-MM-DD.md` |

## Information flow (the disciplines that keep it alive)

- **Session start:** the restart protocol (CD #8) reads the surface set (directives, CURRENT_FOCUS, STATUS) and reconciles claims against live files and git state.
- **During work:** substantive sessions bank dated memos in the evidence archive (the frozen-memo convention, DOCUMENTATION_PLAYBOOK §8). The memo is the receipt; verdicts and plans cite it.
- **Pre-compact (CD #9):** at most three genuinely reusable learnings graduate to institutional memory; working context is redrawn clean; everything session-specific stays out of the durable tiers.
- **Every working-context edit** is a coherent replacement (CD #11): the whole file re-read, stale content pruned end-to-end.

## Field notes: what a year of deployment changed

- **Working context slimmed to two files everywhere.** The 2025 canon allowed up to fifty lines across the tier; the live estates converged on a tight CURRENT_FOCUS and STATUS pair, with everything else pushed down a tier.
- **The evidence archive became the estates' primary knowledge store.** One deployment's archive README states it plainly; another banked scores of typed memos in its first weeks. The 2025 canon treated this tier as a seldom-visited basement. Field practice inverted that: the dated memo is where governance work actually lands, and the upper tiers hold the distillate.
- **Tier rules moved into directives.** Prose guidance about hygiene became CD #9 and CD #11, with the estates' kill discipline pruning what could not earn its keep. These tier READMEs exist for adopters; a running estate carries the discipline in its directive set.

## Install

Copy this directory to `memento/memory-prosthesis/`, drop the `_TEMPLATE` suffixes (e.g. `CURRENT_FOCUS_TEMPLATE.md` → `CURRENT_FOCUS.md`), fill the slots, and give every file the spine frontmatter (`framework/conventions/ESTATE_SPINE.md`).
