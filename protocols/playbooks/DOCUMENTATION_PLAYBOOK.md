# DOCUMENTATION_PLAYBOOK.MD

**Objective:** Create and maintain clear, accurate documentation integrated with Memento knowledge system

---

## 1. Documentation Standards

### British English
- Spelling: colour, behaviour, optimise, initialise, centre
- Consistency throughout all documentation
- No US spelling variants

### Markdown Format
- Proper anchor links: `{#section-name}`
- Code examples with language specification
- Consistent emphasis: **bold** for importance, *italic* for terms
- Clear heading hierarchy

---

## 2. Purposeful Updates

**Rule:** State documentation purpose at beginning of work.

**Purpose Categories:**
- **Progress Updates**: Update STATUS.md or CURRENT_FOCUS.md
- **Knowledge Capture**: Document patterns or lessons learned
- **Process Documentation**: Create/update procedures
- **Architecture Documentation**: Design decisions and rationale

**Documentation Triggers:**
- Completed logical unit needs recording
- New pattern discovered
- Process refined through usage
- Architecture decision made

---

## 3. Knowledge Capture Integration

**Rule:** When documenting new patterns, propose addition to KNOWLEDGE_ARCHIVE.md

**Capture Template:**
```markdown
KNOWLEDGE_CAPTURE_PROPOSAL: Add "[Pattern Name]" to KNOWLEDGE_ARCHIVE.md#[section]

## Pattern: [Name]
**Purpose:** [Why this pattern exists]
**Implementation:** [How to apply it]
**Prevention Value:** [What problems it prevents]
**Example:** [Concrete usage example]
```

**Quality Standards:**
- Must be genuinely reusable
- Include concrete examples
- Show prevention value
- Avoid session-specific details

---

## 4. Cross-Referencing

**Rule:** Link relevant documents using precise paths and anchors.

**Reference Patterns:**
- Playbooks: `See DEBUGGING_PLAYBOOK.md#evidence-first-mandate`
- Knowledge: `Pattern in KNOWLEDGE_ARCHIVE.md#[section]`
- Context: `Current task in CURRENT_FOCUS.md`
- Principles: `Per ARCHITECTURE_PRINCIPLES.md`

**Navigation Guidelines:**
- Maintain link integrity
- Use relative paths
- Include anchor links for precision
- Test links after major changes

---

## 5. Documentation Hierarchy

### Working Context (Session-Specific)
- CURRENT_FOCUS.md - Current mission
- STATUS.md - Session achievements
- Refresh each session

### Active Knowledge (Multi-Session)
- PROJECT_CONTEXT.md - Mission and philosophy
- ARCHITECTURE_PRINCIPLES.md - Core decisions
- ACTIVE_BACKLOG.md - Priorities
- Update as needed

### Institutional Memory (Long-Term)
- KNOWLEDGE_ARCHIVE.md - Patterns library
- Graduate valuable patterns here
- Preserve indefinitely

### Evidence Archive (Historical)
- Session artifacts
- Investigation reports
- Superseded documentation
- Preserve for forensics

---

## 6. Pre-Compact Documentation

**When User Signals Session End:**
1. Update STATUS.md with achievements
2. Identify patterns for graduation
3. Review KNOWLEDGE_ARCHIVE for duplicates
4. Propose valuable additions only
5. Clean working context for next session

---

## Additional Guidelines

### Quality Over Quantity
- Document what matters
- Focus on reusability
- Avoid redundancy
- Keep it searchable

### Maintenance Discipline
- Fix broken links immediately
- Update outdated information
- Remove obsolete content
- Preserve navigation integrity

---

**This playbook ensures documentation serves as effective institutional memory whilst maintaining Memento structure.**