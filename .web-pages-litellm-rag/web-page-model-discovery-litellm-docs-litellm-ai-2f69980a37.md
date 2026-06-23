# Model Discovery | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/proxy/model_discovery
- Final URL: https://docs.litellm.ai/docs/proxy/model_discovery
- Canonical URL: https://docs.litellm.ai/docs/proxy/model_discovery
- Fetched at: 2026-06-23T14:31:31Z
- Content type: text/html; charset=utf-8

## Description

Use this to give users an accurate list of models available behind provider endpoint, when calling /v1/models for wildcard models.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Use this to give users an accurate list of models available behind provider endpoint, when calling /v1/models for wildcard models.
Supported Models ​
Fireworks AI
OpenAI
Gemini
LiteLLM Proxy
Topaz
Anthropic
XAI
VLLM
Vertex AI
Usage ​
1. Setup config.yaml
model_list :
- model_name : xai/*
litellm_params :
model : xai/*
api_key : os.environ/XAI_API_KEY
litellm_settings :
check_provider_endpoint : true # 👈 Enable checking provider endpoint for wildcard models
2. Start proxy
litellm --config /path/to/config.yaml
# RUNNING on http://0.0.0.0:4000
3. Call /v1/models
curl -X GET "http://localhost:4000/v1/models" -H "Authorization: Bearer $LITELLM_KEY"
Expected response
{
"data" : [
"id" : "xai/grok-2-1212" ,
"object" : "model" ,
"created" : 1677610602 ,
"owned_by" : "openai"
} ,
"id" : "xai/grok-2-vision-1212" ,
"id" : "xai/grok-3-beta" ,
"id" : "xai/grok-3-fast-beta" ,
"id" : "xai/grok-3-mini-beta" ,
"id" : "xai/grok-3-mini-fast-beta" ,
"id" : "xai/grok-beta" ,
"id" : "xai/grok-vision-beta" ,
"id" : "xai/grok-2-image-1212" ,
}
] ,
"object" : "list"
Supported Models
Usage
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
