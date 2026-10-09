#!/usr/bin/env python3
"""Counting for the planning skill trial (plan-planning-skill-trial-2026-10-09).

baseline DIR BEFORE [N]: for the N most recent plan-*.md files in DIR dated before BEFORE (the date in the filename,
YYYY-MM-DD), which of the eight required plan sections (PLANNING_PLAYBOOK §2) appear as headings, and whether a counts
line is present. N omitted means every plan before the date. Prints one row per plan and a summary.

Matching is deliberately loose and stays the same before and after the trial: any heading line counts, the title
included, and a heading containing a section's key word credits that section (for example any "slice" heading credits
scope). A section written as bold prose counts as absent. The counts column reads yes or no for plans dated after
2026-10-06, when counts lines began in this estate, and - for earlier plans or estates without the practice.
"""
import re
import sys
from pathlib import Path

SECTIONS = [
    ("pattern", r"pattern search"),
    ("purpose", r"problem|purpose"),
    ("posture", r"posture|predictab"),
    ("scope", r"scope|slice"),
    ("risks", r"risk"),
    ("verify", r"verif"),
    ("effort", r"effort|sizing"),
    ("approval", r"approval"),
]
DATE = re.compile(r"(\d{4}-\d{2}-\d{2})\.md$")
COUNTS = re.compile(r"^(Review|Slice) counts \(", re.M)


def sections(text: str) -> dict[str, bool]:
    heads = [l.lower() for l in text.splitlines() if l.startswith("#")]
    return {k: any(re.search(rx, h) for h in heads) for k, rx in SECTIONS}


def baseline(d: Path, before: str, n: int | None) -> None:
    plans = sorted((p for p in d.glob("plan-*.md") if DATE.search(p.name) and DATE.search(p.name).group(1) < before),
                   key=lambda p: (DATE.search(p.name).group(1), p.name))
    if n:
        plans = plans[-n:]
    full = 0
    print("plan\t" + "\t".join(k for k, _ in SECTIONS) + "\tcounts")
    for p in plans:
        text = p.read_text(errors="replace")
        s = sections(text)
        full += all(s.values())
        dated = DATE.search(p.name).group(1)
        counts = "yes" if COUNTS.search(text) else ("no" if dated > "2026-10-06" else "-")
        print(p.name + "\t" + "\t".join("1" if v else "0" for v in s.values()) + "\t" + counts)
    print(f"summary: {len(plans)} plans, {full} with all eight sections as headings")


if __name__ == "__main__":
    if len(sys.argv) >= 4 and sys.argv[1] == "baseline":
        baseline(Path(sys.argv[2]), sys.argv[3], int(sys.argv[4]) if len(sys.argv) > 4 else None)
    else:
        sys.exit(__doc__)
