# Cohere - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/providers/cohere
- Final URL: https://docs.openclaw.ai/providers/cohere
- Canonical URL: https://docs.openclaw.ai/providers/cohere
- Fetched at: 2026-06-23T14:55:09Z
- Content type: text/html; charset=utf-8

## Description

Cohere setup (auth + model selection)

## Extracted Text

Close
Models Providers
Cohere provides OpenAI-compatible inference through its Compatibility API. OpenClaw ships the Cohere provider during its externalization transition and also publishes it as an official external plugin with the Command A model catalog.
Property Value Provider id cohere Plugin bundled during transition; official external package Auth env var COHERE_API_KEY Onboarding flag --auth-choice cohere-api-key Direct CLI flag --cohere-api-key <key> API OpenAI-compatible ( openai-completions ) Base URL https://api.cohere.ai/compatibility/v1 Default model cohere/command-a-03-2025
Get started
Cohere is included in current OpenClaw packages. If it is unavailable, install the external package and restart the Gateway:
bash Copy code openclaw plugins install @openclaw/cohere-provider openclaw gateway restart
Create a Cohere API key.
Run onboarding:
bash Copy code openclaw onboard --non-interactive \ --auth-choice cohere-api-key \ --cohere-api-key " $COHERE_API_KEY "
Confirm the catalog is available:
bash Copy code openclaw models list --provider cohere
The default model is set only when no primary model is already configured.
Environment-only setup
Make COHERE_API_KEY available to the Gateway process, then select the Cohere model:
json5 Copy code { agents : { defaults : { model : { primary : "cohere/command-a-03-2025" }, }, }, } Note
If the Gateway runs as a daemon or in Docker, configure COHERE_API_KEY for that service. Exporting it only in an interactive shell does not make it available to an already-running Gateway.
Related
Model providers
Models CLI
Provider directory
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
