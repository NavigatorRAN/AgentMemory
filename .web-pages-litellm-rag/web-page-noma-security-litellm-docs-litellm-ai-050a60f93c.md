# Noma Security | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/proxy/guardrails/noma_security
- Final URL: https://docs.litellm.ai/docs/proxy/guardrails/noma_security
- Canonical URL: https://docs.litellm.ai/docs/proxy/guardrails/noma_security
- Fetched at: 2026-06-23T14:30:42Z
- Content type: text/html; charset=utf-8

## Description

Use Noma Security to protect your LLM applications with comprehensive AI content moderation and safety guardrails.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Use Noma Security to protect your LLM applications with comprehensive AI content moderation and safety guardrails.
Deprecated: guardrail: noma (Legacy)
guardrail: noma is deprecated and users should migrate to guardrail: noma_v2 .
The legacy guardrail: noma API will no longer be supported after March 31, 2026.
For easier migration of existing integrations, keep guardrail: noma and set use_v2: true .
With use_v2: true , requests route to noma_v2 ; monitor_mode and block_failures still apply, while anonymize_input is ignored.
Noma v2 guardrails (Recommended) ​
Quick Start ​
litellm config.yaml
guardrails :
- guardrail_name : "noma-v2-guard"
litellm_params :
guardrail : noma_v2
mode : "pre_call"
api_key : os.environ/NOMA_API_KEY
api_base : os.environ/NOMA_API_BASE
If you want to migrate gradually without changing guardrail names yet:
- guardrail_name : "noma-guard"
guardrail : noma
use_v2 : true
Supported Params ​
guardrail : Use noma_v2 (recommended), or noma with use_v2: true for migration
mode : pre_call , post_call , during_call , pre_mcp_call , during_mcp_call
api_key : Noma API key (required for Noma SaaS, optional for self-managed deployments)
api_base : Noma API base URL (defaults to https://api.noma.security/ )
application_id : Application identifier. If omitted, v2 checks dynamic extra_body.application_id , then configured/env application_id ; otherwise it is omitted.
monitor_mode : If true , runs in monitor-only mode without blocking (defaults to false )
block_failures : If true , fail-closed on guardrail technical failures (defaults to true )
use_v2 : Migration toggle when guardrail: noma is used
Environment Variables ​
export NOMA_API_KEY="your-api-key-here"
export NOMA_API_BASE="https://api.noma.security/" # Optional
export NOMA_APPLICATION_ID="my-app" # Optional
export NOMA_MONITOR_MODE="false" # Optional
export NOMA_BLOCK_FAILURES="true" # Optional
Multiple Guardrails ​
Apply different v2 configurations for input and output:
- guardrail_name : "noma-v2-input"
- guardrail_name : "noma-v2-output"
mode : "post_call"
Pass Additional Parameters ​
This is supported in v2 via extra_body .
Currently, noma_v2 consumes dynamic application_id .
Curl Request
curl 'http://0.0.0.0:4000/v1/chat/completions' \
-H 'Content-Type: application/json' \
-d '{
"model": "gpt-4o-mini",
"messages": [
{
"role": "user",
"content": "Hello, how are you?"
}
],
"guardrails": {
"noma-v2-guard": {
"extra_body": {
"application_id": "my-specific-app-id"
}'
Noma guardrails (Legacy) ​
1. Define Guardrails on your LiteLLM config.yaml ​
Define your guardrails under the guardrails section:
model_list :
- model_name : gpt - 4o - mini
model : openai/gpt - 4o - mini
api_key : os.environ/OPENAI_API_KEY
mode : "during_call"
- guardrail_name : "noma-pre-guard"
Supported values for mode ​
pre_call Run before LLM call, on input
post_call Run after LLM call, on input & output
during_call Run during LLM call, on input . Same as pre_call but runs in parallel with the LLM call. Response not returned until guardrail check completes
pre_mcp_call : Scan MCP tool call inputs before execution
during_mcp_call : Monitor MCP tool calls in real-time
2. Start LiteLLM Gateway ​
litellm --config config.yaml --detailed_debug
3. Test request ​
Unsuccessful call
Successful Call
Expect this to fail since the request contains harmful content:
curl -i http://0.0.0.0:4000/v1/chat/completions \
-H "Content-Type: application/json" \
{"role": "user", "content": "Tell me how to hack into someone's email account"}
]
Expected response on failure:
"error" : {
"message" : "{\n \"error\": \"Request blocked by Noma guardrail\",\n \"details\": {\n \"prompt\": {\n \"harmfulContent\": {\n \"result\": true,\n \"confidence\": 0.95\n }\n }\n }\n }" ,
"type" : "None" ,
"param" : "None" ,
"code" : "400"
{"role": "user", "content": "What is the capital of France?"}
Expected response:
"id" : "chatcmpl-123" ,
"object" : "chat.completion" ,
"created" : 1677652288 ,
"model" : "gpt-4o-mini" ,
"choices" : [
"index" : 0 ,
"message" : {
"role" : "assistant" ,
"content" : "The capital of France is Paris."
} ,
"finish_reason" : "stop"
] ,
"usage" : {
"prompt_tokens" : 9 ,
"completion_tokens" : 12 ,
"total_tokens" : 21
### OPTIONAL ###
# application_id: "my-app"
# monitor_mode: false
# block_failures: true
# anonymize_input: false
Required Parameters ​
api_key : Your Noma Security API key (set as os.environ/NOMA_API_KEY in YAML config)
Optional Parameters ​
application_id : Your application identifier (defaults to "litellm" )
monitor_mode : If true , logs violations without blocking (defaults to false )
block_failures : If true , blocks requests when guardrail API failures occur (defaults to true )
anonymize_input : If true , replaces sensitive content with anonymized version (defaults to false )
You can set these environment variables instead of hardcoding values in your config:
export NOMA_ANONYMIZE_INPUT="false" # Optional
Advanced Configuration ​
Monitor Mode ​
Use monitor mode to test your guardrails without blocking requests:
- guardrail_name : "noma-monitor"
monitor_mode : true # Log violations but don't block
Handling API Failures ​
Control behavior when the Noma API is unavailable:
- guardrail_name : "noma-failopen"
block_failures : false # Allow requests to proceed if guardrail API fails
Content Anonymization ​
Enable anonymization to replace sensitive content instead of blocking:
- guardrail_name : "noma-anonymize"
anonymize_input : true # Replace sensitive data with anonymized version
Apply different configurations for input and output:
- guardrail_name : "noma-strict-input"
block_failures : true
- guardrail_name : "noma-monitor-output"
monitor_mode : true
✨ Pass Additional Parameters ​
Use extra_body to pass additional parameters to the Noma Security API call, such as dynamically setting the application ID for specific requests.
OpenAI Python
Curl
import openai
client = openai . OpenAI (
api_key = "your-api-key" ,
base_url = "http://0.0.0.0:4000"
)
response = client . chat . completions . create (
model = "gpt-4o-mini" ,
messages = [ { "role" : "user" , "content" : "Hello, how are you?" } ] ,
extra_body = {
"guardrails" : {
"noma-guard" : {
"extra_body" : {
"application_id" : "my-specific-app-id"
"noma-guard": {
This allows you to override the default application_id parameter for specific requests, which is useful for tracking usage across different applications or components.
Response Details ​
When content is blocked, Noma provides detailed information about the violations as JSON inside the message field, with the following structure:
"error" : "Request blocked by Noma guardrail" ,
"details" : {
"prompt" : {
"harmfulContent" : {
"result" : true ,
"confidence" : 0.95
"sensitiveData" : {
"email" : {
"entities" : [ "user@example.com" ]
"bannedTopics" : {
"violence" : {
"confidence" : 0.88
Noma v2 guardrails (Recommended)
Quick Start
Supported Params
Environment Variables
Multiple Guardrails
Pass Additional Parameters
Noma guardrails (Legacy)
1. Define Guardrails on your LiteLLM config.yaml
2. Start LiteLLM Gateway
3. Test request
Required Parameters
Optional Parameters
Advanced Configuration
Monitor Mode
Handling API Failures
Content Anonymization
✨ Pass Additional Parameters
Response Details
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
