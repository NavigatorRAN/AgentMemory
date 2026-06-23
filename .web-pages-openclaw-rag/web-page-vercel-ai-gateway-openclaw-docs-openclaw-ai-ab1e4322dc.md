# Vercel AI gateway - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/providers/vercel-ai-gateway
- Final URL: https://docs.openclaw.ai/providers/vercel-ai-gateway
- Canonical URL: https://docs.openclaw.ai/providers/vercel-ai-gateway
- Fetched at: 2026-06-23T14:56:03Z
- Content type: text/html; charset=utf-8

## Description

Vercel AI Gateway setup (auth + model selection)

## Extracted Text

Close
Models Providers
The Vercel AI Gateway provides a unified API to
access hundreds of models through a single endpoint.
Property Value Provider vercel-ai-gateway Package @openclaw/vercel-ai-gateway-provider Auth AI_GATEWAY_API_KEY API Anthropic Messages compatible Model catalog Auto-discovered via /v1/models
Tip
OpenClaw auto-discovers the Gateway /v1/models catalog, so
/models vercel-ai-gateway includes current model refs such as
vercel-ai-gateway/openai/gpt-5.5 and
vercel-ai-gateway/moonshotai/kimi-k2.6 .
Getting started
Install the plugin
bash Copy code openclaw plugins install @openclaw/vercel-ai-gateway-provider
Set the API key
Run onboarding and choose the AI Gateway auth option:
bash Copy code openclaw onboard --auth-choice ai-gateway-api-key
Set a default model
Add the model to your OpenClaw config:
json5 Copy code { agents : { defaults : { model : { primary : "vercel-ai-gateway/anthropic/claude-opus-4.6" }, }, }, }
Verify the model is available
bash Copy code openclaw models list --provider vercel-ai-gateway
Non-interactive example
For scripted or CI setups, pass all values on the command line:
bash Copy code openclaw onboard --non-interactive \ --mode local \ --auth-choice ai-gateway-api-key \ --ai-gateway-api-key " $AI_GATEWAY_API_KEY "
Model ID shorthand
OpenClaw accepts Vercel Claude shorthand model refs and normalizes them at
runtime:
Shorthand input Normalized model ref vercel-ai-gateway/claude-opus-4.6 vercel-ai-gateway/anthropic/claude-opus-4.6 vercel-ai-gateway/opus-4.6 vercel-ai-gateway/anthropic/claude-opus-4-6
You can use either the shorthand or the fully qualified model ref in your
configuration. OpenClaw resolves the canonical form automatically.
Advanced configuration
Environment variable for daemon processes
If the OpenClaw Gateway runs as a daemon (launchd/systemd), make sure
AI_GATEWAY_API_KEY is available to that process.
Warning
A key exported only in an interactive shell will not be visible to a
launchd/systemd daemon unless that environment is explicitly imported. Set
the key in ~/.openclaw/.env or via env.shellEnv to ensure the gateway
process can read it.
Provider routing
Vercel AI Gateway routes requests to the upstream provider based on the model
ref prefix. For example, vercel-ai-gateway/anthropic/claude-opus-4.6 routes
through Anthropic, while vercel-ai-gateway/openai/gpt-5.5 routes through
OpenAI and vercel-ai-gateway/moonshotai/kimi-k2.6 routes through
MoonshotAI. Your single AI_GATEWAY_API_KEY handles authentication for all
upstream providers.
Thinking levels
/think options follow trusted upstream model prefixes when OpenClaw knows
the upstream provider contract. vercel-ai-gateway/anthropic/... uses the
Claude thinking profile, including adaptive defaults for Claude 4.6 models.
vercel-ai-gateway/openai/gpt-5.4 , gpt-5.5 , and Codex-style refs expose
/think xhigh just like the direct OpenAI/OpenAI Codex providers. Other
namespaced refs keep the normal reasoning levels unless their catalog
metadata declares more.
Related
Model selection
Choosing providers, model refs, and failover behavior.
Troubleshooting
General troubleshooting and FAQ.
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
