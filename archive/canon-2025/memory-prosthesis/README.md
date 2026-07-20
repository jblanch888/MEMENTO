# Memory Prosthesis

**Purpose:** 4-tier external memory system designed for AI collaboration across unlimited sessions

**Mental Model:** An iceberg architecture optimised for AI attention patterns - you live at the surface but can dive deeper when you need context, wisdom, or evidence.

---

## The Iceberg Architecture

```
     [Working Context]     ← You live here (≤50 lines)
    ═══════════════════
   [Active Knowledge]      ← Frequent reference (svelte)
  ═════════════════════
 [Institutional Memory]    ← Deep wisdom (searchable)
═══════════════════════
[Evidence Archive]         ← Historical forensics (unlimited)
```

### Design Philosophy

**Machine-First:** Optimised for AI effectiveness, not human browsing patterns  
**Attention Respect:** Each tier sized to match AI cognitive load limits  
**Depth-Based Access:** Information organised by usage frequency, not importance  
**Session Survival:** Knowledge persists and accumulates across context resets  

---

## Tier Overview

### [Working Context](working-context/) - Session Surface
**Purpose:** Immediate operational focus  
**Size Limit:** ≤50 lines total  
**Frequency:** Every session  
**Content:** Current task, constraints, next actions  

### [Active Knowledge](active-knowledge/) - Frequent Reference  
**Purpose:** Multi-session guidance and principles  
**Size Limit:** Svelte (scannable)  
**Frequency:** Weekly/sprint updates  
**Content:** Architecture, priorities, cross-session patterns  

### [Institutional Memory](institutional-memory/) - Deep Wisdom
**Purpose:** Searchable archive of proven patterns  
**Size Limit:** Unlimited (searchable)  
**Frequency:** Knowledge graduation from sessions  
**Content:** Battle-tested patterns, anti-patterns, crisis protocols  

### [Evidence Archive](evidence-archive/) - Historical Forensics
**Purpose:** Detailed artifacts and superseded documentation  
**Size Limit:** Unlimited (historical)  
**Frequency:** Archive completed investigations  
**Content:** Session artifacts, implementation records, decision history  

---

## Navigation Patterns

### When to Use Which Tier

**Starting Work:** Always begin with [Working Context](working-context/CURRENT_FOCUS.md)  
**Need Principles:** Descend to [Active Knowledge](active-knowledge/) for guidance  
**Complex Problems:** Search [Institutional Memory](institutional-memory/KNOWLEDGE_ARCHIVE.md) for patterns  
**Forensic Investigation:** Dive to [Evidence Archive](evidence-archive/) for historical context  

### Information Flow

**Upward (Session to Session):**
- Working Context → refreshed each session
- Active Knowledge → updated when priorities shift  
- Institutional Memory → graduated via pre-compact protocol
- Evidence Archive → completed work archived

**Downward (Within Session):**
- Start shallow, dive deeper as needed
- Each tier provides progressively more context
- Information density increases with depth

---

## Critical Disciplines

### Size Management
- **Working Context:** Ruthlessly prune to ≤50 lines
- **Active Knowledge:** Keep svelte, graduate large content downward
- **Institutional Memory:** Searchable organisation, anchor-based navigation
- **Evidence Archive:** Preserve but organise, subdirectories as needed

### Knowledge Graduation
- Patterns proven through usage → Institutional Memory
- Completed investigations → Evidence Archive  
- Failed approaches → Evidence Archive with lessons
- Session-specific details → removed during refresh

### Attention Efficiency
- Most-used information closest to surface
- Progressive disclosure from general to specific
- Search-optimised for lower tiers
- Cross-references between tiers maintained

---

## Integration with MEMENTO

### Protocol Integration
- **CORE_DIRECTIVES:** Reference working context for mission
- **Pre-Compact Protocol:** Graduate knowledge through tiers
- **Playbooks:** Reference appropriate tier for guidance
- **Session Restart:** Begin with working context, validate against active knowledge

### Anti-Degradation
- Architecture preserves across unlimited sessions
- Knowledge accumulates without context bloat
- Attention patterns respected regardless of project complexity
- External memory supplements, doesn't replace, AI capabilities

---

**This memory prosthesis transforms AI's contextual amnesia from limitation into systematic advantage through structured knowledge preservation and attention-optimised access patterns.**