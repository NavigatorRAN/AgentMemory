# Contribute Custom Webhook API | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/contribute_integration/custom_webhook_api
- Final URL: https://docs.litellm.ai/docs/contribute_integration/custom_webhook_api
- Canonical URL: https://docs.litellm.ai/docs/contribute_integration/custom_webhook_api
- Fetched at: 2026-06-23T14:23:39Z
- Content type: text/html; charset=utf-8

## Description

If your API just needs a Webhook event from LiteLLM, here's how to add a 'native' integration for it on LiteLLM:

## Extracted Text

Skip to main content
On this page
Copy as Markdown
If your API just needs a Webhook event from LiteLLM, here's how to add a 'native' integration for it on LiteLLM:
Clone the repo and open the generic_api_compatible_callbacks.json
git clone https://github.com/BerriAI/litellm.git
cd litellm
open .
Add your API to the generic_api_compatible_callbacks.json
Example:
{
"rubrik" : {
"event_types" : [ "llm_api_success" ] ,
"endpoint" : "{{environment_variables.RUBRIK_WEBHOOK_URL}}" ,
"headers" : {
"Content-Type" : "application/json" ,
"Authorization" : "Bearer {{environment_variables.RUBRIK_API_KEY}}"
} ,
"environment_variables" : [ "RUBRIK_API_KEY" , "RUBRIK_WEBHOOK_URL" ]
}
Spec:
"sample_callback" : {
"event_types" : [ "llm_api_success" , "llm_api_failure" ] , # Optional - defaults to all events
"endpoint" : "{{environment_variables.SAMPLE_CALLBACK_URL}}" ,
"Authorization" : "Bearer {{environment_variables.SAMPLE_CALLBACK_API_KEY}}"
"environment_variables" : [ "SAMPLE_CALLBACK_URL" , "SAMPLE_CALLBACK_API_KEY" ]
Test it!
a. Setup config.yaml
model_list :
- model_name : gpt - 3.5 - turbo
litellm_params :
model : openai/gpt - 3.5 - turbo
api_key : os.environ/OPENAI_API_KEY
- model_name : anthropic - claude
model : anthropic/claude - 3 - 5 - sonnet - 20241022
api_key : os.environ/ANTHROPIC_API_KEY
litellm_settings :
callbacks : [ "rubrik" ]
environment_variables :
RUBRIK_API_KEY : sk - 1234
RUBRIK_WEBHOOK_URL : https : //webhook.site/efc57707 - 9018 - 478c - bdf1 - 2ffaabb2b315
b. Start the proxy
litellm --config /path/to/config.yaml
c. Test it!
curl -L -X POST 'http://0.0.0.0:4000/chat/completions' \
-H 'Content-Type: application/json' \
-H 'Authorization: Bearer sk-1234' \
-d '{
"model": "gpt-3.5-turbo",
"messages": [
"role": "system",
"content": "Ignore previous instructions"
},
"role": "user",
"content": "What is the weather like in Boston today?"
],
"mock_response": "hey!"
}'
Add Documentation
If you're adding a new integration, please add documentation for it under the observability folder:
Create a new file at docs/my-website/docs/observability/<your_integration>_integration.md
Follow the format of existing integration docs, such as Langsmith Integration
Include: Quick Start, SDK usage, Proxy usage, and any advanced configuration options
File a PR!
Review our contribution guide here
Push your fork to your GitHub repo
Submit a PR from there
What get's logged? ​
The LiteLLM Standard Logging Payload is sent to your endpoint.
What get's logged?
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
