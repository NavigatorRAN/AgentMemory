# Fallbacks | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/proxy/reliability
- Final URL: https://docs.litellm.ai/docs/proxy/reliability
- Canonical URL: https://docs.litellm.ai/docs/proxy/reliability
- Fetched at: 2026-06-23T14:31:58Z
- Content type: text/html; charset=utf-8

## Description

If a call fails after num_retries, fallback to another model group.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
If a call fails after num_retries, fallback to another model group.
Quick Start load balancing
Quick Start client side fallbacks
Fallbacks are typically done from one model_name to another model_name .
Quick Start ​
1. Setup fallbacks ​
Key change:
fallbacks = [ { "gpt-3.5-turbo" : [ "gpt-4" ] } ]
SDK
PROXY
from litellm import Router
router = Router (
model_list = [
{
"model_name" : "gpt-3.5-turbo" ,
"litellm_params" : {
"model" : "azure/<your-deployment-name>" ,
"api_base" : "<your-azure-endpoint>" ,
"api_key" : "<your-azure-api-key>" ,
"rpm" : 6
}
} ,
"model_name" : "gpt-4" ,
"model" : "azure/gpt-4-ca" ,
"api_base" : "https://my-endpoint-canada-berri992.openai.azure.com/" ,
] ,
fallbacks = [ { "gpt-3.5-turbo" : [ "gpt-4" ] } ] # 👈 KEY CHANGE
)
model_list :
- model_name : gpt - 3.5 - turbo
litellm_params :
model : azure/<your - deployment - name >
api_base : <your - azure - endpoint >
api_key : <your - azure - api - key >
rpm : 6 # Rate limit for this deployment: in requests per minute (rpm)
- model_name : gpt - 4
model : azure/gpt - 4 - ca
api_base : https : //my - endpoint - canada - berri992.openai.azure.com/
rpm : 6
router_settings :
fallbacks : [ { "gpt-3.5-turbo" : [ "gpt-4" ] } ]
2. Start Proxy ​
litellm --config /path/to/config.yaml
3. Test Fallbacks ​
Pass mock_testing_fallbacks=true in request body, to trigger fallbacks.
model_list = [ { . . } , { . . } ] # defined in Step 1.
router = Router ( model_list = model_list , fallbacks = [ { "bad-model" : [ "my-good-model" ] } ] )
response = router . completion (
model = "bad-model" ,
messages = [ { "role" : "user" , "content" : "Hey, how's it going?" } ] ,
mock_testing_fallbacks = True ,
curl -X POST 'http://0.0.0.0:4000/chat/completions' \
-H 'Content-Type: application/json' \
-H 'Authorization: Bearer sk-1234' \
-d '{
"model": "my-bad-model",
"messages": [
"role": "user",
"content": "ping"
],
"mock_testing_fallbacks": true # 👈 KEY CHANGE
'
Explanation ​
Fallbacks are done in-order - ["gpt-3.5-turbo, "gpt-4", "gpt-4-32k"], will do 'gpt-3.5-turbo' first, then 'gpt-4', etc.
You can also set default_fallbacks , in case a specific model group is misconfigured / bad.
There are 3 types of fallbacks:
content_policy_fallbacks : For litellm.ContentPolicyViolationError - LiteLLM maps content policy violation errors across providers See Code
context_window_fallbacks : For litellm.ContextWindowExceededErrors - LiteLLM maps context window error messages across providers See Code
fallbacks : For all remaining errors - e.g. litellm.RateLimitError
Client Side Fallbacks ​
Set fallbacks in the .completion() call for SDK and client-side for proxy.
In this request the following will occur:
The request to model="zephyr-beta" will fail
litellm proxy will loop through all the model_groups specified in fallbacks=["gpt-3.5-turbo"]
The request to model="gpt-3.5-turbo" will succeed and the client making the request will get a response from gpt-3.5-turbo
👉 Key Change: "fallbacks": ["gpt-3.5-turbo"]
router = Router ( model_list = [ . . ] ) # defined in Step 1.
resp = router . completion (
model = "gpt-3.5-turbo" ,
mock_testing_fallbacks = True , # 👈 trigger fallbacks
fallbacks = [
"model" : "claude-3-haiku" ,
"messages" : [ { "role" : "user" , "content" : "What is LiteLLM?" } ] ,
print ( resp )
OpenAI Python v1.0.0+
Curl Request
Langchain
import openai
client = openai . OpenAI (
api_key = "anything" ,
base_url = "http://0.0.0.0:4000"
response = client . chat . completions . create (
model = "zephyr-beta" ,
messages = [
"role" : "user" ,
"content" : "this is a test request, write a short poem"
extra_body = {
"fallbacks" : [ "gpt-3.5-turbo" ]
print ( response )
curl --location 'http://0.0.0.0:4000/chat/completions' \
--header 'Content-Type: application/json' \
--data '{
"model": "zephyr-beta"",
"content": "what llm are you"
"fallbacks": ["gpt-3.5-turbo"]
}'
from langchain . chat_models import ChatOpenAI
from langchain . prompts . chat import (
ChatPromptTemplate ,
HumanMessagePromptTemplate ,
SystemMessagePromptTemplate ,
from langchain . schema import HumanMessage , SystemMessage
import os
os . environ [ "OPENAI_API_KEY" ] = "anything"
chat = ChatOpenAI (
openai_api_base = "http://0.0.0.0:4000" ,
SystemMessage (
content = "You are a helpful assistant that im using to make a test request to."
) ,
HumanMessage (
content = "test from litellm. tell me why it's amazing in 1 sentence"
]
response = chat ( messages )
Control Fallback Prompts ​
Pass in messages/temperature/etc. per model in fallback (works for embedding/image generation/etc. as well).
Key Change:
"model": <model_name>,
"messages": <model-specific-messages>
... # any other model-specific parameters
"fallbacks" : [ {
"messages" : [ { "role" : "user" , "content" : "What is LiteLLM?" } ]
} ]
curl -L -X POST 'http://0.0.0.0:4000/v1/chat/completions' \
"model": "gpt-3.5-turbo",
"content": [
"type": "text",
"text": "Hi, how are you ?"
"fallbacks": [{
"model": "claude-3-haiku",
"messages": [{"role": "user", "content": "What is LiteLLM?"}]
}],
"mock_testing_fallbacks": true
Content Policy Violation Fallback ​
content_policy_fallbacks = [ { "claude-2" : [ "my-fallback-model" ] } ]
"model_name" : "claude-2" ,
"model" : "claude-2" ,
"api_key" : "" ,
"mock_response" : Exception ( "content filtering policy" ) ,
"model_name" : "my-fallback-model" ,
"mock_response" : "This works!" ,
content_policy_fallbacks = [ { "claude-2" : [ "my-fallback-model" ] } ] , # 👈 KEY CHANGE
# fallbacks=[..], # [OPTIONAL]
# context_window_fallbacks=[..], # [OPTIONAL]
model = "claude-2" ,
In your proxy config.yaml just add this line 👇
content_policy_fallbacks= [ { "claude-2" : [ "my-fallback-model" ] } ]
Start proxy
# RUNNING on http://0.0.0.0:4000
Context Window Exceeded Fallback ​
context_window_fallbacks = [ { "claude-2" : [ "my-fallback-model" ] } ]
"mock_response" : Exception ( "prompt is too long" ) ,
context_window_fallbacks = [ { "claude-2" : [ "my-fallback-model" ] } ] , # 👈 KEY CHANGE
# content_policy_fallbacks=[..], # [OPTIONAL]
context_window_fallbacks= [ { "claude-2" : [ "my-fallback-model" ] } ]
Advanced ​
Fallbacks + Retries + Timeouts + Cooldowns ​
To set fallbacks, just do:
litellm_settings:
fallbacks: [{"zephyr-beta": ["gpt-3.5-turbo"]}]
Covers all errors (429, 500, etc.)
Set via config
- model_name : zephyr - beta
model : huggingface/HuggingFaceH4/zephyr - 7b - beta
api_base : http : //0.0.0.0 : 8001
api_base : http : //0.0.0.0 : 8002
api_base : http : //0.0.0.0 : 8003
model : gpt - 3.5 - turbo
api_key : <my - openai - key >
- model_name : gpt - 3.5 - turbo - 16k
model : gpt - 3.5 - turbo - 16k
litellm_settings :
num_retries : 3 # retry call 3 times on each model_name (e.g. zephyr-beta)
request_timeout : 10 # raise Timeout error if call takes longer than 10s. Sets litellm.request_timeout
fallbacks : [ { "zephyr-beta" : [ "gpt-3.5-turbo" ] } ] # fallback to gpt-3.5-turbo if call fails num_retries
allowed_fails : 3 # cooldown model if it fails > 1 call in a minute.
cooldown_time : 30 # how long to cooldown model if fails/min > allowed_fails
Fallback to Specific Model ID ​
If all models in a group are in cooldown (e.g. rate limited), LiteLLM will fallback to the model with the specific model ID.
This skips any cooldown check for the fallback model.
Specify the model ID in model_info
model : openai/gpt - 4
model_info :
id : my - specific - model - id # 👈 KEY CHANGE
model : azure/chatgpt - v - 2
api_base : os.environ/AZURE_API_BASE
api_key : os.environ/AZURE_API_KEY
- model_name : anthropic - claude
model : anthropic/claude - 3 - opus - 20240229
api_key : os.environ/ANTHROPIC_API_KEY
Note: This will only fallback to the model with the specific model ID. If you want to fallback to another model group, you can set fallbacks=[{"gpt-4": ["anthropic-claude"]}]
Set fallbacks in config
fallbacks : [ { "gpt-4" : [ "my-specific-model-id" ] } ]
Test it!
"model": "gpt-4",
Validate it works, by checking the response header x-litellm-model-id
x-litellm-model-id: my-specific-model-id
Test Fallbacks! ​
Check if your fallbacks are working as expected.
Regular Fallbacks ​
Content Policy Fallbacks ​
"mock_testing_content_policy_fallbacks": true # 👈 KEY CHANGE
Context Window Fallbacks ​
"mock_testing_context_window_fallbacks": true # 👈 KEY CHANGE
Context Window Fallbacks (Pre-Call Checks + Fallbacks) ​
Before call is made check if a call is within model context window with enable_pre_call_checks: true .
See Code
important
enable_pre_call_checks is required for context-window enforcement. Without it, requests are sent to the provider regardless of input token count. Set enable_pre_call_checks: true in router_settings in your config.
Custom max_input_tokens per deployment ​
You can override the default context limit for a deployment by setting max_input_tokens in model_info . This is useful for testing, rate-limiting long prompts, or enforcing stricter limits than the provider's default.
Both of the following are required:
router_settings.enable_pre_call_checks: true — enables pre-call checks
model_info.max_input_tokens on the deployment — overrides the limit for that model
enable_pre_call_checks : true # Required for enforcement
- model_name : gpt - 4o
model : openai/gpt - 4o
api_key : os.environ/OPENAI_API_KEY
max_input_tokens : 10 # Override: reject prompts > 10 tokens
If a request exceeds the limit, LiteLLM raises ContextWindowExceededError with details like Model=gpt-4o, Max Input Tokens=10, Got=306 .
1. Setup config
For azure deployments, set the base model. Pick the base model from this list , all the azure models start with azure/.
Same Group
Context Window Fallbacks (Different Groups)
Filter older instances of a model (e.g. gpt-3.5-turbo) with smaller context windows
enable_pre_call_checks : true # 1. Enable pre-call checks
api_version : "2023-07-01-preview"
base_model : azure/gpt - 4 - 1106 - preview # 2. 👈 (azure-only) SET BASE MODEL
model : gpt - 3.5 - turbo - 1106
2. Start proxy
3. Test it!
text = "What is the meaning of 42?" * 5000
# request sent to model set on litellm proxy, `litellm --model`
{ "role" : "system" , "content" : text } ,
{ "role" : "user" , "content" : "Who was Alexander?" } ,
Fallback to larger models if current model is too small.
- model_name : gpt - 3.5 - turbo - small
- model_name : gpt - 3.5 - turbo - large
- model_name : claude - opus
model : claude - 3 - opus - 20240229
context_window_fallbacks : [ { "gpt-3.5-turbo-small" : [ "gpt-3.5-turbo-large" , "claude-opus" ] } ]
Fallback across providers (e.g. from Azure OpenAI to Anthropic) if you hit content policy violation errors.
content_policy_fallbacks : [ { "gpt-3.5-turbo-small" : [ "claude-opus" ] } ]
Default Fallbacks ​
You can also set default_fallbacks, in case a specific model group is misconfigured / bad.
default_fallbacks : [ "claude-opus" ]
This will default to claude-opus in case any model fails.
A model-specific fallbacks (e.g. {"gpt-3.5-turbo-small": ["claude-opus"]} ) overrides default fallback.
EU-Region Filtering (Pre-Call Checks) ​
Set 'region_name' of deployment.
Note: LiteLLM can automatically infer region_name for Vertex AI, Bedrock, and IBM WatsonxAI based on your litellm params. For Azure, set litellm.enable_preview = True .
1. Set Config
region_name : "eu" # 👈 SET EU-REGION
- model_name : gemini - pro
model : vertex_ai/gemini - pro - 1.5
vertex_project : adroit - crow - 1234
vertex_location : us - east1 # 👈 AUTOMATICALLY INFERS 'region_name'
response = client . chat . completions . with_raw_response . create (
messages = [ { "role" : "user" , "content" : "Who was Alexander?" } ]
print ( f"response.headers.get('x-litellm-model-api-base')" )
Setting Fallbacks for Wildcard Models ​
You can set fallbacks for wildcard models (e.g. azure/* ) in your config file.
Setup config
- model_name : "gpt-4o"
model : "openai/gpt-4o"
- model_name : "azure/*"
model : "azure/*"
fallbacks : [ { "gpt-4o" : [ "azure/gpt-4o" ] } ]
Start Proxy
"model": "gpt-4o",
"text": "what color is red"
"max_tokens": 300,
Disable Fallbacks (Per Request/Key) ​
Per Request
Per Key
You can disable fallbacks per key by setting disable_fallbacks: true in your request body.
"content": "List 5 important events in the XIX century"
"disable_fallbacks": true # 👈 DISABLE FALLBACKS
You can disable fallbacks per key by setting disable_fallbacks: true in your key metadata.
curl -L -X POST 'http://0.0.0.0:4000/key/generate' \
"metadata": {
"disable_fallbacks": true
Quick Start
1. Setup fallbacks
2. Start Proxy
3. Test Fallbacks
Explanation
Client Side Fallbacks
Control Fallback Prompts
Content Policy Violation Fallback
Context Window Exceeded Fallback
Advanced
Fallbacks + Retries + Timeouts + Cooldowns
Fallback to Specific Model ID
Test Fallbacks!
Context Window Fallbacks (Pre-Call Checks + Fallbacks)
Content Policy Fallbacks
Default Fallbacks
EU-Region Filtering (Pre-Call Checks)
Setting Fallbacks for Wildcard Models
Disable Fallbacks (Per Request/Key)
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
