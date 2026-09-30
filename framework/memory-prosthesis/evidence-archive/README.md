# Evidence Archive

Plans, findings, design decisions and handovers, with their supporting evidence; in the projects observed, the busiest tier. Each record is a dated account of how a substantial piece of work was done, so that a claim made anywhere in the project's Memento files can cite its evidence.

## Conventions

- **Naming:** `{type}-{topic}-YYYY-MM-DD.md`, lowercase. Types proven in use: `plan`, `finding`, `design`, `discovery`, `reference`, `assessment`, `handover`, `research`. The list of types grows with use.
- **Standard metadata (frontmatter)** on every record (`framework/conventions/ESTATE_SPINE.md`), with `status:` tracking the record's life (awaiting-approval / approved / superseded / historical). The `status:` field is the one part of a saved record kept current: update it when the record's status changes, so readers can trust it; the body, including any `OPEN` markers, speaks as at the date it was saved.
- **A record's body is kept as written once saved** (the frozen-memo convention, DOCUMENTATION_PLAYBOOK §8). Lasting insights move up to institutional memory, and the record itself stays as written while understanding changes. New sessions write new records that refer to earlier ones.
- **The one permitted addition to the body:** a dated ERRATUM or AMENDMENT note, added when a claim is later disproved or overruled, so a future reader cannot inherit the error.
- **Handovers:** a substantial session that ends at a compaction saves a handover record naming what to read to resume, so the next session starts from evidence.

## What belongs here

Completed plans with their approval state; findings with their evidence; design decisions with why the alternatives were rejected; failed approaches with why they failed; handovers. Storage is unlimited, and pruning history is banned (CD #4): mark a superseded record with a banner and keep it.

## Tools to add on evidence

A generated index (`INDEX.generated.md`, built from each record's metadata) has proved its worth once the archive grows too big to scan by hand. The trigger for building it, and the build itself, are decisions each project records; neither is a default.
