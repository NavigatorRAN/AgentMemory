# Qwen OAuth / Portal - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/providers/qwen-oauth
- Final URL: https://docs.openclaw.ai/providers/qwen-oauth
- Canonical URL: https://docs.openclaw.ai/providers/qwen-oauth
- Fetched at: 2026-06-23T14:55:52Z
- Content type: text/html; charset=utf-8

## Description

Use the Qwen Portal provider id with OpenClaw

## Extracted Text

Close
Models Providers
qwen-oauth is the Qwen Portal provider id. It targets the Qwen Portal endpoint
and keeps older Qwen OAuth / portal setups addressable through a distinct
provider id.
Use this provider when you specifically have a current Qwen Portal token for
https://portal.qwen.ai/v1 , or when you are migrating an older Qwen Portal /
Qwen CLI setup and want to keep those credentials separate from the canonical
Qwen Cloud provider. It is not the recommended first choice for new Qwen users.
For new Qwen Cloud setups, prefer Qwen with the Standard
ModelStudio endpoint unless you specifically have a current Qwen Portal token.
Setup
Provide your portal token through onboarding:
bash Copy code openclaw onboard --auth-choice qwen-oauth
Or set:
bash Copy code export QWEN_API_KEY= "<your-qwen-portal-token>" # pragma: allowlist secret
Defaults
Provider: qwen-oauth
Aliases: qwen-portal , qwen-cli
Base URL: https://portal.qwen.ai/v1
Env var: QWEN_API_KEY
API style: OpenAI-compatible
Default model: qwen-oauth/qwen3.5-plus
How this differs from Qwen
OpenClaw has two Qwen-facing provider ids:
Provider Endpoint family Best for qwen Qwen Cloud / Alibaba DashScope and Coding Plan endpoints New API-key setups, Standard pay-as-you-go, Coding Plan, multimodal DashScope features qwen-oauth Qwen Portal endpoint at portal.qwen.ai/v1 Existing Qwen Portal tokens and legacy Qwen OAuth / CLI setups
Both providers use OpenAI-compatible request shapes, but they are separate auth
surfaces. A token stored for qwen-oauth should not be treated as a DashScope
or ModelStudio key, and a new DashScope key should use the canonical qwen
provider instead.
When to choose Qwen OAuth / Portal
You already have a working Qwen Portal token.
You are preserving a legacy Qwen OAuth or Qwen CLI workflow while moving to
OpenClaw's provider model.
You need to test compatibility with the Qwen Portal endpoint specifically.
Choose Qwen for new setup, broader endpoint choices, Standard
ModelStudio, Coding Plan, and the full Qwen plugin catalog.
Models
The Qwen plugin catalog seeds the Qwen Portal default:
qwen-oauth/qwen3.5-plus
Availability depends on the current Qwen Portal account and token. If your
account uses ModelStudio / DashScope API keys instead, configure the canonical
qwen provider:
bash Copy code openclaw onboard --auth-choice qwen-standard-api-key openclaw models set qwen/qwen3-coder-plus
Migration
Legacy Qwen Portal OAuth profiles may not be refreshable. If a portal profile
stops working, re-authenticate with a current token or switch to the Standard
Qwen provider:
bash Copy code openclaw onboard --auth-choice qwen-standard-api-key
Standard global ModelStudio uses:
text Copy code https://dashscope-intl.aliyuncs.com/compatible-mode/v1
Troubleshooting
Portal OAuth refresh failures: legacy Qwen Portal OAuth profiles may not be
refreshable. Re-run onboarding with a current token.
Wrong endpoint errors: confirm the model ref starts with qwen-oauth/ when
using a portal token. Use qwen/ refs only for the canonical Qwen provider.
QWEN_API_KEY confusion: both Qwen pages mention this env var, but onboarding
stores credentials under the selected provider id. Prefer onboarding when you
keep both qwen and qwen-oauth available on the same machine.
Related
Qwen
Alibaba Model Studio
Model providers
All providers
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
