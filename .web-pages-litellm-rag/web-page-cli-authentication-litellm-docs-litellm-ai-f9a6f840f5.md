# CLI Authentication | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/proxy/cli_sso
- Final URL: https://docs.litellm.ai/docs/proxy/cli_sso
- Canonical URL: https://docs.litellm.ai/docs/proxy/cli_sso
- Fetched at: 2026-06-23T14:29:47Z
- Content type: text/html; charset=utf-8

## Description

Use the litellm cli to authenticate to the LiteLLM Gateway. This is great if you're trying to give a large number of developers self-serve access to the LiteLLM Gateway.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Use the litellm cli to authenticate to the LiteLLM Gateway. This is great if you're trying to give a large number of developers self-serve access to the LiteLLM Gateway.
Demo ​
Usage ​
Prerequisites - Start LiteLLM Proxy with Beta Flag ​
Beta Feature - Required
CLI SSO Authentication is currently in beta. You must set this environment variable when starting up your LiteLLM Proxy :
export EXPERIMENTAL_UI_LOGIN="True"
litellm --config config.yaml
Or add it to your proxy startup command:
EXPERIMENTAL_UI_LOGIN="True" litellm --config config.yaml
Configuration ​
JWT Token Expiration ​
By default, CLI authentication tokens expire after 24 hours . You can customize this expiration time by setting the LITELLM_CLI_JWT_EXPIRATION_HOURS environment variable when starting your LiteLLM Proxy:
# Set CLI JWT tokens to expire after 48 hours
export LITELLM_CLI_JWT_EXPIRATION_HOURS=48
Or in a single command:
LITELLM_CLI_JWT_EXPIRATION_HOURS=48 EXPERIMENTAL_UI_LOGIN="True" litellm --config config.yaml
Examples:
LITELLM_CLI_JWT_EXPIRATION_HOURS=12 - Tokens expire after 12 hours
LITELLM_CLI_JWT_EXPIRATION_HOURS=168 - Tokens expire after 7 days (168 hours)
LITELLM_CLI_JWT_EXPIRATION_HOURS=720 - Tokens expire after 30 days (720 hours)
Experimental UI Session
When EXPERIMENTAL_UI_LOGIN is enabled, the browser UI login session uses a fixed 10-minute expiry (not configurable). LITELLM_UI_SESSION_DURATION applies only to non-experimental flows.
tip
You can check your current token's age and expiration status using:
lite whoami
Attribution metadata (OIDC claims) ​
Map allowlisted OIDC claims into the LiteLLM user's metadata and return them to the CLI in /sso/cli/poll as attribution_metadata . Use this for stable attribution fields (for example employment type or cost center) without parsing large group lists in the client.
Set on the proxy before startup:
export CLI_SSO_CLAIM_MAP="employment_type->acme_employment_type,org_info.department->department"
export GENERIC_USER_EXTRA_ATTRIBUTES="employment_type,org_info.department"
CLI_SSO_CLAIM_MAP and LITELLM_CLI_SSO_CLAIM_MAP are equivalent. Format: comma-separated source_claim->metadata_key pairs. The optional metadata. prefix on the destination is stripped; values are stored on the user's metadata JSON column.
Part Meaning source_claim OIDC claim path (dot notation), including fields from GENERIC_USER_EXTRA_ATTRIBUTES metadata_key Key under LiteLLM user metadata (supports nested keys via dots)
Only non-secret scalar values ( string , int , float , bool ) are persisted and returned. Lists, objects, and destination keys containing fragments like token or secret are dropped.
Example poll response (after SSO completes):
{
"status" : "ready" ,
"key" : "eyJ..." ,
"user_id" : "user@company.com" ,
"attribution_metadata" : {
"acme_employment_type" : "full_time" ,
"department" : "Engineering"
}
Local testing without a real IdP: run python scripts/mock_oidc_server_for_cli_sso.py from the LiteLLM repo, point Generic SSO env vars at http://127.0.0.1:8765 , then run python scripts/test_cli_sso_claims_e2e.py .
Steps ​
Install the CLI
The lite client is a thin laptop install: it points at a LiteLLM proxy and runs your coding agents through it, with none of the proxy server runtime pulled in. The one-line installer needs only curl ; it bootstraps uv when it's missing and lets uv provision a compatible Python for you:
curl -fsSL https://raw.githubusercontent.com/BerriAI/litellm/main/scripts/install-cli.sh | sh
On macOS you can install it with Homebrew instead:
brew install BerriAI/litellm/lite
Already have uv and prefer to drive it yourself? Install the package directly:
uv tool install 'litellm[cli]'
Any of these gives you the lite command; if you already run a proxy server from litellm[proxy] , it ships there too. Start by typing it in your terminal:
lite
Set up environment variables
On your local machine, set the proxy URL:
export LITELLM_PROXY_URL=http://localhost:4000
(Replace with your actual proxy URL)
Login
lite login
This will open a browser window to authenticate. If you have connected LiteLLM Proxy to your SSO provider, you should be able to login with your SSO credentials. Once logged in, you can use the CLI to make requests to the LiteLLM Gateway.
Make a test request to view models
lite models list
This will list all the models available to you.
Demo
Usage
Prerequisites - Start LiteLLM Proxy with Beta Flag
Configuration
Steps
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
