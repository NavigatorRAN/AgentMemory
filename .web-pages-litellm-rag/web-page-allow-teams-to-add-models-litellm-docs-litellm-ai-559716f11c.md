# ✨ Allow Teams to Add Models | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/proxy/team_model_add
- Final URL: https://docs.litellm.ai/docs/proxy/team_model_add
- Canonical URL: https://docs.litellm.ai/docs/proxy/team_model_add
- Fetched at: 2026-06-23T14:32:13Z
- Content type: text/html; charset=utf-8

## Description

This is an Enterprise feature.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
info
This is an Enterprise feature.
Enterprise Pricing
Contact us here to get a free trial
Allow team to add a their own models/key for that project - so any OpenAI call they make uses their OpenAI key.
Useful for teams that want to call their own finetuned models.
Specify Team ID in /model/add endpoint ​
curl -L -X POST 'http://0.0.0.0:4000/model/new' \
-H 'Authorization: Bearer sk-******2ql3-sm28WU0tTAmA' \ # 👈 Team API Key (has same 'team_id' as below)
-H 'Content-Type: application/json' \
-d '{
"model_name": "my-team-model", # 👈 Call LiteLLM with this model name
"litellm_params": {
"model": "openai/gpt-4o",
"custom_llm_provider": "openai",
"api_key": "******ccb07",
"api_base": "https://my-azure-endpoint.openai.azure.com",
"api_version": "2023-12-01-preview"
},
"model_info": {
"team_id": "e59e2671-a064-436a-a0fa-16ae96e5a0a1" # 👈 Specify the team ID it belongs to
}
}'
Test it! ​
curl -L -X POST 'http://0.0.0.0:4000/v1/chat/completions' \
-H 'Authorization: Bearer sk-******2ql3-sm28WU0tTAmA' \ # 👈 Team API Key
"model": "my-team-model", # 👈 team model name
"messages": [
{
"role": "user",
"content": "What's the weather like in Boston today?"
]
Debugging ​
'model_name' not found ​
Check if model alias exists in team table.
curl -L -X GET 'http://localhost:4000/team/info?team_id=e59e2671-a064-436a-a0fa-16ae96e5a0a1' \
-H 'Authorization: Bearer sk-******2ql3-sm28WU0tTAmA' \
Expected Response:
"team_id" : "e59e2671-a064-436a-a0fa-16ae96e5a0a1" ,
"team_info" : {
... ,
"litellm_model_table" : {
"model_aliases" : {
"my-team-model" : # 👈 public model name "model_name_e59e2671-a064-436a-a0fa-16ae96e5a0a1_e81c9286-2195-4bd9-81e1-cf393788a1a0" 👈 internally generated model name (used to ensure uniqueness)
} ,
"created_by" : "default_user_id" ,
"updated_by" : "default_user_id"
Specify Team ID in /model/add endpoint
Test it!
Debugging
'model_name' not found
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
