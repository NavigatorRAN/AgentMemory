# [DEPRECATED] Team-based Routing | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/proxy/team_based_routing
- Final URL: https://docs.litellm.ai/docs/proxy/team_based_routing
- Canonical URL: https://docs.litellm.ai/docs/proxy/team_based_routing
- Fetched at: 2026-06-23T14:32:11Z
- Content type: text/html; charset=utf-8

## Description

This is deprecated, please use Tag Based Routing instead

## Extracted Text

Skip to main content
On this page
Copy as Markdown
info
This is deprecated, please use Tag Based Routing instead
Routing ​
Route calls to different model groups based on the team-id
Config with model group ​
Create a config.yaml with 2 model groups + connected postgres db
model_list :
- model_name : gpt - 3.5 - turbo - eu # 👈 Model Group 1
litellm_params :
model : azure/chatgpt - v - 2
api_base : os.environ/AZURE_API_BASE_EU
api_key : os.environ/AZURE_API_KEY_EU
api_version : "2023-07-01-preview"
- model_name : gpt - 3.5 - turbo - worldwide # 👈 Model Group 2
api_base : os.environ/AZURE_API_BASE
api_key : os.environ/AZURE_API_KEY
general_settings :
master_key : sk - 1234
database_url : "postgresql://..." # 👈 Connect proxy to DB
Start proxy
litellm --config /path/to/config.yaml
Create Team with Model Alias ​
curl --location 'http://0.0.0.0:4000/team/new' \
--header 'Authorization: Bearer sk-1234' \ # 👈 Master Key
--header 'Content-Type: application/json' \
--data '{
"team_alias": "my-new-team_4",
"model_aliases": {"gpt-3.5-turbo": "gpt-3.5-turbo-eu"}
}'
# Returns team_id: my-team-id
Create Team Key ​
curl --location 'http://localhost:4000/key/generate' \
--header 'Authorization: Bearer sk-1234' \
"team_id": "my-team-id", # 👈 YOUR TEAM ID
Call Model with alias ​
curl --location 'http://0.0.0.0:4000/v1/chat/completions' \
--header 'Authorization: Bearer sk-A1L0C3Px2LJl53sF_kTF9A' \
"model": "gpt-3.5-turbo", # 👈 MODEL
"messages": [{"role": "system", "content": "You'\''re an expert at writing poems"}, {"role": "user", "content": "Write me a poem"}, {"role": "user", "content": "What'\''s your name?"}],
"user": "usha"
Routing
Config with model group
Create Team with Model Alias
Create Team Key
Call Model with alias
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
