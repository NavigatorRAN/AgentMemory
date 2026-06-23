# Firecrawl - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/tools/firecrawl
- Final URL: https://docs.openclaw.ai/tools/firecrawl
- Canonical URL: https://docs.openclaw.ai/tools/firecrawl
- Fetched at: 2026-06-23T14:57:48Z
- Content type: text/html; charset=utf-8

## Description

Firecrawl search, scrape, and web_fetch fallback

## Extracted Text

Close
Capabilities Tools
OpenClaw can use Firecrawl in three ways:
as the web_search provider
as explicit plugin tools: firecrawl_search and firecrawl_scrape
as a fallback extractor for web_fetch
It is a hosted extraction/search service that supports bot circumvention and caching,
which helps with JS-heavy sites or pages that block plain HTTP fetches.
Install plugin
Install the official plugin, then restart Gateway:
bash Copy code openclaw plugins install @openclaw/firecrawl-plugin openclaw gateway restart
Keyless web_fetch and API keys
The explicitly selected hosted Firecrawl web_fetch fallback supports starter
access without an API key. Add FIRECRAWL_API_KEY in the gateway environment
or configure it when you need higher limits. Firecrawl web_search and
firecrawl_scrape require an API key.
Configure Firecrawl search
json5 Copy code { tools : { web : { search : { provider : "firecrawl" , }, }, }, plugins : { entries : { firecrawl : { enabled : true , config : { webSearch : { apiKey : "FIRECRAWL_API_KEY_HERE" , baseUrl : "https://api.firecrawl.dev" , }, }, }, }, }, }
Notes:
Choosing Firecrawl in onboarding or openclaw configure --section web enables the installed Firecrawl plugin automatically.
web_search with Firecrawl supports query and count .
For Firecrawl-specific controls like sources , categories , or result scraping, use firecrawl_search .
baseUrl defaults to hosted Firecrawl at https://api.firecrawl.dev . Self-hosted overrides are allowed only for private/internal endpoints; HTTP is accepted only for those private targets.
FIRECRAWL_BASE_URL is the shared env fallback for Firecrawl search and scrape base URLs.
Configure Firecrawl web_fetch fallback
json5 Copy code { tools : { web : { fetch : { provider : "firecrawl" , // explicit selection enables keyless fallback }, }, }, plugins : { entries : { firecrawl : { enabled : true , config : { webFetch : { baseUrl : "https://api.firecrawl.dev" , onlyMainContent : true , maxAgeMs : 172800000 , timeoutSeconds : 60 , }, }, }, }, }, }
The explicitly selected Firecrawl web_fetch fallback works without an API key. When configured, OpenClaw sends plugins.entries.firecrawl.config.webFetch.apiKey or FIRECRAWL_API_KEY for higher limits.
Choosing Firecrawl during onboarding or openclaw configure --section web enables the plugin and selects Firecrawl for web_fetch unless another fetch provider is already configured.
firecrawl_scrape requires an API key.
maxAgeMs controls how old cached results can be (ms). Default is 2 days.
Legacy tools.web.fetch.firecrawl.* config is auto-migrated by openclaw doctor --fix .
Firecrawl scrape/base URL overrides follow the same hosted/private rule as search: public hosted traffic uses https://api.firecrawl.dev ; self-hosted overrides must resolve to private/internal endpoints.
firecrawl_scrape rejects obvious private, loopback, metadata, and non-HTTP(S) target URLs before forwarding them to Firecrawl, matching the web_fetch target-safety contract for explicit Firecrawl scrape calls.
firecrawl_scrape reuses the same plugins.entries.firecrawl.config.webFetch.* settings and env vars, including its required API key.
Self-hosted Firecrawl
Set plugins.entries.firecrawl.config.webSearch.baseUrl ,
plugins.entries.firecrawl.config.webFetch.baseUrl , or FIRECRAWL_BASE_URL
when you run Firecrawl yourself. OpenClaw accepts http:// only for loopback,
private-network, .local , .internal , or .localhost targets. Public custom
hosts are rejected so Firecrawl API keys are not sent to arbitrary endpoints by
accident.
Firecrawl plugin tools
firecrawl_search
Use this when you want Firecrawl-specific search controls instead of generic web_search .
Core parameters:
query
count
sources
categories
scrapeResults
timeoutSeconds
firecrawl_scrape
Use this for JS-heavy or bot-protected pages where plain web_fetch is weak.
url
extractMode
maxChars
onlyMainContent
maxAgeMs
proxy
storeInCache
Stealth / bot circumvention
Firecrawl exposes a proxy mode parameter for bot circumvention ( basic , stealth , or auto ).
OpenClaw always uses proxy: "auto" plus storeInCache: true for Firecrawl requests.
If proxy is omitted, Firecrawl defaults to auto . auto retries with stealth proxies if a basic attempt fails, which may use more credits
than basic-only scraping.
How web_fetch uses Firecrawl
web_fetch extraction order:
Readability (local)
Firecrawl (when selected, or auto-detected from configured credentials)
Basic HTML cleanup (last fallback)
The selection knob is tools.web.fetch.provider . If you omit it, OpenClaw
auto-detects the first ready web-fetch provider from available credentials.
The official Firecrawl plugin provides that fallback.
Related
Web Search overview -- all providers and auto-detection
Web Fetch -- web_fetch tool with Firecrawl fallback
Tavily -- search + extract tools
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
