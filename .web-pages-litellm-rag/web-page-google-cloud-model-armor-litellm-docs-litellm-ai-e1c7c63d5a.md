# Google Cloud Model Armor | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/proxy/guardrails/model_armor
- Final URL: https://docs.litellm.ai/docs/proxy/guardrails/model_armor
- Canonical URL: https://docs.litellm.ai/docs/proxy/guardrails/model_armor
- Fetched at: 2026-06-23T14:30:41Z
- Content type: text/html; charset=utf-8

## Description

LiteLLM supports Google Cloud Model Armor guardrails via the Model Armor API.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
LiteLLM supports Google Cloud Model Armor guardrails via the Model Armor API .
Supported Guardrails ​
Model Armor Templates - Content sanitization and blocking based on configured templates
Quick Start ​
1. Define Guardrails on your LiteLLM config.yaml ​
Define your guardrails under the guardrails section
model_list :
- model_name : gpt - 3.5 - turbo
litellm_params :
model : openai/gpt - 3.5 - turbo
api_key : os.environ/OPENAI_API_KEY
guardrails :
- guardrail_name : model - armor - shield
guardrail : model_armor
mode : [ pre_call , during_call , post_call ] # Run on input, parallel, and output
template_id : "your-template-id" # Required: Your Model Armor template ID
project_id : "your-project-id" # Your GCP project ID
location : "us-central1" # GCP location (default: us-central1)
credentials : "path/to/credentials.json" # Path to service account key
mask_request_content : true # Enable request content masking
mask_response_content : true # Enable response content masking
fail_on_error : true # Fail request if Model Armor errors (default: true)
default_on : true # Run by default for all requests
Supported values for mode ​
pre_call Run before LLM call, on input
during_call Run in parallel with LLM call, on input
post_call Run after LLM call, on output
2. Start LiteLLM Gateway ​
litellm --config config.yaml --detailed_debug
3. Test request ​
Langchain, OpenAI SDK Usage Examples
curl -i http://localhost:4000/v1/chat/completions \
-H "Content-Type: application/json" \
-H "Authorization: Bearer sk-npnwjPQciVRok5yNZgKmFQ" \
-d '{
"model": "gpt-3.5-turbo",
"messages": [
{"role": "user", "content": "Hi, my email is test@example.com"}
],
"guardrails": ["model-armor-shield"]
}'
Supported Params ​
Common Params ​
api_key - str - Google Cloud service account credentials (optional if using ADC)
api_base - str - Custom Model Armor API endpoint (optional)
default_on - bool - Whether to run the guardrail by default. Default is false .
mode - Union[str, list[str]] - Mode to run the guardrail. Supported values: pre_call , during_call , post_call . Default is pre_call .
Model Armor Specific ​
template_id - str - The ID of your Model Armor template (required)
project_id - str - Google Cloud project ID (defaults to credentials project)
location - str - Google Cloud location/region. Default is us-central1
credentials - Union[str, dict] - Path to service account JSON file or credentials dictionary
api_endpoint - str - Custom API endpoint for Model Armor (optional)
fail_on_error - bool - Whether to fail requests if Model Armor encounters errors. Default is true
mask_request_content - bool - Enable masking of sensitive content in requests. Default is false
mask_response_content - bool - Enable masking of sensitive content in responses. Default is false
Further Reading ​
Control Guardrails per API Key
Supported Guardrails
Quick Start
1. Define Guardrails on your LiteLLM config.yaml
2. Start LiteLLM Gateway
3. Test request
Supported Params
Common Params
Model Armor Specific
Further Reading
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
