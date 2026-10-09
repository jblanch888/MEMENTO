# Changes

Each version tag of this repository, newest first, with what changed outside `memento/` since the previous tag. A tag is final, and only the User may move or delete one (`framework/conventions/GIT_STANDARDS.md` §8). For changes to this repository's own Memento files in `memento/`, see the git history.

## v2026.10.1 (2026-10-10)

Changes since `v2026.10`.

### Summary

- **A new playbook for improving a working system:** `GOVERNED_OPTIMISATION_PLAYBOOK.md`. It covers cutting cost or running time, or replacing a mechanism, while proving the quality holds. It was imported from a live project, de-identified, and cleared by the User.
- **Skills, with planning on trial:**
  - **A new `framework/skills/` folder** holds procedures packaged as skills, for assistants that support them (Claude Code and Codex).
  - **The first skill,** `memento-planning`, brings in the planning playbook when an undertaking may need a saved plan. It repeats only the playbook's trigger and its fixed exemption phrase.
  - **It is on trial,** with criteria set in advance. The trial decides whether the framework recommends delivering procedures as skills.

### Changed files

**Playbooks**
- `framework/playbooks/GOVERNED_OPTIMISATION_PLAYBOOK.md`: new. It covers the records, four gated phases, the disciplines, five learning loops, a checklist of traps, and the verdict words.
- `framework/playbooks/README.md`: lists the new playbook, points to the skills folder, and counts three transplanted playbooks.

**Skills**
- `framework/skills/README.md`: new. What a skill is here, the single-source rule, installing, and the trial's status.
- `framework/skills/memento-planning/SKILL.md`: new. The planning skill template.

**Framework overview**
- `framework/README.md`: the directory table gains a skills row, and the playbooks row names governed optimisation.

**This repository's own tooling**
- `.claude/skills/memento-planning/SKILL.md`: the planning skill, installed in this repository for the trial.

## v2026.10 (2026-10-09)

The first tag. It lists changes since commit `1c8adfc` (2026-10-03).

### Summary

- **Fewer playbooks, plus standards.**
  - **Moved:** the git operations, documentation and incremental execution playbooks became standards in `framework/conventions/` (`GIT_STANDARDS.md`, `DOCUMENTATION_STANDARDS.md`, `CHANGE_STANDARDS.md`).
  - **Stayed as playbooks:** planning and knowledge gardening.
  - **Skills** are named as a way to deliver a procedure where the assistant supports them (Claude Code and Codex).
- **CD #1 changes.**
  - **What the working context names:** an active plan in place of an active playbook.
  - **Playbooks and skills:** the assistant brings one in when the current work calls for it. The instruction to follow the named playbook strictly is removed.
  - **Precedence:** a numbered order is added for the project's Memento documents.
- **Practices imported from a live project:** precedence (CD #1), one list of the User's operations (CD #4), find before creating (CD #8e), health checks in pre-compact (CD #9a), the `verified_by` field and `governing-stale` status (estate spine), and the retirement of lessons (institutional memory). They are de-identified and were cleared by the User.
- **CD #4g:** destructive git operations beyond merges and history rewrites, such as a hard reset or deleting a branch, are reserved for the User.
- **The directives are the "Foundation".** The title and closing line no longer call them immutable or fixed. They are dated and revisable, changes are the User's, and the assistant proposes revising or retiring a directive when evidence shows it no longer serves its purpose.
- **Tier map corrections:** verified against Claude Code CLI 2.1.286; the main thread's rank; the tool guarantees of the scout and reviewer agents; a live-dispatch witness now exists.

### Changed files

**Directives**
- `framework/directives/CORE_DIRECTIVES_TEMPLATE.md`:
  - **Title and objective:** the title becomes "(Foundation)", dropping "Immutable". The objective says the directives are dated and revisable, that the assistant proposes revising or retiring a directive with a dated explanation, and what a governing document's `governs`, `last_verified` and `verified_by` fields record.
  - **CD #1:** active plan; playbooks and skills brought in when needed; the instruction to follow the named playbook strictly is removed; precedence.
  - **CD #4:** item a points to `GIT_STANDARDS.md`; item g is added; the list is named as the canonical list of the User's operations.
  - **CD #5:** the reviewer instruction becomes "every form of each pattern".
  - **CD #8:** item e, find before creating.
  - **CD #9:** item a gains health checks, a check of the working context for stale claims, and index refreshes, applied after the User's review; a full gardening pass is proposed when the checks say one is due.
  - **CD #12:** the closing sentences restated.
  - **The closing line:** "the fixed foundation" becomes "the foundation".

**Conventions and standards**
- `framework/conventions/GIT_STANDARDS.md`:
  - **Moved** from `framework/playbooks/GIT_OPERATIONS_PLAYBOOK.md`, with a dated note on the move; its type changes to convention and its relative paths are corrected.
  - **§4 and §6** are marked as the User's operations; §6 points to CD #4g.
  - **§8**, version tags, is new.
- `framework/conventions/DOCUMENTATION_STANDARDS.md`:
  - **Moved** from `framework/playbooks/DOCUMENTATION_PLAYBOOK.md`, with a dated note on the move; its type changes to convention and its relative paths are corrected.
  - **§5** is reduced to a pointer to CD #9.
  - **Cross-references** include standards and skills.
  - **§8 record sections:** the header names "the plan or playbook in use".
- `framework/conventions/CHANGE_STANDARDS.md`:
  - **Moved** from `framework/playbooks/INCREMENTAL_EXECUTION_PLAYBOOK.md`, with a dated note on the move; its type changes to convention and its relative paths are corrected.
  - **§2** (test plan first) is noted as suited to a skill.
  - **§3** is one ordered list of the directive steps; its waiting and no-finality wording is left to CD #2, and its review exemptions to CD #14.
  - **§4** is retired into §3.
- `framework/conventions/ESTATE_SPINE.md`: the `verified_by` field and the `governing-stale` status in the frontmatter template; one bullet on what a governing document's fields record, one defining `governing-stale`; the import noted in its source note.
- `framework/conventions/RESOURCE_ROUTING.md`: step 5 restated: keeping work in the main session is a valid result of the loop, and the loop runs on every turn.
- `framework/conventions/TIER_MAP.json`:
  - **Verified:** `last_verified` 2026-10-06; Claude Code binding verified against 2.1.286.
  - **Ranks:** the judgement role is rank 1.
  - **Scout:** no longer carries agent memory, which would add Write and Edit.
  - **Reviewer:** its no-write guarantee becomes behavioural.
  - **Runtime dependency:** a live-dispatch witness now exists, is re-run after every harness upgrade, and last passed on 2.1.286, 2026-10-05.

**Playbooks**
- `framework/playbooks/README.md`: lists planning and knowledge gardening; says where the other three went; adds a section on skills.

**Memory prosthesis**
- `framework/memory-prosthesis/README.md`: standards described as part of the operational protocols; "active plan"; DOCUMENTATION_STANDARDS reference.
- `framework/memory-prosthesis/active-knowledge/README.md`: lists the three standards.
- `framework/memory-prosthesis/evidence-archive/README.md`: DOCUMENTATION_STANDARDS reference.
- `framework/memory-prosthesis/institutional-memory/README.md`: new section, retiring lessons.
- `framework/memory-prosthesis/working-context/CURRENT_FOCUS_TEMPLATE.md`: the "Active Playbook" heading becomes "Active plan".
- `framework/memory-prosthesis/working-context/README.md`: "active plan".

**Framework overview**
- `framework/README.md`:
  - **Directory table:** playbooks and conventions rows updated.
  - **Install paths:** given for standards.
  - **Words used here:** new entries for conventions, standard and skill; revised entries for operational protocols and playbook.

**Adoption**
- `adoption/GETTING_STARTED.md`:
  - **Step 2:** the planning playbook first, gardening when the notes grow.
  - **Step 4:** installs the standards.
  - **Session rhythm:** "active plan".
- `adoption/GRADUATION_LADDER.md`: Rung 2 names the planning playbook and the standards.

**Story and front pages**
- `CHANGES.md`: new; this file.
- `story/ORGAN_REGISTRY.md`: dated notes on rows 3 (core directives form) and 4 (playbook system).
- `README.md`: the framework row mentions standards; "Playbooks and standards" bullet.
- `docs/index.md`: the framework row mentions standards.

**This repository's own tooling**
- `.githooks/` (`pre-commit`, `pre-merge-commit`, `commit-msg`): run the confidentiality sweep on staged changes, merges, commit messages and identities, once a clone sets `core.hooksPath`.
- `.claude/settings.json`: hooks that prompt the restart protocol at session start, and when a prompt asks for a restart.
