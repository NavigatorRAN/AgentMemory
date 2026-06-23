# MCP OBO Auth | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/mcp_obo_auth
- Final URL: https://docs.litellm.ai/docs/mcp_obo_auth
- Canonical URL: https://docs.litellm.ai/docs/mcp_obo_auth
- Fetched at: 2026-06-23T14:24:38Z
- Content type: text/html; charset=utf-8

## Description

OAuth 2.0 On-Behalf-Of (OBO) auth lets LiteLLM exchange a user's incoming bearer token for a scoped token that is valid for a specific MCP server.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
OAuth 2.0 On-Behalf-Of (OBO) auth lets LiteLLM exchange a user's incoming bearer token for a scoped token that is valid for a specific MCP server.
Use OBO when:
Your MCP server should receive a token minted specifically for that MCP server.
Your identity provider supports RFC 8693 OAuth 2.0 Token Exchange .
You want LiteLLM to keep the user's raw token from being forwarded directly to the MCP server.
How It Works ​
In short:
The client sends a request to LiteLLM with a bearer token.
LiteLLM uses that bearer token as the RFC 8693 subject_token .
LiteLLM exchanges it at your identity provider's token exchange endpoint.
LiteLLM forwards only the exchanged scoped token to the MCP server.
LiteLLM caches the exchanged token until it expires, so repeated calls avoid another identity provider round trip.
Configure an MCP Server for OBO ​
Set auth_type: oauth2_token_exchange on the MCP server.
config.yaml
mcp_servers :
internal_tools :
url : "https://mcp.example.com/mcp"
transport : "http"
auth_type : oauth2_token_exchange
# OAuth 2.0 Token Exchange endpoint on your identity provider
token_exchange_endpoint : "https://idp.example.com/oauth2/token"
# Token exchange client registered with your identity provider
client_id : "<idp-client-id>"
client_secret : "<idp-client-secret>"
# Optional but recommended: restrict the exchanged token to this MCP server
audience : "api://internal-tools-mcp"
scopes :
- "mcp.tools.read"
- "mcp.tools.execute"
# Optional. Defaults to access_token.
subject_token_type : "urn:ietf:params:oauth:token-type:access_token"
Config Fields ​
Field Required Description auth_type Yes Must be oauth2_token_exchange . token_exchange_endpoint Yes The identity provider endpoint that accepts RFC 8693 token exchange requests. client_id Yes OAuth client identifier LiteLLM uses when calling the token exchange endpoint. client_secret Yes OAuth client secret LiteLLM uses when calling the token exchange endpoint. audience Recommended Resource identifier for the MCP server. LiteLLM sends this as the token exchange audience . scopes Optional Scopes LiteLLM requests for the exchanged token. LiteLLM joins the list into the OAuth scope parameter. subject_token_type Optional RFC 8693 subject token type. Defaults to urn:ietf:params:oauth:token-type:access_token .
Token Exchange Request ​
For each uncached subject token and MCP server pair, LiteLLM sends a form-encoded request like this to token_exchange_endpoint :
POST /oauth2/token
Content-Type: application/x-www-form-urlencoded
grant_type=urn:ietf:params:oauth:grant-type:token-exchange
&subject_token=<caller-bearer-token>
&subject_token_type=urn:ietf:params:oauth:token-type:access_token
&client_id=<idp-client-id>
&client_secret=<idp-client-secret>
&audience=api://internal-tools-mcp
&scope=mcp.tools.read mcp.tools.execute
Your identity provider should return an access token:
{
"access_token" : "scoped-token-for-mcp-server" ,
"token_type" : "Bearer" ,
"expires_in" : 3600
}
LiteLLM then calls the MCP server with:
Authorization: Bearer scoped-token-for-mcp-server
Calling an OBO MCP Server ​
The inbound request must include the user's bearer token so LiteLLM has a subject_token to exchange.
For direct MCP calls, keep the LiteLLM key in x-litellm-api-key and leave Authorization for the user token:
Direct MCP call
curl -X POST "https://litellm.example.com/internal_tools/mcp" \
-H "Content-Type: application/json" \
-H "x-litellm-api-key: Bearer <litellm-api-key>" \
-H "Authorization: Bearer <user-token>" \
-d '{"jsonrpc":"2.0","id":1,"method":"tools/list","params":{}}'
For the Responses API, pass MCP tool headers with the LiteLLM key separated from the user token:
Responses API with MCP OBO
curl -X POST "https://litellm.example.com/v1/responses" \
-H "Authorization: Bearer <litellm-api-key>" \
-d '{
"model": "gpt-4o",
"input": "List the available internal tools",
"tools": [
"type": "mcp",
"server_label": "internal_tools",
"server_url": "https://litellm.example.com/internal_tools/mcp",
"require_approval": "never",
"headers": {
"x-litellm-api-key": "Bearer <litellm-api-key>",
"Authorization": "Bearer <user-token>"
]
}'
tip
If the MCP client can only send one Authorization header, use x-litellm-api-key for the LiteLLM key and reserve Authorization for the user's token. LiteLLM needs the user token as the OBO subject_token .
Caching Behavior ​
LiteLLM caches exchanged tokens by:
subject token
MCP server ID
This means two different users get separate exchanged tokens, while repeated calls from the same user to the same MCP server reuse the cached token until it expires.
The cache TTL is based on expires_in minus LiteLLM's OAuth expiry buffer. If expires_in is missing or invalid, LiteLLM uses the default OAuth token cache TTL.
Fallback Behavior ​
If an OBO server has no incoming subject token:
If client_id , client_secret , and token_url are configured, LiteLLM can fall back to OAuth client_credentials .
Otherwise, LiteLLM logs a warning and proceeds without token exchange.
For strict OBO deployments, configure clients so every request includes the user bearer token.
Troubleshooting ​
Symptom Check MCP server receives the LiteLLM key Move the LiteLLM key to x-litellm-api-key and use Authorization for the user token. Token exchange endpoint returns 400 Confirm audience , scopes , client_id , and subject_token_type match your identity provider configuration. MCP server receives no Authorization header Confirm the MCP server has auth_type: oauth2_token_exchange and the inbound request includes a user bearer token. Identity provider is called on every request Confirm the identity provider returns expires_in , and that the same user token and MCP server are being reused.
How It Works
Configure an MCP Server for OBO
Config Fields
Token Exchange Request
Calling an OBO MCP Server
Caching Behavior
Fallback Behavior
Troubleshooting
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
