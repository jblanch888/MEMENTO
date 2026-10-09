# Skills

Procedures packaged for assistants that load them when the task fits. Claude Code and Codex both support skills. Each skill here is a folder with a `SKILL.md` whose frontmatter has a `name` and a `description`; the description says when the skill applies.

| Skill | What it brings in |
|---|---|
| [`memento-planning/`](memento-planning/SKILL.md) | The planning playbook, when an undertaking may need a saved plan |

**One source.** A skill here points to its playbook and repeats only the trigger and the fixed exemption phrase, so the procedure keeps one home. When the playbook changes, check the skill against it. A project without skills support uses the playbook alone.

**Installing.** Copy the skill folder to where your assistant reads skills: `.claude/skills/` in the repository for Claude Code, and Codex's skills folder for Codex (`~/.codex/skills/` at the time of writing). Fit the paths in the skill to where your project installs the playbook.

**Status: on trial from 2026-10-09.** Whether the skill loads reliably when a plan is due, and whether Codex loads it as Claude Code does, is being measured against criteria set in advance. The trial's plan is in this repository's own Memento files (`memento/`). Its result decides whether the framework recommends delivering procedures as skills.
