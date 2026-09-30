# Killed Mechanisms

Memento publishes the controls it removed alongside the ones it still uses. The rule of its current stage, *falsifiable governance*, requires it: before relying on a control, write down the result that would show it is failing its purpose and when you will check; when that result appears, retire the control and record what it taught. This page is that record. It shows the framework's claims about its own controls being tested, and each removal left a lesson worth keeping.

Each entry says what the control was, how it ended (removed on evidence, held and then replaced, or never built), and what that taught. Dates come from the projects' own records; projects are described without their names, by policy.

## 1. The commit-approval prompt

A hook asked the human to approve every commit. Over thirty days it asked 154 times and was approved all 154 times: it never blocked a commit. **Removed July 2026.** The useful protection had been the automated checks that ran before each commit all along. *Lesson: measure how often an approval prompt is refused. One that is approved every time, as this one was, is worth questioning: it may be adding friction and deciding nothing.*

## 2. The reminder that never reached the assistant

*(Recorded in the projects as the stranded charter injector.)* A tool was meant to add a set of instructions for how the assistant must work to each session. It ran in test mode (shadow mode), logging what it would have done; a setting was needed to switch on real delivery, and that setting was never switched on, anywhere, at any time. Over its whole life the tool logged roughly 450 test runs and delivered nothing. Nobody noticed, because nothing was checking that it delivered. A deep health audit found it, and it was **removed July 2026.** *Lesson: silence is not health. Record whether each control ran and carried out its intended action, every time, including runs that found no problem; a control that has stopped working otherwise looks exactly like one with nothing to report.*

## 3. The restart checklist the assistant marked itself

*(Recorded as the self-asserted restart protocol.)* The first restart protocol was carefully designed, in three layers. At the start of a session the assistant ticked a checklist, quoting evidence for each tick; quoted rules back to show it had loaded them; and wrote out, in its own words, the mission, the constraints, the principles that mattered most and its next safe action with the reason. It was **retired in June 2026** on firm evidence. The assistant ticking the boxes was the same assistant making the claims, so the checklist gave no independent assurance. A root-cause analysis then found an assistant restating a rule in the same message in which it broke that rule: reading a rule aloud did not stop it being broken. A short experiment reached the same verdict on the written summary: a paraphrase cost the assistant as little as a ticked box. The project's own review estimated the protocol at about three-quarters show and one-quarter useful work.

The useful quarter survived: checking the notes against the actual project. It is now automated as a comparison of the recorded claims against the files and current git state, with each mismatch resolved one by one; judging what the situation needs stays with the assistant. *Lesson: when the assistant grades its own reflection, the reflection proves little. Keep the checks a machine can run against the real project, keep the assistant's judgement, and drop having it repeat the rules back.*

## 4. The routing-enforcement hook

A hook tried to enforce the routing rule (choosing who or what does each part of the work) by counting the main assistant's tool calls at the end of each turn. The rule concerns whether the right worker handles each part, and a count of calls cannot show that. The hook fired without enforcing anything, and it could not see half the failures it was built to catch. **Removed in 2026, having done more harm than good.** The routing rule remains a discipline the assistant follows on its own judgement. *Lesson: rules that depend on judgement are hard to automate. A misleading measure is worse than none, and some rules have to stay as written guidance until a proposed automation has been checked against its recorded failure criterion.*

**Added September 2026, so this entry is not read as a ban on every routing check:** what was removed here measured *fit*, whether the right worker was chosen. A later control, the spawn-tier pin check, requires a model tier to be named before a sub-agent can launch, and makes no judgement about fit. It passed adversarial review and has a failure criterion of its own. For a while this entry was read across the projects as "no hooks on routing", and one project went three months relying on written guidance alone for the tier rule while another project's logs recorded the cost. The allocation test tells the two cases apart: ask whether the rule needs judgement or can be detected mechanically. Run it before extending a removal to a new case by analogy.

## 5. The working-context edit check

A hook checked that each edit to the working-context files was a full rewrite that removed stale content. Deciding whether content is stale needs an understanding of the content that a hook does not have, so **this check was removed in June 2026**; the hook's other checks, which a machine can make, stayed. The rule itself matters (a real incident, with fresh headlines left above stale content, created it) and continues as a core directive. *Lesson: keep the rule as written guidance, and stop presenting it as automatically enforced.*

## 6. The spend governor

A daily spending limit on model use, designed and then deliberately left unbuilt. Before it was wired in, a stronger design arrived: items that fail are parked in an error state for a person to decide what happens next, and are never retried automatically. That removed the way spending could run away in the first place. **Held, then replaced, July 2026.** *Lesson: where you can, remove the path to a failure before building something to measure it. Sometimes the best control is the one you decide not to build.*

## 7. The refusal carried between projects

An example of the projects learning from each other: a newly started project's backlog records a routing-enforcement hook as deliberately not imported, because another project had already shown it did not work (§4). The removal happened once, and at least one other project took its lesson without repeating the experiment. *Lesson: the record of a removal can travel between projects, and honouring another project's removal costs less than repeating the experiment.* *Added September 2026: the record needs to carry its reason with it, or it gets applied too widely. The refusal above was right for the fit-measuring hook, and it was later read as covering a pin check it never tested (§4). Import a removal together with the allocation test that explains it.*

## 8. The settings that configured nothing

*(Recorded as the orphaned parameters.)* A detailed audit of one project's core directives found two problems. A token-budget trigger was set to control an automation that had been lost in a migration long before, so the setting did nothing. And a note on where a rule came from cited a protocol document that did not exist. Both were **removed in June 2026**, and the directive was relabelled with an honest status it still carries: "value unverified on the current agent generation". *Lesson: directives decay like code. Audit them in detail, and prefer an honest UNVERIFIED label to a confident reference to something that does not exist.*

---

## Running your own removals

1. **Write down the failure criterion when you install a control.** State the result that would show it is failing its purpose, and when you will check.
2. **Record every run, and check that each expected run happened.** Without that record, a control that has stopped cannot be told apart from one with nothing to report.
3. **Check on the date you set.** The review date in your record of controls (the validation ledger) arrives whether or not you suspect a problem.
4. **Record the removal.** The lesson is what lasts, so write it down with the reason the control was removed.

This repository's own Memento files work under the same rule. Their first automated control, a check before compaction, was installed labelled "enforcement unverified". It was observed running at its first real compaction, and its blocking behaviour stays marked unverified in the repository's register of controls until an incident or a deliberate test shows it working, because the rule applies most of all to the people writing it down.
