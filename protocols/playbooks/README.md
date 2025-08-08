# Playbooks

**Purpose:** Structured procedures for common development scenarios and operational modes

**Mental Model:** Your operational procedures manual - when CURRENT_FOCUS.md says "use X playbook", you come here

**Usage:** Active Playbook specified in CURRENT_FOCUS.md guides current work approach

---

## Available Playbooks

### Core Development
- **INCREMENTAL_EXECUTION_PLAYBOOK.md** - Safe, incremental development with validation gates
- **PLANNING_PLAYBOOK.md** - Structured analysis and user approval for complex work
- **DEBUGGING_PLAYBOOK.md** - Systematic crisis investigation and resolution

### Code Management  
- **REFACTORING_PLAYBOOK.md** - Safe code restructuring without breaking functionality
- **GIT_OPERATIONS_PLAYBOOK.md** - Version control procedures and commit discipline

### Knowledge Management
- **DOCUMENTATION_PLAYBOOK.md** - Creating and maintaining project documentation

---

## Playbook Selection

**When to Use Which:**
- **Starting new feature** → PLANNING then INCREMENTAL_EXECUTION
- **System broken** → DEBUGGING (or CRISIS_MODE if severe)
- **Code cleanup** → REFACTORING
- **Documentation updates** → DOCUMENTATION
- **Version control** → GIT_OPERATIONS

**Switching Playbooks:**
If work requires different approach, update CURRENT_FOCUS.md with new Active Playbook

---

**These playbooks provide systematic approaches proven through battle-testing. Follow them to avoid known pitfalls and maintain development discipline.**