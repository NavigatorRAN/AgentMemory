# DuckDuckGo search - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/tools/duckduckgo-search
- Final URL: https://docs.openclaw.ai/tools/duckduckgo-search
- Canonical URL: https://docs.openclaw.ai/tools/duckduckgo-search
- Fetched at: 2026-06-23T14:57:41Z
- Content type: text/html; charset=utf-8

## Description

DuckDuckGo web search -- key-free provider (experimental, HTML-based)

## Extracted Text

Close
Capabilities Tools
OpenClaw supports DuckDuckGo as a key-free web_search provider. No API
key or account is required.
Warning
DuckDuckGo is an experimental, unofficial integration that pulls results
from DuckDuckGo's non-JavaScript search pages - not an official API. Expect
occasional breakage from bot-challenge pages or HTML changes.
Setup
No API key needed - just set DuckDuckGo as your provider:
Configure
bash Copy code openclaw configure --section web # Select "duckduckgo" as the provider
Config
json5 Copy code { tools : { web : { search : { provider : "duckduckgo" , }, }, }, }
Optional plugin-level settings for region and SafeSearch:
json5 Copy code { plugins : { entries : { duckduckgo : { config : { webSearch : { region : "us-en" , // DuckDuckGo region code safeSearch : "moderate" , // "strict", "moderate", or "off" }, }, }, }, }, }
Tool parameters
Search query.
Results to return (1-10).
DuckDuckGo region code (e.g. us-en , uk-en , de-de ).
SafeSearch level.
Region and SafeSearch can also be set in plugin config (see above) - tool
parameters override config values per-query.
Notes
No API key - works after you select DuckDuckGo as your web_search
provider
Experimental - gathers results from DuckDuckGo's non-JavaScript HTML
search pages, not an official API or SDK
Bot-challenge risk - DuckDuckGo may serve CAPTCHAs or block requests
under heavy or automated use
HTML parsing - results depend on page structure, which can change without
notice
Explicit selection - OpenClaw does not choose DuckDuckGo automatically
when no API-backed provider is configured
SafeSearch defaults to moderate when not configured
Tip
For production use, consider Brave Search (free tier
available) or another API-backed provider.
Related
Web Search overview -- all providers and auto-detection
Brave Search -- structured results with free tier
Exa Search -- neural search with content extraction
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
