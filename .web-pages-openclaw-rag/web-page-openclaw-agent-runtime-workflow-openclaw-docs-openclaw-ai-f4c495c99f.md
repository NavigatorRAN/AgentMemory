# OpenClaw agent runtime workflow - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/openclaw-agent-runtime
- Final URL: https://docs.openclaw.ai/openclaw-agent-runtime
- Canonical URL: https://docs.openclaw.ai/openclaw-agent-runtime
- Fetched at: 2026-06-23T14:49:15Z
- Content type: text/html; charset=utf-8

## Description

Developer workflow for OpenClaw agent runtime: build, test, and live validation

## Extracted Text

Close
Install Advanced setup
A sane workflow for working on the OpenClaw agent runtime in OpenClaw.
Type checking and linting
Default local gate: pnpm check
Build gate: pnpm build when the change can affect build output, packaging, or lazy-loading/module boundaries
Full landing gate for agent-runtime changes: pnpm check && pnpm test
Running Agent Runtime Tests
Run the agent-runtime test set directly with Vitest:
bash Copy code pnpm test \ "src/agents/agent-*.test.ts" \ "src/agents/embedded-agent-*.test.ts" \ "src/agents/agent-tools*.test.ts" \ "src/agents/agent-settings.test.ts" \ "src/agents/agent-tool-definition-adapter*.test.ts" \ "src/agents/agent-hooks/**/*.test.ts"
To include the live provider exercise:
bash Copy code OPENCLAW_LIVE_TEST=1 pnpm test src/agents/embedded-agent-runner-extraparams.live.test.ts
This covers the main agent runtime unit suites:
src/agents/agent-*.test.ts
src/agents/embedded-agent-*.test.ts
src/agents/agent-tools*.test.ts
src/agents/agent-settings.test.ts
src/agents/agent-tool-definition-adapter.test.ts
src/agents/agent-hooks/*.test.ts
Manual testing
Recommended flow:
Run the gateway in dev mode:
pnpm gateway:dev
Trigger the agent directly:
pnpm openclaw agent --message "Hello" --thinking low
Use the TUI for interactive debugging:
pnpm tui
For tool call behavior, prompt for a read or exec action so you can see tool streaming and payload handling.
Clean slate reset
State lives under the OpenClaw state directory. Default is ~/.openclaw . If OPENCLAW_STATE_DIR is set, use that directory instead.
To reset everything:
openclaw.json for config
agents/<agentId>/agent/auth-profiles.json for model auth profiles (API keys + OAuth)
credentials/ for provider/channel state that still lives outside the auth profile store
agents/<agentId>/sessions/ for agent session history
agents/<agentId>/sessions/sessions.json for the session index
sessions/ if legacy paths exist
workspace/ if you want a blank workspace
If you only want to reset sessions, delete agents/<agentId>/sessions/ for that agent. If you want to keep auth, leave agents/<agentId>/agent/auth-profiles.json and any provider state under credentials/ in place.
References
Testing
Getting Started
Related
OpenClaw agent runtime architecture
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
