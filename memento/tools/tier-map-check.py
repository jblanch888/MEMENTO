#!/usr/bin/env python3
"""tier-map-check.py: release-cadence detectors for the tier map (slice 5 of the spawn-tier plan).

The tier map pins roles to RANKS on a ladder of model aliases, so a new version inside a family
changes nothing. What moves under it is a NEW FAMILY (a new alias above or between the rungs) or a
new harness (the hook fields the gate depends on). Three detectors, none of which re-tiers anything;
each prints an OWED line for John, who classifies a new model once in the canon map.

  1. Telemetry: every model identifier seen by the machine-wide Claude Code telemetry (local Loki)
     in the last N days whose family name matches no alias on the binding's ladder. Fails OPEN with
     a WARN if Loki is unreachable: the doctor must not depend on the telemetry stack.
  2. Harness: the interactive CLI version differs from the binding's `verified_against`, so the hook
     contract (tool_input.model on the Agent tool) is unproven on the running harness until the
     live-dispatch witness is re-run.
  3. Age: the policy's `last_verified` is older than --max-age days.

Exit 0 when nothing is owed, 1 when something is (advisory; the caller decides). Standard library.
Test hooks: --models "a,b" replaces the Loki query; --cli-version replaces `claude --version`.
"""
import argparse, datetime as dt, json, os, re, subprocess, sys, time, urllib.parse, urllib.request

ROOT = os.path.abspath(os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", ".."))


def confined(path):
    """Resolve a path and refuse it unless it lies inside this repository (path-traversal guard)."""
    real = os.path.realpath(path)
    base = os.path.realpath(ROOT)
    if real != base and not real.startswith(base + os.sep):
        sys.exit(f"refusing a path outside the repository: {path}")
    return real
LOKI = os.environ.get("MEMENTO_LOKI", "http://localhost:3100")


def loki_models(days, timeout=4):
    """Distinct model identifiers with request counts over the window, via Loki's structured metadata."""
    now = int(time.time()); start = now - days * 86400
    q = 'sum by (model) (count_over_time({service_name="claude-code"} |= "api_request" [%dd]))' % days
    p = urllib.parse.urlencode({"query": q, "start": f"{start}000000000", "end": f"{now}000000000", "step": f"{days}d"})
    with urllib.request.urlopen(f"{LOKI}/loki/api/v1/query_range?{p}", timeout=timeout) as r:
        d = json.load(r)
    out = {}
    for row in d["data"]["result"]:
        m = row["metric"].get("model", "")
        if m: out[m] = out.get(m, 0) + sum(int(float(v)) for _, v in row["values"])
    return out


def family_of(model_id, ladder):
    """The ladder alias whose name appears in the identifier, e.g. claude-sonnet-5 -> sonnet."""
    low = model_id.lower()
    hits = [a for a in ladder if a.lower() in low]
    return hits[0] if len(hits) == 1 else None


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--map", default=os.environ.get("TIER_MAP") or os.path.join(ROOT, "memento", "TIER_MAP.json"))
    ap.add_argument("--binding", default=os.environ.get("TIER_BINDING", "claude-code"))
    ap.add_argument("--days", type=int, default=7)
    ap.add_argument("--max-age", type=int, default=90)
    ap.add_argument("--models", default=None, help="test hook: comma-separated model ids instead of Loki")
    ap.add_argument("--cli-version", default=None, help="test hook: version string instead of `claude --version`")
    a = ap.parse_args()
    with open(confined(a.map)) as f: raw = json.load(f)
    pol = raw["policy"]; b = raw["bindings"][a.binding]
    ladder = b["ladder"]; owed = 0

    # 1. telemetry: unmapped families
    if a.models is not None:
        seen = {m.strip(): 1 for m in a.models.split(",") if m.strip()}; src = "test input"
    else:
        try:
            seen = loki_models(a.days); src = f"Loki, last {a.days} days"
        except Exception as e:
            seen = None; print(f"  WARN (does not fail): telemetry unreachable ({type(e).__name__}); the unmapped-family detector did not run.")
    if seen is not None:
        unmapped = {m: n for m, n in seen.items() if family_of(m, ladder) is None}
        if unmapped:
            owed += 1
            for m, n in sorted(unmapped.items(), key=lambda kv: -kv[1]):
                print(f"  OWED (John): model '{m}' ({n} requests, {src}) matches no alias on the ladder {ladder}. Classify its family once in the canon TIER_MAP.json (a new rung, or a note that it maps to an existing alias), then copy the map to each estate.")
        else:
            print(f"  PASS: every model seen ({src}: {', '.join(sorted(seen)) or 'none'}) maps to a ladder alias.")
    print(f"  dashboard query (Loki): {'sum by (model) (count_over_time({service_name=%s} |= %s [7d]))' % ('\"claude-code\"', '\"api_request\"')}")

    # 2. harness version vs verified_against
    ver = a.cli_version
    if ver is None:
        try:
            ver = subprocess.run(["claude", "--version"], capture_output=True, text=True, timeout=10,
                                 env=dict(os.environ, DISABLE_AUTOUPDATER="1")).stdout.strip().split()[0]
        except Exception:
            ver = None
    want = str(b.get("verified_against", ""))
    if ver is None:
        print("  WARN (does not fail): interactive CLI not found; harness check skipped.")
    elif ver != want:
        owed += 1
        print(f"  OWED (agent, then John): interactive CLI is {ver}, the {a.binding} binding was verified against {want}. Re-run the live-dispatch witness on this harness; if it passes, set verified_against to {ver} in the canon map and copy it out.")
    else:
        print(f"  PASS: interactive CLI {ver} matches the binding's verified_against.")

    # 3. age
    try:
        lv = dt.date.fromisoformat(str(pol.get("last_verified")))
        age = (dt.date.today() - lv).days
        if age > a.max_age:
            owed += 1; print(f"  OWED (John): tier map last verified {lv} ({age} days ago, limit {a.max_age}). Re-read the ladder and roles against the current model landscape and bump last_verified.")
        else:
            print(f"  PASS: tier map verified {age} days ago (limit {a.max_age}).")
    except Exception:
        owed += 1; print("  OWED (John): policy.last_verified is missing or not an ISO date.")
    sys.exit(1 if owed else 0)


if __name__ == "__main__":
    main()
