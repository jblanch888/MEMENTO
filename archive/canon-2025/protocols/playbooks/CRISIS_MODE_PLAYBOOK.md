# CRISIS_MODE_PLAYBOOK.md

**Objective:** Stabilise system during severe issues through systematic diagnostics, minimal interventions, and user-directed recovery

---

## 1. Acknowledge & Halt Protocol

**Rule:** CRISIS MODE ACKNOWLEDGED. Halting proactive changes. Focusing on diagnostics and stability.

**Immediate Actions:**
- Stop all ongoing development work
- Cease any speculative fixes or enhancements
- Switch to diagnostic and evidence-gathering mode only
- Await explicit user direction for any system changes

**Crisis Triggers:**
- Multiple system failures simultaneously
- Data loss or corruption suspected
- Production systems affected
- User signals critical urgency
- Service coordination breakdown

---

## 2. Assess Crisis Severity & Response

**Rule:** Classify crisis severity to determine appropriate response level. Present systematic choices to User.

**Response Process:**
1. **Assess Severity:** Critical/High/Medium impact classification (see below)
2. **Identify Scope:** Single component vs. system-wide issues
3. **Evaluate Options:** Rollback, targeted fix, or full reset
4. **Present Choices:** Clear options with risks and benefits
5. **Await User Decision:** No autonomous crisis actions

**Response by Severity:**
- **Critical:** Immediate halt, full diagnostic sweep, user-directed recovery only
- **High:** Stop new work, focused diagnostics, minimal targeted fixes
- **Medium:** Continue with caution, systematic investigation, document findings

---

## 3. Maximum Evidence, Minimal Action

**Rule:** Prioritise gathering precise diagnostics. Any proposed fix must be minimal and targeted at immediate stabilisation.

**Evidence Collection Priority:**
1. **System State:** Current error messages, log outputs, process status
2. **Recent Changes:** Last commits, deployments, configuration changes
3. **Environmental Factors:** Network, database, external service status
4. **User Impact:** Specific failures observed, data at risk

**Minimal Action Principle:**
- No exploratory coding during crisis
- No "while we're here" improvements
- No speculative fixes without clear evidence
- Focus on immediate stability only

---

## 4. User-Led Recovery

**Rule:** All actions require explicit User approval and execution. Awaiting User direction based on Crisis Tree options.

**Action Categories:**

**Diagnostic Commands (Safe):**
- System status checks
- Log file examination
- Process and service verification
- Database connectivity tests

**Recovery Commands (User-Executed):**
- Service restarts
- Configuration rollbacks
- Database recovery operations
- Code deployment or rollback

**Communication Protocol:**
"Crisis diagnostics complete. Evidence: [summary]. Options: 
1. [Safe option with minimal risk]
2. [Targeted fix with moderate risk] 
3. [Full reset with known downtime]
Recommend: [option] based on [evidence]. Awaiting your decision and execution."

---

## 5. Crisis Documentation

**Rule:** Document crisis progression, decisions, and resolution for future prevention.

**Real-Time Documentation:**
- Timestamp all significant events
- Record evidence collection results
- Note all decisions and rationale
- Track recovery actions and outcomes

**Post-Crisis Knowledge Capture:**
"Crisis resolved. This incident provides valuable learning. Should we add a summary to `../../memory-prosthesis/institutional-memory/KNOWLEDGE_ARCHIVE.md#crisis-investigation-protocol` covering [key lessons]?"

---

## Crisis Severity Levels

**Critical (Immediate Response):**
- Data loss or corruption
- Production system down
- Security breach suspected
- Multiple core systems failing

**High (Urgent Response):**
- Core functionality broken
- User-facing errors
- Development environment unusable
- Database connectivity lost

**Medium (Planned Response):**
- Non-critical features failing
- Performance degradation
- Development workflow disrupted
- Intermittent issues

---

## Recovery Validation

**System Stability Verification:**
- Confirm core functionality restored
- Verify data integrity preserved
- Test key user workflows
- Monitor for recurring issues

**Post-Crisis Protocol:**
"Crisis response complete. System stability restored. Please verify [specific functions]. Recommend monitoring for [potential recurring issues]. Ready for normal operations resumption upon your confirmation."

---

## Additional Guidelines

### Integration with Existing Protocols

**Circuit Breaker Coordination:**
- Crisis mode can be triggered by circuit breaker activation
- Apply same "stop and reassess" principle
- Escalate to user-led decision making

**Evidence-First Application:**
- More rigorous evidence collection during crisis
- No hypothesis without supporting data
- Conservative interpretation of ambiguous evidence

### Communication Standards

**Status Updates:**
- Clear, factual communication about system state
- No speculation about causes without evidence
- Regular progress updates during extended recovery

### Knowledge Integration

**Reference institutional memory** for:
- Similar historical incidents and resolutions
- System-specific troubleshooting approaches
- Context-dependent escalation strategies
- Proven recovery procedures

---

**This playbook improves the odds of systematic crisis response with proper user oversight whilst building institutional wisdom for future crisis prevention.**