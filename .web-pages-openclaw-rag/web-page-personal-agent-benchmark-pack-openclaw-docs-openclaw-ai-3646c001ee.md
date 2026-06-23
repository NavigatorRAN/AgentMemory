# Personal agent benchmark pack - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/concepts/personal-agent-benchmark-pack
- Final URL: https://docs.openclaw.ai/concepts/personal-agent-benchmark-pack
- Canonical URL: https://docs.openclaw.ai/concepts/personal-agent-benchmark-pack
- Fetched at: 2026-06-23T14:39:01Z
- Content type: text/html; charset=utf-8

## Description

Local qa-channel scenarios for privacy-preserving personal assistant workflow checks.

## Extracted Text

Close
Agents Fundamentals
The Personal Agent Benchmark Pack is a small repo-backed QA scenario pack for
local personal assistant workflows. It is not a generic model benchmark and it
does not require a new runner. The pack reuses the private QA stack described in
QA overview , the synthetic
QA channel , and the existing qa/scenarios YAML
catalog.
The first pack is intentionally narrow:
fake personal reminders through local cron delivery
fake DM and thread reply routing through qa-channel
fake preference recall from the temporary QA workspace memory files
fake secret no-echo checks
safe read-backed tool followthrough after a short approval-style turn
approval denial stop behavior for a sensitive local read request
proof-backed task status reporting that keeps pending, blocked, and done separate
share-safe diagnostics artifacts that keep useful status while omitting raw personal content
proof-backed completion claims that avoid fake progress before local evidence exists
failure recovery that reports partial status and keeps retry boundaries clear
Scenarios
The machine-readable pack metadata lives in
extensions/qa-lab/src/scenario-packs.ts . Run the pack with
--pack personal-agent :
bash Copy code OPENCLAW_ENABLE_PRIVATE_QA_CLI=1 pnpm openclaw qa suite \ --provider-mode mock-openai \ --pack personal-agent \ --concurrency 1
--pack is additive with repeated --scenario flags. Explicit scenarios run
first, then the pack scenarios run in QA_PERSONAL_AGENT_SCENARIO_IDS order with
duplicates removed.
The pack is designed for qa-channel with mock-openai or another local QA
provider lane. It should not be pointed at live chat services or real personal
accounts.
Privacy Model
The scenarios use only fake users, fake preferences, fake secrets, and the
temporary QA gateway workspace created by the suite. They must not read or write
real OpenClaw user memory, sessions, credentials, launch agents, global configs,
or live gateway state.
Artifacts stay under the existing QA suite artifact directory and should be
treated like test output. Redaction checks use fake markers so failures are safe
to inspect and file in issues.
Extending The Pack
Add new .yaml cases under qa/scenarios/personal/ , then add the scenario id
to QA_PERSONAL_AGENT_SCENARIO_IDS . Keep each case small, local, deterministic
in mock-openai , and focused on one personal assistant behavior.
Good follow-up candidates:
redacted trajectory export checks
local-only plugin workflow checks
Avoid adding a new runner, plugin, dependency, live transport, or model judge
until the scenario catalog has enough stable cases to justify that surface.
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
