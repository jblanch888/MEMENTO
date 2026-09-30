# Active Knowledge

Project rules and reference material used across tasks: the project's governing documents and current principles. After the working context, the assistant checks here before making a decision that needs grounding.

## Typical contents (from the projects using Memento)

- **CHARTER.md**: what the work is for, its standing positions, and the changes of direction still open.
- **RESOURCE_ROUTING.md**: the routing rule, for choosing who or what does each part of the work (template in `framework/conventions/`).
- **ESTATE_SPINE.md**: the file metadata and naming conventions (template in `framework/conventions/`).
- **BACKLOG.md**: prioritised work, and the NOTE_FOR_LATER collection.
- **Principles and system-context files**: architecture principles and overviews of the domain.

## Disciplines

- **Compact.** Larger than the working context, with every file still readable in one pass. When a file grows too large to scan, propose its reusable lessons for institutional memory through CD #9, and shorten the file while preserving the rules and evidence the project still needs.
- **Governing documents carry the standard metadata**, including `governs:` and `last_verified:` fields, so staleness is visible and a governance map can be generated when a recorded need justifies building the tool.
- **The context-plunge pattern.** Where a system is complex enough that sessions after a compaction struggle with it, write a quick-context file for that area: the system's purpose in a sentence, the core architecture in a readable outline, and the key operations with concrete examples. One page here pays for itself at every restart.
