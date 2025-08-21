# DEBUGGING_PLAYBOOK.md

**Objective:** Forensic investigation of specific problems with absolute evidence discipline

---

## 1. Evidence-First Mandate

**FORENSIC DISCIPLINE:** NEVER propose fixes without completing this mandatory evidence protocol:

```
EVIDENCE: [Concrete observations, logs, errors, user reports - NO speculation]
HYPOTHESIS: [Root cause theory DERIVED ONLY from evidence above]
PROPOSED_FIX: [Specific change to test hypothesis - NO assumptions]
TEST_PLAN: [How user can verify the fix - NO guesswork]
```

**FORBIDDEN ACTIONS:**
- Guessing based on "likely" causes
- Pattern-matching from unrelated issues  
- Assuming root cause without evidence
- Proposing fixes based on speculation
- Making changes without user validation

**Example:**
```
EVIDENCE: System showing 0 outputs despite successful API response
HYPOTHESIS: Data processing using wrong validation path
PROPOSED_FIX: Check validation logic in processing function
TEST_PLAN: Process sample input and verify expected output
```

---

## 2. Evidence Collection Sequence

**Required Evidence:**
1. **System Status**: Current state and health checks
2. **Error Messages**: Exact errors, stack traces, logs  
3. **Recent Changes**: What changed since last working state
4. **User Observations**: What user actually sees happening

**FORENSIC COLLECTION PROTOCOL:**
- **MANDATORY:** Direct observation before ANY theorising
- **FORBIDDEN:** Making assumptions about what "probably" happened
- **REQUIRED:** Document EXACT error messages, not paraphrased versions
- **DISCIPLINE:** Gather evidence methodically, resist urge to jump to solutions
- **VALIDATION:** All evidence must be verifiable by user

---

## 3. Circuit Breaker Protocol

**Rule:** After **2 FAILED** fixes for same symptom → STOP

**Trigger Action:**
"CIRCUIT_BREAKER: Re-evaluating approach for [symptom]. Initiating deep dive analysis."

**Purpose:** Prevents debugging loops when initial approaches fail

---

## 4. Deep Dive Analysis

**When Required:**
- Circuit breaker triggered
- User requests comprehensive review
- Complex multi-component issue

**Deep Dive Structure:**
1. **Evidence Summary**: All collected data points
2. **Pattern Analysis**: Similar issues from KNOWLEDGE_ARCHIVE
3. **Root Cause Theory**: Comprehensive explanation
4. **Revised Plan**: New approach with specific steps
5. **Risk Assessment**: What could still go wrong

---

## 5. Architectural Pattern Recognition

**Recurring Issue Triggers:**
- Same problem across multiple sessions
- User frustration signals ("this keeps happening")
- Fix cycles that fail in production

**Assessment Protocol:**
1. Check KNOWLEDGE_ARCHIVE for similar patterns
2. Consider architectural root cause
3. Generate multiple solution approaches
4. Document as anti-pattern if recurring

---

## 6. Crisis Escalation Path

**Level 1: Standard Debugging**
- Follow evidence-first approach
- Single component focus
- Quick iteration cycles

**Level 2: Circuit Breaker Triggered**
- Deep dive analysis required
- Multi-component investigation
- Pattern recognition check

**Level 3: Architectural Issue**
- Systematic failure pattern
- Requires design change
- Document in KNOWLEDGE_ARCHIVE

---

## 7. User Validation Protocol

**Never Claim "Fixed" Without:**
- User testing with real data
- Evidence of resolution
- Confirmation of expected behaviour

**Validation Request Format:**
"Debug fix implemented for [issue]. Please test [specific action]. Expected result: [behaviour]. Please confirm resolution."

---

## Additional Guidelines

### Knowledge Archive Integration
- Check for known issues and solutions
- Document new patterns discovered
- Add anti-patterns to prevent recurrence

### Commit Discipline
- Commit immediately after validated fix
- Include evidence in commit message
- Reference issue in documentation

---

**This playbook ensures systematic debugging whilst preventing loops and maintaining evidence-first principles.**