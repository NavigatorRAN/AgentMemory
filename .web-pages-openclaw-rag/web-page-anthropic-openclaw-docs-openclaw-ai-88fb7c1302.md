# Anthropic - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/providers/anthropic
- Final URL: https://docs.openclaw.ai/providers/anthropic
- Canonical URL: https://docs.openclaw.ai/providers/anthropic
- Fetched at: 2026-06-23T14:54:56Z
- Content type: text/html; charset=utf-8

## Description

Use Anthropic Claude via API keys or Claude CLI in OpenClaw

## Extracted Text

Close
Models Providers
Anthropic builds the Claude model family. OpenClaw supports two auth routes:
API key — direct Anthropic API access with usage-based billing ( anthropic/* models)
Claude CLI — reuse an existing Claude Code login on the same host
Warning
OpenClaw's Claude CLI backend runs the installed Claude Code CLI in
non-interactive print mode. Anthropic's current Claude Code docs describe
claude -p as Agent SDK/programmatic usage. Starting June 15, 2026, Anthropic
says subscription-plan claude -p usage no longer draws from normal Claude
plan limits; it draws from a separate monthly Agent SDK credit first, then from
usage credits at standard API rates when those credits are enabled.
Interactive Claude Code still draws from the signed-in Claude plan limits. API
key auth remains direct pay-as-you-go API billing. For long-lived gateway hosts,
shared automation, and predictable production spend, use an Anthropic API key.
Anthropic's current public docs:
Claude Code CLI reference
Use the Claude Agent SDK with your Claude plan
Use Claude Code with your Pro or Max plan
Use Claude Code with your Team or Enterprise plan
Manage Claude Code costs
Getting started
API key
Best for: standard API access and usage-based billing.
Get your API key
Create an API key in the Anthropic Console .
Run onboarding
bash Copy code openclaw onboard # choose: Anthropic API key
Or pass the key directly:
bash Copy code openclaw onboard --anthropic-api-key " $ANTHROPIC_API_KEY "
Verify the model is available
bash Copy code openclaw models list --provider anthropic
Config example
json5 Copy code { env : { ANTHROPIC_API_KEY : "example-anthropic-key-not-real" }, agents : { defaults : { model : { primary : "anthropic/claude-opus-4-8" } } }, }
Claude CLI
Best for: reusing an existing Claude CLI login without a separate API key.
Ensure Claude CLI is installed and logged in
Verify with:
bash Copy code claude --version
bash Copy code openclaw onboard # choose: Claude CLI
OpenClaw detects and reuses the existing Claude CLI credentials.
Note
Setup and runtime details for the Claude CLI backend are in CLI Backends .
Claude CLI reuse expects the OpenClaw process to run on the same host as the
Claude CLI login. Container installs such as Podman do
not mount host ~/.claude into setup or runtime; use an Anthropic API key
there, or choose a provider with OpenClaw-managed OAuth such as
OpenAI Codex .
Prefer the canonical Anthropic model ref plus a CLI runtime override:
json5 Copy code { agents : { defaults : { model : { primary : "anthropic/claude-opus-4-8" }, models : { "anthropic/claude-opus-4-8" : { agentRuntime : { id : "claude-cli" }, }, }, }, }, }
Legacy claude-cli/claude-opus-4-7 model refs still work for
compatibility, but new config should keep provider/model selection as
anthropic/* and put the execution backend in provider/model runtime policy.
Billing and claude -p
OpenClaw uses Claude Code's non-interactive claude -p path for Claude CLI
runs. Anthropic currently treats that path as Agent SDK/programmatic usage:
Until June 15, 2026, subscription-plan handling follows Anthropic's active
Claude Code rules for the signed-in account.
Starting June 15, 2026, subscription-plan claude -p usage draws from the
user's monthly Agent SDK credit first, then from usage credits at standard
API rates if usage credits are enabled.
Console/API-key logins use pay-as-you-go API billing and do not receive
the subscription Agent SDK credit.
Anthropic can change Claude Code billing and rate-limit behavior without an
OpenClaw release. Check claude auth status , /status , and
Anthropic's linked docs when billing predictability matters.
Tip
For shared production automation, use an Anthropic API key instead of
Claude CLI. OpenClaw also supports subscription-style options from
OpenAI Codex , Qwen Cloud ,
MiniMax , and Z.AI / GLM .
Thinking defaults (Claude Fable 5, 4.8, and 4.6)
anthropic/claude-fable-5 always uses adaptive thinking and defaults to high
effort. Because Anthropic does not allow thinking to be disabled for this model,
/think off and /think minimal use low effort. OpenClaw also omits custom
temperature values for Fable 5 requests.
Claude Opus 4.8 keeps thinking off by default in OpenClaw. When you explicitly enable adaptive thinking with /think high|xhigh|max , OpenClaw sends Anthropic's Opus 4.8 effort values; Claude 4.6 models default to adaptive .
Override per-message with /think:<level> or in model params:
json5 Copy code { agents : { defaults : { models : { "anthropic/claude-opus-4-8" : { params : { thinking : "high" }, }, }, }, }, } Note
Related Anthropic docs:
Adaptive thinking
Extended thinking
Prompt caching
OpenClaw supports Anthropic's prompt caching feature for API-key auth.
Value Cache duration Description "short" (default) 5 minutes Applied automatically for API-key auth "long" 1 hour Extended cache "none" No caching Disable prompt caching
json5 Copy code { agents : { defaults : { models : { "anthropic/claude-opus-4-6" : { params : { cacheRetention : "long" }, }, }, }, }, }
Per-agent cache overrides
Use model-level params as your baseline, then override specific agents via agents.list[].params :
json5 Copy code { agents : { defaults : { model : { primary : "anthropic/claude-opus-4-6" }, models : { "anthropic/claude-opus-4-6" : { params : { cacheRetention : "long" }, }, }, }, list : [ { id : "research" , default : true }, { id : "alerts" , params : { cacheRetention : "none" } }, ], }, }
Config merge order:
agents.defaults.models["provider/model"].params
agents.list[].params (matching id , overrides by key)
This lets one agent keep a long-lived cache while another agent on the same model disables caching for bursty/low-reuse traffic.
Bedrock Claude notes
Anthropic Claude models on Bedrock ( amazon-bedrock/*anthropic.claude* ) accept cacheRetention pass-through when configured.
Non-Anthropic Bedrock models are forced to cacheRetention: "none" at runtime.
API-key smart defaults also seed cacheRetention: "short" for Claude-on-Bedrock refs when no explicit value is set.
Advanced configuration
Fast mode
OpenClaw's shared /fast toggle supports direct Anthropic traffic (API-key and OAuth to api.anthropic.com ).
Command Maps to /fast on service_tier: "auto" /fast off service_tier: "standard_only"
json5 Copy code { agents : { defaults : { models : { "anthropic/claude-sonnet-4-6" : { params : { fastMode : true }, }, }, }, }, } Note
Only injected for direct api.anthropic.com requests. Proxy routes leave service_tier untouched.
Explicit serviceTier or service_tier params override /fast when both are set.
On accounts without Priority Tier capacity, service_tier: "auto" may resolve to standard .
Media understanding (image and PDF)
The bundled Anthropic plugin registers image and PDF understanding. OpenClaw
auto-resolves media capabilities from the configured Anthropic auth — no
additional config is needed.
Property Value Default model claude-opus-4-8 Supported input Images, PDF documents
When an image or PDF is attached to a conversation, OpenClaw automatically
routes it through the Anthropic media understanding provider.
1M context window
Anthropic's 1M context window is available on GA-capable Claude 4.x models
such as Opus 4.8, Opus 4.7, Opus 4.6, and Sonnet 4.6. OpenClaw sizes those models at
1M automatically:
json5 Copy code { agents : { defaults : { models : { "anthropic/claude-opus-4-6" : {}, }, }, }, }
Older configs can keep params.context1m: true , but OpenClaw no longer sends
the retired context-1m-2025-08-07 beta header. Older anthropicBeta config
entries with that value are ignored during request header resolution and
unsupported older Claude models stay on their normal context window.
params.context1m: true also applies to the Claude CLI backend
( claude-cli/* ) for eligible GA-capable Opus and Sonnet models, preserving
the runtime context window for those CLI sessions to match the direct-API
behavior.
Requires long-context access on your Anthropic credential. OAuth/subscription token auth keeps its required Anthropic beta headers, but OpenClaw strips the retired 1M beta header if it remains in older config.
Claude Opus 4.8 1M context
anthropic/claude-opus-4-8 and its claude-cli variant have a 1M context
window by default — no params.context1m: true needed.
Troubleshooting
401 errors / token suddenly invalid
Anthropic token auth expires and can be revoked. For new setups, use an Anthropic API key instead.
No API key found for provider "anthropic"
Anthropic auth is per agent — new agents do not inherit the main agent's keys. Re-run onboarding for that agent (or configure an API key on the gateway host), then verify with openclaw models status .
No credentials found for profile "anthropic:default"
Run openclaw models status to see which auth profile is active. Re-run onboarding, or configure an API key for that profile path.
No available auth profile (all in cooldown)
Check openclaw models status --json for auth.unusableProfiles . Anthropic rate-limit cooldowns can be model-scoped, so a sibling Anthropic model may still be usable. Add another Anthropic profile or wait for cooldown.
More help: Troubleshooting and FAQ .
Related
Model selection
Choosing providers, model refs, and failover behavior.
CLI backends
Claude CLI backend setup and runtime details.
How prompt caching works across providers.
OAuth and auth
Auth details and credential reuse rules.
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
