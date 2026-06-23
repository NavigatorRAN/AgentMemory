# Auto Sync Anthropic Beta Headers | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/proxy/sync_anthropic_beta_headers
- Final URL: https://docs.litellm.ai/docs/proxy/sync_anthropic_beta_headers
- Canonical URL: https://docs.litellm.ai/docs/proxy/sync_anthropic_beta_headers
- Fetched at: 2026-06-23T14:32:07Z
- Content type: text/html; charset=utf-8

## Description

Automatically keep your Anthropic beta headers configuration up to date without restarting your service. This allows you to support new Anthropic beta features across all providers without restarting your service.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Automatically keep your Anthropic beta headers configuration up to date without restarting your service. This allows you to support new Anthropic beta features across all providers without restarting your service.
Overview ​
When Anthropic releases new beta features (e.g., new tool capabilities, extended context windows), you typically need to restart your LiteLLM service to get the latest beta header mappings for different providers (Anthropic, Bedrock, Vertex AI, Azure AI).
With auto-sync, LiteLLM automatically pulls the latest configuration from GitHub's anthropic_beta_headers_config.json without requiring a restart. This means:
Zero downtime when new beta features are released
Always up-to-date provider support mappings
Automatic updates - set it once and forget it
Quick Start ​
Manual sync:
curl -X POST "https://your-proxy-url/reload/anthropic_beta_headers" \
-H "Authorization: Bearer YOUR_ADMIN_TOKEN" \
-H "Content-Type: application/json"
Automatic sync every 24 hours:
curl -X POST "https://your-proxy-url/schedule/anthropic_beta_headers_reload?hours=24" \
API Endpoints ​
Endpoint Method Description /reload/anthropic_beta_headers POST Manual sync /schedule/anthropic_beta_headers_reload?hours={hours} POST Schedule periodic sync /schedule/anthropic_beta_headers_reload DELETE Cancel scheduled sync /schedule/anthropic_beta_headers_reload/status GET Check sync status
Authentication: Requires admin role or master key
Python Example ​
import requests
def sync_anthropic_beta_headers ( proxy_url , admin_token ) :
response = requests . post (
f" { proxy_url } /reload/anthropic_beta_headers" ,
headers = { "Authorization" : f"Bearer { admin_token } " }
)
return response . json ( )
# Usage
result = sync_anthropic_beta_headers ( "https://your-proxy-url" , "your-admin-token" )
print ( result [ 'message' ] )
Configuration ​
Custom beta headers config URL:
export LITELLM_ANTHROPIC_BETA_HEADERS_URL="https://raw.githubusercontent.com/BerriAI/litellm/main/litellm/anthropic_beta_headers_config.json"
Use local beta headers config:
export LITELLM_LOCAL_ANTHROPIC_BETA_HEADERS=True
Scheduling Automatic Reloads ​
Schedule automatic reloads to ensure your proxy always has the latest beta header mappings:
# Reload every 24 hours
-H "Authorization: Bearer YOUR_ADMIN_TOKEN"
Check reload status:
curl -X GET "https://your-proxy-url/schedule/anthropic_beta_headers_reload/status" \
Response:
{
"scheduled" : true ,
"interval_hours" : 24 ,
"last_run" : "2026-02-13T10:00:00" ,
"next_run" : "2026-02-14T10:00:00"
}
Cancel scheduled reload:
curl -X DELETE "https://your-proxy-url/schedule/anthropic_beta_headers_reload" \
Environment Variables ​
Variable Description Default LITELLM_ANTHROPIC_BETA_HEADERS_URL URL to fetch beta headers config from GitHub main branch LITELLM_LOCAL_ANTHROPIC_BETA_HEADERS Set to True to use local config only False
How It Works ​
Initial Load: On startup, LiteLLM loads the beta headers configuration from the remote URL (or local file if configured)
Caching: The configuration is cached in memory to avoid repeated fetches on every request
Scheduled Reload: If configured, the proxy checks every 10 seconds whether it's time to reload based on your schedule
Manual Reload: You can trigger an immediate reload via the API endpoint
Multi-Pod Support: In multi-pod deployments, the reload configuration is stored in the database so all pods stay in sync
Benefits ​
No Restarts Required: Add support for new Anthropic beta features without downtime
Provider Compatibility: Automatically get updated mappings for Bedrock, Vertex AI, Azure AI, etc.
Performance: Configuration is cached and only reloaded when needed
Reliability: Falls back to local configuration if remote fetch fails
Related ​
Model Cost Map Sync - Auto-sync model pricing data
Anthropic Beta Headers - Using Anthropic beta features
Overview
Quick Start
API Endpoints
Python Example
Configuration
Scheduling Automatic Reloads
Environment Variables
How It Works
Benefits
Related
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
