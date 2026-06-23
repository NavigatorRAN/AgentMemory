# Health Checks | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/proxy/health
- Final URL: https://docs.litellm.ai/docs/proxy/health
- Canonical URL: https://docs.litellm.ai/docs/proxy/health
- Fetched at: 2026-06-23T14:31:08Z
- Content type: text/html; charset=utf-8

## Description

Use this to health check all LLMs defined in your config.yaml

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Use this to health check all LLMs defined in your config.yaml
When to Use Each Endpoint ​
Endpoint Use Case Purpose /health/liveliness Container liveness probes Basic alive check - use for container restart decisions /health/readiness Load balancer health checks Ready to accept traffic - includes DB connection status /health Model health monitoring Comprehensive LLM model health - makes actual API calls /health/services Service debugging Check specific integrations (datadog, langfuse, etc.) /health/shared-status Multi-pod coordination Monitor shared health check state across pods
Summary ​
The proxy exposes:
a /health endpoint which returns the health of the LLM APIs
a /health/readiness endpoint for returning if the proxy is ready to accept requests
a /health/liveliness endpoint for returning if the proxy is alive
a /health/shared-status endpoint for monitoring shared health check coordination across pods
Shared Health Check State ​
When running multiple LiteLLM proxy pods, you can enable shared health check state to coordinate health checks across pods and avoid duplicate API calls. This is especially beneficial for expensive models like Gemini 2.5-pro.
Key Benefits:
Reduces duplicate health checks across pods
Saves costs on expensive model API calls
Reduces monitoring noise and logging
Improves resource efficiency
Requirements:
Redis for shared state coordination
Background health checks enabled
Multiple proxy pods
For detailed configuration and usage, see Shared Health Check State .
/health ​
Request ​
Make a GET Request to /health on the proxy
info
This endpoint makes an LLM API call to each model to check if it is healthy.
curl --location 'http://0.0.0.0:4000/health' -H "Authorization: Bearer sk-1234"
You can also run litellm -health it makes a get request to http://0.0.0.0:4000/health for you
litellm --health
Response ​
{
"healthy_endpoints": [
"model": "azure/gpt-35-turbo",
"api_base": "https://my-endpoint-canada-berri992.openai.azure.com/"
},
"api_base": "https://my-endpoint-europe-berri-992.openai.azure.com/"
}
],
"unhealthy_endpoints": [
"api_base": "https://openai-france-1234.openai.azure.com/"
]
Embedding Models ​
To run embedding health checks, specify the mode as "embedding" in your config for the relevant model.
model_list :
- model_name : azure - embedding - model
litellm_params :
model : azure/azure - embedding - model
api_base : os.environ/AZURE_API_BASE
api_key : os.environ/AZURE_API_KEY
api_version : "2023-07-01-preview"
model_info :
mode : embedding # 👈 ADD THIS
Image Generation Models ​
To run image generation health checks, specify the mode as "image_generation" in your config for the relevant model.
- model_name : dall - e - 3
model : azure/dall - e - 3
mode : image_generation # 👈 ADD THIS
Custom Health Check Prompt ​
By default, health checks use the prompt "test from litellm" . You can customize this prompt globally by setting an environment variable, or per-model via config:
DEFAULT_HEALTH_CHECK_PROMPT="this is a test prompt"
Text Completion Models ​
To run /completions health checks, specify the mode as "completion" in your config for the relevant model.
- model_name : azure - text - completion
model : azure/text - davinci - 003
mode : completion # 👈 ADD THIS
Speech to Text Models ​
- model_name : whisper
model : whisper - 1
api_key : os.environ/OPENAI_API_KEY
mode : audio_transcription
Text to Speech Models ​
# OpenAI Text to Speech Models
- model_name : tts
model : openai/tts - 1
api_key : "os.environ/OPENAI_API_KEY"
mode : audio_speech
health_check_voice : alloy
You can specify a health_check_voice if you need to use a voice other than "alloy".
Rerank Models ​
To run rerank health checks, specify the mode as "rerank" in your config for the relevant model.
- model_name : rerank - english - v3.0
model : cohere/rerank - english - v3.0
api_key : os.environ/COHERE_API_KEY
mode : rerank
Batch Models (Azure Only) ​
For Azure models deployed as 'batch' models, set mode: batch .
- model_name : "batch-gpt-4o-mini"
model : "azure/batch-gpt-4o-mini"
mode : batch
Expected Response
"api_base": "https://...",
"model": "azure/gpt-4o-mini",
"x-ms-region": "East US"
"unhealthy_endpoints": [],
"healthy_count": 1,
"unhealthy_count": 0
Realtime Models ​
To run realtime health checks, specify the mode as "realtime" in your config for the relevant model.
- model_name : openai/gpt - 4o - realtime - audio
model : openai/gpt - 4o - realtime - audio
mode : realtime
OCR Models ​
To run OCR health checks, specify the mode as "ocr" in your config for the relevant model.
- model_name : mistral/mistral - ocr - latest
model : mistral/mistral - ocr - latest
api_key : os.environ/MISTRAL_API_KEY
mode : ocr
Wildcard Routes ​
For wildcard routes, you can specify a health_check_model in your config.yaml. This model will be used for health checks for that wildcard route.
In this example, when running a health check for openai/* , the health check will make a /chat/completions request to openai/gpt-4o-mini .
- model_name : openai/*
model : openai/*
health_check_model : openai/gpt - 4o - mini
- model_name : anthropic/*
model : anthropic/*
api_key : os.environ/ANTHROPIC_API_KEY
health_check_model : anthropic/claude - 3 - 5 - sonnet - 20240620
Background Health Checks ​
You can enable model health checks being run in the background, to prevent each model from being queried too frequently via /health .
This makes an LLM API call to each model to check if it is healthy.
Here's how to use it:
in the config.yaml add:
general_settings:
background_health_checks: True # enable background health checks
health_check_interval: 300 # frequency of background health checks
Start server
$ litellm /path/to/config.yaml
Query health endpoint:
curl --location 'http://0.0.0.0:4000/health'
Disable Background Health Checks For Specific Models ​
Use this if you want to disable background health checks for specific models.
If background_health_checks is enabled you can skip individual models by
setting disable_background_health_check: true in the model's model_info .
- model_name : openai/gpt - 4o
model : openai/gpt - 4o
disable_background_health_check : true
Skip the same models on GET /health ​
By default, disable_background_health_check: true only skips those deployments in the background health loop. On-demand GET /health still probes them unless you enable this global flag:
general_settings :
health_check_skip_disabled_background_models : true
When true , deployments with model_info.disable_background_health_check: true are omitted from on-demand GET /health (including ?model= / ?model_id= ) and from health-check runs that honor general_settings (including Redis-backed shared health checks).
Hide details ​
The health check response contains details like endpoint URLs, error messages,
and other LiteLLM params. While this is useful for debugging, it can be
problematic when exposing the proxy server to a broad audience.
You can hide these details by setting the health_check_details setting to False .
health_check_details : False
Health Check Driven Routing ​
Route traffic away from unhealthy deployments proactively — before user requests hit them. Supports per-error-type failure thresholds, transient error suppression, and automatic safety nets.
See the full guide: Health Check Driven Routing
Health Check Timeout ​
The health check timeout is set in litellm/constants.py and defaults to 60 seconds.
This can be overridden in the config.yaml by setting health_check_timeout in the model_info section.
health_check_timeout : 10 # 👈 OVERRIDE HEALTH CHECK TIMEOUT
Health Check Max Tokens ​
By default, health checks use max_tokens=5 to balance reliability with low cost and latency. For wildcard models, the default is max_tokens=10 .
You can override this per-model by setting health_check_max_tokens in the model_info section of your config.yaml.
health_check_max_tokens : 5 # 👈 OVERRIDE HEALTH CHECK MAX TOKENS
Reasoning vs non-reasoning defaults ​
Reasoning models (per supports_reasoning in the model map) often need a higher health-check max_tokens because providers count reasoning tokens toward the completion budget. You can set separate limits without listing every model:
Per deployment ( model_info ) — used when health_check_max_tokens is not set. Ignored for wildcard routes ( * in litellm_params.model , i.e. the deployment model string; not health_check_model ).
- model_name : openai - stack
model : openai/gpt - 5 - nano
health_check_max_tokens_reasoning : 128
health_check_max_tokens_non_reasoning : 1
Global (environment) :
BACKGROUND_HEALTH_CHECK_MAX_TOKENS_REASONING — for non-wildcard reasoning models, this value takes precedence when set
BACKGROUND_HEALTH_CHECK_MAX_TOKENS — global fallback for all models (including wildcard routes)
If neither is set, non-wildcard models default to 5 and wildcard routes omit max_tokens .
Health check reasoning effort ​
For reasoning models (e.g. GPT-5, o-series), you can set only for the health-check request how much reasoning to use via health_check_reasoning_effort in model_info . This is forwarded as reasoning_effort on the underlying completion call so you can use a minimal level (for example none or minimal ) to reduce latency and cost during probes.
Applies when mode is unset (chat), or explicitly chat , completion , batch , or responses . It is not applied for embedding , audio_* , rerank , etc.
- model_name : openai/gpt - 5 - nano
health_check_reasoning_effort : none # options depend on provider/model map
Checking which reasoning_effort values your model supports ​
LiteLLM reads per-model flags from model_prices_and_context_window.json . For reasoning effort, entries may include supports_none_reasoning_effort , supports_minimal_reasoning_effort , supports_low_reasoning_effort , supports_xhigh_reasoning_effort , supports_max_reasoning_effort , and similar keys. When a key is true , LiteLLM treats that level as supported for that model.
Call litellm.get_model_info() with the same model string you use under litellm_params.model (including a provider prefix such as azure/ when you use one), then inspect the returned supports_*_reasoning_effort fields:
import litellm
info = litellm . get_model_info ( "azure/gpt-5.4-mini" )
for name in sorted ( dir ( info ) ) :
if "reasoning_effort" in name and not name . startswith ( "_" ) :
print ( name , getattr ( info , name ) )
If the model is not present in the LiteLLM model map, get_model_info may raise. In that case add or fix the entry in the JSON, or confirm allowed values from your provider’s API documentation (Azure OpenAI, OpenAI, Anthropic, etc.)—provider docs are the final authority when the map has not caught up to a new SKU.
/health/readiness ​
Unprotected endpoint for checking if proxy is ready to accept requests
Example Request:
curl http://0.0.0.0:4000/health/readiness
Example Response:
"status" : "connected" ,
"db" : "connected" ,
"cache" : null ,
"litellm_version" : "1.40.21" ,
"success_callbacks" : [
"langfuse" ,
"_PROXY_track_cost_callback" ,
"response_taking_too_long_callback" ,
"_PROXY_MaxParallelRequestsHandler" ,
"_PROXY_MaxBudgetLimiter" ,
"_PROXY_CacheControlCheck" ,
"ServiceLogging"
] ,
"last_updated" : "2024-07-10T18:59:10.616968"
If the proxy is not connected to a database, then the "db" field will be "Not connected" instead of "connected" and the "last_updated" field will not be present.
/health/liveliness ​
Unprotected endpoint for checking if proxy is alive
curl -X 'GET' \
'http://0.0.0.0:4000/health/liveliness' \
-H 'accept: application/json'
"I'm alive!"
/health/services ​
Use this admin-only endpoint to check if a connected service (datadog/slack/langfuse/etc.) is healthy.
curl -L -X GET 'http://0.0.0.0:4000/health/services?service=datadog' -H 'Authorization: Bearer sk-1234'
API Reference
Advanced - Call specific models ​
To check health of specific models, here's how to call them:
1. Get model id via /model/info ​
curl -X GET 'http://0.0.0.0:4000/v1/model/info' \
--header 'Authorization: Bearer sk-1234' \
"model_name": "bedrock-anthropic-claude-3",
"litellm_params": {
"model": "anthropic.claude-3-sonnet-20240229-v1:0"
"model_info": {
"id": "634b87c444..", # 👈 UNIQUE MODEL ID
2. Call specific model via /chat/completions ​
curl -X POST 'http://localhost:4000/chat/completions' \
-H 'Content-Type: application/json' \
-H 'Authorization: Bearer sk-1234' \
-D '{
"model": "634b87c444.." # 👈 UNIQUE MODEL ID
"messages": [
"role": "user",
"content": "ping"
'
When to Use Each Endpoint
Summary
Shared Health Check State
/health
Embedding Models
Image Generation Models
Text Completion Models
Speech to Text Models
Text to Speech Models
Rerank Models
Batch Models (Azure Only)
Realtime Models
OCR Models
Wildcard Routes
Background Health Checks
Disable Background Health Checks For Specific Models
Skip the same models on GET /health
Hide details
Health Check Driven Routing
Health Check Timeout
Health Check Max Tokens
Reasoning vs non-reasoning defaults
Health check reasoning effort
Checking which reasoning_effort values your model supports
/health/readiness
/health/liveliness
/health/services
Advanced - Call specific models
1. Get model id via /model/info
2. Call specific model via /chat/completions
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
