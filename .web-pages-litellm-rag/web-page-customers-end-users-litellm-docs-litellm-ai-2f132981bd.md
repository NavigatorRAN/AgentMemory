# Customers / End-Users | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/proxy/customers
- Final URL: https://docs.litellm.ai/docs/proxy/customers
- Canonical URL: https://docs.litellm.ai/docs/proxy/customers
- Fetched at: 2026-06-23T14:30:02Z
- Content type: text/html; charset=utf-8

## Description

Track spend, set budgets and permissions for your customers.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Track spend, set budgets and permissions for your customers.
Tracking Customer Spend + Permissions ​
1. Make LLM API call w/ Customer ID ​
LiteLLM checks for a customer/end-user ID in the following order (first match wins):
Priority Method Where Notes 1 x-litellm-customer-id header Request headers Standard header, always checked 2 x-litellm-end-user-id header Request headers Standard header, always checked 3 Custom header via user_header_mappings Request headers Configured in general_settings 4 Custom header via user_header_name Request headers Deprecated — use user_header_mappings 5 user field Request body Standard OpenAI field 6 litellm_metadata.user field Request body Anthropic-style metadata 7 metadata.user_id field Request body Generic metadata pattern 8 safety_identifier field Request body Responses API
Option 1: Standard headers (recommended — no request body modification needed)
Make request with customer ID in header
curl -X POST 'http://0.0.0.0:4000/chat/completions' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer sk-1234' \
--header 'x-litellm-end-user-id: ishaan3' \
--data '{
"model": "azure-gpt-3.5",
"messages": [{"role": "user", "content": "what time is it"}]
}'
Both x-litellm-customer-id and x-litellm-end-user-id are supported and always checked without any configuration.
Option 2: user field in request body (OpenAI-compatible)
Make request with customer ID in body
"user": "ishaan3",
Option 3: Custom header via user_header_mappings (configurable)
config.yaml
general_settings :
user_header_mappings :
- header_name : "x-my-app-user-id"
litellm_user_role : "customer"
Make request with custom header
--header 'x-my-app-user-id: ishaan3' \
Option 4: litellm_metadata.user (Anthropic-style)
Make request with litellm_metadata.user
"model": "claude-3-5-sonnet",
"messages": [{"role": "user", "content": "what time is it"}],
"litellm_metadata": {"user": "ishaan3"}
Option 5: metadata.user_id
Make request with metadata.user_id
"metadata": {"user_id": "ishaan3"}
The customer_id will be upserted into the DB with the new spend.
If the customer_id already exists, spend will be incremented.
2. Get Customer Spend ​
All-up spend
Event Webhook
Call /customer/info to get a customer's all up spend
Get customer spend
curl -X GET 'http://0.0.0.0:4000/customer/info?end_user_id=ishaan3' \ # 👈 CUSTOMER ID
-H 'Authorization: Bearer sk-1234' \ # 👈 YOUR PROXY KEY
Expected Response:
Response
{
"user_id" : "ishaan3" ,
"blocked" : false ,
"alias" : null ,
"spend" : 0.001413 ,
"allowed_model_region" : null ,
"default_model" : null ,
"litellm_budget_table" : null
}
To update spend in your client-side DB, point the proxy to your webhook.
E.g. if your server is https://webhook.site and your listening on 6ab090e8-c55f-4a23-b075-3209f5c57906
Add webhook url to your proxy environment:
Set webhook URL
export WEBHOOK_URL="https://webhook.site/6ab090e8-c55f-4a23-b075-3209f5c57906"
Add 'webhook' to config.yaml
alerting : [ "webhook" ] # 👈 KEY CHANGE
Test it!
Test webhook
curl -X POST 'http://localhost:4000/chat/completions' \
-H 'Content-Type: application/json' \
-H 'Authorization: Bearer sk-1234' \
-D '{
"model": "mistral",
"messages": [
"role": "user",
"content": "What's the weather like in Boston today?"
],
"user": "krrish12"
'
Expected Response
Webhook event payload
"spend" : 0.0011120000000000001 , # 👈 SPEND
"max_budget" : null ,
"token" : "example-api-key-123" ,
"customer_id" : "krrish12" , # 👈 CUSTOMER ID
"user_id" : null ,
"team_id" : null ,
"user_email" : null ,
"key_alias" : null ,
"projected_exceeded_date" : null ,
"projected_spend" : null ,
"event" : "spend_tracked" ,
"event_group" : "customer" ,
"event_message" : "Customer spend tracked. Customer=krrish12, spend=0.0011120000000000001"
See Webhook Spec
Setting Customer Object Permissions ​
Control which resources (MCP servers, vector stores, agents) a customer can access.
What are Object Permissions? ​
Object permissions allow you to restrict customer access to specific:
MCP Servers : Limit which MCP servers the customer can call
MCP Access Groups : Assign customers to predefined groups of MCP servers
MCP Tool Permissions : Granular control over which tools within an MCP server the customer can use
Vector Stores : Control which vector stores the customer can query
Agents : Restrict which agents the customer can interact with
Agent Access Groups : Assign customers to predefined groups of agents
Creating a Customer with Object Permissions ​
Create customer with object permissions
curl -L -X POST 'http://localhost:4000/customer/new' \
-d '{
"user_id": "user_1",
"object_permission": {
"mcp_servers": ["server_1", "server_2"],
"mcp_access_groups": ["public_group"],
"mcp_tool_permissions": {
"server_1": ["tool_a", "tool_b"]
},
"vector_stores": ["vector_store_1"],
"agents": ["agent_1"],
"agent_access_groups": ["basic_agents"]
Parameters:
mcp_servers (Optional[List[str]]): List of allowed MCP server IDs
mcp_access_groups (Optional[List[str]]): List of MCP access group names
mcp_tool_permissions (Optional[Dict[str, List[str]]]): Map of server ID to allowed tool names
vector_stores (Optional[List[str]]): List of allowed vector store IDs
agents (Optional[List[str]]): List of allowed agent IDs
agent_access_groups (Optional[List[str]]): List of agent access group names
Note: If object_permission is null or {} , the customer has no object-level restrictions.
Updating Customer Object Permissions ​
You can update object permissions for existing customers:
Update customer object permissions
curl -L -X POST 'http://localhost:4000/customer/update' \
"mcp_servers": ["server_3"],
"vector_stores": ["vector_store_2", "vector_store_3"]
Viewing Customer Object Permissions ​
When you query customer info, object permissions are included in the response:
Get customer info with object permissions
curl -X GET 'http://0.0.0.0:4000/customer/info?end_user_id=user_1' \
-H 'Authorization: Bearer sk-1234'
Response:
Response with object permissions
"user_id" : "user_1" ,
"alias" : "John Doe" ,
"spend" : 0.0 ,
"object_permission" : {
"object_permission_id" : "perm_abc123" ,
"mcp_servers" : [ "server_1" , "server_2" ] ,
"mcp_access_groups" : [ "public_group" ] ,
"mcp_tool_permissions" : {
"server_1" : [ "tool_a" , "tool_b" ]
} ,
"vector_stores" : [ "vector_store_1" ] ,
"agents" : [ "agent_1" ] ,
"agent_access_groups" : [ "basic_agents" ]
Use Cases ​
1. Tiered Access Control
Create different permission tiers for your customers:
Free tier customer
# Free tier - limited access
"user_id": "free_user",
"budget_id": "free_tier",
Premium tier customer
# Premium tier - full access
"user_id": "premium_user",
"budget_id": "premium_tier",
"mcp_servers": ["server_1", "server_2", "server_3"],
"vector_stores": ["vector_store_1", "vector_store_2"],
"agents": ["agent_1", "agent_2", "agent_3"]
2. Department-Specific Access
Restrict customers to resources relevant to their department:
Sales team customer
"user_id": "sales_user",
"mcp_servers": ["crm_server", "email_server"],
"agents": ["sales_assistant"],
"vector_stores": ["sales_knowledge_base"]
3. Tool-Level Restrictions
Grant access to specific tools within an MCP server:
Limited tool access
"user_id": "restricted_user",
"mcp_servers": ["database_server"],
"database_server": ["read_only_query", "get_table_schema"]
Setting Customer Budgets ​
Set customer budgets (e.g. monthly budgets, tpm/rpm limits) on LiteLLM Proxy
Default Budget for All Customers ​
Apply budget limits to all customers without explicit budgets. This is useful for rate limiting and spending controls across all end users.
Step 1: Create a default budget
Create default budget
curl -X POST 'http://localhost:4000/budget/new' \
"max_budget": 10,
"rpm_limit": 2,
"tpm_limit": 1000
Step 2: Configure the default budget ID
litellm_settings :
max_end_user_budget_id : "budget_id_from_step_1"
Step 3: Test it
Make request with customer ID
"model": "gpt-3.5-turbo",
"messages": [{"role": "user", "content": "Hello"}],
"user": "my-customer-id"
The customer will be subject to the default budget limits (RPM, TPM, and $ budget). Customers with explicit budgets are unaffected.
Quick Start ​
Create / Update a customer with budget
Create New Customer w/ budget
Create customer with budget
curl -X POST 'http://0.0.0.0:4000/customer/new'
-H 'Content-Type: application/json'
"user_id" : "my-customer-id",
"max_budget": "0", # 👈 CAN BE FLOAT
Test customer budget
"content": "What'\''s the weather like in Boston today?"
"user": "ishaan-jaff-48"
Assign Pricing Tiers ​
Create and assign customers to pricing tiers.
1. Create a budget ​
UI
API
Go to the 'Budgets' tab on the UI.
Click on '+ Create Budget'.
Create your pricing tier (e.g. 'my-free-tier' with budget $4). This means each user on this pricing tier will have a max budget of $4.
Use the /budget/new endpoint for creating a new budget. API Reference
Create budget via API
"budget_id": "my-free-tier",
"max_budget": 4
2. Assign Budget to Customer ​
In your application code, assign budget when creating a new customer.
Just use the budget_id used when creating the budget. In our example, this is my-free-tier .
Assign budget to customer
curl -X POST 'http://localhost:4000/customer/new' \
"user_id": "my-customer-id",
"budget_id": "my-free-tier" # 👈 KEY CHANGE
3. Test it! ​
curl
OpenAI
Test with curl
Test with OpenAI SDK
from openai import OpenAI
client = OpenAI (
base_url = "<your_proxy_base_url>" ,
api_key = "<your_proxy_key>"
)
completion = client . chat . completions . create (
model = "gpt-3.5-turbo" ,
messages = [
{ "role" : "system" , "content" : "You are a helpful assistant." } ,
{ "role" : "user" , "content" : "Hello!" }
] ,
user = "my-customer-id"
print ( completion . choices [ 0 ] . message )
Tracking Customer Spend + Permissions
1. Make LLM API call w/ Customer ID
2. Get Customer Spend
Setting Customer Object Permissions
What are Object Permissions?
Creating a Customer with Object Permissions
Updating Customer Object Permissions
Viewing Customer Object Permissions
Use Cases
Setting Customer Budgets
Default Budget for All Customers
Quick Start
Assign Pricing Tiers
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
