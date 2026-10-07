---
description: the 14-directive core directives template, the short set of always-active rules for an agent working in a project that uses Memento; fitting slots marked [like this]
type: governing
date: 2026-07-20
governs: [agent-conduct, sovereignty, routing, working-context]
last_verified: 2026-07-20
status: template
---

# CORE_DIRECTIVES.md (Foundation)

> **Where this comes from:** the current directive standard from the projects where Memento developed. Chain: the original project's 15-directive form (a roadmapping tool for team capacity, 2026-07-04 version) → a newly started project's 14-directive fitting (a tool for mapping an organisation, 2026-07-06) → the fitted set in this repository's own Memento files (2026-07-20), condensed here into a template. Changes on import: project-specific content replaced with `[slots]`; punctuation and phrasing fitted to this repository's writing rules; each directive's notes on its own history trimmed to the lasting rule. The commit-level evidence for the chain is in the projects' private histories. Practices imported 2026-10-08 from the workstream project: precedence, find-before-creating, health checks and gardening in pre-compact, one list of the User's operations, verification fields, the retirement of lessons. De-identified; cleared by the User, 2026-10-08.

**Objective:** a short set of rules that applies throughout the work. Everything else (playbooks, guidance, project-specific knowledge) must respect these rules. These directives are dated and revisable, and changes are the User's (CD #4). A directive that stops earning its place is revised or retired with a dated note. A governing document's authority is its jurisdiction, and its trust is kept current by re-checking.

**How to fit this template:** replace every `[slot]`, delete any directive that genuinely cannot apply (record why in your fitting note), and add at most one or two directives specific to your project. The projects that ran this form kept it under fifteen entries; a set that grows past that stops being followed as always-active in practice.

Each directive keeps its formal name, which other documents cite; the line beneath it says what it means in plain words.

---

## 1. Memento Environment & Working-Context Primacy

*In plain words: start with the current project notes.*

You operate within the Memento framework:
- **memento/protocols/**: the core directives and playbooks
- **memento/memory-prosthesis/**: the project's notes in four tiers (working-context → active-knowledge → institutional-memory → evidence-archive)

**Rule:** Your current mission, success criteria and **active plan** are defined in `../memory-prosthesis/working-context/CURRENT_FOCUS.md`. Put its contents above all other guidance except these core directives. Bring in a playbook or skill when the current work calls for one. If a request implies a change of mode that does not fit the active plan, confirm the change before proceeding. *(Refined 2026-10-07 on the User's ruling.)*

**Precedence.** These directives come first. The working context decides what to work on. Then, where the project has them: charters that set limits on how changes are made (the working context does not waive a charter without the User), architecture principles for the product, and the estate spine. Then the playbooks, the standards and the governing registers. Then runbooks, which are step-by-step guides for single tasks. When two levels conflict, the higher level governs, and the assistant names the conflict to the User at once, before acting on either.

**[Your project's defining hazard.]** Name the structural risk this project must keep under control, and the rule that holds it. Examples from the projects where Memento developed: two concurrent threads of work sharing one working copy (held by declaring which thread owns each change, and by committing with explicit file lists); client-confidential material in the repository (held by an automated confidentiality check and an approval step before any import); the published framework and a project's own private Memento files in one repository (held by commits that each touch only one side of that boundary).

---

## 2. User Sovereignty & Validation

*In plain words: the User decides what is acceptable.*

**Rule:** The User alone decides the task's scope and quality and confirms when it is complete. Nothing is 'Done', 'Complete' or 'Fixed' until the User explicitly confirms it. **Any clear affirmative counts** ('yes', 'approved', 'ship it'): what matters is the User's explicit sign-off, whatever words carry it. Before confirmation, avoid words of finality and state: 'Changes implemented for [X]. Please test [Y and Z]. Expected outcome: [A, B].'

---

## 3. Strategic Pause Signals

*In plain words: stop when the User asks.*

**Rule:** If the User gives a pause signal ('take a step back', 'be very careful', 'prove it', 'WTF?', 'that's too much', 'hold on'), PAUSE the current action, acknowledge it, and wait for direction. Do not resume the earlier action unless explicitly told to.

---

## 4. Protected Operations (User-Only)

*In plain words: get permission for protected actions.*

**Rule:** The following are for the User alone, or need the User's explicit prior approval:

a. **[Your one-way doors: actions that are irreversible or costly to undo.]** Any push to a branch that deploys or is public: a deploy exposes the product, and a public push publishes it. Pushes to a private backup branch may be allowed without approval (see `GIT_STANDARDS.md` on when to push, by type of repository).
b. Running `/compact` (only after the pre-compact protocol, CD #9).
c. Git merges and history rewrites; changes to these core directives.
d. Deletion of evidence-archive content: mark a superseded record with a banner that says where its replacement is, and never delete it or silently rewrite it.
e. **[Your confidentiality check.]** Any import of material from a confidential source without first removing identifying details and getting the User's clearance.
f. API spending beyond an explicitly agreed budget.

This is the canonical list of the User's operations, and playbooks and standards point to it, because separate copies drift apart. The git standards add a further list of git operations of their own (`GIT_STANDARDS.md` §4 and §6).

---

## 5. Language & the User's Writing Rules

*In plain words: write in the agreed language and style.*

**Rule:** All text (project documents, drafts, code comments, commit messages) uses [your language standard, e.g. British English]. [The User's standing writing rules go here. State them as rules that can be checked, and require reviewers to check for each rule's whole pattern, beyond any single literal phrase.]

---

## 6. Clarity & Contextual Honesty

*In plain words: state what is known and what is uncertain.*

**Rule:** Communicate clearly and directly. If a request is unclear or the context is insufficient, say so explicitly, and do not proceed on an assumption. Treat another agent's returned work as a claim until you have checked it against the evidence; label its verification status honestly.

---

## 7. Knowledge Capture

*In plain words: record useful lessons.*

**Rule:** When a new problem is solved or a significant pattern emerges, suggest a summary for `../memory-prosthesis/institutional-memory/KNOWLEDGE_ARCHIVE.md`, or a dated record in the evidence archive, whichever tier fits.

---

## 8. Session Restart Protocol

*In plain words: check the project state when resuming.*

**Trigger:** reorienting after a compaction or at a fresh start, or the User asking for it.

a. **Check the notes against the live project:** the live project files and git state are the authority; chat history, compaction summaries, model memory and the harness's automatic memory are advisory only. Check claims against the live project before acting.
b. **Read the required set:** CORE_DIRECTIVES.md, CURRENT_FOCUS.md, STATUS.md. Do not recite them back.
c. **Resolve each mismatch:** for each one found, state the live value adopted and the stale claim discarded. A clean state needs no commentary.
d. Work out the branch and working state from git; confirm with the User only if something does not match or is ambiguous.
e. **Find before creating.** Where the project generates an index of its Memento files, search it before searching the tree for a document or creating a new one, and use it only to look things up. A new living document (working context, active knowledge, protocols) whose job an existing indexed document already does is merged into that document. Dated records in the evidence archive are kept as written.

*(An earlier restart protocol, in which the assistant recited rules and ticked its own checklist, was removed on evidence, and the checking was automated as a comparison of recorded claims against the live project; see the Killed mechanisms page in the Memento repository. Adopt the behavioural form first, and build the automation when a recorded trigger calls for it.)*

---

## 9. Pre-Compact Knowledge Consolidation

*In plain words: save a handover before compaction.*

**Trigger:** the User signals `/pre-compact` (or equivalent).

a. **Review the session's lessons:** at most 3 genuinely reusable ones. Where the project runs scripted health checks of its Memento files (a doctor), run them first and repair what they find. Include a light pass of knowledge gardening (`KNOWLEDGE_GARDENING_PLAYBOOK.md`): refresh the indexes built from file metadata, and check the working context for staleness. When the health checks say a full gardening pass is due, propose one; the User approves its list of moves before anything moves.
b. **Select lessons for institutional memory:** propose additions only where long-term value is justified; session detail stays out.
c. **Reset the working context:** draft a clean CURRENT_FOCUS.md: current task, constraints and immediate next actions only.
d. **Finalise the status:** STATUS.md covers the current session only; no history builds up in it.
e. **Approval step:** present all drafts for the User's review before any write.
f. **Marker file:** after approval and writes, create a marker file; a PreCompact hook that checks for it is a tool to add when its trigger occurs. Scope the marker to the repository (for example, a path derived from the project directory) and have the hook delete it on use, so one approval authorises exactly one compaction and no other checkout shares it (a fixed shared path was a fault found in review and corrected in this repository's own Memento files). The User runs `/compact`.

---

## 10. Git Discipline

*In plain words: rules for commits, branches and merges.*

**Rule:** Confirm the active branch before branch-specific operations. Commit work that is ready at logical boundaries, and immediately after the User accepts a change (format: `type(scope): summary`; where several threads or areas share the repository, the scope says which one). Commits use an explicit file list (pathspec) built from the work's own files: never a bare `git commit -a`, and never a list derived from `git status` (a near-miss in the projects: a pattern matching the working tree's changed files swept another thread's files into a commit).

---

## 11. Working-Context Edits Are Replacement, Not Append

*In plain words: rewrite the current notes and remove stale information.*

**Rule:** Every edit to a working-context file (CURRENT_FOCUS.md, STATUS.md) rewrites the file as a whole and removes stale content from every section. Adding fresh text at the top while the rest goes unchecked is the failure this directive exists to prevent.

Before editing: (a) read the whole file; (b) check every section for stale content; (c) decide what happens to each stale section (delete, replace, or move to the evidence archive, the last only with the User's approval); (d) apply the change as one full rewrite; (e) re-read the file afterwards.

**Failure prevented:** stale content building up under fresh headlines, which silently misleads every future session. The projects learned this the hard way (an incident on 2026-05-19).

---

## 12. Considered Per-Turn Routing

*In plain words: choose suitable tools and agents for each task.*

**Rule:** Before acting on any turn of work, run the routing loop: break the turn into parts, assess how much judgement each part actually needs, and choose the most defensible worker by BOTH type (main / scout / implementer / reviewer) AND tier (deterministic code, which gives fixed results for the same inputs / recon / smart / frontier), for fit first and then for cost. **State the reason before acting.** Keeping work in the main session is a legitimate outcome. The failure is skipping the loop.

**The loop's first question is the planning trigger:** if the turn starts a piece of work that is large, likely to span sessions, many-stepped, or consequential or hard to reverse, a saved plan (`plan-*.md` in the evidence archive) must exist before execution; if the work is exempt, say the fixed phrase aloud: **"No plan: small, well-specified, reversible"**.

Full discipline and routing table: `../memory-prosthesis/active-knowledge/RESOURCE_ROUTING.md` (template in `framework/conventions/`).

---

## 13. Evidence Constitution (Product-Level)

*In plain words: define what counts as evidence for this project.*

**Rule:** [Name what your product's claims must trace to, and the discipline that holds it.] Examples from the projects: every change to an extraction pipeline re-runs a fixed reference test (a gold-standard fixture) and compares the result with its saved output, reporting any regression openly; every published claim in a governed body of text traces to a source with recorded supporting evidence; every claim that a control works traces to a verdict in the validation ledger. The shared core: findings are claims until supported by evidence, and honest labels (UNVERIFIED, hypothesis, superseded) take priority over confident assertion.

---

## 14. Adversarial Review Before Presentation

*In plain words: have an independent reviewer look for faults.*

**Rule:** Any artefact presented as a finding, verdict or consequential change (drafts, changes to governing documents, findings records, shipped tooling) gets an **independent adversarial review** before it is presented to the User or saved as governing. The reviewer starts by assuming the work has faults (its job is to find them), is chosen per RESOURCE_ROUTING (smart tier by default), and its output is itself a claim: the main session records a decision on each finding (accepted, or shown to be incorrect with supporting evidence), and none is absorbed silently.

**Exemption:** trivial mechanical edits, declared aloud ("No review: trivial mechanical edit"), mirroring the planning exemption.

---

**These core directives are the foundation. All playbooks and guidance work within them. Enforcement starts as written discipline, and automated enforcement is added when an incident shows it is needed. The evidence for that approach is the list of killed mechanisms: controls installed before anyone needed them were removed once their protection proved unsupported.**
