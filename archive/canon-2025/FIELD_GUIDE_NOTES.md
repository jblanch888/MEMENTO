# FIELD GUIDE NOTES - Raw Materials

*Working notes for the complete Field Guide/Investigator's Handbook*

---

## Core Philosophy & Design

### Machine-First Design
- Memento is primarily designed for machine readability and ML attention patterns
- Structure optimised for AI effectiveness, not human browsing
- Semantic clustering and cognitive load respect built into architecture

### Token Investment Philosophy  
- Memento is NOT for token misers
- Quality context costs tokens - typically 40-60% of session budget
- Investment in documentation, context setting, knowledge structuring is valuable
- Better to spend tokens on clarity than save tokens and lose context

### Attention Pyramid/Iceberg Architecture
- **Working Context** (TOP): Must be TINY (≤50 lines total across all files)
- **Active Knowledge**: Can be bigger, frequently referenced material  
- **Institutional Memory**: Larger, searchable archive of proven patterns
- **Evidence Archive** (BOTTOM): Can grow quite big with project history

**Mental Model**: Like an iceberg - you live at the tip (working context) and periodically descend to lower levels for more context, wisdom, or information. Not numbered/linear but depth-based access patterns.

**Critical Rule**: Top 2 tiers MUST be kept svelte for attention efficiency

---

## Tier Sizing Guidelines

### Working Context (Session-Only)
- Absolute maximum 50 lines across ALL files
- Current task focus only
- Immediate next actions
- Session status
- Complete refresh each session

### Active Knowledge (Multi-Session)
- Frequently referenced material
- Architectural principles
- Feature backlog
- Cross-session reference material
- Update as priorities change

### Institutional Memory (Long-Term)
- Searchable archive of proven patterns
- Development patterns and anti-patterns
- Operating procedures
- Strategic knowledge
- Knowledge graduation from sessions

### Evidence Archive (Historical)
- Can grow large with project
- Detailed artifacts and implementation evidence
- Investigation plans and test results
- Historical analysis and superseded documentation
- Complete session artifacts

---

## Pattern Notes

### The 5 Failed Paradigms (Evolution Story)
- Epoch 0: Undefined Problem (contextual decay)
- Epoch 1: Documentation-as-Memory (library problem)
- Epoch 2: Quantified Compliance (compliance theatre)  
- Epoch 3: Programmatic Enforcement (fighting the protagonist)
- Epoch 4: Memento Framework (accept amnesiac genius nature)

### Why Memento Works
- Accepts AI limitations rather than fighting them
- Human as "Director" with cognitive scaffolding
- Evidence-first methodology
- Validation gates prevent self-deception
- British English standard throughout

### Active-Knowledge Reality Check
- Templates are intentionally sparse vs real implementations
- Real active-knowledge files are rich, detailed, specific (real implementations: 159-828 lines per file)
- Generic templates show structure; reference implementation shows depth needed
- Mature Memento requires substantial content investment for effectiveness

### ML-First Design Philosophy
- Files optimised for AI consumption, not human browsing
- Machine readability takes priority over human aesthetic preferences
- Structure designed around AI attention patterns and cognitive load limits
- Documentation serves AI context first, human reference second

### Domain Context Files for AI Orientation
- SYSTEM_OVERVIEW_TEMPLATE.md concept for rapid AI context acquisition
- Designed for post-compact context restoration and immediate productivity
- ML-optimised structure: system purpose → architecture → operations → patterns
- Simple template that users adapt to their domain complexity
- Target: AI requiring system understanding for effective collaboration

### Memento as Part of Project Codebase
- Memento becomes integrated into your project, not separate from it
- KNOWLEDGE_ARCHIVE will contain project-specific patterns alongside Memento patterns
- Some patterns (like Compliance Theatre) discovered through using Memento itself
- Meta-patterns about AI collaboration emerge and get documented
- Framework evolves with the project - not static boilerplate

### Documentation as Memento's Learning Mechanism
- DOCUMENTATION_PLAYBOOK is vital for self-healing and development
- It's the metabolic process - how experiences become knowledge
- Pattern capture prevents repeating mistakes
- Knowledge graduation builds institutional wisdom
- Without documentation, Memento is static; with it, it's a living system

### Memento Housekeeping (Periodic Maintenance)
- **Pruning**: Remove outdated patterns from KNOWLEDGE_ARCHIVE
- **Deduplicating**: Consolidate similar patterns that have emerged separately
- **Link Maintenance**: Fix broken cross-references, update navigation paths
- **Keeping Top Svelte**: Prevent working-context and active-knowledge bloat
- **Quarantining**: Move failed methods to evidence-archive with deprecation reasons
- **Reality Updates**: Adjust ARCHITECTURE_PRINCIPLES as project evolves
- **Archive Organisation**: Create subdirectories in evidence-archive as it grows
- **Navigation Index Updates**: Keep KNOWLEDGE_ARCHIVE index current with content

Note: Knowledge graduation from sessions happens during pre-compact protocol, not general housekeeping

**Housekeeping Frequency**: 
- Working context: Every session (automatic via refresh)
- Active knowledge: Weekly/sprint boundaries
- Institutional memory: Monthly or major milestones
- Evidence archive: Quarterly or when searching becomes difficult

### Environment Discipline & Risk Scaling
- Environment discipline scales with risk tolerance and project context
- Personal projects may accept "everything in prod" when balanced with disciplined commits and validation gates
- Commercial contexts require additional safety layers (dev/test/prod workflows)
- Risk management through systematic habits (unit commits, incremental validation) often more effective than heavyweight process
- Memento's structured approach enables "fast + structured" development regardless of environment complexity

---

## Detective Theme Elements
- Framework as detective's toolkit for AI orchestration
- Investigation metaphors throughout
- Evidence-based decision making
- "Field Manual" rather than "User Guide"

---

## Critical User Insights (From Framework Development)

### KNOWLEDGE_ARCHIVE.md is Make-or-Break
- This single file determines whether MEMENTO adds value or becomes overhead
- Expect to invest **entire sessions (200k+ tokens)** on maintenance
- Poor stewardship turns institutional memory into institutional confusion
- "Content gardening" and "protocol hardening" are real operational requirements
- Session-specific contamination and broken cross-references will destroy effectiveness
- This is not theoretical - users WILL hit the maintenance wall

### Template vs Reality Gap  
- Framework templates are intentionally sparse starting points
- Real implementations are rich, detailed, domain-specific (real ML pipeline guide: 828 lines)
- The value emerges through usage, not from the initial templates
- Templates show structure; your content provides the operational value
- Don't expect immediate value - MEMENTO compounds through systematic usage

### Post-Compact Productivity Pattern
- Real operational sequence: CORE_DIRECTIVES → ARCHITECTURE_PRINCIPLES → domain context file
- "Context plunge" prevents post-compact fumbling and enables immediate productive work  
- Complex systems often need dedicated context acquisition files for AI orientation
- This pattern emerges from necessity, not upfront planning
- Three-stage activation transforms post-compact Claude from clueless to operational

### Documentation Standards Are Non-Negotiable
- MEMENTO examples must follow MEMENTO's own documentation playbook standards
- Inconsistent pattern formats destroy the institutional memory value
- Missing Prevention Value, Implementation, Cross-References make patterns unusable
- Session-specific details contaminate reusable patterns
- Framework self-hosting: use MEMENTO standards for MEMENTO development

### Evidence-First is a Discipline, Not a Suggestion
- Every pattern must include concrete examples and prevention value
- "Your specific example" placeholders are documentation debt
- Speculation and assumptions poison institutional memory
- Real usage evidence > theoretical pattern descriptions
- Anti-gamability measures must be strengthened continuously

### Size Discipline is Attention Architecture
- 50-line working context limit is **absolutely critical** for effectiveness
- "Svelte" requirements prevent attention efficiency breakdown
- Working context bloat destroys the entire framework value
- Context accumulation is an anti-pattern that kills productivity
- Ruthless pruning each session maintains cognitive efficiency

### Framework Evolution Through Usage
- MEMENTO starts generic and becomes domain-specific through sessions
- Patterns emerge from real problems, not theoretical frameworks
- The framework grows with your project - it's not static boilerplate
- Meta-patterns about AI collaboration get documented in your KNOWLEDGE_ARCHIVE
- Most valuable insights come from systematic usage, not initial setup

### Cross-Reference Integrity is System Health
- Broken anchor links destroy navigation and institutional memory
- Regular link validation prevents knowledge archive degradation
- Navigation index must stay current with content evolution
- Reference paths need systematic maintenance as content moves
- Link rot is institutional memory rot

### Real Maintenance Investment Required
- MEMENTO is not "set and forget" - it requires active stewardship
- Content gardening: remove contamination, resolve boundary violations
- Protocol hardening: improve framework processes based on failure evidence
- Tier boundary enforcement: prevent content from accumulating in wrong tiers
- This is operational reality, not theoretical overhead

### Domain Context Files Are Essential for Complex Systems
- ML pipelines, multi-service architectures need dedicated context files
- "Rapid context acquisition" prevents post-compact productivity loss
- System overview templates help but domain-specific content is what works
- This need emerges through experience of post-compact confusion
- ML-optimised structure: purpose → architecture → operations → patterns

---

*These notes will be refined into the complete Field Guide*