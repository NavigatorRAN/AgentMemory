# Request Tags for Spend Tracking | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/proxy/request_tags
- Final URL: https://docs.litellm.ai/docs/proxy/request_tags
- Canonical URL: https://docs.litellm.ai/docs/proxy/request_tags
- Fetched at: 2026-06-23T14:32:00Z
- Content type: text/html; charset=utf-8

## Description

Add tags to model deployments to track spend by environment, AWS account, or any custom label.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Add tags to model deployments to track spend by environment, AWS account, or any custom label.
Tags appear in the request_tags field of LiteLLM spend logs.
Requirements
Virtual Keys & a database should be set up. See Virtual Keys Setup .
Config Setup ​
Set tags on model deployments in config.yaml :
config.yaml
model_list :
- model_name : gpt - 4
litellm_params :
model : azure/gpt - 4 - prod
api_key : os.environ/AZURE_PROD_API_KEY
api_base : https : //prod.openai.azure.com/
tags : [ "AWS_IAM_PROD" ] # 👈 Tag for production
- model_name : gpt - 4 - dev
model : azure/gpt - 4 - dev
api_key : os.environ/AZURE_DEV_API_KEY
api_base : https : //dev.openai.azure.com/
tags : [ "AWS_IAM_DEV" ] # 👈 Tag for development
Make Request ​
Option 1: Use Config Tags (Automatic) ​
Requests just specify the model - tags are automatically applied from config:
curl -X POST 'http://0.0.0.0:4000/chat/completions' \
-H 'Authorization: Bearer sk-1234' \
-H 'Content-Type: application/json' \
-d '{
"model": "gpt-4",
"messages": [{"role": "user", "content": "Hello"}]
}'
Option 2: Use x-litellm-tags Header ​
Pass tags dynamically via the x-litellm-tags header as a comma-separated string:
-H 'x-litellm-tags: team-api,production,us-east-1' \
Format: Comma-separated string (spaces are automatically trimmed): "tag1,tag2,tag3"
Option 3: Use Request Body tags ​
Pass tags directly in the request body. Both formats are supported:
Direct tags Field
Metadata Nested
"messages": [{"role": "user", "content": "Hello"}],
"tags": ["team-api", "production", "us-east-1"]
"metadata": {
}
The tags field must be an array of strings.
info
When tags are provided via header or request body, they override any tags configured in the model deployment. If both header and body tags are provided, body tags take precedence.
Set Tags on Keys or Teams ​
You can also set default tags at the API key or team level:
Set on Key
Set on Team
curl -L -X POST 'http://0.0.0.0:4000/key/generate' \
"tags": ["customer-acme", "tier-premium"]
curl -L -X POST 'http://0.0.0.0:4000/team/new' \
"tags": ["team-engineering", "department-ai"]
Advanced: Custom Header Tracking ​
Track spend using any custom header by adding it to your config:
litellm_settings :
extra_spend_tag_headers :
- "x-custom-header"
- "x-customer-id"
Disable User-Agent tracking:
disable_add_user_agent_to_request_tags : true
Spend Logs ​
The tag from the model config appears in LiteLLM_SpendLogs :
{
"request_id" : "chatcmpl-abc123" ,
"request_tags" : [ "AWS_IAM_PROD" ] ,
"spend" : 0.002 ,
"model" : "gpt-4"
Related ​
Spend Tracking Overview - Complete tutorial on tracking spend with tags
Tag Budgets - Set budget limits per tag
Virtual Keys Setup - Required for tag tracking
Config Setup
Make Request
Option 1: Use Config Tags (Automatic)
Option 2: Use x-litellm-tags Header
Option 3: Use Request Body tags
Set Tags on Keys or Teams
Advanced: Custom Header Tracking
Spend Logs
Related
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
