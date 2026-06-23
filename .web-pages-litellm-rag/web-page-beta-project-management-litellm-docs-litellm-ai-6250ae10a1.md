# ✨ [Beta] Project Management | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/proxy/project_management
- Final URL: https://docs.litellm.ai/docs/proxy/project_management
- Canonical URL: https://docs.litellm.ai/docs/proxy/project_management
- Fetched at: 2026-06-23T14:31:45Z
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
Projects in LiteLLM sit between teams and keys in the organizational hierarchy, enabling fine-grained access control and budget management for specific use cases or applications.
Hierarchy : Organizations > Teams > Projects > Keys
Quick Start ​
This walkthrough shows how to create a project, generate an API key, make requests, and view project-level spend tracking in the UI.
Step 1: Create a Project ​
curl --location 'http://0.0.0.0:4000/project/new' \
--header 'Authorization: Bearer sk-1234' \
--header 'Content-Type: application/json' \
--data '{
"project_alias": "flight-search-assistant",
"team_id": "ad898803-c8a3-4f4a-976a-a3c372cffa45",
"models": ["gpt-4", "gpt-3.5-turbo"],
"max_budget": 100,
"metadata": {
"use_case_id": "SNOW-12345",
"responsible_ai_id": "RAI-67890"
}
}' | jq
Response:
{
"project_id" : "e402a141-725a-4437-bff5-d47459189716" ,
"project_alias" : "flight-search-assistant" ,
"team_id" : "ad898803-c8a3-4f4a-976a-a3c372cffa45" ,
"models" : [ "gpt-4" , "gpt-3.5-turbo" ] ,
"max_budget" : 100 ,
...
Step 2: Generate API Key for Project ​
curl 'http://0.0.0.0:4000/key/generate' \
--data-raw '{
"models": ["gpt-3.5-turbo", "gpt-4"],
"metadata": {"user": "ishaan@berri.ai"},
"project_id": "e402a141-725a-4437-bff5-d47459189716"
"key" : "sk-W8VbscpfuyvHm5TkxRYiXA" ,
"key_name" : "sk-...YiXA" ,
Step 3: Use API Key in Chat Completions ​
curl http://localhost:4000/v1/chat/completions \
--header 'Authorization: Bearer sk-W8VbscpfuyvHm5TkxRYiXA' \
"model": "gpt-4",
"messages": [{"role": "user", "content": "What is litellm?"}]
Step 4: View Project Spend in UI ​
Navigate to the Logs page in the LiteLLM Admin UI. You'll see the user_api_key_project_id tracked in the request metadata:
As shown above, the spend logs metadata includes:
"user_api_key_project_id": "e402a141-725a-4437-bff5-d47459189716" - Links the request to your project
All costs and token usage are automatically attributed to the project
You can query and filter logs by project ID for detailed reporting
API Endpoints ​
POST /project/new ​
Create a new project.
Who can call : Admins or Team Admins
Parameters :
project_alias (string, optional): Human-readable name for the project
team_id (string, required): The team this project belongs to
models (array, optional): List of models the project can access
max_budget (float, optional): Maximum spend budget for the project
tpm_limit (int, optional): Tokens per minute limit
rpm_limit (int, optional): Requests per minute limit
budget_duration (string, optional): Budget reset period (e.g., "30d", "1mo")
metadata (object, optional): Custom metadata for the project
blocked (boolean, optional): Block all API calls for this project
Example :
"project_alias": "hotel-recommendations",
"team_id": "team-123",
"models": ["claude-3-sonnet"],
"max_budget": 200,
"tpm_limit": 100000,
"use_case_id": "SNOW-12346",
"cost_center": "travel-products"
}'
Response :
"project_id" : "project-def" ,
"project_alias" : "hotel-recommendations" ,
"team_id" : "team-123" ,
"models" : [ "claude-3-sonnet" ] ,
"spend" : 0.0 ,
"budget_id" : "budget-xyz" ,
"metadata" : {
"use_case_id" : "SNOW-12346" ,
"cost_center" : "travel-products"
} ,
"created_at" : "2025-01-15T10:00:00Z" ,
"updated_at" : "2025-01-15T10:00:00Z"
POST /project/update ​
Update an existing project.
project_id (string, required): The project to update
project_alias (string, optional): Updated project name
team_id (string, optional): Move project to different team
models (array, optional): Updated list of allowed models
max_budget (float, optional): Updated budget
tpm_limit (int, optional): Updated TPM limit
rpm_limit (int, optional): Updated RPM limit
metadata (object, optional): Updated metadata
blocked (boolean, optional): Updated blocked status
curl --location 'http://0.0.0.0:4000/project/update' \
"project_id": "project-abc",
"tpm_limit": 200000,
"status": "production"
GET /project/info ​
Get information about a specific project.
project_id (string, required): Query parameter
curl --location 'http://0.0.0.0:4000/project/info?project_id=project-abc' \
--header 'Authorization: Bearer sk-1234'
"project_id" : "project-abc" ,
"spend" : 45.67 ,
"model_spend" : {
"gpt-4" : 42.30 ,
"gpt-3.5-turbo" : 3.37
"litellm_budget_table" : {
"max_budget" : 100.0 ,
"tpm_limit" : 100000 ,
"rpm_limit" : 100
"use_case_id" : "SNOW-12345"
GET /project/list ​
List all projects the user has access to.
curl --location 'http://0.0.0.0:4000/project/list' \
[
"spend" : 45.67
"spend" : 23.45
]
DELETE /project/delete ​
Delete one or more projects.
Who can call : Admins only
project_ids (array, required): List of project IDs to delete
curl --location --request DELETE 'http://0.0.0.0:4000/project/delete' \
"project_ids": ["project-abc", "project-def"]
Note : Projects with associated API keys cannot be deleted. Delete or reassign the keys first.
Model-Specific Quotas ​
You can set different quotas for different models within a project:
"project_alias": "multi-model-project",
"models": ["gpt-4", "gpt-3.5-turbo", "claude-3-sonnet"],
"max_budget": 500,
"model_tpm_limit": {
"gpt-4": 50000,
"gpt-3.5-turbo": 200000,
"claude-3-sonnet": 100000
},
"model_rpm_limit": {
"gpt-4": 50,
"gpt-3.5-turbo": 500,
"claude-3-sonnet": 100
Quick Start
Step 1: Create a Project
Step 2: Generate API Key for Project
Step 3: Use API Key in Chat Completions
Step 4: View Project Spend in UI
API Endpoints
POST /project/new
POST /project/update
GET /project/info
GET /project/list
DELETE /project/delete
Model-Specific Quotas
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
