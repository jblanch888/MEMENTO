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
  sections  the eight required sections present as headings in the plan file as it stands in REPO now;
  aware     the session had seen the trial before the first write (any transcript line naming it: "skill trial",
            "skills trial" or the trial plan's filename). Such cases are reported apart and kept out of the count
            (the User's ruling, 2026-10-09). Awareness lapses at a compaction: after one, a session is aware
            again only if the trial is named after it, in its summary, or in a message the compaction preserved
            (refinement 2026-10-10, delegated by the User).
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
AWARE = re.compile(r"skills? trial|plan-planning-skill-trial", re.I)
PHRASE = "No plan: small, well-specified, reversible"


def _events(tdir: Path, since: str):
    """(time, session, kind, detail) from every transcript line after SINCE, in time order."""
    from datetime import datetime
    cut = datetime.fromisoformat(since).timestamp()
    out = []
    for f in tdir.rglob("*.jsonl"):
        for line in open(f, errors="replace"):
            aware = bool(AWARE.search(line))
            compact = '"compact_boundary"' in line
            if not aware and not compact and SKILL not in line and "plan-" not in line and "lanning" not in line and PHRASE not in line:
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
            if aware:
                out.append((t, sid, "aware", d.get("uuid", "")))
            if d.get("subtype") == "compact_boundary":
                keep = (d.get("compactMetadata") or {}).get("preservedMessages", {}).get("allUuids", [])
                out.append((t, sid, "compact", ",".join(keep)))
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


def _blind_fn(ev):
    """A session is aware from a line naming the trial until its next compaction, unless the compaction preserved
    that line; after a compaction it is aware again only from a later line naming the trial."""
    aware_uuids = {u for (_, _, k, u) in ev if k == "aware" and u}
    marks = {}
    for t, sid, k, x in ev:
        if k == "aware":
            marks.setdefault(sid, []).append((t, "on"))
        elif k == "compact":
            kept = set(x.split(",")) & aware_uuids if x else set()
            marks.setdefault(sid, []).append((t, "on" if kept else "off"))
    def blind(sid, t):
        state = "off"
        for t2, m in marks.get(sid, []):
            if t2 > t:
                break
            state = m
        return state == "off"
    return blind


def trial(tdir: Path, repo: Path, since: str) -> None:
    ev = _events(tdir, since)
    blind = _blind_fn(ev)
    seen, rows = set(), []
    for t, sid, kind, fp in ev:
        if kind != "write" or fp in seen:
            continue
        seen.add(fp)
        before = [k for (t2, s2, k, _) in ev if s2 == sid and t2 <= t and k != "aware"]
        if not blind(sid, t):
            before.append("aware")
        f = Path(fp) if Path(fp).is_absolute() else repo / fp
        sec = sections(f.read_text(errors="replace")) if f.exists() else None
        rows.append((Path(fp).name, "fired" in before, "invoked" in before, "read" in before,
                     "-" if sec is None else sum(sec.values()), "aware" in before))
    print("plan\tfired\tinvoked\tread\tsections(of 8)\taware")
    for r in rows:
        print("\t".join(str(x) for x in r))
    phrases = sum(1 for (t, sid, k, _) in ev if k == "phrase" and blind(sid, t))
    false = 0
    for t, sid, kind, _ in ev:
        if kind != "fired" or not blind(sid, t):
            continue
        later = [k for (t2, s2, k, _) in ev if s2 == sid and t2 > t]
        false += not ("write" in later or "phrase" in later)
    counted = [r for r in rows if not r[5]]
    print(f"summary: {len(rows)} plans first written, {len(counted)} counted and {len(rows) - len(counted)} apart (aware); "
          f"counted: fired {sum(r[1] for r in counted)}, invoked {sum(r[2] for r in counted)}; "
          f"exemption phrases {phrases}; loads with no plan or phrase after them {false} (unaware sessions only)")


if __name__ == "__main__":
    if len(sys.argv) >= 4 and sys.argv[1] == "baseline":
        baseline(Path(sys.argv[2]), sys.argv[3], int(sys.argv[4]) if len(sys.argv) > 4 else None)
    elif len(sys.argv) == 5 and sys.argv[1] == "trial":
        trial(Path(sys.argv[2]), Path(sys.argv[3]), sys.argv[4])
    else:
        sys.exit(__doc__)
