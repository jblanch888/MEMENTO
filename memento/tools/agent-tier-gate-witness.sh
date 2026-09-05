#!/usr/bin/env bash
# agent-tier-gate-witness.sh: proves memento/tools/agent-tier-gate.py allows and denies for the RIGHT
# reasons on both matchers (Agent, Workflow), that the generator derives definitions the gate then
# honours, and that the witness itself can go red (three mutants). Exit 0 = every case passes and
# every mutant is killed. Run from anywhere; uses a scratch tier map, never the live one.
set -u
HERE="$(cd "$(dirname "$0")" && pwd)"
GATE="$HERE/agent-tier-gate.py"
GEN="$HERE/generate_agents.py"
CANON_MAP="$HERE/../../framework/conventions/TIER_MAP.json"
[ -f "$CANON_MAP" ] || CANON_MAP="$HERE/../TIER_MAP.json"   # estate copy when run inside an instance
TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT
export AGENT_TIER_LOG="$TMP/gate.log"
export TIER_MAP="$TMP/TIER_MAP.json"; cp "$CANON_MAP" "$TIER_MAP"
PASS=0; FAIL=0

decide() { printf '%s' "$2" | python3 "$1" | python3 -c 'import sys,json
try: print(json.load(sys.stdin)["hookSpecificOutput"]["permissionDecision"])
except Exception: print("MALFORMED")'; }
reason() { printf '%s' "$2" | python3 "$1" | python3 -c 'import sys,json; print(json.load(sys.stdin)["hookSpecificOutput"]["permissionDecisionReason"])'; }
case_() { # name expected json [gate]
  local got; got="$(decide "${4:-$GATE}" "$3")"
  if [ "$got" = "$2" ]; then PASS=$((PASS+1)); echo "PASS  $1 -> $got"
  else FAIL=$((FAIL+1)); echo "FAIL  $1 -> got $got, expected $2"; fi
}
J40="TIER-JUSTIFICATION: this sub-task must weigh contradictory evidence and rule on it, sonnet misreads it"
J10="TIER-JUSTIFICATION: because"
ag() { printf '{"tool_name":"Agent","tool_input":%s}' "$1"; }
agm() { printf '{"tool_name":"Agent","tool_input":{"model":"%s","description":"x","prompt":"%s"}}' "$1" "$2"; }   # model + prompt
agf() { printf '{"tool_name":"Agent","tool_input":{"subagent_type":"fork","description":"x","prompt":"%s"}}' "$1"; }
wf() { python3 -c 'import json,sys; print(json.dumps({"tool_name":"Workflow","tool_input":{"script":sys.argv[1]}}))' "$1"; }

echo "== Agent matcher =="
case_ A1-no-model            deny  "$(ag '{"subagent_type":"general-purpose","description":"x","prompt":"read files"}')"
case_ A2-haiku               allow "$(ag '{"model":"haiku","description":"listing","prompt":"list"}')"
case_ A3-sonnet              allow "$(ag '{"model":"sonnet","description":"extract","prompt":"extract"}')"
case_ A4-fable-unjustified   deny  "$(ag '{"model":"fable","description":"x","prompt":"do judgement"}')"
case_ A5-fable-justified     allow "$(agm fable "line one\\n$J40\\nline three")"
case_ A6-fable-short-just    deny  "$(agm fable "$J10")"
case_ A7-opus-unjustified    deny  "$(ag '{"model":"opus","description":"x","prompt":"p"}')"
case_ A8-fork-unjustified    deny  "$(ag '{"subagent_type":"fork","description":"x","prompt":"p"}')"
case_ A9-fork-justified      allow "$(agf "$J40")"
case_ A10-unknown-model      deny  "$(ag '{"model":"gpt-9","description":"x","prompt":"p"}')"
case_ A11-full-id-denied     deny  "$(ag '{"model":"claude-sonnet-5","description":"x","prompt":"p"}')"
case_ A12-inherit-denied     deny  "$(ag '{"model":"inherit","description":"x","prompt":"p"}')"
case_ A13-named-agent-pinned allow "$(ag '{"subagent_type":"memento-scout","description":"x","prompt":"p"}')"
case_ A14-named-agent-unknown deny "$(ag '{"subagent_type":"some-other-agent","description":"x","prompt":"p"}')"
case_ A15-just-mid-line-only deny  "$(ag '{"model":"fable","description":"x","prompt":"we said TIER-JUSTIFICATION: inline should not count because it is not a line start and forty chars"}')"
case_ A16-not-a-spawn-tool   allow '{"tool_name":"Bash","tool_input":{"command":"ls"}}'
case_ A17-garbage-input      deny  'this is not json'

echo "== Workflow matcher =="
case_ W1-no-agent-calls      allow "$(wf 'export const meta={name:"x",description:"y"}; return 1')"
case_ W2-pinned-sonnet       allow "$(wf 'const r = await agent("do it", {label: "a", model: "sonnet"})')"
case_ W3-unpinned            deny  "$(wf 'const r = await agent("do it", {label: "a"})')"
case_ W4-one-of-two-unpinned deny  "$(wf 'await agent("a", {model: "sonnet"}); await pipeline(X, d => agent(d.p, {label: "b"}))')"
case_ W5-variable-model      deny  "$(wf 'const M="sonnet"; await agent("a", {model: M})')"
case_ W6-template-model      deny  "$(wf 'await agent("a", {model: `${tier}`})')"
case_ W7-frontier-unjust     deny  "$(wf 'await agent("judge", {model: "opus"})')"
case_ W8-frontier-justified  allow "$(wf "// $J40
await agent(\"judge\", {model: \"opus\"})")"
case_ W9-agentType-map       allow "$(wf 'await agent("scan", {agentType: "memento-scout"})')"
case_ W10-agentType-unknown  deny  "$(wf 'await agent("scan", {agentType: "code-reviewer"})')"
case_ W11-nested-workflow    deny  "$(wf 'await agent("a", {model: "sonnet"}); await workflow("child")')"
case_ W12-named-only         deny  '{"tool_name":"Workflow","tool_input":{"name":"review-changes"}}'
case_ W13-scriptPath-missing deny  "{\"tool_name\":\"Workflow\",\"tool_input\":{\"scriptPath\":\"$TMP/nope.js\"}}"
printf 'await agent("a", {model: "haiku"})\n' > "$TMP/ok.js"
case_ W14-scriptPath-ok      allow "{\"tool_name\":\"Workflow\",\"tool_input\":{\"scriptPath\":\"$TMP/ok.js\"}}"
case_ W15-unknown-alias      deny  "$(wf 'await agent("a", {model: "gpt-9"})')"
case_ W16-nested-parens      allow "$(wf 'await agent(`x ${f(1,(2))}`, {schema: {type:"object", properties:{}}, model: "sonnet"})')"
# reviewer bypasses (2026-09-06 adversarial review), each must DENY
case_ W17-decoy-model-in-prompt   deny  "$(wf "await agent('need model: \"sonnet\" done', {model: \"opus\"})")"
case_ W18-decoy-agentType-in-prompt deny "$(wf "await agent('agentType: \"memento-scout\"', {agentType: \"custom-frontier\"})")"
case_ W19-agent-aliased           deny  "$(wf 'const spawn = agent; await spawn("do it", {model: "opus"});')"
case_ W20-globalThis              deny  "$(wf 'await globalThis["agent"]("x", {model: "sonnet"})')"
case_ W21-spread-opts             deny  "$(wf 'const o={model:"opus"}; await agent("x", {...o, model: "sonnet"})')"
case_ W22-opts-variable           deny  "$(wf 'const o={model:"sonnet"}; await agent("x", o)')"
case_ W23-model-in-nested-object  deny  "$(wf 'await agent("x", {schema: {model: "sonnet"}})')"
case_ W24-call-in-comment-only    allow "$(wf '// agent("x", {model: "opus"}) is not a call
return 1')"
case_ W25-decoy-in-prompt-real-ok allow "$(wf "await agent('model: \"opus\" is text', {model: \"sonnet\"})")"
case_ W26-eval                    deny  "$(wf 'eval("agent(1,{model:\"opus\"})")')"
case_ W27-multiline-call          allow "$(wf 'await agent(
  "long prompt",
  {
    label: "a",
    model: "haiku",
  }
)')"
# round-2 reviewer bypasses and masker cases (2026-09-06)
case_ W28-duplicate-key-last-wins deny  "$(wf 'await agent("x", {model: "sonnet", model: "opus"})')"
case_ W29-duplicate-quoted-key    deny  "$(wf 'await agent("x", {model: "sonnet", "model": "opus"})')"
case_ W30-unicode-escaped-ident   deny  "$(wf 'await \u0061gent("x", {model: "opus"})')"
case_ W31-escape-inside-string-ok allow "$(wf 'await agent("x", {model: "sonnet", label: "\u0061"})')"
case_ W32-regex-with-quote        deny  "$(wf 'const r = /"/; await agent("x", {model: "opus"}); const z = "y"')"
case_ W33-division-not-regex      allow "$(wf 'const k = Math.floor(budget.total / 100_000); await agent("x", {model: "sonnet"}); const q = a / b / c')"
case_ W34-unterminated-string     deny  "$(wf 'const s = "unterminated; await agent("x", {model: "opus"})')"
case_ W35-computed-key            deny  "$(wf 'await agent("x", {["model"]: "sonnet"})')"
case_ W36-quoted-key-only         deny  "$(wf 'await agent("x", {"model": "sonnet"})')"
case_ W37-nested-schema-model-ok  allow "$(wf 'await agent("x", {schema: {type:"object", properties:{model:{type:"string"}}}, model: "sonnet", label: "a"})')"
case_ W38-tagged-template         deny  "$(wf 'agent`hello`')"
case_ W39-default-param-alias     deny  "$(wf 'function f(a = agent) { return a }; await f()("x", {model: "opus"})')"
# round-3 (2026-09-06)
case_ W40-third-argument          deny  "$(wf 'await agent("prompt", {model: "sonnet"}, {model: "opus"})')"
case_ W41-value-expression        deny  "$(wf 'await agent("x", {model: "sonnet" && "opus"})')"
case_ W42-single-quote-pin        allow "$(wf "await agent('x', {model: 'haiku'})")"

echo "== Map and generator =="
got="$(TIER_MAP="$TMP/absent.json" bash -c "printf '%s' '$(ag '{"model":"sonnet","description":"x","prompt":"p"}')' | python3 '$GATE'" | python3 -c 'import sys,json; print(json.load(sys.stdin)["hookSpecificOutput"]["permissionDecision"])')"
if [ "$got" = "deny" ]; then PASS=$((PASS+1)); echo "PASS  M2-missing-map-denies -> deny"; else FAIL=$((FAIL+1)); echo "FAIL  M2-missing-map-denies -> $got"; fi
# new alias honoured with no script change: insert "titan" above fable as rank 0 frontier; fable becomes rank 1 (still frontier)
python3 - "$TIER_MAP" <<'EOF'
import json,sys; p=sys.argv[1]; m=json.load(open(p)); b=m["bindings"]["claude-code"]; b["ladder"]=["titan"]+b["ladder"]
m["policy"]["ladder_depth"]+=1; m["policy"]["frontier_ranks"]=[0,1]
m["policy"]["roles"]={k:dict(v, rank=v["rank"]+1) for k,v in m["policy"]["roles"].items()}; json.dump(m,open(p,"w"))
EOF
case_ M3-new-alias-frontier  deny  "$(ag '{"model":"titan","description":"x","prompt":"p"}')"
case_ M4-new-alias-justified allow "$(agm titan "$J40")"
case_ M5-sonnet-now-rank-3   allow "$(ag '{"model":"sonnet","description":"x","prompt":"p"}')"
cp "$CANON_MAP" "$TIER_MAP"
# a named agent whose ROLE moves to a frontier rank must need justification on both paths (review finding 2, 2026-09-06)
python3 -c 'import json,sys; p=sys.argv[1]; m=json.load(open(p)); m["policy"]["roles"]["review"]["rank"]=0; json.dump(m,open(p,"w"))' "$TIER_MAP"
case_ M6-named-agent-frontier-role-agent    deny  "$(ag '{"subagent_type":"memento-reviewer","description":"x","prompt":"p"}')"
case_ M7-named-agent-frontier-role-justified allow "$(printf '{"tool_name":"Agent","tool_input":{"subagent_type":"memento-reviewer","description":"x","prompt":"%s"}}' "$J40")"
case_ M8-named-agent-frontier-role-workflow deny  "$(wf 'await agent("x", {agentType: "memento-reviewer"})')"
cp "$CANON_MAP" "$TIER_MAP"
# malformed maps deny: schema 1 shape, unknown binding, ladder depth mismatch
printf '{"schema":1,"ladder":["fable","opus","sonnet","haiku"]}' > "$TIER_MAP"
case_ M9-schema1-map-denies  deny  "$(ag '{"model":"sonnet","description":"x","prompt":"p"}')"
cp "$CANON_MAP" "$TIER_MAP"
got="$(TIER_BINDING=codex bash -c "printf '%s' '$(ag '{"model":"sonnet","description":"x","prompt":"p"}')' | python3 '$GATE'" | python3 -c 'import sys,json; print(json.load(sys.stdin)["hookSpecificOutput"]["permissionDecision"])')"
if [ "$got" = "deny" ]; then PASS=$((PASS+1)); echo "PASS  M10-unknown-binding-denies -> deny"; else FAIL=$((FAIL+1)); echo "FAIL  M10-unknown-binding-denies -> $got"; fi
python3 -c 'import json,sys; p=sys.argv[1]; m=json.load(open(p)); m["policy"]["ladder_depth"]=9; json.dump(m,open(p,"w"))' "$TIER_MAP"
case_ M11-ladder-depth-mismatch deny "$(ag '{"model":"sonnet","description":"x","prompt":"p"}')"
cp "$CANON_MAP" "$TIER_MAP"
# generator: definitions derive from the map and the gate honours them; --check detects drift
OUT="$TMP/agents"; python3 "$GEN" --map "$TIER_MAP" --out "$OUT" --bodies "$HERE/../../framework/conventions/agents" >/dev/null
if grep -q '^model: haiku$' "$OUT/memento-scout.md" && grep -q '^effort: low$' "$OUT/memento-scout.md" && grep -q '^model: sonnet$' "$OUT/memento-reviewer.md" && grep -q '^effort: medium$' "$OUT/memento-reviewer.md"; then PASS=$((PASS+1)); echo "PASS  G1-generated-frontmatter-from-map"; else FAIL=$((FAIL+1)); echo "FAIL  G1-generated-frontmatter"; cat "$OUT/memento-scout.md" | head -8; fi
if python3 "$GEN" --map "$TIER_MAP" --out "$OUT" --bodies "$HERE/../../framework/conventions/agents" --check >/dev/null; then PASS=$((PASS+1)); echo "PASS  G2-check-clean-after-generate"; else FAIL=$((FAIL+1)); echo "FAIL  G2-check-clean"; fi
sed -i.bak 's/^model: haiku$/model: opus/' "$OUT/memento-scout.md"
if python3 "$GEN" --map "$TIER_MAP" --out "$OUT" --bodies "$HERE/../../framework/conventions/agents" --check >/dev/null; then FAIL=$((FAIL+1)); echo "FAIL  G3-check-misses-hand-edit"; else PASS=$((PASS+1)); echo "PASS  G3-check-catches-hand-edited-model"; fi
if grep -q "You are a Memento scout" "$OUT/memento-scout.md"; then PASS=$((PASS+1)); echo "PASS  G4-canon-body-carried"; else FAIL=$((FAIL+1)); echo "FAIL  G4-canon-body-missing"; fi

echo "== Log =="
n="$(grep -c '' "$AGENT_TIER_LOG")"
if [ "$n" -eq 68 ]; then PASS=$((PASS+1)); echo "PASS  L1-log-exactly-68-rows (16 Agent + 42 Workflow + 10 map cases; A16 logs nothing)"; else FAIL=$((FAIL+1)); echo "FAIL  L1-log-rows ($n)"; fi
if grep -q '^[0-9T:Z-]* | deny | (unparseable) | -$' "$AGENT_TIER_LOG"; then PASS=$((PASS+1)); echo "PASS  L2-unparseable-logged"; else FAIL=$((FAIL+1)); echo "FAIL  L2-unparseable-not-logged"; fi

echo "== Mutants =="
MUT="$TMP/gate.X1.py"; sed 's/^    if not model:$/    if False:/' "$GATE" > "$MUT"
if cmp -s "$GATE" "$MUT"; then FAIL=$((FAIL+1)); echo "FAIL  X1-anchor-drifted"; else
  r="$(reason "$MUT" "$(ag '{"subagent_type":"general-purpose","description":"x","prompt":"p"}')")"
  if printf '%s' "$r" | grep -q 'No explicit model'; then FAIL=$((FAIL+1)); echo "FAIL  X1-mutant-survived"; else PASS=$((PASS+1)); echo "PASS  X1-missing-model-branch-mutant-killed"; fi; fi
MUT2="$TMP/gate.X2.py"; sed 's/>= m\["justification"\]\["min_chars"\]/>= 1/' "$GATE" > "$MUT2"
if cmp -s "$GATE" "$MUT2"; then FAIL=$((FAIL+1)); echo "FAIL  X2-anchor-drifted"; else
  case_ X2-justification-bar-mutant-killed allow "$(agm fable "$J10")" "$MUT2"; fi
MUT3="$TMP/gate.X3.py"; sed 's/^        else:$/        elif False:/' "$GATE" > "$MUT3"
if cmp -s "$GATE" "$MUT3"; then FAIL=$((FAIL+1)); echo "FAIL  X3-anchor-drifted"; else
  case_ X3-workflow-unpinned-branch-mutant-killed allow "$(wf 'await agent("do it", {label: "a"})')" "$MUT3"; fi

echo "----"; echo "agent-tier-gate witness: $PASS passed, $FAIL failed"
[ "$FAIL" -eq 0 ]
