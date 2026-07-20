# Working Context

The surface tier: what the agent reads first, every session. Two files, with a temporal split that prevents redundancy:

- **CURRENT_FOCUS.md** — "what now": mission, Active Playbook, current task, constraints, what is open with the User.
- **STATUS.md** — "what happened": the session's ledger, tree state, and what waits on the User.

## Rules

- **Replacement, never append (CD #11).** Every edit re-reads the whole file and prunes stale content end-to-end. The failure this prevents is sedimentary contamination: a fresh headline over a stale body, silently misleading every future session.
- **Session-scoped only.** Completed work graduates or moves to the evidence archive; history does not accumulate here.
- **Smallest tier by design.** If content needs to persist across sessions, it belongs a tier down.
- **Ownership.** Where multiple threads share one repository, name which thread owns these files; the other thread keeps its state in its own session or its own estate. (Incident-receipted in the lineage: two editable copies of working context become two divergent truths.)
- **Publication state is derived, never asserted.** Working context must not claim "pushed" or "awaiting push": a committed claim about a push cannot survive the push that publishes it, so the published copy is false the moment it matters. Derive remote state live from git (`git status -sb`, `git log @{u}..`) at restart. (Twice incident-receipted in the estate that produced this canon.)
