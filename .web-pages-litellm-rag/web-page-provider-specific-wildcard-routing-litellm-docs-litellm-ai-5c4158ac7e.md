# Provider specific Wildcard routing | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/wildcard_routing
- Final URL: https://docs.litellm.ai/docs/wildcard_routing
- Canonical URL: https://docs.litellm.ai/docs/wildcard_routing
- Fetched at: 2026-06-23T14:34:54Z
- Content type: text/html; charset=utf-8

## Description

Proxy all models from a provider

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Proxy all models from a provider
Use this if you want to proxy all models from a specific provider without defining them on the config.yaml
Step 1. Define provider specific routing ​
SDK
PROXY
from litellm import Router
router = Router (
model_list = [
{
"model_name" : "anthropic/*" ,
"litellm_params" : {
"model" : "anthropic/*" ,
"api_key" : os . environ [ "ANTHROPIC_API_KEY" ]
}
} ,
"model_name" : "groq/*" ,
"model" : "groq/*" ,
"api_key" : os . environ [ "GROQ_API_KEY" ]
"model_name" : "fo::*:static::*" , # all requests matching this pattern will be routed to this deployment, example: model="fo::hi::static::hi" will be routed to deployment: "openai/fo::*:static::*"
"model" : "openai/fo::*:static::*" ,
"api_key" : os . environ [ "OPENAI_API_KEY" ]
]
)
Step 1 - define provider specific routing on config.yaml
model_list :
# provider specific wildcard routing
- model_name : "anthropic/*"
litellm_params :
model : "anthropic/*"
api_key : os.environ/ANTHROPIC_API_KEY
- model_name : "groq/*"
model : "groq/*"
api_key : os.environ/GROQ_API_KEY
- model_name : "fo::*:static::*" # all requests matching this pattern will be routed to this deployment, example: model="fo::hi::static::hi" will be routed to deployment: "openai/fo::*:static::*"
model : "openai/fo::*:static::*"
api_key : os.environ/OPENAI_API_KEY
[PROXY-Only] Step 2 - Run litellm proxy ​
$ litellm --config /path/to/config.yaml
Step 3 - Test it ​
router = Router ( model_list = . . . )
# Test with `anthropic/` - all models with `anthropic/` prefix will get routed to `anthropic/*`
resp = completion ( model = "anthropic/claude-3-sonnet-20240229" , messages = [ { "role" : "user" , "content" : "Hello, Claude!" } ] )
print ( resp )
# Test with `groq/` - all models with `groq/` prefix will get routed to `groq/*`
resp = completion ( model = "groq/llama3-8b-8192" , messages = [ { "role" : "user" , "content" : "Hello, Groq!" } ] )
# Test with `fo::*::static::*` - all requests matching this pattern will be routed to `openai/fo::*:static::*`
resp = completion ( model = "fo::hi::static::hi" , messages = [ { "role" : "user" , "content" : "Hello, Claude!" } ] )
Test with anthropic/ - all models with anthropic/ prefix will get routed to anthropic/*
curl http://localhost:4000/v1/chat/completions \
-H "Content-Type: application/json" \
-H "Authorization: Bearer sk-1234" \
-d '{
"model": "anthropic/claude-3-sonnet-20240229",
"messages": [
{"role": "user", "content": "Hello, Claude!"}
}'
Test with groq/ - all models with groq/ prefix will get routed to groq/*
"model": "groq/llama3-8b-8192",
Test with fo::*::static::* - all requests matching this pattern will be routed to openai/fo::*:static::*
"model": "fo::hi::static::hi",
[PROXY-Only] Control Wildcard Model Access ​
Step 1. Define provider specific routing
[PROXY-Only] Step 2 - Run litellm proxy
Step 3 - Test it
[PROXY-Only] Control Wildcard Model Access
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
