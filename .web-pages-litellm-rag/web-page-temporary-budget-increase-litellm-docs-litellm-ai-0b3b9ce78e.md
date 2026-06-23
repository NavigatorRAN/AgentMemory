# ✨ Temporary Budget Increase | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/proxy/temporary_budget_increase
- Final URL: https://docs.litellm.ai/docs/proxy/temporary_budget_increase
- Canonical URL: https://docs.litellm.ai/docs/proxy/temporary_budget_increase
- Fetched at: 2026-06-23T14:32:14Z
- Content type: text/html; charset=utf-8

## Description

Set temporary budget increase for a LiteLLM Virtual Key. Use this if you get asked to increase the budget for a key temporarily.

## Extracted Text

Skip to main content
Copy as Markdown
Set temporary budget increase for a LiteLLM Virtual Key. Use this if you get asked to increase the budget for a key temporarily.
Hierarchy Supported LiteLLM Virtual Key ✅ User ❌ Team ❌ Organization ❌
note
✨ Temporary Budget Increase is a LiteLLM Enterprise feature.
Enterprise Pricing
Get free 7-day trial key
Create a LiteLLM Virtual Key with budget
curl -L -X POST 'http://localhost:4000/key/generate' \
-H 'Content-Type: application/json' \
-H 'Authorization: Bearer LITELLM_MASTER_KEY' \
-d '{
"max_budget": 0.0000001
}'
Expected response:
{
"key" : "sk-your-new-key"
}
Update key with temporary budget increase
curl -L -X POST 'http://localhost:4000/key/update' \
"key": "sk-your-new-key",
"temp_budget_increase": 100,
"temp_budget_expiry": "2025-01-15"
Test it!
curl -L -X POST 'http://localhost:4000/chat/completions' \
-H 'Authorization: Bearer sk-your-new-key' \
"model": "gpt-4o",
"messages": [{"role": "user", "content": "Hello, world!"}]
Expected Response Header:
x-litellm-key-max-budget: 100.0000001
