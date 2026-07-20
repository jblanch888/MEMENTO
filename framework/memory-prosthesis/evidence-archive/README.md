# Evidence Archive

The receipted record, and in the observed deployments the busiest tier: dated memos banking how every substantive piece of work was done, so that claims made anywhere in the estate can cite their evidence.

## Conventions

- **Naming:** `{type}-{topic}-YYYY-MM-DD.md`, lowercase. Field-proven types: `plan`, `finding`, `design`, `discovery`, `reference`, `assessment`, `handover`, `research`. The type vocabulary grows with use.
- **Spine frontmatter** on every memo (`framework/conventions/ESTATE_SPINE.md`), with `status:` tracking the memo's life (awaiting-approval / approved / superseded / historical). The `status:` field is the one LIVE element of a banked memo: maintain it at life events so readers can trust it as current; the body, including any `OPEN` markers, speaks as at banking.
- **Memos are frozen once banked** (DOCUMENTATION_PLAYBOOK §8). Durable insights graduate upward; the memo itself is never rewritten as understanding matures. New sessions write new memos that reference earlier ones.
- **The one permitted touch:** a dated ERRATUM or AMENDMENT note added when a claim is later disproven or overruled, so the error cannot be re-inherited by a future reader.
- **Handovers:** a session of substance that ends at a compaction boundary banks a handover memo naming its resume chain, so the next session begins from receipts.

## What belongs here

Completed plans with their approval state; findings with their receipts; design decisions with the options that lost; failed approaches with why they failed; handovers. Storage is unlimited; pruning history is banned (CD #4): supersede with a banner, never delete.

## Earned tooling

A generated index (`INDEX.generated.md` built from memo frontmatter) is the proven shape once the archive outgrows manual scanning; the trigger and the build are registered estate decisions, not defaults.
