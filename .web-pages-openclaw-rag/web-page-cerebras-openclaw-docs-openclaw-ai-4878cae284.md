# Cerebras - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/providers/cerebras
- Final URL: https://docs.openclaw.ai/providers/cerebras
- Canonical URL: https://docs.openclaw.ai/providers/cerebras
- Fetched at: 2026-06-23T14:55:03Z
- Content type: text/html; charset=utf-8

## Description

Cerebras setup (auth + model selection)

## Extracted Text

Close
Models Providers
Cerebras provides high-speed OpenAI-compatible inference on custom inference hardware. The Cerebras provider plugin includes a static four-model catalog.
Property Value Provider id cerebras Plugin official external package Auth env var CEREBRAS_API_KEY Onboarding flag --auth-choice cerebras-api-key Direct CLI flag --cerebras-api-key <key> API OpenAI-compatible ( openai-completions ) Base URL https://api.cerebras.ai/v1 Default model cerebras/zai-glm-4.7
Install plugin
Install the official plugin, then restart Gateway:
bash Copy code openclaw plugins install @openclaw/cerebras-provider openclaw gateway restart
Getting started
Get an API key
Create an API key in the Cerebras Cloud Console .
Run onboarding
Onboarding Copy code openclaw onboard --auth-choice cerebras-api-key Direct flag Copy code openclaw onboard --non-interactive \ --auth-choice cerebras-api-key \ --cerebras-api-key " $CEREBRAS_API_KEY " Env only Copy code export CEREBRAS_API_KEY=csk-...
Verify models are available
bash Copy code openclaw models list --provider cerebras
The list should include all four static models. If CEREBRAS_API_KEY is unresolved, openclaw models status --json reports the missing credential under auth.unusableProfiles .
Non-interactive setup
bash Copy code openclaw onboard --non-interactive \ --mode local \ --auth-choice cerebras-api-key \ --cerebras-api-key " $CEREBRAS_API_KEY "
Built-in catalog
OpenClaw ships a static Cerebras catalog that mirrors the public OpenAI-compatible endpoint. All four models share a 128k context and 8,192 max-output tokens.
Model ref Name Reasoning Notes cerebras/zai-glm-4.7 Z.ai GLM 4.7 yes Default model; preview reasoning model cerebras/gpt-oss-120b GPT OSS 120B yes Production reasoning model cerebras/qwen-3-235b-a22b-instruct-2507 Qwen 3 235B Instruct no Preview non-reasoning model cerebras/llama3.1-8b Llama 3.1 8B no Production speed-focused model
Warning
Cerebras marks zai-glm-4.7 and qwen-3-235b-a22b-instruct-2507 as preview models, and llama3.1-8b plus qwen-3-235b-a22b-instruct-2507 are documented for deprecation on May 27, 2026. Check Cerebras' supported-models page before relying on them for production workloads.
Manual config
The plugin usually means you only need the API key. Use explicit models.providers.cerebras config when you want to override model metadata or run in mode: "merge" against the static catalog:
json5 Copy code { env : { CEREBRAS_API_KEY : "csk-..." }, agents : { defaults : { model : { primary : "cerebras/zai-glm-4.7" }, }, }, models : { mode : "merge" , providers : { cerebras : { baseUrl : "https://api.cerebras.ai/v1" , apiKey : "${CEREBRAS_API_KEY}" , api : "openai-completions" , models : [ { id : "zai-glm-4.7" , name : "Z.ai GLM 4.7" }, { id : "gpt-oss-120b" , name : "GPT OSS 120B" }, ], }, }, }, } Note
If the Gateway runs as a daemon (launchd, systemd, Docker), make sure CEREBRAS_API_KEY is available to that process — for example in ~/.openclaw/.env or through env.shellEnv . A key exported only in an interactive shell will not help a managed service unless the env is imported separately.
Related
Model providers
Choosing providers, model refs, and failover behavior.
Thinking modes
Reasoning effort levels for the two reasoning-capable Cerebras models.
Configuration reference
Agent defaults and model configuration.
Models FAQ
Auth profiles, switching models, and resolving "no profile" errors.
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
