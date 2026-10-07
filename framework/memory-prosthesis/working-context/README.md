# Working Context

The top tier: what the assistant reads first, every session. Two files, split by time so they do not repeat each other:

- **CURRENT_FOCUS.md**, what to do now: the mission, the active plan, the current task, constraints, and questions open with the User.
- **STATUS.md**, what happened: this session's record of commits, the state of the working tree, and what waits on the User.

## Rules

- **Rewrite the whole file each time (CD #11).** Every edit re-reads the whole file and removes stale content from every section. This prevents stale content building up under fresh headlines, which silently misleads every future session.
- **This session only.** Completed work moves to institutional memory (as a lesson, with the User's approval) or to the evidence archive; history does not build up here.
- **Smallest tier by design.** Content that needs to last across sessions belongs a tier down.
- **Ownership.** Where several threads of work share one repository, name which thread owns these files; the other thread keeps its state in its own session or its own set of Memento files. (Learned from an incident in the projects: two editable copies of the working context become two conflicting accounts.)
- **Work out publication state from git at restart.** The working context must not claim "pushed" or "awaiting push". Publication status changes outside the commit that records it, so keep it out of committed notes and check git's current local and upstream state (`git status -sb`, `git log @{u}..`) at restart. (This happened twice in the Memento files that produced this repository.)
