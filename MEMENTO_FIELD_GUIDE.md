# The MEMENTO Field Manual: A Detective's Guide to the Bizarre Mélange

## Warning Label

You'll spend months grinding through millions of tokens, grappling with an amnesiac genius, investigating failures like a hard-boiled detective, all to build the tools nobody else will make.

If that sounds terrible, close this guide now.

This isn't about making AI development easy. It's about making it possible for specific people with specific needs and a lot of persistence.

---

## Introduction: What This Actually Is

For the last three months, I've been deep in a bizarre mélange of software development. I'm not a hands-on coder, but my background is in software product development, and I've built three sophisticated tools that solve very specific problems (my problems!) without writing a single line of code.

It's been equal parts magic and shit show. Some days you build in hours what teams couldn't in weeks. Other days you're screaming at Claude Code for forgetting what it successfully did two minutes ago.

This guide won't make it easy. But if you have:
- A real problem that needs solving
- $150 to invest monthly for tool subs
- Mental fortitude
- Some software experience (not necessarily coding)

Then maybe you can navigate this bizarre mélange too.

---

## Part 1: Reality Check

![Don't trust him](docs/assets/Don't%20trust%20him.png)

### Who You Need to Be

**You're not going to be a "prompt engineer" or "AI whisperer."**

You're going to be a detective investigating crimes your AI partner commits. A foreman managing a brilliant worker with total amnesia. A QA manager catching catastrophic failures. All while maintaining discipline through a daily emotional rollercoaster.

Your actual job titles:
- **The Visionary**: Holding the strategic intent and vision of success
- **The Investigator**: Most sessions have forensic debugging
- **The Foreman**: Managing brilliant but unreliable labour  
- **The Director**: Orchestrating multiple AIs in different roles
- **The Janitor**: Cleaning up messes constantly

### Your Actual Partners

**Primary Worker**: Claude Code
- Can build anything you can clearly describe
- Forgets it all every 200k tokens
- Confidently wrong 30% of the time
- Not a lot of common sense

**Advisory Board**: Claude, Gemini, ChatGPT
- Review session logs for patterns
- Provide alternative perspectives
- Analyse what went wrong
- Suggest different approaches when Claude Code gets stuck

Yes, you'll be running multiple AIs. This isn't one tool - it's an orchestra of unruly musicians.

### The Three Types of Days

**Flow State Days - about quarter**
Everything clicks. You build in 12 hours what would take teams weeks. This is the drug that keeps you going.

**Grinding Days  - about half**
Nothing works right. Claude forgets successful patterns. You restart 5 times. Progress measured in inches.

**Investigation Days - about quarter**
You build nothing. You investigate why 40% of your data vanished. You document patterns so it doesn't happen tomorrow.

### What You Can Actually Build

**Perfect for:**
- Custom tools for your unique workflow (whether you're a consultant, a coach, or a club secretary)
- Niche solutions for problems only you (or your team) have
- Personal "prostheses" that capture and scale your expertise

While Memento hasn't yet been tested for building large-scale public applications, it has proven highly effective for creating sophisticated, reliable tools that solve specific problems. The goal is not to build the next Facebook, but to build the exact tool you need. The kind of tool you can't buy off-the-shelf and don't have the resources to commission.

---

## Part 2: The Bizarre Mélange

### What Makes This Bizarre

**My sessions have been a constant mix of contradictions:**
- Incredible development speed followed by complete, grinding stops.
- Sophisticated, working outputs that emerge from a series of idiotic AI mistakes.
- Clean, maintainable architecture emerging from a process that feels messy and unpredictable.
- Moments of raw frustration immediately followed by the calm execution of a disciplined protocol.

**Example from my actual logs:**
```
Me: "no you fucking asshole it is not fixed"
[30 seconds later]
Me: "just stop. pre-compact protocol." (a rare mid-session wipe)
```

The frustration is real. The discipline must survive it.

### The Hidden Prerequisites

**What I had that made this possible:**
- 20 years around software (QA, management, product, coaching)
- Intuition for when architecture "smells wrong"
- Patience from debugging complex systems
- Ability to recognise patterns without understanding code
- The resilience to persist through daily frustration and setbacks

If you don't have something similar, this might be even harder.

### The Real Economics

**Build Phase**: $100/month for Claude Max for all-day coding assistance
**Advisory Tools**: Google AI Studio (free at the time of writing), sometimes Opus, sometimes ChatGPT (another $50 or so)
**Total Investment**: $150
**Running Cost**: $0 (it's just code once built)

You're not subscribing to a service. You're renting tools to build your own solution.

---

## Part 3: The Framework

### Machine-First Design

**The Physics of Attention**

The tiers:
- **Working Context**: Current focus only (≤50 lines)
- **Active Knowledge**: Frequently needed (keep it svelte)
- **Institutional Memory**: Accumulated patterns (searchable)
- **Evidence Archive**: Historical record (can grow large)

### Token Investment Philosophy

You'll spend 40-60% of tokens on context, living documentation and resets. This isn't waste - it's the cost of keeping the AI grounded in your project's reality.

For every 100k tokens of productive work, I invest 100k in the foundation: loading the project's memory, setting the context, running the restart protocol at the beginning and the pre-compact protocol at the end of each session. A solid foundation isn't overhead; it's what makes the real work possible.

### The Daily Grind

**Context Resets**: 3-7 per day, a few minutes each
- Validate Pre-Compact: Quickly review the AI's proposals for knowledge capture. Approve if they are sound.
- Execute the Reset: Type /compact, wait, then use the "restart using protocol..." command.
- Perform the "Context Plunge": The AI is now rebooted, but it's not yet ready for complex work. Your first command should be to load the necessary operational context. This often includes having it read key files from your Active Knowledge tier, like your architectural principles or a system overview document.
- Back to Work: Once the AI has absorbed this richer context, you can resume productive work.

This becomes muscle memory. It's just a pit stop.

**Validation Discipline**: Never trust, always verify
- "Show me the database"
- "Prove that worked"
- "What actually got stored?"

Your paranoia is the project's immune system.

---

## Part 4: The Protocols

### Core Directives (Always Active)
- User validation is sovereign
- Respond to strategic pause signals
- No assumptions without evidence
- Commit after every validated change

### Playbook Activation
Different situations need different protocols:
- **Debugging**: Forensic investigation mode
- **Planning**: Systematic analysis before building
- **Documentation**: Capturing patterns as they emerge
- **Incremental**: Small validated steps forward

### The Pre-Compact Ritual
When your context window hits 10-5% remaining:
1. Trigger the pre-compact protocol
2. Claude proposes what to preserve
3. You validate the proposed edits
4. Knowledge graduates to appropriate tier
5. Trigger the /compact operation

This happens so often it becomes breathing.

---

## Part 5: Survival Patterns

The framework and protocols provide the structure. But day-to-day survival depends on the craft you develop. The following are the essential, hard-won patterns of work that will keep you on the rails and lead to a successful outcome.

### "Show Me the Receipts"
Never believe Claude's success claims. Demand evidence:
- Database queries showing actual data
- Browser console proving it works
- File system confirming changes
- Vector search showing indexing

Trust nothing without proof.

### The Righteous Path
When you find a bug, you face a choice:
- Fix this instance (fast)
- Fix the system that created it (right)

Choose the righteous path. Fix the factory, not just the product.

Progress with Memento doesn't always look the same. Depending on the task, you will shift between three distinct rhythms of work. Mastering all 3 is key to success.

#### **Rhythm 1: The Structured Build (for New Features)**

When you are building something new from scratch, the process is disciplined and follows a clear sequence:

1.  **Planning:** You start with the `PLANNING_PLAYBOOK`. You and the AI collaborate on a plan, defining the problem, the proposed solution, and the implementation slices.
2.  **Implementation:** You execute the plan one slice at a time. Each slice is a significant, logical unit of work.
3.  **Deep Validation:** You act as the "picky tester," rigorously testing the new functionality against your vision of success.
4.  **Commit:** Once a slice is validated, it's committed, providing a stable foundation for the next slice.

This is the rhythm for building. It's a deliberate, structured, and strategic process.

#### **Rhythm 2: The Micro-Transaction (for Refinement & Fixes)**

When you are polishing an existing feature or fixing a series of small bugs, the rhythm becomes much faster and more reactive:
1.  **Spot a tiny flaw:** A visual glitch, a small error, a piece of awkward wording.
2.  **AI proposes a minimal fix.**
3.  **You provide a quick, one-word validation:** "yep," "good," "proceed."
4.  **AI commits immediately.**
5.  **Move instantly to the next flaw.**

This is the rhythm for refinement. It's a rapid-fire sequence of tiny, validated changes that allows you to quickly converge on a high-quality final product.

#### **Rhythm 3: The Forensic Investigation (When You Are Stuck or Broken)**

This is the third, and most critical, rhythm. It's the mode you enter when progress has completely stalled, when a critical bug appears, or when the AI is stuck in a loop of failure. This is not about building; it is about pure, disciplined problem-solving.

1.  **Activate the `DEBUGGING_PLAYBOOK`:** The first step is to formally switch modes. All forward progress on features stops.
2.  **Adopt the Forensic Stance:** You are no longer a builder; you are a detective. Your only job is to find the truth.
3.  **Demand the "Paper Trail":** You must relentlessly enforce the "Show Me the Receipts" mandate. Trust nothing. Demand logs, database queries, and direct evidence.
4.  **Embrace the "Go Slow to Go Fast" Principle:** The path out of a deep hole is not through fast, speculative fixes. It is through slow, methodical, evidence-based hypothesis testing.
5.  **Be Prepared for a "Nuke and Pave":** Sometimes, the system will enter a state of catastrophic failure (e.g., a corrupted database). The fastest path to recovery is often not to debug, but to confidently delete the broken state and rebuild it from scratch, trusting in the repeatability of your Memento-driven process.

This is the rhythm of resilience. It is often the most frustrating part of the work, but it is also where the most valuable learning occurs and where the integrity of your system is forged.

### Managing Multi-AI Orchestra

**Claude Code**: Your builder
- Give clear direction
- Verify everything
- Maintain discipline

**Gemini Pro**: Your analyst
- Feed session logs (80k lines of log chunks)
- Get pattern analysis
- Find what you're missing

**Opus/GPT**: Your advisors
- Strategic questions
- Alternative approaches
- Sanity checks
- Getting unstuck

You're not using one AI. You're conducting an AI organisation.

---

## Part 6: The Reality of Progress

### What 3 Months Looks Like

**Month 1**: Learning the pain
- First project will be brittle
- You'll fight the tools constantly
- You'll want to quit daily
- You'll discover what doesn't work

**Month 2**: Finding the rhythm
- Resets become routine
- Patterns start emerging
- You build your second thing
- The framework crystallises

**Month 3**: Productive chaos
- 3-7 resets feel normal
- You know Claude's failure modes
- You can build what you imagine
- The bizarre becomes familiar

### Knowledge Archive Evolution

Your knowledge archive starts empty. After 2 hard weeks on a project:
- 20+ major patterns documented
- 20+ anti-patterns identified
- Forensic procedures developed
- Domain-specific wisdom captured

This accumulation IS the value. Each project gets smarter as you find wisdom that is transferable between projects and infuse it into the next project's Memento.

### The Fortitude Filter

**Most will quit because:**
- Daily frustration is too high
- Progress feels too slow
- Resets feel like failure
- Claude Code's stupidity is maddening

**You'll survive if you:**
- Have real problems worth solving
- Can persist through the emotional rollercoaster
- Follow protocols especially when frustrated or exhausted
- Measure success by what gets built

---

## Part 7: Your First Mission

### Your First Project

**Pick something:**
- You personally need
- Nobody else will build
- You understand as a domain expert
- Can be "good enough"

**Expect:**
- A steep learing curve
- You'll restart from scratch at least once
- If you have the vision, the technical implementation will emerge from the process
- It willeventually work but probably be brittle

### Building Your Practice

**Project 1**: Learn what doesn't work (painful but educational)
**Project 2**: Apply lessons, develop patterns
**Project 3**: Hit your stride, framework solidifies

Each project contributes to your institutional memory. The pain becomes patterns. The patterns become power.

### The Maintenance Reality

Every few days, spend a session on maintaining your project's Memento:
- Consolidate duplicate patterns
- Prune outdated knowledge
- Fix broken references
- Keep working context tiny

This isn't optional. Without maintenance, the system actually becomes a drag.

---

## Conclusion: The Bottom Line

Memento is a framework for navigating the bizarre mélange of AI development. It's not easy. It's often infuriating.

**But it works.**
For $150 a month and a lot of persistence, you probably won't be building the next mass-market app. You will be building something far more valuable: a **precision instrument.** A sophisticated, custom-built tool designed to solve *your* specific problem with a clarity and power that off-the-shelf software won't match.

The process will make you a detective investigating AI crimes. You'll grapple with your AI partner daily. You'll restart constantly. You'll consume millions of tokens.

**But you'll ship.** And for problems that have no other solution, that's everything.

---

## The Promise

I'm not selling magic. I'm documenting a process that somehow produces results.

If you:
- Have problems worth solving
- Can handle daily frustration
- Have the ability to detach from the immediate frustration and rely on the process
- Can orchestrate multiple AIs
- Have software intuition (even without coding)

Then you can build what you need.

It won't be easy. But it will be possible.

And sometimes, possible is enough.