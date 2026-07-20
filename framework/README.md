# The framework

This directory is what an adopter installs: the operational-protocol arm (directives and playbooks) plus the conventions that keep the memory-prosthesis arm navigable. The memory-prosthesis tier templates themselves land in `memory-prosthesis/` in a later slice, per the assembly note in the root README.

**A note on paths:** relative paths inside these documents (`../../memory-prosthesis/…`, `../CORE_DIRECTIVES.md`) are written for the documents' installed locations in an estate (`memento/protocols/`, `memento/protocols/playbooks/`), not for their position in this directory. Install first, then follow the links.

Everything here is a **2026 transplant**: a field-hardened form imported from the framework's live deployments, carrying a provenance note that records the source estate (named generically), the source date, and the fitting changes made on import. These are the forms that survived a year of field evolution and the lineage's kill discipline. The 2025 canon documents that did not survive it were ruled vestiges and live only in the era exhibit at [`archive/canon-2025/`](../archive/canon-2025/).

## Fitting

Every deployment in the lineage fitted these documents to its host: renamed the referents, dropped inapplicable sections, and recorded the changes. The provenance notes on these files are worked examples of that practice. Copy the form, fit it to your product, and write your own fitting note; the note is what makes the next fitting auditable.

On install, files take their conventional estate names and locations: `CORE_DIRECTIVES_TEMPLATE.md` becomes `memento/protocols/CORE_DIRECTIVES.md`, playbooks go to `memento/protocols/playbooks/`, and the conventions files usually live in `memento/memory-prosthesis/active-knowledge/`. The documents' internal cross-references assume those installed names.

## Layout

| Path | Contents |
|---|---|
| [`directives/`](directives/) | The 14-form core-directive template |
| [`playbooks/`](playbooks/) | Planning, git operations, incremental execution, knowledge gardening, documentation |
| [`conventions/`](conventions/) | The routing law and the estate spine (frontmatter, naming, derived indexes) |
| `memory-prosthesis/` | Tier templates (later slice) |
