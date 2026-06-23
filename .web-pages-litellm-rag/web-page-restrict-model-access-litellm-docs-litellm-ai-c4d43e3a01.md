# Restrict Model Access | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/proxy/model_access
- Final URL: https://docs.litellm.ai/docs/proxy/model_access
- Canonical URL: https://docs.litellm.ai/docs/proxy/model_access
- Fetched at: 2026-06-23T14:31:27Z
- Content type: text/html; charset=utf-8

## Description

Restrict models by Virtual Key

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Restrict models by Virtual Key ​
Set allowed models for a key using the models param
curl 'http://0.0.0.0:4000/key/generate' \
--header 'Authorization: Bearer <your-master-key>' \
--header 'Content-Type: application/json' \
--data-raw '{"models": ["gpt-3.5-turbo", "gpt-4"]}'
info
This key can only make requests to models that are gpt-3.5-turbo or gpt-4
Verify this is set correctly by
Allowed Access
Disallowed Access
curl -i http://localhost:4000/v1/chat/completions \
-H "Content-Type: application/json" \
-H "Authorization: Bearer sk-1234" \
-d '{
"model": "gpt-4",
"messages": [
{"role": "user", "content": "Hello"}
]
}'
Expect this to fail since gpt-4o is not in the models for the key generated
"model": "gpt-4o",
API Reference ​
Restrict models by team_id ​
litellm-dev can only access azure-gpt-3.5
1. Create a team via /team/new
curl --location 'http://localhost:4000/team/new' \
--data-raw '{
"team_alias": "litellm-dev",
"models": ["azure-gpt-3.5"]
# returns {...,"team_id": "my-unique-id"}
2. Create a key for team
curl --location 'http://localhost:4000/key/generate' \
--header 'Authorization: Bearer sk-1234' \
--data-raw '{"team_id": "my-unique-id"}'
3. Test it
curl --location 'http://0.0.0.0:4000/chat/completions' \
--header 'Authorization: Bearer sk-qo992IjKOC2CHKZGRoJIGA' \
--data '{
"model": "BEDROCK_GROUP",
{
"role": "user",
"content": "hi"
}
{"error":{"message":"Invalid model for team litellm-dev: BEDROCK_GROUP. Valid models for team are: ['azure-gpt-3.5']\n\n\nTraceback (most recent call last):\n File \"/Users/ishaanjaffer/Github/litellm/litellm/proxy/proxy_server.py\", line 2298, in chat_completion\n _is_valid_team_configs(\n File \"/Users/ishaanjaffer/Github/litellm/litellm/proxy/utils.py\", line 1296, in _is_valid_team_configs\n raise Exception(\nException: Invalid model for team litellm-dev: BEDROCK_GROUP. Valid models for team are: ['azure-gpt-3.5']\n\n","type":"None","param":"None","code":500}}%
View Available Fallback Models ​
Use the /v1/models endpoint to discover available fallback models for a given model. This helps you understand which backup models are available when your primary model is unavailable or restricted.
Extension Point
The include_metadata parameter serves as an extension point for exposing additional model metadata in the future. While currently focused on fallback models, this approach will be expanded to include other model metadata such as pricing information, capabilities, rate limits, and more.
Basic Usage ​
Get all available models:
curl -X GET 'http://localhost:4000/v1/models' \
-H 'Authorization: Bearer <your-api-key>'
Get Fallback Models with Metadata ​
Include metadata to see fallback model information:
curl -X GET 'http://localhost:4000/v1/models?include_metadata=true' \
Get Specific Fallback Types ​
You can specify the type of fallbacks you want to see:
General Fallbacks
Context Window Fallbacks
Content Policy Fallbacks
curl -X GET 'http://localhost:4000/v1/models?include_metadata=true&fallback_type=general' \
General fallbacks are alternative models that can handle the same types of requests.
curl -X GET 'http://localhost:4000/v1/models?include_metadata=true&fallback_type=context_window' \
Context window fallbacks are models with larger context windows that can handle requests when the primary model's context limit is exceeded.
curl -X GET 'http://localhost:4000/v1/models?include_metadata=true&fallback_type=content_policy' \
Content policy fallbacks are models that can handle requests when the primary model rejects content due to safety policies.
Example Response ​
When include_metadata=true is specified, the response includes fallback information:
"data" : [
"id" : "gpt-4" ,
"object" : "model" ,
"created" : 1677610602 ,
"owned_by" : "openai" ,
"fallbacks" : {
"general" : [ "gpt-3.5-turbo" , "claude-3-sonnet" ] ,
"context_window" : [ "gpt-4-turbo" , "claude-3-opus" ] ,
"content_policy" : [ "claude-3-haiku" ]
Use Cases ​
High Availability : Identify backup models to ensure service continuity
Cost Optimization : Find cheaper alternatives when primary models are expensive
Content Filtering : Discover models with different content policies
Context Length : Find models that can handle larger inputs
Load Balancing : Distribute requests across multiple compatible models
API Parameters ​
Parameter Type Description include_metadata boolean Include additional model metadata including fallbacks fallback_type string Filter fallbacks by type: general , context_window , or content_policy
Advanced: Model Access Groups ​
For advanced use cases, use Model Access Groups to dynamically group multiple models and manage access without restarting the proxy.
Role Based Access Control (RBAC) ​
Restrict models by Virtual Key
API Reference
Restrict models by team_id
View Available Fallback Models
Basic Usage
Get Fallback Models with Metadata
Get Specific Fallback Types
Example Response
Use Cases
API Parameters
Advanced: Model Access Groups
Role Based Access Control (RBAC)
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
