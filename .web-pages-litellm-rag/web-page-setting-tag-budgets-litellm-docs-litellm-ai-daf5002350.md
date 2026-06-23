# Setting Tag Budgets | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/proxy/tag_budgets
- Final URL: https://docs.litellm.ai/docs/proxy/tag_budgets
- Canonical URL: https://docs.litellm.ai/docs/proxy/tag_budgets
- Fetched at: 2026-06-23T14:32:09Z
- Content type: text/html; charset=utf-8

## Description

Track spend and set budgets for your API requests using tags. Tags allow you to categorize and monitor costs across different cost centers, projects, and departments.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Track spend and set budgets for your API requests using tags. Tags allow you to categorize and monitor costs across different cost centers, projects, and departments.
Pre-Requisites ​
You must set up a Postgres database (e.g. Supabase, Neon, etc.)
What are Tags? ​
Tags are labels you can attach to your LLM requests to track and limit spending by category.
Common Use Cases:
Cost Center Tracking : Allocate LLM costs to specific departments or business units (e.g., "engineering", "marketing", "customer-support")
Project-based Budgeting : Set budgets for different projects or initiatives (e.g., "project-alpha", "chatbot-v2")
Customer Attribution : Track spend per customer or client (e.g., "customer-acme", "customer-techcorp")
Feature Monitoring : Monitor costs for specific features (e.g., "feature-chat", "feature-summarization")
Tags can be set on each request (in metadata or via x-litellm-tags ), or attached to a virtual key so every request using that key inherits the tag and its budget limits automatically.
Setting Tag Budgets ​
1. Create a tag with budget ​
Create a tag to represent a cost center, project, or any budget category. Set max_budget ($ value allowed) and budget_duration (how frequently the budget resets).
Example: Create a tag for your Engineering department with a monthly $500 budget
API ​
Create a new tag and set max_budget and budget_duration
curl -X POST 'http://0.0.0.0:4000/tag/new' \
-H 'Authorization: Bearer sk-1234' \
-H 'Content-Type: application/json' \
-d '{
"name": "engineering",
"description": "Engineering department cost center",
"max_budget": 500.0,
"budget_duration": "30d"
}'
Request Body Parameters:
Parameter Type Required Description name string Yes Unique name for the tag (e.g., cost center name) description string No Description of what this tag tracks models list[string] No Restrict tag to specific models max_budget float No Maximum budget in USD budget_duration string No How often budget resets (e.g., "30d", "1d") soft_budget float No Soft budget limit for warnings
Response:
{
"name" : "engineering" ,
"description" : "Engineering department cost center" ,
"max_budget" : 500.0 ,
"budget_duration" : "30d" ,
"budget_reset_at" : "2025-11-10T00:00:00Z" ,
"created_at" : "2025-10-11T00:00:00Z"
}
LiteLLM Admin UI ​
Navigate to the Tag Management page and click Create New Tag . Fill in the tag details and set your budget:
Possible values for budget_duration :
budget_duration When Budget will reset budget_duration="1s" every 1 second budget_duration="1m" every 1 minute budget_duration="1h" every 1 hour budget_duration="1d" every 1 day budget_duration="7d" every 1 week budget_duration="30d" every 1 month
2. Attach the tag to an API key (recommended) ​
Attach the tag when creating or updating a virtual key. Every request made with that key automatically inherits the tag, and the proxy enforces the tag's budget without requiring clients to pass metadata.tags on each request.
Use the top-level tags field on /key/generate or /key/update :
curl -X POST 'http://0.0.0.0:4000/key/generate' \
"tags": ["engineering"]
You can also set tags under key metadata :
"metadata": {
Navigate to Virtual Keys → Create Key (or edit an existing key) and select the tag(s) in the Tags field.
3. Use the tag in your requests (optional) ​
If you did not attach tags to the API key, add tags to each request in the metadata field (or via the x-litellm-tags header — see Request Tags ):
OpenAI SDK
cURL
import openai
client = openai . OpenAI (
api_key = "sk-1234" , # Your LiteLLM proxy key
base_url = "http://0.0.0.0:4000"
)
response = client . chat . completions . create (
model = "gpt-4" ,
messages = [ { "role" : "user" , "content" : "Hello" } ] ,
extra_body = {
"metadata" : {
"tags" : [ "engineering" ]
curl -X POST 'http://0.0.0.0:4000/chat/completions' \
"model": "gpt-4",
"messages": [{"role": "user", "content": "Hello"}],
4. Test It ​
Make requests with the virtual key from step 2 until the tag budget is exceeded. You do not need to pass metadata.tags if the tag is already on the key:
-H 'Authorization: Bearer sk-your-key-with-engineering-tag' \
"messages": [{"role": "user", "content": "Hello"}]
If you skipped step 2, include the tag in the request body instead:
When budget is exceeded, you'll see:
"error" : {
"message" : "Budget has been exceeded! Tag=engineering Current cost: 505.50, Max budget: 500.0" ,
"type" : "budget_exceeded" ,
"param" : null ,
"code" : "400"
Managing Tags ​
View Tag Information ​
Get information about specific tags:
curl -X POST 'http://0.0.0.0:4000/tag/info' \
"names": ["engineering", "marketing"]
"engineering" : {
"spend" : 245.50 ,
"created_at" : "2025-10-11T00:00:00Z" ,
"updated_at" : "2025-10-11T12:30:00Z"
} ,
"marketing" : {
"name" : "marketing" ,
"description" : "Marketing department cost center" ,
"spend" : 89.20 ,
"max_budget" : 300.0 ,
Update Tag Budget ​
Update an existing tag's budget:
curl -X POST 'http://0.0.0.0:4000/tag/update' \
"max_budget": 750.0,
Delete Tag ​
curl -X POST 'http://0.0.0.0:4000/tag/delete' \
"name": "engineering"
Multiple Tags per Request ​
You can apply multiple tags to a single request to track costs across different dimensions simultaneously. For example, track both the cost center and the specific project:
"tags" : [ "engineering" , "project-alpha" , "customer-acme" ]
"tags": ["engineering", "project-alpha", "customer-acme"]
Budget Enforcement: If any tag exceeds its budget, the request will be rejected.
Pre-Requisites
What are Tags?
Setting Tag Budgets
1. Create a tag with budget
2. Attach the tag to an API key (recommended)
3. Use the tag in your requests (optional)
4. Test It
Managing Tags
View Tag Information
Update Tag Budget
Delete Tag
Multiple Tags per Request
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
