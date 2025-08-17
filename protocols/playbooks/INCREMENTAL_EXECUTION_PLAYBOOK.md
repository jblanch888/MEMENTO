# INCREMENTAL_EXECUTION_PLAYBOOK.MD

**Objective:** Safe, incremental development with mandatory commit discipline and user validation gates

---

## 1. Pre-Execution Evidence Gathering

**Rule:** Before any work, establish baseline understanding through evidence collection.

**Required Evidence:**
- **Current State**: System status and health
- **Target Functionality**: Explicit requirements and success criteria
- **Related Patterns**: Check existing codebase for similar implementations
- **Risk Assessment**: Identify potential breaking changes or dependencies

---

## 2. Logical Unit Definition

**Rule:** Define clear, small logical units of work with specific success criteria.

**Logical Unit Characteristics:**
- **Single Purpose**: One clear functional change
- **Testable**: Can be verified independently  
- **Reversible**: Can be safely rolled back
- **User Valuable**: Provides demonstrable improvement

**Examples of Logical Units:**
- Add single validation check
- Implement one method or function  
- Create single cross-reference link
- Fix one specific bug
- Document one pattern

---

## 3. Implementation with User Validation

**Rule:** Implement logical unit with immediate testing and mandatory user validation before proceeding.

**Implementation Sequence:**
1. **Make Change**: Implement single logical unit
2. **Test Functionality**: Verify expected behaviour
3. **Check Integration**: Ensure no breaking changes
4. **Present to User**: Request validation using specific format
5. **Await Confirmation**: Do not proceed until user validates

**User Validation Protocol:**
After implementation, state: "Changes implemented for [specific change]. Please test [Y and Z]. Expected outcome: [A, B]."

**Natural Language Validation:**
Accept validation signals: "good", "continue", "proceed", "ok", "correct", "valid"
Upon detecting validation → commit immediately → proceed to next unit

**CRITICAL**: Never declare "Done", "Complete", or "Fixed" until user validation received.

---

## 4. Mandatory Commit Discipline

**Rule:** MUST commit after each validated logical unit. No exceptions.

**Commit Triggers:**
- User validation detected (natural language)
- Logical unit complete AND validated
- Before starting next logical unit
- Safety checkpoint reached

**Commit Message Format:**
```
feat/fix/docs: clear description of logical change

- Specific change made
- Why change was necessary  
- How change improves system

🤖 AI-assisted development
Co-Authored-By: AI Assistant
```

---

## 5. Progressive Enhancement

**Rule:** Build functionality incrementally with working checkpoints at each step.

**Enhancement Strategy:**
- **Foundation First**: Establish basic working functionality
- **Incremental Improvement**: Add enhancements one at a time
- **Validation Gates**: User approval between enhancement layers
- **Rollback Safety**: Each step independently reversible

---

## 6. Integration Verification

**Rule:** After each logical unit, verify integration with broader system.

**Integration Checks:**
- **Component Health**: All components remain functional
- **Data Flow**: Information flows correctly
- **User Experience**: Functionality works from user perspective
- **System Stability**: No performance degradation or errors

---

## 7. Error Handling

**Approach:**
- **Graceful Degradation**: System remains functional if new code fails
- **Clear Error Messages**: Actionable feedback for debugging
- **Rollback Capability**: Always maintain ability to revert changes

---

**This playbook improves the odds of safe, incremental execution whilst maintaining system stability and user confidence through systematic validation.**