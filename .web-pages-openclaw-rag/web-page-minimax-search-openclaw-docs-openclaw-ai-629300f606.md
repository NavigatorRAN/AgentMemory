# MiniMax search - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/tools/minimax-search
- Final URL: https://docs.openclaw.ai/tools/minimax-search
- Canonical URL: https://docs.openclaw.ai/tools/minimax-search
- Fetched at: 2026-06-23T14:58:00Z
- Content type: text/html; charset=utf-8

## Description

MiniMax Search via the Token Plan search API

## Extracted Text

Close
Capabilities Tools
OpenClaw supports MiniMax as a web_search provider through the MiniMax
Token Plan search API. It returns structured search results with titles, URLs,
snippets, and related queries.
Get a Token Plan credential
Create a key
Create or copy a MiniMax Token Plan key from
MiniMax Platform .
OAuth setups can reuse MINIMAX_OAUTH_TOKEN instead.
Store the key
Set MINIMAX_CODE_PLAN_KEY in the Gateway environment, or configure via:
bash Copy code openclaw configure --section web
OpenClaw also accepts MINIMAX_CODING_API_KEY , MINIMAX_OAUTH_TOKEN , and
MINIMAX_API_KEY as env aliases. MINIMAX_API_KEY should point at a
search-enabled Token Plan credential; ordinary MiniMax model API keys may not
be accepted by the Token Plan search endpoint.
Config
json5 Copy code { plugins : { entries : { minimax : { config : { webSearch : { apiKey : "sk-cp-..." , // optional if a MiniMax Token Plan env var is set region : "global" , // or "cn" }, }, }, }, }, tools : { web : { search : { provider : "minimax" , }, }, }, }
Environment alternative: set MINIMAX_CODE_PLAN_KEY , MINIMAX_CODING_API_KEY ,
MINIMAX_OAUTH_TOKEN , or MINIMAX_API_KEY in the Gateway environment.
For a gateway install, put it in ~/.openclaw/.env .
Region selection
MiniMax Search uses these endpoints:
Global: https://api.minimax.io/v1/coding_plan/search
CN: https://api.minimaxi.com/v1/coding_plan/search
If plugins.entries.minimax.config.webSearch.region is unset, OpenClaw resolves
the region in this order:
tools.web.search.minimax.region / plugin-owned webSearch.region
MINIMAX_API_HOST
models.providers.minimax.baseUrl
models.providers.minimax-portal.baseUrl
That means CN onboarding or MINIMAX_API_HOST=https://api.minimaxi.com/...
automatically keeps MiniMax Search on the CN host too.
Even when you authenticated MiniMax through the OAuth minimax-portal path,
web search still registers as provider id minimax ; the OAuth provider base URL
is used as a region hint for CN/global host selection, and MINIMAX_OAUTH_TOKEN
can satisfy the MiniMax Search bearer credential.
Supported parameters
Parameter Type Constraints Description query string required Search query string. count integer 1-10 Number of results to return. OpenClaw trims the returned list to this size.
Provider-specific filters are not currently supported.
Related
Web Search overview -- all providers and auto-detection
MiniMax -- model, image, speech, and auth setup
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
