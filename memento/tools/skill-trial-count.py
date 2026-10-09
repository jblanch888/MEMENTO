#!/usr/bin/env python3
"""Counting for the planning skill trial (plan-planning-skill-trial-2026-10-09).

baseline DIR BEFORE [N]: for the N most recent plan-*.md files in DIR dated before BEFORE (the date in the filename,
YYYY-MM-DD), which of the eight required plan sections (PLANNING_PLAYBOOK §2) appear as headings, and whether a counts
line is present. N omitted means every plan before the date. Prints one row per plan and a summary.

Matching is deliberately loose and stays the same before and after the trial: any heading line counts, the title
included, and a heading containing a section's key word credits that section (for example any "slice" heading credits
scope). A section written as bold prose counts as absent. The counts column reads yes or no for plans dated after
2026-10-06, when counts lines began in this estate, and - for earlier plans or estates without the practice.

trial TRANSCRIPTS_DIR REPO SINCE: reads the Claude Code transcripts (*.jsonl, subagents included) of one project after
SINCE (ISO time, the install commit) and reports, per plan file first written in that time, in time order:
  fired     the memento-planning skill loaded by the assistant (Skill tool) in that session before the first write;
  invoked   the User typed /memento-planning in that session before the first write (reported apart from fired);
  read      the planning playbook was read in that session before the first write;
  sections  the eight required sections present as headings in the plan file as it stands in REPO now.
Then: exemption phrases spoken, and loads with no plan file first written later in the same session and no exemption
phrase after them (false firing). Only facts found in the transcripts are reported.
"""
import json
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


SKILL = "memento-planning"
PHRASE = "No plan: small, well-specified, reversible"


def _events(tdir: Path, since: str):
    """(time, session, kind, detail) from every transcript line after SINCE, in time order."""
    from datetime import datetime
    cut = datetime.fromisoformat(since).timestamp()
    out = []
    for f in tdir.rglob("*.jsonl"):
        for line in open(f, errors="replace"):
            if SKILL not in line and "plan-" not in line and "lanning" not in line and PHRASE not in line:
                continue
            try:
                d = json.loads(line)
            except ValueError:
                continue
            ts = d.get("timestamp")
            if not ts:
                continue
            t = datetime.fromisoformat(ts.replace("Z", "+00:00")).timestamp()
            if t < cut:
                continue
            sid = d.get("sessionId") or f.stem
            m = d.get("message") if isinstance(d.get("message"), dict) else {}
            cont = m.get("content")
            if d.get("type") == "user" and isinstance(cont, str) and f"<command-name>/{SKILL}</command-name>" in cont:
                out.append((t, sid, "invoked", ""))
            if not isinstance(cont, list):
                continue
            for c in cont:
                if not isinstance(c, dict):
                    continue
                if c.get("type") == "text" and d.get("type") == "assistant" and PHRASE in c.get("text", ""):
                    out.append((t, sid, "phrase", ""))
                if c.get("type") != "tool_use":
                    continue
                n, i = c.get("name"), c.get("input") or {}
                fp = str(i.get("file_path", ""))
                if n == "Skill" and (i.get("skill") or "").split(":")[-1] == SKILL:
                    out.append((t, sid, "fired", ""))
                elif n == "Read" and re.search(r"planning[-_]playbook\.md$", fp, re.I):
                    out.append((t, sid, "read", ""))
                elif n == "Write" and re.search(r"evidence-archive/plan-[^/]+\.md$", fp):
                    out.append((t, sid, "write", fp))
    return sorted(out)


def trial(tdir: Path, repo: Path, since: str) -> None:
    ev = _events(tdir, since)
    seen, rows = set(), []
    for t, sid, kind, fp in ev:
        if kind != "write" or fp in seen:
            continue
        seen.add(fp)
        before = [k for (t2, s2, k, _) in ev if s2 == sid and t2 <= t]
        f = Path(fp) if Path(fp).is_absolute() else repo / fp
        sec = sections(f.read_text(errors="replace")) if f.exists() else None
        rows.append((Path(fp).name, "fired" in before, "invoked" in before, "read" in before,
                     "-" if sec is None else sum(sec.values())))
    print("plan\tfired\tinvoked\tread\tsections(of 8)")
    for r in rows:
        print("\t".join(str(x) for x in r))
    phrases = sum(1 for e in ev if e[2] == "phrase")
    false = 0
    for t, sid, kind, _ in ev:
        if kind != "fired":
            continue
        later = [k for (t2, s2, k, _) in ev if s2 == sid and t2 > t]
        false += not ("write" in later or "phrase" in later)
    print(f"summary: {len(rows)} plans first written; fired {sum(r[1] for r in rows)}; invoked {sum(r[2] for r in rows)}; "
          f"exemption phrases {phrases}; loads with no plan or phrase after them {false}")


if __name__ == "__main__":
    if len(sys.argv) >= 4 and sys.argv[1] == "baseline":
        baseline(Path(sys.argv[2]), sys.argv[3], int(sys.argv[4]) if len(sys.argv) > 4 else None)
    elif len(sys.argv) == 5 and sys.argv[1] == "trial":
        trial(Path(sys.argv[2]), Path(sys.argv[3]), sys.argv[4])
    else:
        sys.exit(__doc__)
