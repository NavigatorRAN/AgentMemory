# Spend Tracking | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/proxy/cost_tracking
- Final URL: https://docs.litellm.ai/docs/proxy/cost_tracking
- Canonical URL: https://docs.litellm.ai/docs/proxy/cost_tracking
- Fetched at: 2026-06-23T14:29:52Z
- Content type: text/html; charset=utf-8

## Description

Track spend for keys, users, and teams across 100+ LLMs.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Track spend for keys, users, and teams across 100+ LLMs.
LiteLLM automatically tracks spend for all known models. See our model cost map
Provider-specific cost tracking (e.g., Vertex AI PayGo / priority pricing , Bedrock service tiers , Azure base model mapping ) is applied automatically when the response includes tier metadata.
Keep Pricing Data Updated
Sync model pricing data from GitHub to ensure accurate cost tracking.
Cost does not match your provider bill?
Use the step-by-step workflow in Debugging a cost discrepancy : align time ranges, compare token categories (including cache), then decide whether the gap is ingestion, formula, or model-map pricing.
How to Track Spend with LiteLLM ​
Step 1
👉 Setup LiteLLM with a Database
Step2 Send /chat/completions request
OpenAI Python v1.0.0+
Curl Request
Langchain
Send Request with Spend Tracking
import openai
client = openai . OpenAI (
api_key = "sk-1234" ,
base_url = "http://0.0.0.0:4000"
)
response = client . chat . completions . create (
model = "llama3" ,
messages = [
{
"role" : "user" ,
"content" : "this is a test request, write a short poem"
}
] ,
user = "palantir" , # OPTIONAL: pass user to track spend by user
extra_body = {
"metadata" : {
"tags" : [ "jobID:214590dsff09fds" , "taskName:run_page_classification" ] # ENTERPRISE: pass tags to track spend by tags
print ( response )
Pass metadata as part of the request body
Curl Request with Spend Tracking
curl --location 'http://0.0.0.0:4000/chat/completions' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer sk-1234' \
--data '{
"model": "llama3",
"messages": [
"role": "user",
"content": "what llm are you"
],
"user": "palantir", # OPTIONAL: pass user to track spend by user
"metadata": {
"tags": ["jobID:214590dsff09fds", "taskName:run_page_classification"] # ENTERPRISE: pass tags to track spend by tags
}'
Langchain with Spend Tracking
from langchain . chat_models import ChatOpenAI
from langchain . prompts . chat import (
ChatPromptTemplate ,
HumanMessagePromptTemplate ,
SystemMessagePromptTemplate ,
from langchain . schema import HumanMessage , SystemMessage
import os
os . environ [ "OPENAI_API_KEY" ] = "sk-1234"
chat = ChatOpenAI (
openai_api_base = "http://0.0.0.0:4000" ,
user = "palantir" ,
SystemMessage (
content = "You are a helpful assistant that im using to make a test request to."
) ,
HumanMessage (
content = "test from litellm. tell me why it's amazing in 1 sentence"
]
response = chat ( messages )
Step3 - Verify Spend Tracked
That's IT. Now Verify your spend was tracked
Response Headers
DB + UI
Expect to see x-litellm-response-cost in the response headers with calculated cost
The following spend gets tracked in Table LiteLLM_SpendLogs
Spend Log Entry Format
"api_key" : "fe6b0cab4ff5a5a8df823196cc8a450*****" , # Hash of API Key used
"user" : "default_user" , # Internal User (LiteLLM_UserTable) that owns `api_key=sk -1234 `.
"team_id" : "e8d1460f-846c-45d7-9b43-55f3cc52ac32" , # Team (LiteLLM_TeamTable) that owns `api_key=sk -1234 `
"request_tags" : [ "jobID:214590dsff09fds" , "taskName:run_page_classification" ] , # Tags sent in request
"end_user" : "palantir" , # Customer - the `user` sent in the request
"model_group" : "llama3" , # "model" passed to LiteLLM
"api_base" : "https://api.groq.com/openai/v1/" , # "api_base" of model used by LiteLLM
"spend" : 0.000002 , # Spend in $
"total_tokens" : 100 ,
"completion_tokens" : 80 ,
"prompt_tokens" : 20 ,
Navigate to the Usage Tab on the LiteLLM UI (found on https://your-proxy-endpoint/ui ) and verify you see spend tracked under Usage
Allowing Non-Proxy Admins to access /spend endpoints ​
Use this when you want non-proxy admins to access /spend endpoints
info
Schedule a meeting with us to get your Enterprise License
Create Key ​
Create Key with with permissions={"get_spend_routes": true}
Generate Key with Spend Route Permissions
curl --location 'http://0.0.0.0:4000/key/generate' \
"permissions": {"get_spend_routes": true}
Use generated key on /spend endpoints ​
Access spend Routes with newly generate keys
curl -X GET 'http://localhost:4000/global/spend/report?start_date=2024-04-01&end_date=2024-06-30' \
-H 'Authorization: Bearer sk-H16BKvrSNConSsBYLGc_7A'
Reset Team, API Key Spend - MASTER KEY ONLY ​
Use /global/spend/reset if you want to:
Reset the Spend for all API Keys, Teams. The spend for ALL Teams and Keys in LiteLLM_TeamTable and LiteLLM_VerificationToken will be set to spend=0
LiteLLM will maintain all the logs in LiteLLMSpendLogs for Auditing Purposes
Request ​
Only the LITELLM_MASTER_KEY you set can access this route
curl -X POST \
'http://localhost:4000/global/spend/reset' \
-H 'Authorization: Bearer sk-1234' \
-H 'Content-Type: application/json'
Expected Responses ​
{"message":"Spend for all API Keys and Teams reset successfully","status":"success"}
Total spend per user ​
Assuming you have been issuing keys for end users, and setting their user_id on the key, you can check their usage.
Get User Spend - API Request
curl -L -X GET 'http://localhost:4000/user/info?user_id=jane_smith' \
-H 'Authorization: Bearer sk-...'
Total for a user API Response
"user_id" : "jane_smith" ,
"user_info" : {
"spend" : 0.1
} ,
"keys" : [
"token" : "6e952b0efcafbb6350240db25ed534b4ec6011b3e1ba1006eb4f903461fd36f6" ,
"key_name" : "sk-...KE_A" ,
"key_alias" : "user-01882d6b-e090-776a-a587-21c63e502670-01983ddb-872f-71a3-8b3a-f9452c705483" ,
"soft_budget_cooldown" : false ,
"spend" : 0.1 ,
"expires" : "2025-07-31T19:14:13.968000+00:00" ,
"models" : [ ] ,
"aliases" : { } ,
"config" : { } ,
"user_id" : "01982d6b-e090-776a-a587-21c63e502660" ,
"team_id" : "f2044fde-2293-482f-bf35-a8dab4e85c5f" ,
"permissions" : { } ,
"max_parallel_requests" : null ,
"metadata" : { } ,
"blocked" : null ,
"tpm_limit" : null ,
"rpm_limit" : null ,
"max_budget" : null ,
"budget_duration" : null ,
"budget_reset_at" : null ,
"allowed_cache_controls" : [ ] ,
"allowed_routes" : [ ] ,
"model_spend" : { } ,
"model_max_budget" : { } ,
"budget_id" : null ,
"organization_id" : null ,
"object_permission_id" : null ,
"created_at" : "2025-07-24T19:14:13.970000Z" ,
"created_by" : "582b168f-fc11-4e14-ad6a-cf4bb3656ddc" ,
"updated_at" : "2025-07-24T19:14:13.970000Z" ,
"updated_by" : "582b168f-fc11-4e14-ad6a-cf4bb3656ddc" ,
"litellm_budget_table" : null ,
"litellm_organization_table" : null ,
"object_permission" : null ,
"team_alias" : null
"teams" : [ ]
Warning
End users can provide the user parameter in their request bodies, doing this will increment the cost reported via /customer/info?end_user_id=self-declared-user , and not for the user that owns the key as reported by that API. This means users could "avoid" having their spend tracked, through their method.
This means if you need to track user spend, and are giving end users API keys, you must always set user_id when creating their api keys, and use keys issued for that user every time you're making LLM calls on their behalf in backend services. This will track their spend.
Spend list endpoints ( /spend/keys and /spend/users ) ​
These endpoints list rows from the verification-token and user tables (ordered by spend). They are included in spend_tracking_routes for internal users.
Access control (default) ​
By default, non-admin callers are scoped to their own data :
Caller role /spend/keys /spend/users proxy_admin / proxy_admin_viewer All keys All users (or ?user_id= for one row) internal_user / internal_user_view_only Keys where user_id matches the caller Only the caller's row Non-admin with no user_id on the key Empty list [] Empty list []
An internal user who passes ?user_id= for another user receives HTTP 403 (not a silently filtered list).
Admin — all keys
curl -X GET 'http://localhost:4000/spend/keys' \
-H 'Authorization: Bearer <proxy-admin-key>'
Internal user — own keys only
-H 'Authorization: Bearer <internal-user-key>'
Legacy unscoped behavior (upgrade path) ​
Before this scoping change, any authenticated key could list the full key/user tables. If you rely on that behavior (for example automation using an internal_user key), opt out explicitly:
config.yaml
general_settings :
legacy_unscoped_spend_list_endpoints : true
Or set the environment variable:
export LITELLM_LEGACY_UNSCOPED_SPEND_LIST_ENDPOINTS=true
When legacy mode is enabled, /spend/keys and /spend/users behave as they did previously for non-admin callers.
To disable scoping without the legacy flag name:
scope_spend_list_endpoints_to_caller : false
See general_settings reference for scope_spend_list_endpoints_to_caller and legacy_unscoped_spend_list_endpoints .
Prefer /user/info?user_id=... or /global/spend/report for per-user spend analytics. The list endpoints are intended for admin dashboards and scoped self-service views.
Daily Spend Breakdown API ​
Retrieve granular daily usage data for a user (by model, provider, and API key) with a single endpoint.
Example Request:
Daily Spend Breakdown API
curl -L -X GET 'http://localhost:4000/user/daily/activity?start_date=2025-03-20&end_date=2025-03-27' \
Daily Spend Breakdown API Response
"results" : [
"date" : "2025-03-27" ,
"metrics" : {
"spend" : 0.0177072 ,
"prompt_tokens" : 111 ,
"completion_tokens" : 1711 ,
"total_tokens" : 1822 ,
"api_requests" : 11
"breakdown" : {
"models" : {
"gpt-4o-mini" : {
"spend" : 1.095e-05 ,
"prompt_tokens" : 37 ,
"completion_tokens" : 9 ,
"total_tokens" : 46 ,
"api_requests" : 1
"providers" : { "openai" : { ... } , "azure_ai" : { ... } } ,
"api_keys" : { "3126b6eaf1..." : { ... } }
"total_spend" : 0.7274667 ,
"total_prompt_tokens" : 280990 ,
"total_completion_tokens" : 376674 ,
"total_api_requests" : 14
API Reference ​
See our Swagger API for more details on the /user/daily/activity endpoint
Custom Tags ​
See Full Request Tags Documentation
For comprehensive documentation on all tag options including x-litellm-tags header, request body tags , and config-based tags, see the dedicated Request Tags page.
Requirements:
Virtual Keys & a database should be set up, see virtual keys
Note: By default, LiteLLM will track User-Agent as a custom tag for cost tracking. This enables viewing usage for tools like Claude Code, Gemini CLI, etc.
Client-side spend tag ​
Set on Key
Set on Team
OpenAI JS
curl -L -X POST 'http://0.0.0.0:4000/key/generate' \
-H 'Content-Type: application/json' \
-d '{
"tags": ["tag1", "tag2", "tag3"]
'
curl -L -X POST 'http://0.0.0.0:4000/team/new' \
Set extra_body={"metadata": { }} to metadata you want to pass
api_key = "anything" ,
model = "gpt-3.5-turbo" ,
"tags" : [ "model-anthropic-claude-v2.1" , "app-ishaan-prod" ] # 👈 Key Change
const openai = require ( "openai" ) ;
async function runOpenAI ( ) {
const client = new openai . OpenAI ( {
apiKey : "sk-1234" ,
baseURL : "http://0.0.0.0:4000" ,
} ) ;
try {
const response = await client . chat . completions . create ( {
model : "gpt-3.5-turbo" ,
messages : [
role : "user" ,
content : "this is a test request, write a short poem" ,
metadata : {
tags : [ "model-anthropic-claude-v2.1" , "app-ishaan-prod" ] , // 👈 Key Change
console . log ( response ) ;
} catch ( error ) {
console . log ( "got this exception from server" ) ;
console . error ( error ) ;
// Call the asynchronous function
runOpenAI ( ) ;
"model": "gpt-3.5-turbo",
"metadata": {"tags": ["model-anthropic-claude-v2.1", "app-ishaan-prod"]}
temperature = 0.1 ,
"tags" : [ "model-anthropic-claude-v2.1" , "app-ishaan-prod" ]
Add custom headers to spend tracking ​
You can add custom headers to the request to track spend and usage.
litellm_settings :
extra_spend_tag_headers :
- "x-custom-header"
Disable user-agent tracking ​
You can disable user-agent tracking by setting litellm_settings.disable_add_user_agent_to_request_tags to true .
disable_add_user_agent_to_request_tags : true
✨ (Enterprise) Generate Spend Reports ​
Use this to charge other teams, customers, users
Use the /global/spend/report endpoint to get spend reports
Spend Per Team
Spend Per Customer
Spend for Specific API Key
Spend for Internal User (Key Owner)
Example Request ​
👉 Key Change: Specify group_by=team
curl -X GET 'http://localhost:4000/global/spend/report?start_date=2024-04-01&end_date=2024-06-30&group_by=team' \
-H 'Authorization: Bearer sk-1234'
Example Response ​
Expected Response
Script to Parse Response (Python)
[
"group_by_day": "2024-04-30T00:00:00+00:00",
"teams": [
"team_name": "Prod Team",
"total_spend": 0.0015265,
"metadata": [ # see the spend by unique(key + model)
"model": "gpt-4",
"spend": 0.00123,
"total_tokens": 28,
"api_key": "88dc28.." # the hashed api key
},
"api_key": "a73dc2.." # the hashed api key
"model": "chatgpt-v-2",
"spend": 0.000214,
"total_tokens": 122,
"api_key": "898c28.." # the hashed api key
"spend": 0.0000825,
"total_tokens": 85,
"api_key": "84dc28.." # the hashed api key
import requests
url = 'http://localhost:4000/global/spend/report'
params = {
'start_date' : '2023-04-01' ,
'end_date' : '2024-06-30'
headers = {
'Authorization' : 'Bearer sk-1234'
# Make the GET request
response = requests . get ( url , headers = headers , params = params )
spend_report = response . json ( )
for row in spend_report :
date = row [ "group_by_day" ]
teams = row [ "teams" ]
for team in teams :
team_name = team [ "team_name" ]
total_spend = team [ "total_spend" ]
metadata = team [ "metadata" ]
print ( f"Date: { date } " )
print ( f"Team: { team_name } " )
print ( f"Total Spend: { total_spend } " )
print ( "Metadata: " , metadata )
print ( )
Output from script
# Date: 2024-05-11T00:00:00+00:00
# Team: local_test_team
# Total Spend: 0.003675099999999999
# Metadata: [{'model': 'gpt-3.5-turbo', 'spend': 0.003675099999999999, 'api_key': 'b94d5e0bc3a71a573917fe1335dc0c14728c7016337451af9714924ff3a729db', 'total_tokens': 3105}]
# Date: 2024-05-13T00:00:00+00:00
# Team: Unassigned Team
# Total Spend: 3.4e-05
# Metadata: [{'model': 'gpt-3.5-turbo', 'spend': 3.4e-05, 'api_key': '9569d13c9777dba68096dea49b0b03e0aaf4d2b65d4030eda9e8a2733c3cd6e0', 'total_tokens': 50}]
# Team: central
# Total Spend: 0.000684
# Metadata: [{'model': 'gpt-3.5-turbo', 'spend': 0.000684, 'api_key': '0323facdf3af551594017b9ef162434a9b9a8ca1bbd9ccbd9d6ce173b1015605', 'total_tokens': 498}]
# Total Spend: 0.0005715000000000001
# Metadata: [{'model': 'gpt-3.5-turbo', 'spend': 0.0005715000000000001, 'api_key': 'b94d5e0bc3a71a573917fe1335dc0c14728c7016337451af9714924ff3a729db', 'total_tokens': 423}]
Customer this is user passed to /chat/completions request
LiteLLM API key
👉 Key Change: Specify group_by=customer
curl -X GET 'http://localhost:4000/global/spend/report?start_date=2024-04-01&end_date=2024-06-30&group_by=customer' \
"customers": [
"customer": "palantir",
👉 Key Change: Specify api_key=sk-1234
curl -X GET 'http://localhost:4000/global/spend/report?start_date=2024-04-01&end_date=2024-06-30&api_key=sk-1234' \
"api_key": "example-api-key-123",
"total_cost": 0.3201286305151999,
"total_input_tokens": 36.0,
"total_output_tokens": 1593.0,
"model_details": [
"model": "dall-e-3",
"total_cost": 0.31999939051519993,
"total_input_tokens": 0,
"total_output_tokens": 0
"model": "llama3-8b-8192",
"total_cost": 0.00012924,
"total_input_tokens": 36,
"total_output_tokens": 1593
Internal User (Key Owner): This is the value of user_id passed when calling /key/generate
👉 Key Change: Specify internal_user_id=ishaan
curl -X GET 'http://localhost:4000/global/spend/report?start_date=2024-04-01&end_date=2024-12-30&internal_user_id=ishaan' \
"total_cost": 0.00013132,
"total_input_tokens": 105.0,
"total_output_tokens": 872.0,
"model": "gpt-3.5-turbo-instruct",
"total_cost": 5.85e-05,
"total_input_tokens": 15,
"total_output_tokens": 18
"total_cost": 7.282000000000001e-05,
"total_input_tokens": 90,
"total_output_tokens": 854
"api_key": "151e85e46ab8c9c7fad090793e3fe87940213f6ae665b543ca633b0b85ba6dc6",
"total_cost": 5.2699999999999993e-05,
"total_input_tokens": 26.0,
"total_output_tokens": 27.0,
"total_cost": 5.2499999999999995e-05,
"total_input_tokens": 24,
"total_output_tokens": 27
"model": "text-embedding-ada-002",
"total_cost": 2e-07,
"total_input_tokens": 2,
"api_key": "60cb83a2dcbf13531bd27a25f83546ecdb25a1a6deebe62d007999dc00e1e32a",
"total_cost": 9.42e-06,
"total_input_tokens": 30.0,
"total_output_tokens": 99.0,
"total_input_tokens": 30,
"total_output_tokens": 99
📊 Spend Logs API - Individual Transaction Logs ​
The /spend/logs endpoint now supports a summarize parameter to control data format when using date filters.
Key Parameters ​
Parameter Description summarize New parameter : true (default) = aggregated data, false = individual transaction logs
Examples ​
Get individual transaction logs:
Get Individual Transaction Logs
curl -X GET "http://localhost:4000/spend/logs?start_date=2024-01-01&end_date=2024-01-02&summarize=false" \
-H "Authorization: Bearer sk-1234"
Get summarized data (default):
Get Summarized Spend Data
curl -X GET "http://localhost:4000/spend/logs?start_date=2024-01-01&end_date=2024-01-02" \
Use Cases:
summarize=false : Analytics dashboards, ETL processes, detailed audit trails
summarize=true : Daily spending reports, high-level cost tracking (legacy behavior)
✨ Custom Spend Log metadata ​
Log specific key,value pairs as part of the metadata for a spend log
Logging specific key,value pairs in spend logs metadata is an enterprise feature.
Usage - /chat/completions requests with special spend logs metadata ​
Using Headers
"spend_logs_metadata": {
"hello": "world"
# request sent to model set on litellm proxy, `litellm --model`
"spend_logs_metadata" : {
"hello" : "world"
Using Headers:
# Pass spend logs metadata via headers
extra_headers = {
"x-litellm-spend-logs-metadata" : '{"user_id": "12345", "project_id": "proj_abc", "request_type": "chat_completion"}'
const openai = require ( 'openai' ) ;
apiKey : 'sk-1234' ,
baseURL : 'http://0.0.0.0:4000'
model : 'gpt-3.5-turbo' ,
role : 'user' ,
content : "this is a test request, write a short poem"
spend_logs_metadata : { // 👈 Key Change
hello : "world"
} , {
headers : {
'x-litellm-spend-logs-metadata' : '{"user_id": "12345", "project_id": "proj_abc", "request_type": "chat_completion"}'
Pass x-litellm-spend-logs-metadata as a request header with JSON string
--header 'x-litellm-spend-logs-metadata: {"user_id": "12345", "project_id": "proj_abc", "request_type": "chat_completion"}' \
Viewing Spend w/ custom metadata ​ /spend/logs Request Format ​
curl -X GET "http://0.0.0.0:4000/spend/logs?request_id=<your-call-id" \ # e.g.: chatcmpl-9ZKMURhVYSi9D6r6PJ9vLcayIK0Vm
/spend/logs Response Format ​
"request_id": "chatcmpl-9ZKMURhVYSi9D6r6PJ9vLcayIK0Vm",
"call_type": "acompletion",
"user_api_key": "example-api-key-123",
"user_api_key_alias": null,
"spend_logs_metadata": { # 👈 LOGGED CUSTOM METADATA
"user_api_key_team_id": null,
"user_api_key_user_id": "116544810872468347480",
"user_api_key_team_alias": null
How to Track Spend with LiteLLM
Allowing Non-Proxy Admins to access /spend endpoints
Total spend per user
Spend list endpoints ( /spend/keys and /spend/users )
Access control (default)
Legacy unscoped behavior (upgrade path)
API Reference
Custom Tags
Client-side spend tag
Add custom headers to spend tracking
Disable user-agent tracking
✨ (Enterprise) Generate Spend Reports
📊 Spend Logs API - Individual Transaction Logs
Key Parameters
Examples
✨ Custom Spend Log metadata
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
