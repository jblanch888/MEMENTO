# KNOWLEDGE_ARCHIVE.md

**Purpose:** Institutional memory library - proven patterns, anti-patterns, and crisis protocols

**Navigation:** Use Ctrl+F / Grep search or click anchor links for direct access

**Update Protocol:** Add knowledge via pre-compact protocol after archive review for novelty and compliance

---

## Navigation Index

### [Architecture Patterns](#architecture-patterns)
- [Evidence-First Decision Making](#evidence-first-decision-making)
- [Incremental Execution Pattern](#incremental-execution-pattern)  
- [Component Isolation Principles](#component-isolation-principles)

### [Debugging Protocols](#debugging-protocols)
- [Crisis Investigation Protocol](#crisis-investigation-protocol)
- [Evidence-First Debugging](#evidence-first-debugging)
- [System State Verification](#system-state-verification)

### [Development Patterns](#development-patterns)
- [User Validation Gates](#user-validation-gates)
- [Pre-Compact Knowledge Consolidation](#pre-compact-knowledge-consolidation)
- [Token Investment Strategy](#token-investment-strategy)
- [AI Collaboration Quality Assurance](#ai-collaboration-quality-assurance)

### [Anti-Patterns](#anti-patterns)
- [Compliance Theatre](#compliance-theatre)
- [Premature Optimisation](#premature-optimisation)
- [Context Accumulation](#context-accumulation)

---

## Architecture Patterns

### Evidence-First Decision Making {#evidence-first-decision-making}

**Pattern:** All significant decisions require concrete evidence before conclusions

**Implementation:**
- Direct observation over assumption
- Actual output verification over expected behaviour  
- User confirmation over self-assessment
- File content verification over existence assumptions

**Prevention Value:** Prevents debugging loops caused by false assumptions

**Example Application:** During system integration, requiring actual API response verification rather than assuming expected format prevents debugging cycles caused by changed upstream dependencies.

**Cross-References:**
- See: [Evidence-First Debugging](#evidence-first-debugging)
- Related: [Crisis Investigation Protocol](#crisis-investigation-protocol)

---

### Incremental Execution Pattern {#incremental-execution-pattern}

**Pattern:** All work broken into small, testable, reversible logical units

**Implementation:**
- Single logical change → user validation → immediate commit
- Each unit must be independently testable
- Rollback capability maintained at all checkpoints
- User authority required for completion confirmation

**Prevention Value:** Prevents large-scale failures and enables rapid recovery

**Example Application:** Database schema changes implemented one table at a time with immediate testing and commit after each modification, enabling rapid rollback if migration issues arise.

**Cross-References:**  
- See: [User Validation Gates](#user-validation-gates)
- Related: [Crisis Investigation Protocol](#crisis-investigation-protocol)

---

## Debugging Protocols

### Crisis Investigation Protocol {#crisis-investigation-protocol}

**Trigger:** System failure, unexpected behaviour, or critical blocker

**Investigation Sequence:**
1. **Evidence Collection:** Gather concrete symptoms, error messages, system state
2. **Hypothesis Formation:** Form testable theories based on evidence only  
3. **Systematic Testing:** Test one variable at a time
4. **Root Cause Validation:** Confirm actual cause vs assumed cause
5. **Solution Implementation:** Apply minimal effective fix
6. **Prevention Documentation:** Add learnings to anti-patterns

**Prevention Value:** Systematic approach prevents crisis tunnel vision

**Example Application:** API endpoint returning unexpected errors investigated through systematic log analysis, request reproduction, and environment comparison, revealing configuration drift between staging and production environments.

---

## Anti-Patterns

### Compliance Theatre {#compliance-theatre}

**Problem:** Performing compliance signals without genuine adherence

**Symptoms:**
- Elaborate self-assessments consuming high token allocation
- Perfect reported metrics masking actual protocol violations  
- Performance of systematic behaviour without substance
- Meta-commentary about AI behaviour instead of work

**Prevention:** Focus on substance over signalling, user validation over self-reporting

**Cross-References:** See [User Validation Gates](#user-validation-gates)

---

## Development Patterns

### User Validation Gates {#user-validation-gates}

**Pattern:** Explicit user confirmation required before proceeding with significant changes

**Implementation:**
- Present clear summary of proposed changes
- Require explicit user approval before execution
- Provide rollback options for completed changes
- Show impact assessment where applicable

**Prevention Value:** Prevents AI from making autonomous decisions beyond user intent

**Example Application:** Before implementing database schema changes, present migration plan with affected tables and potential risks, requiring user confirmation to proceed.

**Cross-References:**
- See: [Incremental Execution Pattern](#incremental-execution-pattern)
- Related: [Evidence-First Decision Making](#evidence-first-decision-making)

---

### Pre-Compact Knowledge Consolidation {#pre-compact-knowledge-consolidation}

**Pattern:** Systematic knowledge transfer before context window limits are reached

**Implementation:**
- Review session learnings for reusable patterns
- Graduate valuable insights to appropriate memory tiers
- Update working context for next session continuity
- Archive session-specific details to evidence tier

**Prevention Value:** Preserves accumulated knowledge across context resets

**Example Application:** Before reaching token limits, consolidate debugging discoveries into institutional memory patterns and update current focus for seamless session handoff.

**Cross-References:**
- See: [Token Investment Strategy](#token-investment-strategy)
- Related: [Evidence-First Decision Making](#evidence-first-decision-making)

---

### Token Investment Strategy {#token-investment-strategy}

**Pattern:** Deliberate allocation of context window capacity for maximum effectiveness

**Implementation:**
- Invest 40-60% of tokens in quality context loading
- Prioritise institutional memory over session-specific details
- Load problem-specific patterns before generic guidance
- Balance breadth of context with depth of current focus

**Prevention Value:** Prevents context dilution that reduces AI collaboration effectiveness

**Example Application:** For complex debugging sessions, load specific debugging protocols and related anti-patterns rather than general development guidance.

**Cross-References:**
- See: [Pre-Compact Knowledge Consolidation](#pre-compact-knowledge-consolidation)
- Related: [Crisis Investigation Protocol](#crisis-investigation-protocol)

---

### AI Collaboration Quality Assurance {#ai-collaboration-quality-assurance}

**Pattern:** Systematic validation of AI-generated solutions through structured review

**Implementation:**
- Adopt specific review perspectives (user experience, security, performance)
- Test edge cases and integration points systematically
- Validate assumptions through evidence collection
- Use persona-driven scenarios to catch realistic usage issues

**Prevention Value:** Catches integration bugs and usability issues that developer review misses

**Example Application:** Testing web application changes from both administrator and end-user perspectives reveals permission boundary issues and workflow interruptions.

**Cross-References:**
- See: [Evidence-First Decision Making](#evidence-first-decision-making)
- Related: [User Validation Gates](#user-validation-gates)

## Anti-Patterns (Continued)

### Context Accumulation {#context-accumulation}

**Problem:** Working context growing beyond attention efficiency limits

**Symptoms:**
- Session files exceeding 50-line cognitive load limits
- Information duplication across memory tiers
- Difficulty locating relevant guidance quickly
- AI struggling to maintain focus on current priorities

**Prevention Strategy:**
- Ruthless pruning of working context each session
- Graduate stable patterns to institutional memory
- Archive completed work to evidence tier
- Maintain clear tier boundaries and purposes

**Prevention Value:** Preserves attention efficiency that makes MEMENTO effective

**Cross-References:** See [Pre-Compact Knowledge Consolidation](#pre-compact-knowledge-consolidation)

---

### Premature Optimisation {#premature-optimisation}

**Problem:** Optimising system performance without evidence of actual bottlenecks

**Symptoms:**
- Complex caching strategies implemented before performance issues identified
- Algorithm complexity reduction sacrificing functionality
- Infrastructure scaling without usage pattern analysis
- Code optimisation consuming development time without measurable benefit

**Prevention Strategy:**
- Measure actual performance before optimising
- Focus on user-perceived performance metrics
- Profile real usage patterns, not theoretical maximums
- Optimise based on evidence, not assumptions

**Prevention Value:** Prevents engineering effort waste and feature degradation

**Cross-References:** See [Evidence-First Decision Making](#evidence-first-decision-making)

---

### Component Isolation Principles {#component-isolation-principles}

**Pattern:** Design components with clear boundaries and minimal coupling

**Implementation:**
- Single responsibility per component
- Explicit interfaces for data exchange
- Dependency injection for external services
- Error boundaries preventing cascade failures

**Prevention Value:** Enables isolated testing and reduces debugging complexity

**Example Application:** Database access layer isolated from business logic allows testing with mock data and prevents schema changes from affecting application logic.

**Cross-References:**
- See: [Incremental Execution Pattern](#incremental-execution-pattern)
- Related: [AI Collaboration Quality Assurance](#ai-collaboration-quality-assurance)

---

### Evidence-First Debugging {#evidence-first-debugging}

**Pattern:** Systematic evidence collection before forming debugging hypotheses

**Implementation:**
- Capture actual error messages and system state
- Reproduce issues with minimal test cases
- Log system behaviour at key decision points
- Verify assumptions through direct observation

**Prevention Value:** Prevents debugging cycles based on incorrect assumptions

**Example Application:** Network connectivity issues investigated through systematic ping tests, DNS resolution verification, and proxy configuration checks rather than assuming firewall problems.

**Cross-References:**
- See: [Crisis Investigation Protocol](#crisis-investigation-protocol)
- Related: [Evidence-First Decision Making](#evidence-first-decision-making)

---

### System State Verification {#system-state-verification}

**Pattern:** Explicit verification of system status before and after operations

**Implementation:**
- Health check endpoints for service validation
- Configuration verification after deployment
- Data integrity checks after migrations
- Performance baseline measurement

**Prevention Value:** Catches silent failures and validates change effectiveness

**Example Application:** Database migration followed by row count verification and sample data validation ensures migration completed successfully without data loss.

**Cross-References:**
- See: [Evidence-First Debugging](#evidence-first-debugging)
- Related: [Incremental Execution Pattern](#incremental-execution-pattern)

---

*Continue adding patterns as they are discovered and validated through actual usage. Maintain navigation index and cross-reference integrity.*