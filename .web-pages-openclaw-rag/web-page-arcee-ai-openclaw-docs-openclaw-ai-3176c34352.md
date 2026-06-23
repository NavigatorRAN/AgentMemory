# Arcee AI - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/providers/arcee
- Final URL: https://docs.openclaw.ai/providers/arcee
- Canonical URL: https://docs.openclaw.ai/providers/arcee
- Fetched at: 2026-06-23T14:54:57Z
- Content type: text/html; charset=utf-8

## Description

Arcee AI setup (auth + model selection)

## Extracted Text

Close
Models Providers
Arcee AI provides access to the Trinity family of mixture-of-experts models through an OpenAI-compatible API. All Trinity models are Apache 2.0 licensed.
Arcee AI models can be accessed directly via the Arcee platform or through OpenRouter .
Property Value Provider arcee Auth ARCEEAI_API_KEY (direct) or OPENROUTER_API_KEY (via OpenRouter) API OpenAI-compatible Base URL https://api.arcee.ai/api/v1 (direct) or https://openrouter.ai/api/v1 (OpenRouter)
Install plugin
Install the official plugin, then restart Gateway:
bash Copy code openclaw plugins install @openclaw/arcee-provider openclaw gateway restart
Getting started
Direct (Arcee platform)
Get an API key
Create an API key at Arcee AI .
Run onboarding
bash Copy code openclaw onboard --auth-choice arceeai-api-key
Set a default model
json5 Copy code { agents : { defaults : { model : { primary : "arcee/trinity-large-thinking" }, }, }, }
Via OpenRouter
Create an API key at OpenRouter .
bash Copy code openclaw onboard --auth-choice arceeai-openrouter
The same model refs work for both direct and OpenRouter setups (for example arcee/trinity-large-thinking ).
Non-interactive setup
bash Copy code openclaw onboard --non-interactive \ --mode local \ --auth-choice arceeai-api-key \ --arceeai-api-key " $ARCEEAI_API_KEY "
bash Copy code openclaw onboard --non-interactive \ --mode local \ --auth-choice arceeai-openrouter \ --openrouter-api-key " $OPENROUTER_API_KEY "
Built-in catalog
OpenClaw currently ships this Arcee static catalog:
Model ref Name Input Context Cost (in/out per 1M) Notes arcee/trinity-large-thinking Trinity Large Thinking text 256K $0.25 / $0.90 Default model; reasoning enabled arcee/trinity-large-preview Trinity Large Preview text 128K $0.25 / $1.00 General-purpose; 400B params, 13B active arcee/trinity-mini Trinity Mini 26B text 128K $0.045 / $0.15 Fast and cost-efficient; function calling
Tip
The onboarding preset sets arcee/trinity-large-thinking as the default model.
Supported features
Feature Supported Streaming Yes Tool use / function calling Yes (Trinity Mini, Trinity Large Preview) Structured output (JSON mode and JSON schema) Yes Extended thinking Yes (Trinity Large Thinking; tools disabled)
Environment note
If the Gateway runs as a daemon (launchd/systemd), make sure ARCEEAI_API_KEY
(or OPENROUTER_API_KEY ) is available to that process (for example, in
~/.openclaw/.env or via env.shellEnv ).
OpenRouter routing
When using Arcee models via OpenRouter, the same arcee/* model refs apply.
OpenClaw handles routing transparently based on your auth choice. See the
OpenRouter provider docs for OpenRouter-specific
configuration details.
Related
OpenRouter
Access Arcee models and many others through a single API key.
Model selection
Choosing providers, model refs, and failover behavior.
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
