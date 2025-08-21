# ARCHITECTURE_PRINCIPLES.md

**Purpose:** Evidence-first development discipline and core architectural decisions

---

## Evidence-First Methodology

**Rule:** All decisions require concrete evidence - audit trails, code analysis, user validation
**Application:** Direct observation over assumption, actual output over expected behaviour  
**Validation:** Multi-level validation - JSON syntax → Schema conformance → Business logic → Semantic coherence

## Incremental Execution Discipline

**Logical Units:** Single purpose, testable, reversible, user-valuable
**Commit Discipline:** Every logical unit → user validation → immediate commit → next unit
**Rollback Safety:** Each change creates recoverable checkpoint
**User Authority:** User validates completion, scope, quality - no "Done" without confirmation

## Component Isolation Principles

**Separation:** Clear boundaries between system components
**Dependencies:** Explicit, minimal, well-defined interfaces  
**Testing:** Each component testable independently
**Modification:** Changes isolated to single component when possible

## Quality Standards

**Definition of Done:** Evidence-based completion with user validation
**Testing Requirements:** Multi-level validation appropriate to change scope
**Validation Gates:** User confirmation required for logical unit completion

## Development Philosophy

**Manual-First Scaling:** Start simple, add complexity only when needed
**User-Driven Development:** Features exist to solve real user problems
**Performance Thresholds:** Evidence-based optimisation decisions using real usage patterns
**Error Handling:** Graceful degradation with user-visible feedback

---

*This file guides daily development decisions. Reference when facing architectural trade-offs or establishing patterns.*