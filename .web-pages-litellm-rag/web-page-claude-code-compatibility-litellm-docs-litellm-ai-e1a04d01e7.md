# Claude Code Compatibility | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/claude_code_compatibility
- Final URL: https://docs.litellm.ai/docs/claude_code_compatibility
- Canonical URL: https://docs.litellm.ai/docs/claude_code_compatibility
- Fetched at: 2026-06-23T14:22:59Z
- Content type: text/html; charset=utf-8

## Description

This table is regenerated daily by an automated populator that runs the

## Extracted Text

Skip to main content
On this page
Copy as Markdown
This table is regenerated daily by an automated populator that runs the
Claude Code CLI against
the latest stable LiteLLM proxy across each supported provider, with
Haiku 4.5, Sonnet 4.6, and Opus 4.7 in parallel. A cell goes green only
if all three model tiers pass.
litellm v1.83.14-stable claude code 2.1.126 generated 2026-06-15T06:16:28Z
Feature Anthropic Bedrock (Invoke) Bedrock (Converse) Vertex AI Azure (Foundry) Basic messaging (non-streaming) ✅ ✅ ❌ ✅ ✅ Basic messaging (streaming) ✅ ✅ ❌ ✅ ✅ Tool use ✅ ✅ ❌ ✅ ✅ Prompt caching (5m TTL) ✅ ✅ ❌ ✅ ✅ Vision ✅ ✅ ✅ ✅ ✅ Thinking ✅ ❌ ❌ ❌ ✅ Tool use (streaming / fine-grained) ✅ ✅ ❌ ✅ ✅ Extended thinking + tool use ✅ ✅ ❌ ✅ ✅ PDF document input ✅ ✅ ❌ ✅ ✅ Prompt caching (1h TTL) ✅ ✅ ❌ ✅ ✅ Web search (server tool) ✅ ✅ ❌ ✅ ✅ Structured outputs ✅ ✅ ❌ ✅ ✅ count_tokens endpoint ✅ ✅ ✅ ❌ ✅ Tool search (MCP discovery) ✅ ❌ ✅ ✅ ✅ Long context (1M) ✅ ✅ ✅ ✅ ✅
Legend ​
Glyph Meaning ✅ All three model tiers pass for this (feature, provider) cell. ❌ At least one model tier failed. Hover for the upstream error. — No test ran for this combination. n/a Not applicable (e.g. provider doesn't expose this feature). Hover for the reason.
Known issues ​
Red cells with a known root cause and a tracked fix are listed below. Each
entry stays here until the named fix has landed in a v*-stable release;
the next daily run after that tag is cut will flip the cells green and
the entry will be removed.
Opus 4.7 extended thinking on Bedrock Invoke + Vertex AI ​
Affected cells : extended_thinking × bedrock_invoke , extended_thinking × vertex_ai . Anthropic-native and Azure Foundry are unaffected on the same tier.
Symptom : Claude Code's --effort max flag is sent to the proxy as output_config.effort=max . The Bedrock Invoke and Vertex AI request transformers in v1.83.14-stable strip output_config.effort for Claude 4.6+ models that aren't on a small hardcoded allow-list, so the upstream request goes out without extended thinking enabled. The response has no thinking content block and the cell is marked failed.
Status : Fixed on main by commit a6c673e7b9 ( fix(anthropic,bedrock,vertex): forward output_config.effort + 400 on garbage reasoning_effort ). Waiting on the next v*-stable cut.
Bedrock Converse — Haiku 4.5 content-block validation ​
Affected cells : every * × bedrock_converse cell (the entire Converse column).
Symptom : Claude Haiku 4.5 routed through AWS Bedrock's Converse API returns Content block is not a text block on the first assistant message of every conversation. Because the matrix only marks a cell green when all three model tiers pass, this Haiku-only failure paints the whole Converse column red even for features that work on Sonnet 4.6 and Opus 4.7 through Converse.
Workaround : Route Haiku traffic through Bedrock Invoke (column to the left), which is green for the same feature set. Sonnet 4.6 and Opus 4.7 can continue to use Converse for those features.
Status : Under investigation in LiteLLM. Issue link pending.
Source ​
The matrix JSON lives at
src/data/compatibility-matrix.json .
The populator is in
tests/claude_code/cron_vm/
on the main repo.
Legend
Known issues
Opus 4.7 extended thinking on Bedrock Invoke + Vertex AI
Bedrock Converse — Haiku 4.5 content-block validation
Source
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
