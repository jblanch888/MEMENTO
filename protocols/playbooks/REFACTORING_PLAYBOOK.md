# REFACTORING_PLAYBOOK.md

**Objective:** Improve code quality safely through systematic refactoring with proper coordination and awareness of system constraints

---

## 1. Refactor Scope & Rationale

**Rule:** Confirm `REFACTOR_SCOPE: [details]` and `REFACTOR_RATIONALE: [e.g., improve system reliability]` from `../../memory-prosthesis/working-context/CURRENT_FOCUS.md`.

**Before Starting:**
- Explicitly state which system components will be refactored
- Confirm impact boundaries and dependencies
- Identify success criteria for improved code quality
- Consider data model implications

**Refactor Examples:**
```
REFACTOR_SCOPE: Extract validation logic into reusable validator class
REFACTOR_RATIONALE: Improve consistency across processing pipeline components

REFACTOR_SCOPE: Consolidate search algorithms into unified interface
REFACTOR_RATIONALE: Reduce code duplication and enable A/B testing of approaches
```

---

## 2. Development Pattern Research

**Rule:** Consult `../../memory-prosthesis/institutional-memory/KNOWLEDGE_ARCHIVE.md#refactoring-patterns` for relevant patterns and existing refactoring approaches.

**Research Checklist:**
- Check for similar component refactoring patterns
- Review architectural decisions that constrain approach
- Identify established processing patterns to maintain
- Look for anti-patterns to avoid

**Pattern Areas:**
- **Integration Patterns**: Interface management, output processing, error handling
- **Coordination Patterns**: Component communication, dependency management
- **Schema Evolution Patterns**: Coordinated changes across system components
- **Data Processing Patterns**: Consistency, validation, optimisation

---

## 3. Incremental Approach

**Rule:** Refactor in small steps. After each step, validate system functionality. Upon user validation (natural language accepted), commit immediately before next step.

**Refactor Process:**
1. **Component Status Baseline** - Verify all components operational before changes
2. **Single Component Change** - One logical transformation (extract, consolidate, optimise)
3. **Multi-Level Validation** - System coordination + output quality verification
4. **User Validation** - Natural language validation triggers immediate commit before next step

**Validation Sequence:**
- **System Coordination**: Verify multi-component communication still functional
- **Data Compatibility**: Confirm schema alignment maintained
- **Output Quality**: Test with real data for processing consistency
- **Search/Query Functions**: Validate functionality and performance

**Example Refactor Sequence:**
- Step 1: Extract processing logic into separate module
- Step 2: Update main pipeline to use new processor
- Step 3: Update validation logic to use same processor
- Step 4: Verify coordinated processing updates work across system

---

## 4. Behavioural Preservation

**Rule:** State: 'This refactor aims for [code improvement] without altering system behaviour unless specified in `../../memory-prosthesis/working-context/CURRENT_FOCUS.md`.'

**Preservation Requirements:**
- **Same Outputs**: Identical inputs produce equivalent responses
- **Same Search Results**: Query quality and relevance maintained
- **Same System Coordination**: Multi-component communication patterns preserved
- **Same Error Handling**: System failure recovery behaviour unchanged

**Preservation Challenges:**
- **Non-Deterministic Outputs**: Some responses may vary slightly - validate semantic consistency
- **Component Timing**: Refactoring shouldn't affect component startup/coordination timing
- **Schema Validation**: Data processing must remain identical
- **Index Consistency**: Data structures and algorithms preserved

**When Behaviour Changes ARE Intended:**
- Must be explicitly stated in `../../memory-prosthesis/working-context/CURRENT_FOCUS.md`
- Requires specific test strategy for new processing behaviour
- Consider if this should be separate enhancement development

---

## 5. System Validation Protocols

**Rule:** After any refactoring step, validate system coordination, processing, and code quality. Report outcomes.

**Post-Refactor Validation:**
1. **Component Status Check**: Verify all system components operational
2. **Processing Test**: Process sample data to verify output consistency
3. **Query Test**: Perform known queries to verify functionality maintained
4. **Schema Validation**: Test data processing with real system outputs
5. **Code Quality**: Run linting and type checking appropriate to codebase

**Code Quality Checks:**
```bash
# Adapt to your specific tools and language
npm run lint          # JavaScript/TypeScript
python -m flake8 src/ # Python
cargo clippy          # Rust
```

**Expected Outcomes:**
- All system components restart successfully after refactoring
- System processing produces semantically equivalent outputs
- Query functionality maintains quality metrics
- No schema validation regressions
- Code quality tools pass without new errors

---

## 6. System Coordination Safety

**Safe Refactoring Techniques:**
- **Component Isolation**: Refactor one component at a time when possible
- **Schema Backward Compatibility**: Maintain existing validation during refactoring
- **Coordinated Restart**: Plan component restart sequences for multi-component changes
- **Rollback Capability**: Preserve ability to revert system changes

**Refactor Boundaries:**
- **Single Component Changes**: Contain refactoring within component boundaries
- **Cross-Component Changes**: Coordinate carefully with component dependency awareness
- **Schema Evolution**: Handle as separate, planned activity with migration strategy
- **Index Changes**: Consider rebuild requirements and timing

---

## 7. Knowledge Capture Integration

**Refactoring Patterns**: Document successful system refactoring approaches in `../../memory-prosthesis/institutional-memory/KNOWLEDGE_ARCHIVE.md#refactoring-patterns`.

**Coordination Lessons**: Capture multi-component refactoring insights for future reference.

**Schema Evolution Wisdom**: Document safe approaches for refactoring around schema constraints.

---

## Additional Guidelines

### Development Considerations
- **Non-Deterministic Testing**: Account for output variability in validation
- **Component Dependencies**: Consider downstream effects of changes
- **Schema Constraints**: Work within existing validation and processing patterns

### Cross-Reference Integration
- **Detailed Patterns**: See `../../memory-prosthesis/institutional-memory/KNOWLEDGE_ARCHIVE.md#refactoring-patterns`
- **System Safety**: Reference `../../memory-prosthesis/institutional-memory/KNOWLEDGE_ARCHIVE.md#system-coordination-safety`
- **Schema Management**: Apply `../../memory-prosthesis/institutional-memory/KNOWLEDGE_ARCHIVE.md#schema-evolution-patterns`

---

**This playbook ensures safe refactoring of system code with proper coordination, schema awareness, and processing validation.**