# Guardrails AI | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/proxy/guardrails/guardrails_ai
- Final URL: https://docs.litellm.ai/docs/proxy/guardrails/guardrails_ai
- Canonical URL: https://docs.litellm.ai/docs/proxy/guardrails/guardrails_ai
- Fetched at: 2026-06-23T14:30:32Z
- Content type: text/html; charset=utf-8

## Description

Use Guardrails AI (guardrailsai.com) to add checks to LLM output.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Use Guardrails AI ( guardrailsai.com ) to add checks to LLM output.
Pre-requisites ​
Setup Guardrails AI Server. quick start
Usage ​
Setup config.yaml
model_list :
- model_name : gpt - 3.5 - turbo
litellm_params :
model : gpt - 3.5 - turbo
api_key : os.environ/OPENAI_API_KEY
guardrails :
- guardrail_name : "guardrails_ai-guard"
guardrail : guardrails_ai
guard_name : "detect-secrets-guard" # 👈 Guardrail AI guard name
mode : "pre_call"
guardrails_ai_api_input_format : "llmOutput" # 👈 This is the only option that currently works (and it is a default), use it for both pre_call and post_call hooks
api_base : os.environ/GUARDRAILS_AI_API_BASE # 👈 Guardrails AI API Base. Defaults to "http://0.0.0.0:8000"
Start LiteLLM Gateway
litellm --config config.yaml --detailed_debug
Test request
Langchain, OpenAI SDK Usage Examples
curl -i http://localhost:4000/v1/chat/completions \
-H "Content-Type: application/json" \
-H "Authorization: Bearer sk-npnwjPQciVRok5yNZgKmFQ" \
-d '{
"model": "gpt-3.5-turbo",
"messages": [
{"role": "user", "content": "hi my email is ishaan@berri.ai"}
],
"guardrails": ["guardrails_ai-guard"]
}'
✨ Control Guardrails per Project (API Key) ​
info
✨ This is an Enterprise only feature Contact us to get a free trial
Use this to control what guardrails run per project. In this tutorial we only want the following guardrails to run for 1 project (API Key)
guardrails : ["aporia-pre-guard", "aporia-post-guard"]
Step 1 Create Key with guardrail settings
/key/generate
/key/update
curl -X POST 'http://0.0.0.0:4000/key/generate' \
-H 'Authorization: Bearer sk-1234' \
-H 'Content-Type: application/json' \
}
curl --location 'http://0.0.0.0:4000/key/update' \
--header 'Authorization: Bearer sk-1234' \
--header 'Content-Type: application/json' \
--data '{
"key": "sk-jNm1Zar7XfNdZXp49Z1kSQ",
Step 2 Test it with new key
curl --location 'http://0.0.0.0:4000/chat/completions' \
--header 'Authorization: Bearer sk-jNm1Zar7XfNdZXp49Z1kSQ' \
{
"role": "user",
"content": "my email is ishaan@berri.ai"
]
Pre-requisites
Usage
✨ Control Guardrails per Project (API Key)
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
