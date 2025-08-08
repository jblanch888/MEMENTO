# PLANNING_PLAYBOOK.MD

**Objective:** Structured analysis and user approval gates for complex work

---

## 1. Pattern-First Research

**Rule:** Before proposing solutions, search KNOWLEDGE_ARCHIVE and existing codebase for similar patterns.

**Research Checklist:**
- Check existing patterns in institutional memory
- Review similar implementations in codebase
- Search for reusable components
- Identify proven approaches

**Pattern Search Output:**
Document what patterns found and how they apply to current problem

---

## 2. Proposal Format

**Rule:** Plans MUST include all sections below for user approval.

### Required Sections:

#### ## Problem Statement
Clear description of issue and why it needs solving

#### ## Proposed Solution Overview  
High-level approach with key design decisions

#### ## Impact Analysis
What components/systems affected and how

#### ## Risk Assessment
Technical risks and mitigation strategies

#### ## Implementation Approach
How work will be broken into logical units

#### ## Estimated Effort (S/M/L)
- **S (Small)**: 1-3 logical units, single component
- **M (Medium)**: 4-8 logical units, multiple components  
- **L (Large)**: 9+ logical units, requires careful slicing

---

## 3. Risk Categories

### Technical Risks
- **Breaking Changes**: What could break existing functionality
- **Integration Issues**: Component coordination challenges
- **Performance Impact**: Potential degradation
- **Data Integrity**: Risk to existing data

### Mitigation Strategies
- How each risk will be addressed
- Rollback procedures if issues arise
- Testing approach for risk validation

---

## 4. Iterative Slicing

**Rule:** Break large work into testable, reversible slices.

**Slicing Strategy:**
1. **Foundation**: Core infrastructure/schema changes
2. **Core Logic**: Primary functionality implementation
3. **Integration**: Connect with existing systems
4. **Enhancement**: Performance and quality improvements
5. **Polish**: Final adjustments and cleanup

**Example Slicing:**
```
Slice 1: Database schema update (foundation)
Slice 2: Core business logic (functionality)
Slice 3: API integration (connection)
Slice 4: Validation and error handling (quality)
Slice 5: Performance optimisation (enhancement)
```

---

## 5. User Approval Gate

**Rule:** Conclude every plan with explicit approval request.

**Standard Format:**
"Awaiting user approval of this plan before implementation."

**Approval Covers:**
- Proposed approach and design
- Risk assessment and mitigation
- Implementation slicing
- Effort estimation

---

## 6. Plan Evolution

**During Implementation:**
- Plans may need adjustment based on discoveries
- Document significant deviations in STATUS.md
- Request re-approval for major changes
- Update KNOWLEDGE_ARCHIVE with learnings

---

**This playbook ensures thorough planning with user alignment before complex implementation begins.**