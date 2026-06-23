# OpenCode - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/providers/opencode
- Final URL: https://docs.openclaw.ai/providers/opencode
- Canonical URL: https://docs.openclaw.ai/providers/opencode
- Fetched at: 2026-06-23T14:55:43Z
- Content type: text/html; charset=utf-8

## Description

Use OpenCode Zen and Go catalogs with OpenClaw

## Extracted Text

Close
Models Providers
OpenCode exposes two hosted catalogs in OpenClaw:
Catalog Prefix Runtime provider Zen opencode/... opencode Go opencode-go/... opencode-go
Both catalogs use the same OpenCode API key. OpenClaw keeps the runtime provider ids
split so upstream per-model routing stays correct, but onboarding and docs treat them
as one OpenCode setup.
Getting started
Zen catalog
Best for: the curated OpenCode multi-model proxy (Claude, GPT, Gemini).
Run onboarding
bash Copy code openclaw onboard --auth-choice opencode-zen
Or pass the key directly:
bash Copy code openclaw onboard --opencode-zen-api-key " $OPENCODE_API_KEY "
Set a Zen model as the default
bash Copy code openclaw config set agents.defaults.model.primary "opencode/claude-opus-4-6"
Verify models are available
bash Copy code openclaw models list --provider opencode
Go catalog
Best for: the OpenCode-hosted Kimi, GLM, and MiniMax lineup.
bash Copy code openclaw onboard --auth-choice opencode-go
bash Copy code openclaw onboard --opencode-go-api-key " $OPENCODE_API_KEY "
Set a Go model as the default
bash Copy code openclaw config set agents.defaults.model.primary "opencode-go/kimi-k2.6"
bash Copy code openclaw models list --provider opencode-go
Config example
json5 Copy code { env : { OPENCODE_API_KEY : "sk-..." }, agents : { defaults : { model : { primary : "opencode/claude-opus-4-6" } } }, }
Built-in catalogs
Zen
Property Value Runtime provider opencode Example models opencode/claude-opus-4-6 , opencode/gpt-5.5 , opencode/gemini-3-pro
Go
Property Value Runtime provider opencode-go Example models opencode-go/kimi-k2.6 , opencode-go/glm-5 , opencode-go/minimax-m2.5
Advanced configuration
API key aliases
OPENCODE_ZEN_API_KEY is also supported as an alias for OPENCODE_API_KEY .
Shared credentials
Entering one OpenCode key during setup stores credentials for both runtime
providers. You do not need to onboard each catalog separately.
Billing and dashboard
You sign in to OpenCode, add billing details, and copy your API key. Billing
and catalog availability are managed from the OpenCode dashboard.
Gemini replay behavior
Gemini-backed OpenCode refs stay on the proxy-Gemini path, so OpenClaw keeps
Gemini thought-signature sanitation there without enabling native Gemini
replay validation or bootstrap rewrites.
Non-Gemini replay behavior
Non-Gemini OpenCode refs keep the minimal OpenAI-compatible replay policy.
Tip
Entering one OpenCode key during setup stores credentials for both the Zen and
Go runtime providers, so you only need to onboard once.
Related
Model selection
Choosing providers, model refs, and failover behavior.
Configuration reference
Full config reference for agents, models, and providers.
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
