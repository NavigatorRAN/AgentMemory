# Structured Output /v1/messages | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/anthropic_unified/structured_output
- Final URL: https://docs.litellm.ai/docs/anthropic_unified/structured_output
- Canonical URL: https://docs.litellm.ai/docs/anthropic_unified/structured_output
- Fetched at: 2026-06-23T14:22:48Z
- Content type: text/html; charset=utf-8

## Description

Use LiteLLM to call Anthropic's structured output feature via the /v1/messages endpoint.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Use LiteLLM to call Anthropic's structured output feature via the /v1/messages endpoint.
Supported Providers ​
Provider Supported Notes Anthropic ✅ Native support Azure AI (Anthropic models) ✅ Claude models on Azure AI Bedrock (Converse Anthropic models) ✅ Claude models via Bedrock Converse API Bedrock (Invoke Anthropic models) ✅ Claude models via Bedrock Invoke API
Usage ​
LiteLLM Proxy Server ​
Anthropic
Azure AI (Anthropic)
Bedrock (Converse)
Bedrock (Invoke)
Setup config.yaml
model_list :
- model_name : claude - sonnet
litellm_params :
model : anthropic/claude - sonnet - 4 - 5 - 20250514
api_key : os.environ/ANTHROPIC_API_KEY
Start proxy
litellm --config /path/to/config.yaml
Test it!
curl http://localhost:4000/v1/messages \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $LITELLM_API_KEY" \
-H "anthropic-version: 2023-06-01" \
-d '{
"model": "claude-sonnet",
"max_tokens": 1024,
"messages": [
{
"role": "user",
"content": "Extract the key information from this email: John Smith (john@example.com) is interested in our Enterprise plan and wants to schedule a demo for next Tuesday at 2pm."
}
],
"output_format": {
"type": "json_schema",
"schema": {
"type": "object",
"properties": {
"name": {"type": "string"},
"email": {"type": "string"},
"plan_interest": {"type": "string"},
"demo_requested": {"type": "boolean"}
},
"required": ["name", "email", "plan_interest", "demo_requested"],
"additionalProperties": false
}'
- model_name : azure - claude - sonnet
model : azure_ai/claude - sonnet - 4 - 5 - 20250514
api_key : os.environ/AZURE_AI_API_KEY
api_base : https : //your - endpoint.inference.ai.azure.com
"model": "azure-claude-sonnet",
- model_name : bedrock - claude - sonnet
model : bedrock/global.anthropic.claude - sonnet - 4 - 5 - 20250929 - v1 : 0
aws_access_key_id : os.environ/AWS_ACCESS_KEY_ID
aws_secret_access_key : os.environ/AWS_SECRET_ACCESS_KEY
aws_region_name : us - west - 2
"model": "bedrock-claude-sonnet",
- model_name : bedrock - claude - invoke
model : bedrock/invoke/global.anthropic.claude - sonnet - 4 - 5 - 20250929 - v1 : 0
"model": "bedrock-claude-invoke",
Example Response ​
"id" : "msg_01XFDUDYJgAACzvnptvVoYEL" ,
"type" : "message" ,
"role" : "assistant" ,
"content" : [
"type" : "text" ,
"text" : "{\"name\":\"John Smith\",\"email\":\"john@example.com\",\"plan_interest\":\"Enterprise\",\"demo_requested\":true}"
] ,
"model" : "claude-sonnet-4-5-20250514" ,
"stop_reason" : "end_turn" ,
"stop_sequence" : null ,
"usage" : {
"input_tokens" : 75 ,
"output_tokens" : 28
Request Format ​
output_format ​
The output_format parameter specifies the structured output format.
"output_format" : {
"type" : "json_schema" ,
"schema" : {
"type" : "object" ,
"properties" : {
"field_name" : { "type" : "string" } ,
"another_field" : { "type" : "integer" }
} ,
"required" : [ "field_name" , "another_field" ] ,
"additionalProperties" : false
Fields ​
type (string): Must be "json_schema"
schema (object): A JSON Schema object defining the expected output structure
type (string): The root type, typically "object"
properties (object): Defines the fields and their types
required (array): List of required field names
additionalProperties (boolean): Set to false to enforce strict schema adherence
Supported Providers
Usage
LiteLLM Proxy Server
Example Response
Request Format
output_format
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
