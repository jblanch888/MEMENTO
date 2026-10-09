---
description: plan to trial the planning playbook delivered as a skill, alongside the playbook, measured by whether the skill loads when a plan is due and whether the plans written under it keep the spine; canon template, this estate and Rooms (on the User's ruling there), Codex smoke-tested
type: plan
date: 2026-10-09
genre: build/change (3A), with an investigation annex (3B) for the measures
size: M (four slices, the trial itself spans weeks)
status: APPROVED 2026-10-09 (the User: "all ok", covering the plan, the criteria and asking Rooms); slices 1 and 2 done, Codex smoke test pending; slice 3 counting
related: [plan-reshape-memento-2026-10-06, decision-bitter-lesson-sort-2026-10-06, plan-memento-ablation-trial-2026-10-06, PLANNING_PLAYBOOK, KILLED_MECHANISMS]
---

# Plan: the planning skill trial

## Origin and authority

The reshape plan left one option open for the User's ruling: "a trial of the planning playbook packaged as a skill (alongside the playbook, nothing removed)". On 2026-10-09 the User ruled: "go with your lean, start the skills trial".

## Pattern Search Results

- **The User's guidance (2026-10-07).** What remains of the playbooks has three homes:
  - standards and conventions;
  - skills, for procedures used when the task fits;
  - directives or hooks.

  Memento ought to work with Codex as well as Claude Code. The canon describes procedures in neutral terms, with a binding for each agent.
- **The canon already names skills** (`framework/playbooks/README.md`, § Skills). The playbook is the description that works with any assistant, and a skill is one way to deliver it. CD #1 brings in a playbook or skill when the work calls for one.
- **Skills already in use:**
  - **Rooms** delivers gardening as a project skill (`.claude/skills/rooms-gardening/SKILL.md`, with Memento frontmatter added to the skill format), and three Memento procedures (evidence-first debugging, a hygiene check, a test-intent gate) as user-level skills.
  - **Codex** has the same three as user-level skills under `~/.codex/skills/`. Both agents read a `SKILL.md` with `name` and `description` frontmatter.
- **Evidence is available.**
  - **Rooms:** more than fifty saved plans, with new ones most days. Its transcripts record each skill load, so whether the skill loads can be counted from them.
  - **This estate:** 13 plans. That is too few for evidence on its own.
- **The ablation pilot (2026-10-06).** The arm without the playbook did no better than the arm without Memento. The playbook's own effect was unresolved. That bears on what this trial can and cannot show (Risks).
- **Read counts understate habitual use** (knowledge archive). So the playbook's read count alone is no measure of whether planning happens.

## Problem / purpose

**The question.** When the planning procedure is delivered as a skill, does it reach the assistant reliably at the moment a plan is due? And are the plans written under it at least as complete as before?

**Why it matters.** The answer decides how the canon recommends delivering procedures, as playbooks read on cue or as skills loaded on need. It also tests the neutral, two-agent binding the User asked for.

**Why now.** The reshape just closed, and Rooms is writing plans most days.

## Posture

Adaptive. Slices 1 and 2 are predictive: build and install. Slice 3 is the trial, with one feedback point at its interim count. Slice 4 is the verdict.

## Scope and slices

**Slice 1: the skill and the baseline.**
- **The canon skill** is a template at `framework/skills/memento-planning/SKILL.md`.
  - **Frontmatter:** `name` and `description` only, so both agents read it. The description names the trigger properties: large, long-horizon, many-stepped, consequential.
  - **Body:** short. Read the project's installed `PLANNING_PLAYBOOK.md` and follow it, plus the spine as a checklist and the fixed exemption phrase.
  - **Single source.** The playbook stays the one source, and the skill points to it, so the two cannot drift apart.
  - **Docs:** a README note for `framework/skills/`, and the playbooks README's § Skills points to it.
- **The baseline** is counted by script from the 20 most recent plans in Rooms and the 13 in this estate:
  - spine sections present (§2 items 1 to 8);
  - counts lines present, where the record is dated after 2026-10-06.
- **Review:** one independent read-only review of the skill text.

**Slice 2: install.**
- **This estate:** `.claude/skills/memento-planning/SKILL.md`, the canon skill fitted with this estate's playbook path. I install it.
- **Rooms:** the same, fitted to Rooms. It is installed by rooms/dev on the User's ruling in Rooms' session (one message from me with the file and the measures). The User's word there decides whether Rooms takes part.
- **Codex:** one smoke test. Install the skill under `~/.codex/skills/memento-planning/`, start a Codex session in this repository, and ask for a plan-sized piece of work. Record whether the skill is listed and loads. The User runs this test, since it needs his Codex login. It is a single check; Codex is not measured further.

**Slice 3: the trial.** It runs until 8 plan-triggering undertakings across the two estates, or until 2027-01-09, whichever comes first.
- **Measured per undertaking, by script, from transcripts and plan files:**
  - **Fired:** the skill loaded before the plan file was first written.
  - **Read:** the playbook was read in that session (from transcripts).
  - **Spine:** the spine sections present in the plan.
  - **Exemptions:** the fixed exemption phrase, where no plan was written.
  - **False firing:** the skill loaded where no plan followed and no exemption was spoken.
- **Interim count at 4 undertakings:** shown to the User as a feedback point.
- **Each slice record ends with its counts line.**

**Slice 4: the verdict**, a decision record for the User's ruling, against the criteria below.

**Consciously out of scope:**
- any other playbook as a skill (gardening is already one in Rooms);
- removing or slimming the playbook;
- Proportion, cartographer and the writing estate (dormant);
- measuring Codex beyond the smoke test;
- the ablation trial.

## Pre-registered criteria (set before any data)

**The skill succeeds** if both hold:
- it fires in at least 6 of 8 plan-triggering undertakings;
- the share of plans with the full spine is no lower than the baseline's share.

Then the canon recommends the skill as the delivery for planning, where the agent supports skills. The playbook stays as the description that works with any assistant.

**The skill fails** if any of these hold:
- it fires in 4 or fewer of 8;
- spine completeness falls below the baseline by more than one plan in eight;
- it fires falsely more than twice.

Then it is retired, with the lesson recorded in `story/KILLED_MECHANISMS.md` as a removed control, and the playbook alone stays.

**Between the two** (5 of 8, or a split result): extend to 16 undertakings, once, then rule.

**If fewer than 8 undertakings occur by 2027-01-09:** the User rules on what there is, and the record states the small number.

## Risks

- **Playbook reading is the habit already.** In Rooms the habit of reading the playbook can mask the skill: a plan is written well whether or not the skill loads. That is why the main measure is "Fired", and spine completeness is only a guard against harm.
- **A small number, before and after.** Eight undertakings measure how reliably the skill loads, and the verdict claims only that. A difference in plan quality would need far more undertakings; the ablation pilot is the reminder.
- **The model plans well unaided.** Firing may matter less than it seems. The trial cannot separate that out, and the verdict says so.
- **Codex skill locations or format differ from Claude Code's.** The smoke test exists to find that. A failure there is recorded, and the trial goes on in Claude Code.
- **Rooms declines.** Then the trial runs in this estate alone, the target becomes 5 undertakings by the same date, and the record says the evidence is thin.
- **Two copies drift.** The thin skill points to the playbook, so the playbook's content has one home.
- **Context cost.** Every session lists the skill's description, which costs a line or two. That is accepted.
- **Reversibility.** Easy: removing the skill files undoes slices 1 and 2. Retiring it from the canon is a commit with its record.

## Verification discipline

| Slice | Witness |
|---|---|
| 1 | independent review record with counts line; baseline table produced by script, numbers kept in the plan record; pre-commit sweep clean |
| 2 | the skill appears in a fresh Claude Code session's skill list in this estate; rooms/dev's confirmation (if the User rules yes); the Codex smoke test result as recorded by the User |
| 3 | per-undertaking rows produced by the counting script from transcripts, never by recollection; interim shown to the User |
| 4 | decision record with the pre-registered criteria applied as written; the User's ruling |

## Estimated Effort

M overall. Slices 1 and 2 are S. Slice 3 is small, recurring counting work over weeks. Slice 4 is S.

## The User's approval gate

**Rulings sought:**
1. this plan as a whole;
2. the pre-registered criteria;
3. whether to ask Rooms to take part. My lean is yes; Rooms is where the evidence is.

Awaiting user approval of this plan before detailed design or implementation.

## Implementation record

### Slice 1 (2026-10-09)

**What was written:**
- **The canon skill:** `framework/skills/memento-planning/SKILL.md`. After review r1 it is thinner: the trigger in the playbook's own four property names, the fixed exemption phrase, and a pointer to the playbook for everything else. It holds no rule of its own.
- **Its README:** `framework/skills/README.md`, with pointers from `framework/README.md` and `framework/playbooks/README.md`.
- **The counting script:** `memento/tools/skill-trial-count.py`, listed in `memento/tools/README.md`.

**The baseline, frozen 2026-10-09:**
- **The rule:** plans dated before 2026-10-09, with every one of the eight required sections present as a heading.
- **This estate:** 6 of 12.
- **Rooms:** about three in ten of its last 20.
- **Together:** 12 of 32, three in eight. This share is the comparator for the "no lower than the baseline" criterion.
- **The rows:** kept privately at `~/.memento/skill-trial/baseline-2026-10-09.tsv`, SHA-256 prefix `3c9ba85044651e4b`.

Slice counts (2026-10-09, author claude-opus-5-5, scout -): new controls 0 · faults by suite or mutants - · defects in shadow - · unsanctioned scope changes 0 · scout reports 0 · scout reports corrected 0

### Review record (r1, 2026-10-09, smart tier, read-only): NEEDS-CHANGES; every finding accepted

**Material findings, fixed:**
1. The skill's checklist carried this estate's counts-line clause into a canon template. The clause is removed, and the checklist with it.
2. The trigger was reworded: "complicated" was dropped, "or" became "and", and the examples came from the estate. It now uses the playbook's four property names.
3. The body referred to properties "above" that only the frontmatter listed. The body now lists them.
4. The README claimed the skill and playbook "cannot drift apart". It now says the skill repeats only the trigger and phrase, and is checked when the playbook changes.

**Also fixed:**
- **The baseline:** it had no cut-off and counted plans dated after the trial began. A cut-off is added.
- **Unproven claims hedged:** the README stated that Codex reads the format and that the skill loads at the right moment. Both are now marked as on trial.
- **Path:** an estate-only path given to adopters, now generic.
- **The script's matching rule** is documented, and the script is listed in the tools README.
- **Rooms usage figures** in this plan are given as shapes.

Review counts (r1, 2026-10-09, author claude-opus-5-5, reviewer claude-sonnet-5-5): material findings 4 · accepted 9 · refuted 0 · unsupported claims 3 · writing-rule breaches 0

### Slice 2 (2026-10-09)

- **This estate:** installed at `.claude/skills/memento-planning/SKILL.md` (961a97a). It is the canon template with the path slot removed.
- **Rooms:** the User ruled yes in Rooms' session. rooms/dev installed the skill verbatim (Rooms a0af26c, pushed), with Rooms' playbook path, and confirmed it appears in that session's skill list.
  - **Checked read-only here:** one file, identical to this estate's copy apart from the path.
  - **The trial is not mentioned** in Rooms' working context or prompts.
- **Codex smoke test:** with the User. He installs the skill under `~/.codex/skills/` and gives Codex one plan-sized request in this repository.
- **The trial counts from 2026-10-09.**

Slice counts (2026-10-09, author claude-opus-5-5, scout -): new controls 0 · faults by suite or mutants - · defects in shadow - · unsanctioned scope changes 0 · scout reports 0 · scout reports corrected 0
