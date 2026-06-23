# Oauth 2.0 Authentication | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/proxy/oauth2
- Final URL: https://docs.litellm.ai/docs/proxy/oauth2
- Canonical URL: https://docs.litellm.ai/docs/proxy/oauth2
- Fetched at: 2026-06-23T14:31:36Z
- Content type: text/html; charset=utf-8

## Description

Use this if you want to use an Oauth2.0 token to make /chat, /embeddings requests to the LiteLLM Proxy

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Use this if you want to use an Oauth2.0 token to make /chat , /embeddings requests to the LiteLLM Proxy
info
This is an Enterprise Feature - get in touch with us if you want a free trial to test if this feature meets your needs
Usage ​
Set env vars:
export OAUTH_TOKEN_INFO_ENDPOINT="https://your-provider.com/token/info"
export OAUTH_USER_ID_FIELD_NAME="sub"
export OAUTH_USER_ROLE_FIELD_NAME="role"
export OAUTH_USER_TEAM_ID_FIELD_NAME="team_id"
OAUTH_TOKEN_INFO_ENDPOINT : URL to validate OAuth tokens
OAUTH_USER_ID_FIELD_NAME : Field in token info response containing user ID
OAUTH_USER_ROLE_FIELD_NAME : Field in token info for user's role
OAUTH_USER_TEAM_ID_FIELD_NAME : Field in token info for user's team ID
Enable on litellm config.yaml
Set this on your config.yaml
model_list :
- model_name : gpt - 4
litellm_params :
model : openai/fake
api_key : fake - key
api_base : https : //exampleopenaiendpoint - production.up.railway.app/
general_settings :
master_key : sk - 1234
enable_oauth2_auth : true
Use token in requests to LiteLLM
curl --location 'http://0.0.0.0:4000/chat/completions' \
--header 'Content-Type: application/json' \
--data '{
"model": "gpt-3.5-turbo",
"messages": [
{
"role": "user",
"content": "what llm are you"
}
]
}'
Debugging ​
Start the LiteLLM Proxy with --detailed_debug mode and you should see more verbose logs
Using OAuth2 + JWT Together ​
LiteLLM supports two OAuth2 + JWT modes:
Global OAuth2 mode ( enable_oauth2_auth: true )
OAuth2 auth is enabled on LLM + info routes.
Selective JWT override mode ( enable_oauth2_auth: false )
Only JWT-shaped tokens that match litellm_jwtauth.routing_overrides are routed to OAuth2 on LLM + info routes.
For selective routing (OAuth2 only for specific JWTs), configure:
config.yaml
enable_jwt_auth : true
enable_oauth2_auth : false
litellm_jwtauth :
routing_overrides :
- iss : "machine-issuer.example.com"
client_id : "MID_LITELLM"
path : "oauth2"
Selectors support shell-style wildcards ( * , ? , case-sensitive) and accept either a single string or a list of strings.
For full routing_overrides behavior — supported selectors, wildcard and list semantics, and matching rules — see /proxy/token_auth .
Usage
Debugging
Using OAuth2 + JWT Together
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
