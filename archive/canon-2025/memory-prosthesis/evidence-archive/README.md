# Evidence Archive

**Purpose:** Historical artifacts, detailed implementation evidence, and superseded documentation

**Mental Model:** The deep iceberg bottom - frozen history you rarely visit but need to preserve. Contains the forensic evidence trail of how you got here.

**Access Pattern:** Forensic investigation during complex debugging, historical reference for "why" decisions, superseded patterns showing evolution

**Update Frequency:** Archive completed investigations, supersede outdated protocols, preserve session artifacts that might have future value

---

## Typical Structure

```
evidence-archive/
├── session-artifacts/        # Complete session records worth preserving
├── investigation-reports/    # Detailed debugging and analysis documentation
├── superseded-protocols/     # Outdated patterns kept for historical reference
├── implementation-records/   # Detailed technical implementations
└── decision-history/         # Why major decisions were made
```

## Content Categories

### Session Artifacts
- Complete debugging sessions with evidence trails
- Crisis recovery documentation
- Complex feature implementation records
- Multi-session investigation results

### Investigation Reports
- Root cause analyses
- Performance investigations
- Architecture explorations
- Failed approach documentation

### Superseded Protocols
- Previous versions of patterns (with deprecation reasons)
- Failed paradigms and why they failed
- Evolution history of current approaches
- Compliance theatre examples

### Implementation Records
- Detailed technical implementations
- Schema evolution history
- Migration procedures
- Configuration changes

### Decision History
- Architectural decision records (ADRs)
- Technology selection rationale
- Trade-off analyses
- Pivot point documentation

---

## Management Principles

### What Belongs Here
- **Completed work** that might inform future decisions
- **Failed approaches** that shouldn't be repeated
- **Historical context** for "why" questions
- **Evidence trails** from complex investigations

### What Doesn't Belong Here
- Active reference material (→ active-knowledge)
- Current patterns (→ institutional-memory)
- Session-specific context (→ working-context)
- Generic templates (→ institutional-memory)

### Preservation vs Pruning
- This tier can grow large - that's acceptable
- Preserve evidence that might answer future "why" questions
- Archive but don't delete - storage is cheap, context is valuable
- Consider subdirectory organisation as content grows

---

**This tier serves as your forensic evidence locker - comprehensive historical record for when you need to understand the journey, not just the destination.**