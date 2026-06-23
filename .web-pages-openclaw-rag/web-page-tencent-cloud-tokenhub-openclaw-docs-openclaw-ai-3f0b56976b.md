# Tencent Cloud (TokenHub) - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/providers/tencent
- Final URL: https://docs.openclaw.ai/providers/tencent
- Canonical URL: https://docs.openclaw.ai/providers/tencent
- Fetched at: 2026-06-23T14:55:59Z
- Content type: text/html; charset=utf-8

## Description

Tencent Cloud TokenHub setup for Hy3 preview

## Extracted Text

Close
Models Providers
Install the official Tencent Cloud provider plugin to access Tencent Hy3 preview through the TokenHub endpoint ( tencent-tokenhub ) using an OpenAI-compatible API.
Property Value Provider id tencent-tokenhub Package @openclaw/tencent-provider Auth env var TOKENHUB_API_KEY Onboarding flag --auth-choice tokenhub-api-key Direct CLI flag --tokenhub-api-key <key> API OpenAI-compatible ( openai-completions ) Default base URL https://tokenhub.tencentmaas.com/v1 Global base URL https://tokenhub-intl.tencentmaas.com/v1 (override) Default model tencent-tokenhub/hy3-preview
Quick start
Install the plugin
bash Copy code openclaw plugins install @openclaw/tencent-provider
Create a TokenHub API key
Create an API key in Tencent Cloud TokenHub. If you choose a limited access scope for the key, include Hy3 preview in the allowed models.
Run onboarding
Onboarding Copy code openclaw onboard --auth-choice tokenhub-api-key Direct flag Copy code openclaw onboard --non-interactive \ --auth-choice tokenhub-api-key \ --tokenhub-api-key " $TOKENHUB_API_KEY " Env only Copy code export TOKENHUB_API_KEY=...
Verify the model
bash Copy code openclaw models list --provider tencent-tokenhub
Non-interactive setup
bash Copy code openclaw onboard --non-interactive \ --mode local \ --auth-choice tokenhub-api-key \ --tokenhub-api-key " $TOKENHUB_API_KEY " \ --skip-health \ --accept-risk
Built-in catalog
Model ref Name Input Context Max output Notes tencent-tokenhub/hy3-preview Hy3 preview (TokenHub) text 256,000 64,000 Default; reasoning-enabled
Hy3 preview is Tencent Hunyuan's large MoE language model for reasoning, long-context instruction following, code, and agent workflows. Tencent's OpenAI-compatible examples use hy3-preview as the model id and support standard chat-completions tool calling plus reasoning_effort .
Tip
The model id is hy3-preview . Do not confuse it with Tencent's HY-3D-* models, which are 3D generation APIs and are not the OpenClaw chat model configured by this provider.
Tiered pricing
The provider catalog ships tiered cost metadata that scales with input window length, so cost estimates are populated without manual overrides.
Input tokens range Input rate Output rate Cache read 0 - 16,000 0.176 0.587 0.059 16,000 - 32,000 0.235 0.939 0.088 32,000+ 0.293 1.173 0.117
Rates are per million tokens in USD as advertised by Tencent. Override pricing under models.providers.tencent-tokenhub only when you need a different surface.
Advanced configuration
Endpoint override
OpenClaw defaults to Tencent Cloud's https://tokenhub.tencentmaas.com/v1 endpoint. Tencent also documents an international TokenHub endpoint:
bash Copy code openclaw config set models.providers.tencent-tokenhub.baseUrl "https://tokenhub-intl.tencentmaas.com/v1"
Only override the endpoint when your TokenHub account or region requires it.
Environment availability for the daemon
If the Gateway runs as a managed service (launchd, systemd, Docker), TOKENHUB_API_KEY must be visible to that process. Set it in ~/.openclaw/.env or via env.shellEnv so launchd, systemd, or Docker exec environments can read it.
Warning
Keys exported only in an interactive shell are not visible to managed gateway processes. Use the env file or config seam for persistent availability.
Related
Model providers
Choosing providers, model refs, and failover behavior.
Configuration reference
Full config schema including provider settings.
Tencent TokenHub
Tencent Cloud's TokenHub product page.
Hy3 preview model card
Tencent Hunyuan Hy3 preview details and benchmarks.
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
