#!/usr/bin/env python3
"""agent-tier-gate.py: PreToolUse hook on the Agent and Workflow tools (the spawn-tier gate, v2).

Reads the tier map (TIER_MAP.json) and refuses any sub-agent spawn that is not pinned to a tier on
the ladder. Standard library only. Exit 0 always; the decision travels in the JSON on stdout, per
the hooks contract. Anything unparseable is DENIED (fail closed).

Decision table, Agent tool:
  subagent_type in map.inherits (fork)      -> needs a justification line in the prompt
  model missing, subagent_type is a map agent -> resolve to its role's alias; frontier rank needs
                                                justification, otherwise ALLOW
  model missing otherwise                    -> DENY (would inherit the parent model)
  model in ladder, rank in frontier_ranks    -> needs a justification line in the prompt
  model in ladder, other rank                -> ALLOW
  anything else (full IDs, "inherit", typos) -> DENY, naming the map

Decision table, Workflow tool (scripts spawn agents outside the Agent tool):
  name only (saved workflow, no script text) -> DENY (cannot inspect)
  scriptPath unreadable                      -> DENY
  script calls workflow(...)                 -> DENY (a nested child cannot be inspected)
  strings, templates and comments are masked before inspection; any dynamic access (globalThis,
  eval, Function, import, require, this[...]) or a bare reference to `agent` that is not a call -> DENY
  every agent(...) call must carry, at the top level of a plain options-object literal, a
  string-literal model on the ladder or an agentType that is a map agent (spreads -> DENY);
  any frontier-rank model needs one justification line anywhere in the script
  no agent() calls                           -> ALLOW (nothing spawned)

Map location: $TIER_MAP, else <repo>/memento/TIER_MAP.json (the estate copy); schema 2 = policy + bindings,
binding chosen by $TIER_BINDING (default claude-code). Missing or malformed map -> DENY.
Log: $AGENT_TIER_LOG, else <repo>/.claude/agent-tier.log, one line per decision:
  ts | decision | tier | tool: description
"""
import json, os, re, sys, datetime

ROOT = os.path.abspath(os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", ".."))
MAP_PATH = os.environ.get("TIER_MAP") or os.path.join(ROOT, "memento", "TIER_MAP.json")
LOG_PATH = os.environ.get("AGENT_TIER_LOG") or os.path.join(ROOT, ".claude", "agent-tier.log")


def emit(decision, reason):
    sys.stdout.write(json.dumps({"hookSpecificOutput": {
        "hookEventName": "PreToolUse", "permissionDecision": decision, "permissionDecisionReason": reason}}))
    sys.stdout.write("\n")


def log(decision, tier, desc):
    try:
        os.makedirs(os.path.dirname(LOG_PATH), exist_ok=True)
        ts = datetime.datetime.now(datetime.timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
        with open(LOG_PATH, "a") as f:
            f.write(f"{ts} | {decision} | {tier} | {desc}\n".replace("\r", " "))
    except OSError:
        pass


def deny(tier, desc, reason):
    log("deny", tier, desc); emit("deny", "agent-tier-gate: DENIED. " + reason)


def allow(tier, desc, reason):
    log("allow", tier, desc); emit("allow", "agent-tier-gate: " + reason)


BINDING = os.environ.get("TIER_BINDING", "claude-code")


def load_map():
    """Flatten schema-2 map (policy + one binding) into the shape the decision code reads."""
    with open(MAP_PATH) as f:
        raw = json.load(f)
    if raw.get("schema") != 2 or "policy" not in raw or "bindings" not in raw:
        raise ValueError("tier map is not schema 2 (policy + bindings)")
    pol = raw["policy"]; b = raw["bindings"][BINDING]          # KeyError -> deny (unknown binding)
    ladder = b["ladder"]; assert isinstance(ladder, list) and ladder
    if len(ladder) != pol.get("ladder_depth", len(ladder)):
        raise ValueError(f"binding ladder has {len(ladder)} rungs, policy says {pol.get('ladder_depth')}")
    agents = {}
    for name, a in pol.get("agents", {}).items():
        agents[name] = dict(a, **b.get("agents", {}).get(name, {}))
    return {"ladder": ladder, "frontier_ranks": pol.get("frontier_ranks", [0]), "inherits": b.get("inherits", ["fork"]),
            "justification": {"marker": pol.get("justification", {}).get("marker", "TIER-JUSTIFICATION:"),
                              "min_chars": pol.get("justification", {}).get("min_chars", 40)},
            "roles": pol.get("roles", {}), "agents": agents, "binding": BINDING}


def justified(text, m):
    """A justification is a LINE starting with the marker whose remainder is long enough."""
    marker = re.escape(m["justification"]["marker"])
    for line in (text or "").splitlines():
        mo = re.match(r"^\s*(?://|#)?\s*" + marker + r"\s*(.*)$", line)
        if mo and len(mo.group(1).strip()) >= m["justification"]["min_chars"]:
            return mo.group(1).strip()
    return None


def howto(m):
    cheap = [a for i, a in enumerate(m["ladder"]) if i not in m["frontier_ranks"]]
    front = [a for i, a in enumerate(m["ladder"]) if i in m["frontier_ranks"]]
    return (f"Pass model={'|'.join(cheap)} (cheapest fit first), or a named agent from the tier map "
            f"({', '.join(m['agents']) or 'none defined'}). Frontier tiers ({'|'.join(front)}) and forks need a line "
            f"'{m['justification']['marker']} <why a cheaper tier cannot do this, {m['justification']['min_chars']}+ chars>'. "
            f"Aliases only; the ladder is {m['ladder']} in {MAP_PATH}.")


def agent_alias(m, name):
    a = m["agents"].get(name)
    if not a:
        return None
    rank = m["roles"].get(a.get("role", ""), {}).get("rank")
    return m["ladder"][rank] if isinstance(rank, int) and 0 <= rank < len(m["ladder"]) else None


# ---------------------------------------------------------------- Agent tool
def decide_agent(m, ti):
    model = str(ti.get("model") or "").strip()
    stype = str(ti.get("subagent_type") or "").strip()
    desc = "Agent: " + str(ti.get("description") or "").replace("\n", " ")
    prompt = str(ti.get("prompt") or "")
    if stype in m["inherits"]:
        tier = f"{stype}(inherits-parent)"
        j = justified(prompt, m)
        if j: return allow(tier + "(justified)", desc, f"{tier} accepted with justification: {j}")
        return deny(tier + "(unjustified)", desc,
                    f"A {stype} always runs on the parent model. It needs a '{m['justification']['marker']}' line stating why the sub-task needs the whole conversation context. " + howto(m))
    if not model:
        pinned = agent_alias(m, stype)
        if not pinned:
            return deny("(none)", desc, "No explicit model on this Agent call; the default inherits the parent model. " + howto(m))
        if m["ladder"].index(pinned) in m["frontier_ranks"]:          # a named agent whose role sits at a frontier rank
            j = justified(prompt, m)
            if j: return allow(f"{pinned}(pinned by {stype}, justified)", desc, f"named agent {stype} resolves to frontier tier {pinned}; justified: {j}")
            return deny(f"{pinned}(pinned by {stype}, unjustified)", desc, f"Named agent '{stype}' resolves to frontier tier '{pinned}' in the tier map; it needs a '{m['justification']['marker']}' line like any frontier spawn. " + howto(m))
        return allow(f"{pinned}(pinned by {stype})", desc, f"named agent {stype} pinned to {pinned} by the tier map")
    if model in m["ladder"]:
        rank = m["ladder"].index(model)
        if rank in m["frontier_ranks"]:
            j = justified(prompt, m)
            if j: return allow(f"{model}(justified)", desc, f"frontier tier {model} accepted with justification: {j}")
            return deny(f"{model}(unjustified)", desc, f"Frontier tier '{model}' needs a '{m['justification']['marker']}' line ({m['justification']['min_chars']}+ chars) in the prompt. " + howto(m))
        return allow(model, desc, model)
    return deny(f"{model}(unknown)", desc, f"Model '{model}' is not an alias on the ladder. " + howto(m))


# ------------------------------------------------------------- Workflow tool
# The script is JavaScript text. Regex over raw text is bypassable (a decoy `model: "sonnet"` inside a
# prompt string; `const spawn = agent`), so the matcher first MASKS every string, template and comment
# body to spaces (offsets and line numbers preserved), then reasons over the masked text and reads
# string values back from the original by offset. Anything dynamic is denied, never guessed.
DYNAMIC_RE = re.compile(r"(?<![\w.$])(globalThis|eval|Function|import|require)\b|(?<![\w$])this\s*\[|\bwith\s*\(|\\[ux]")
AGENT_REF_RE = re.compile(r"(?<![\w.$])agent\b(?!\s*\()")
CALL_RE = re.compile(r"(?<![\w.$])agent\s*\(")
NESTED_RE = re.compile(r"(?<![\w.$])workflow\s*\(")


REGEX_PRECEDER = re.compile(r"(?:^|[(,=:\[!&|?{};+\-*%<>~^]|\breturn|\btypeof|\bcase|\bdo|\belse|\bin|\bof|\bnew|\bdelete|\bvoid|\bthrow|\byield|\bawait)\s*$")


def mask(src):
    """Return (masked, strings, unterminated). Masked source has string, template, comment and regex
    literal bodies replaced by spaces (offsets and line numbers preserved); strings maps the offset
    of an opening quote to (end, raw, has_interpolation); unterminated is True if any literal ran to
    end of file (a desynchronised masker must fail closed)."""
    out = list(src); strings = {}; i = 0; n = len(src); unterminated = False
    while i < n:
        c = src[i]
        if c == "/" and i + 1 < n and src[i + 1] == "/":
            j = src.find("\n", i); j = n if j == -1 else j
            for k in range(i, j): out[k] = " "
            i = j; continue
        if c == "/" and i + 1 < n and src[i + 1] == "*":
            j = src.find("*/", i + 2)
            if j == -1: unterminated = True; j = n
            else: j += 2
            for k in range(i, j):
                if src[k] != "\n": out[k] = " "
            i = j; continue
        if c == "/" and REGEX_PRECEDER.search("".join(out[max(0, i - 12):i])):
            j = i + 1; in_class = False
            while j < n and src[j] != "\n" and (src[j] != "/" or in_class):
                if src[j] == "\\": j += 1
                elif src[j] == "[": in_class = True
                elif src[j] == "]": in_class = False
                j += 1
            if j >= n or src[j] != "/": unterminated = True; j = min(j, n - 1)
            for k in range(i + 1, j): out[k] = " "
            i = j + 1; continue
        if c in "'\"`":
            j = i + 1; interp = False
            while j < n and src[j] != c:
                if src[j] == "\\": j += 1
                elif c == "`" and src[j] == "$" and j + 1 < n and src[j + 1] == "{": interp = True
                elif c != "`" and src[j] == "\n": break
                j += 1
            if j >= n or src[j] != c: unterminated = True; j = min(j, n - 1)
            for k in range(i + 1, j):
                if src[k] != "\n": out[k] = " "
            strings[i] = (j, src[i + 1:j], interp)
            i = j + 1; continue
        i += 1
    return "".join(out), strings, unterminated


def call_spans(masked):
    """Yield (line_no, start, end) for each agent(...) call with balanced parentheses (masked text)."""
    for mo in CALL_RE.finditer(masked):
        i = mo.end(); depth = 1
        while i < len(masked) and depth:
            if masked[i] == "(": depth += 1
            elif masked[i] == ")": depth -= 1
            i += 1
        yield masked.count("\n", 0, mo.start()) + 1, mo.end(), i - 1


def split_args(masked, start, end):
    """Top-level comma split of masked[start:end]; returns list of (s, e) offsets."""
    args, depth, s = [], 0, start
    for i in range(start, end):
        ch = masked[i]
        if ch in "([{": depth += 1
        elif ch in ")]}": depth -= 1
        elif ch == "," and depth == 0:
            args.append((s, i)); s = i + 1
    if masked[s:end].strip(): args.append((s, end))
    return args


def depth_at(body, idx):
    d = 0
    for ch in body[:idx]:
        if ch in "{[(": d += 1
        elif ch in "}])": d -= 1
    return d


def opts_keys(masked, strings, s, e):
    """Audit the options-object literal in masked[s:e]. Returns (keys, problem): keys is
    {name: raw_string_value_or_None} for every bare key at depth 1; problem is a string when the
    object is not a plain literal the gate can read (not an object, quoted key, computed key,
    duplicate key, spread), in which case the caller denies."""
    body = masked[s:e]; st = body.strip()
    if not st or st[0] != "{" or st[-1] != "}": return {}, "options are not a plain object literal"
    if "..." in body: return {}, "options use a spread"
    for q0, (q1, raw, _) in strings.items():          # quoted keys: a string at depth 1 followed by ':'
        if s <= q0 < e and depth_at(body, q0 - s) == 1:
            rest = body[q1 - s + 1:].lstrip()
            if rest.startswith(":"): return {}, f"quoted key '{raw}'; use a bare key"
    for mo in re.finditer(r"\[", body):                # computed keys: '[' at depth 1 preceded by '{' or ','
        if depth_at(body, mo.start()) == 1 and body[:mo.start()].rstrip()[-1:] in ("{", ","):
            return {}, "computed key; use a bare key"
    keys = {}
    for mo in re.finditer(r"\b([A-Za-z_$][\w$]*)\s*:", body):
        if depth_at(body, mo.start()) != 1: continue
        name = mo.group(1)
        if name in keys: return {}, f"duplicate key '{name}' (JavaScript keeps the last, the gate would read the first)"
        q = s + mo.end() + len(body[mo.end():]) - len(body[mo.end():].lstrip())
        val = None
        if q in strings and not strings[q][2]:
            after = body[strings[q][0] - s + 1:].lstrip()        # the literal must END the property
            if after[:1] in (",", "}"): val = strings[q][1].strip()
        keys[name] = val
    return keys, None


def decide_workflow(m, ti):
    desc = "Workflow: " + str(ti.get("name") or ti.get("scriptPath") or "inline script")
    src = ti.get("script")
    if not src and ti.get("scriptPath"):
        try:
            with open(ti["scriptPath"]) as f: src = f.read()
        except OSError as e:
            return deny("workflow(unreadable)", desc, f"scriptPath could not be read ({e}); a script the gate cannot read cannot be checked.")
    if not src:
        return deny("workflow(uninspectable)", desc, "A saved or named workflow carries no script text for the gate to inspect. Pass the script inline or by scriptPath.")
    masked, strings, unterminated = mask(src)
    if unterminated:
        return deny("workflow(unterminated literal)", desc, "A string, template, comment or regex literal runs to end of file; the gate cannot trust its reading of this script. Fix the literal.")
    if NESTED_RE.search(masked):
        return deny("workflow(nested)", desc, "The script calls workflow(...); a nested child's agents cannot be inspected here. Inline the child's agent() calls.")
    dyn = DYNAMIC_RE.search(masked)
    if dyn:
        return deny("workflow(dynamic)", desc, f"The script uses '{dyn.group(0).strip()}' (line {masked.count(chr(10), 0, dyn.start()) + 1}); dynamic access could reach agent() unseen. Call agent(...) directly with literal options.")
    ref = AGENT_REF_RE.search(masked)
    if ref:
        return deny("workflow(agent aliased)", desc, f"'agent' is referenced without being called (line {masked.count(chr(10), 0, ref.start()) + 1}); aliasing hides spawns from the gate. Call agent(...) directly.")
    problems, frontier, calls = [], [], list(call_spans(masked))
    for line, s, e in calls:
        args = split_args(masked, s, e)
        if len(args) != 2:
            problems.append(f"line {line}: agent() takes exactly (prompt, options); found {len(args)} argument(s) (no options would inherit the main-loop model; extra arguments cannot be inspected)"); continue
        os_, oe = args[1]
        keys, problem = opts_keys(masked, strings, os_, oe)
        if problem:
            problems.append(f"line {line}: {problem}"); continue
        model = keys.get("model"); atype = keys.get("agentType")
        if "model" in keys and model is None:
            problems.append(f"line {line}: model is not a plain string literal"); continue
        if model:
            if model not in m["ladder"]:
                problems.append(f"line {line}: model '{model}' is not on the ladder")
            elif m["ladder"].index(model) in m["frontier_ranks"]:
                frontier.append(f"line {line}: {model}")
        elif atype and agent_alias(m, atype):
            if m["ladder"].index(agent_alias(m, atype)) in m["frontier_ranks"]:
                frontier.append(f"line {line}: {atype} resolves to {agent_alias(m, atype)}")
        else:
            problems.append(f"line {line}: agent() has no string-literal model on the ladder and no agentType from the tier map at the top level of a plain options object (it would inherit the main-loop model)")
    if problems:
        return deny(f"workflow({len(problems)} unpinned of {len(calls)})", desc, "; ".join(problems) + ". " + howto(m))
    if frontier:
        j = justified(src, m)
        if not j:
            return deny("workflow(frontier unjustified)", desc,
                        f"Frontier-tier agent() calls ({'; '.join(frontier)}) need one '{m['justification']['marker']}' comment line in the script. " + howto(m))
        return allow(f"workflow({len(calls)} pinned, frontier justified)", desc, f"{len(calls)} agent() calls pinned; frontier justified: {j}")
    return allow(f"workflow({len(calls)} pinned)", desc, f"{len(calls)} agent() call(s) pinned on the ladder" if calls else "no agent() calls in script")


def main():
    raw = sys.stdin.read()
    try:
        inp = json.loads(raw)
        tool = inp.get("tool_name", ""); ti = inp.get("tool_input") or {}
        if not isinstance(ti, dict): raise ValueError("tool_input not an object")
    except Exception:
        log("deny", "(unparseable)", "-"); return emit("deny", "agent-tier-gate: DENIED. Hook input was not valid JSON; failing closed.")
    if tool not in ("Agent", "Workflow"):
        return emit("allow", "agent-tier-gate: not a spawn tool")
    try:
        m = load_map()
    except Exception as e:
        return deny("(no tier map)", tool, f"Tier map unreadable at {MAP_PATH} ({e}). Restore the estate copy from the framework canon (framework/conventions/TIER_MAP.json).")
    try:
        return decide_agent(m, ti) if tool == "Agent" else decide_workflow(m, ti)
    except Exception as e:
        return deny("(gate error)", tool, f"Gate raised {type(e).__name__}: {e}; failing closed.")


if __name__ == "__main__":
    main()
