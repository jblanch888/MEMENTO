# GIT_OPERATIONS_PLAYBOOK.md

**Objective:** Version control procedures and commit discipline

**Scope:** Based on solo development experience with AI assistance. Teams may need to adapt these practices to their existing workflows and conventions.

---

## Commit Discipline

### Logical Unit Commits
- One logical change per commit
- User validation before committing
- Immediate commit after validation
- Never batch multiple changes

### Commit Message Format
```
type(scope): description

- What changed
- Why it changed
- Impact of change

🤖 AI-assisted development
Co-Authored-By: AI Assistant
```

### Types
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation
- `refactor`: Code restructuring
- `test`: Test changes
- `chore`: Maintenance

---

## Branch Management

### Branch Naming
- `feature/description` - New features
- `fix/issue-description` - Bug fixes
- `refactor/area` - Code improvements

### Branch Hygiene
- Keep branches focused
- Regular commits
- Clean history
- Delete after merge

---

## Pre-Commit Checklist

- [ ] Tests pass (if applicable)
- [ ] Code reviewed for quality
- [ ] User validated changes
- [ ] Commit message clear
- [ ] No sensitive data included

---

## Recovery Procedures

### Rollback Last Commit
```bash
git reset --soft HEAD~1  # Keep changes
git reset --hard HEAD~1  # Discard changes
```

### Recovery from Bad State
1. Identify last good commit
2. Create backup branch
3. Reset to good state
4. Cherry-pick valid changes

---

**This playbook improves the odds of clean version history and safe rollback capabilities.**