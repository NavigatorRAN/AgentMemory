# Perplexity - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/providers/perplexity-provider
- Final URL: https://docs.openclaw.ai/providers/perplexity-provider
- Canonical URL: https://docs.openclaw.ai/providers/perplexity-provider
- Fetched at: 2026-06-23T14:55:47Z
- Content type: text/html; charset=utf-8

## Description

Perplexity web search provider setup (API key, search modes, filtering)

## Extracted Text

Close
Models Providers
The Perplexity plugin provides web search capabilities through the Perplexity
Search API or Perplexity Sonar via OpenRouter.
Note
This page is the Perplexity provider setup. For the Perplexity tool (how the agent uses it), see Perplexity tool .
Property Value Type Web search provider (not a model provider) Auth PERPLEXITY_API_KEY (direct) or OPENROUTER_API_KEY (via OpenRouter) Config path plugins.entries.perplexity.config.webSearch.apiKey
Install plugin
Install the official plugin, then restart Gateway:
bash Copy code openclaw plugins install @openclaw/perplexity-plugin openclaw gateway restart
Getting started
Set the API key
Run the interactive web-search configuration flow:
bash Copy code openclaw configure --section web
Or set the key directly:
bash Copy code openclaw config set plugins.entries.perplexity.config.webSearch.apiKey "pplx-xxxxxxxxxxxx"
Start searching
The agent will automatically use Perplexity for web searches once the key is
configured. No additional steps are required.
Search modes
The plugin auto-selects the transport based on API key prefix:
Native Perplexity API (pplx-)
When your key starts with pplx- , OpenClaw uses the native Perplexity Search
API. This transport returns structured results and supports domain, language,
and date filters (see filtering options below).
OpenRouter / Sonar (sk-or-)
When your key starts with sk-or- , OpenClaw routes through OpenRouter using
the Perplexity Sonar model. This transport returns AI-synthesized answers with
citations.
Key prefix Transport Features pplx- Native Perplexity Search API Structured results, domain/language/date filters sk-or- OpenRouter (Sonar) AI-synthesized answers with citations
Native API filtering
Filtering options are only available when using the native Perplexity API
( pplx- key). OpenRouter/Sonar searches do not support these parameters.
When using the native Perplexity API, searches support the following filters:
Filter Description Example Country 2-letter country code us , de , jp Language ISO 639-1 language code en , fr , zh Date range Recency window day , week , month , year Domain filters Allowlist or denylist (max 20 domains) example.com Content budget Token limits per response / per page max_tokens , max_tokens_per_page
Advanced configuration
Environment variable for daemon processes
If the OpenClaw Gateway runs as a daemon (launchd/systemd), make sure
PERPLEXITY_API_KEY is available to that process.
Warning
A key exported only in an interactive shell will not be visible to a
launchd/systemd daemon unless that environment is explicitly imported. Set
the key in ~/.openclaw/.env or via env.shellEnv to ensure the gateway
process can read it.
OpenRouter proxy setup
If you prefer to route Perplexity searches through OpenRouter, set an
OPENROUTER_API_KEY (prefix sk-or- ) instead of a native Perplexity key.
OpenClaw will detect the prefix and switch to the Sonar transport
automatically.
Tip
The OpenRouter transport is useful if you already have an OpenRouter account
and want consolidated billing across multiple providers.
Related
Perplexity search tool
How the agent invokes Perplexity searches and interprets results.
Configuration reference
Full configuration reference including plugin entries.
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
