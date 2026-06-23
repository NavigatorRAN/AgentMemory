# Gateway Quickstart | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/learn/gateway_quickstart
- Final URL: https://docs.litellm.ai/docs/learn/gateway_quickstart
- Canonical URL: https://docs.litellm.ai/docs/learn/gateway_quickstart
- Fetched at: 2026-06-23T14:24:23Z
- Content type: text/html; charset=utf-8

## Description

Start LiteLLM Gateway, add models and keys, then connect applications and SDKs to one shared endpoint.

## Extracted Text

Skip to main content
On this page
Use this path if you need one shared OpenAI-compatible endpoint for a team or platform.
If you need a Docker or database-first setup, use the Docker + Database tutorial . Otherwise, use the steps below to get to a working request fast.
1. Install The Gateway ​
uv tool install 'litellm[proxy]'
2. Set One Provider Key ​
export OPENAI_API_KEY="your-api-key"
3. Create config.yaml ​
model_list :
- model_name : gpt - 4o - mini
litellm_params :
model : openai/gpt - 4o - mini
api_key : os.environ/OPENAI_API_KEY
general_settings :
master_key : sk - 1234
database_url : postgresql : //llmproxy : dbpassword9090@db : 5432/litellm
4. Start The Gateway ​
litellm --config config.yaml
You should see the proxy start on http://0.0.0.0:4000 .
5. Send Your First Request ​
curl -X POST 'http://0.0.0.0:4000/chat/completions' \
-H 'Content-Type: application/json' \
-H 'Authorization: Bearer sk-1234' \
-d '{
"model": "gpt-4o-mini",
"messages": [
{"role": "user", "content": "Hello from LiteLLM Gateway"}
]
}'
6. Check The Response ​
If the request succeeds, the proxy returns 200 OK with an OpenAI-style response.
The assistant text will be in:
choices [ 0 ] .message.content
If your gateway is routing to OpenAI, a real response can look like this:
{
"id" : "chatcmpl-abc123" ,
"created" : 1677858242 ,
"model" : "gpt-4o-mini-2024-07-18" ,
"object" : "chat.completion" ,
"system_fingerprint" : "fp_406d6473f8" ,
"choices" : [
"finish_reason" : "stop" ,
"index" : 0 ,
"message" : {
"role" : "assistant" ,
"content" : "Hello! How can I assist you today?" ,
"tool_calls" : null ,
"function_call" : null ,
"annotations" : [ ]
}
] ,
"usage" : {
"completion_tokens" : 9 ,
"prompt_tokens" : 13 ,
"total_tokens" : 22 ,
"completion_tokens_details" : {
"accepted_prediction_tokens" : 0 ,
"audio_tokens" : 0 ,
"reasoning_tokens" : 0 ,
"rejected_prediction_tokens" : 0
} ,
"prompt_tokens_details" : {
"cached_tokens" : 0
"service_tier" : "default"
id , created , the resolved model version, token counts, and message text will vary by request. Other providers may return a smaller or slightly different set of fields, but choices[0].message.content is the main field to read.
7. Add Keys And The UI ​
If you need virtual keys, spend tracking, or the admin UI, add a database next.
Add database_url under general_settings
Use Virtual keys for key creation and budgets
Use Admin UI to manage models and keys
Use the Docker + Database tutorial if you want a fuller setup
8. Pick Your Next Step ​
🖥️
Make LLM Requests
Point LiteLLM or OpenAI-compatible clients to the gateway.
🎛️
Model Config
Add more models and gateway settings.
🔑
Virtual Keys
Create keys, budgets, and access controls.
📈
Add Logging
Capture logs, spend, and traces.
🔀
Load Balance
Route across deployments, regions, or providers.
🛡️
Add Guardrails
Add safety checks and policy enforcement.
📊
Reliability
Configure retries, fallbacks, and timeouts.
When To Use The SDK Path Instead ​
If you only need to call models from one application and do not need centralized auth or shared infrastructure, start with the SDK Quickstart instead.
1. Install The Gateway
2. Set One Provider Key
3. Create config.yaml
4. Start The Gateway
5. Send Your First Request
6. Check The Response
7. Add Keys And The UI
8. Pick Your Next Step
When To Use The SDK Path Instead
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
