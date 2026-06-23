# Arize Phoenix Prompt Management | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/proxy/arize_phoenix_prompts
- Final URL: https://docs.litellm.ai/docs/proxy/arize_phoenix_prompts
- Canonical URL: https://docs.litellm.ai/docs/proxy/arize_phoenix_prompts
- Fetched at: 2026-06-23T14:29:40Z
- Content type: text/html; charset=utf-8

## Description

Use prompt versions from Arize Phoenix with LiteLLM SDK and Proxy.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Use prompt versions from Arize Phoenix with LiteLLM SDK and Proxy.
Quick Start ​
SDK ​
import litellm
response = litellm . completion (
model = "gpt-4o" ,
prompt_id = "UHJvbXB0VmVyc2lvbjox" ,
prompt_integration = "arize_phoenix" ,
api_key = "your-arize-phoenix-token" ,
api_base = "https://app.phoenix.arize.com/s/your-workspace" ,
prompt_variables = { "question" : "What is AI?" } ,
)
Proxy ​
1. Add prompt to config
prompts :
- prompt_id : "simple_prompt"
litellm_params :
prompt_id : "UHJvbXB0VmVyc2lvbjox"
prompt_integration : "arize_phoenix"
api_base : https : //app.phoenix.arize.com/s/your - workspace
api_key : os.environ/PHOENIX_API_KEY
ignore_prompt_manager_model : true # optional: use model from config instead
ignore_prompt_manager_optional_params : true # optional: ignore temp, max_tokens from prompt
2. Make request
curl -X POST 'http://0.0.0.0:4000/chat/completions' \
-H 'Content-Type: application/json' \
-H 'Authorization: Bearer sk-1234' \
-d '{
"model": "gpt-3.5-turbo",
"prompt_id": "simple_prompt",
"prompt_variables": {
"question": "Explain quantum computing"
}
}'
Configuration ​
Get Arize Phoenix Credentials ​
API Token : Get from Arize Phoenix Settings
Workspace URL : https://app.phoenix.arize.com/s/{your-workspace}
Prompt ID : Found in prompt version URL
Set environment variable :
export PHOENIX_API_KEY="your-token"
SDK + PROXY Options ​
Parameter Required Description prompt_id Yes Arize Phoenix prompt version ID prompt_integration Yes Set to "arize_phoenix" api_base Yes Workspace URL api_key Yes Access token prompt_variables No Variables for template
Proxy-only Options ​
Parameter Description ignore_prompt_manager_model Use config model instead of prompt's model ignore_prompt_manager_optional_params Ignore temperature, max_tokens from prompt
Variable Templates ​
Arize Phoenix uses Mustache/Handlebars syntax:
# Template: "Hello {{name}}, question: {{question}}"
prompt_variables = {
"name" : "Alice" ,
"question" : "What is ML?"
# Result: "Hello Alice, question: What is ML?"
Combine with Additional Messages ​
prompt_variables = { "question" : "Explain AI" } ,
messages = [
{ "role" : "user" , "content" : "Keep it under 50 words" }
]
Error Handling ​
try :
prompt_id = "invalid-id" ,
api_base = "https://app.phoenix.arize.com/s/workspace"
except Exception as e :
print ( f"Error: { e } " )
# 404: Prompt not found
# 401: Invalid credentials
# 403: Access denied
Support ​
LiteLLM GitHub Issues
Arize Phoenix Docs
Quick Start
SDK
Proxy
Configuration
Get Arize Phoenix Credentials
SDK + PROXY Options
Proxy-only Options
Variable Templates
Combine with Additional Messages
Error Handling
Support
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
