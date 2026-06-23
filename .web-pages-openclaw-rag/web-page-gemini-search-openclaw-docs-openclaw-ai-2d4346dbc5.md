# Gemini search - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/tools/gemini-search
- Final URL: https://docs.openclaw.ai/tools/gemini-search
- Canonical URL: https://docs.openclaw.ai/tools/gemini-search
- Fetched at: 2026-06-23T14:57:49Z
- Content type: text/html; charset=utf-8

## Description

Gemini web search with Google Search grounding

## Extracted Text

Close
Capabilities Tools
OpenClaw supports Gemini models with built-in
Google Search grounding ,
which returns AI-synthesized answers backed by live Google Search results with
citations.
Get an API key
Create a key
Go to Google AI Studio and create an
API key.
Store the key
Set GEMINI_API_KEY in the Gateway environment, reuse
models.providers.google.apiKey , or configure a dedicated web-search key via:
bash Copy code openclaw configure --section web
Config
json5 Copy code { plugins : { entries : { google : { config : { webSearch : { apiKey : "AIza..." , // optional if GEMINI_API_KEY or models.providers.google.apiKey is set baseUrl : "https://generativelanguage.googleapis.com/v1beta" , // optional; falls back to models.providers.google.baseUrl model : "gemini-2.5-flash" , // default }, }, }, }, }, tools : { web : { search : { provider : "gemini" , }, }, }, }
Credential precedence: Gemini web search uses
plugins.entries.google.config.webSearch.apiKey first, then GEMINI_API_KEY ,
then models.providers.google.apiKey . For base URLs, the dedicated
plugins.entries.google.config.webSearch.baseUrl wins before
models.providers.google.baseUrl .
For a gateway install, put env keys in ~/.openclaw/.env .
How it works
Unlike traditional search providers that return a list of links and snippets,
Gemini uses Google Search grounding to produce AI-synthesized answers with
inline citations. The results include both the synthesized answer and the source
URLs.
Citation URLs from Gemini grounding are automatically resolved from Google
redirect URLs to direct URLs.
Redirect resolution uses the SSRF guard path (HEAD + redirect checks +
http/https validation) before returning the final citation URL.
Redirect resolution uses strict SSRF defaults, so redirects to
private/internal targets are blocked.
Supported parameters
Gemini search supports query , freshness , date_after , and date_before .
count is accepted for shared web_search compatibility, but Gemini grounding
still returns one synthesized answer with citations rather than an N-result
list.
freshness accepts day , week , month , year , and the shared shortcuts
pd , pw , pm , and py . day / pd adds a recency instruction to the Gemini
query instead of a hard 24-hour range. week , month , year , and explicit
date_after / date_before ranges set Gemini Google Search grounding's
timeRangeFilter . country , language , and domain_filter are not supported.
Model selection
The default model is gemini-2.5-flash (fast and cost-effective). Any Gemini
model that supports grounding can be used via
plugins.entries.google.config.webSearch.model .
Base URL overrides
Set plugins.entries.google.config.webSearch.baseUrl when Gemini web search
must route through an operator proxy or custom Gemini-compatible endpoint. If
that is unset, Gemini web search reuses models.providers.google.baseUrl . A plain
https://generativelanguage.googleapis.com value is normalized to
https://generativelanguage.googleapis.com/v1beta ; custom proxy paths are kept
as provided after trimming trailing slashes.
Related
Web Search overview -- all providers and auto-detection
Brave Search -- structured results with snippets
Perplexity Search -- structured results + content extraction
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
