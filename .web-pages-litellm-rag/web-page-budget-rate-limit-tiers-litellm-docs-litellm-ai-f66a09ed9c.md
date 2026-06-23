# ✨ Budget / Rate Limit Tiers | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/proxy/rate_limit_tiers
- Final URL: https://docs.litellm.ai/docs/proxy/rate_limit_tiers
- Canonical URL: https://docs.litellm.ai/docs/proxy/rate_limit_tiers
- Fetched at: 2026-06-23T14:31:54Z
- Content type: text/html; charset=utf-8

## Description

Define tiers with rate limits. Assign them to keys.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Define tiers with rate limits. Assign them to keys.
Use this to control access and budgets across a lot of keys.
info
This is a LiteLLM Enterprise feature.
Get a 7 day free trial + get in touch here .
See pricing here .
1. Create a budget ​
curl -L -X POST 'http://0.0.0.0:4000/budget/new' \
-H 'Authorization: Bearer sk-1234' \
-H 'Content-Type: application/json' \
-d '{
"budget_id": "my-test-tier",
"rpm_limit": 0
}'
2. Assign budget to a key ​
curl -L -X POST 'http://0.0.0.0:4000/key/generate' \
"budget_id": "my-test-tier"
Expected Response:
{
"key" : "sk-..." ,
"budget_id" : "my-test-tier" ,
"litellm_budget_table" : {
"rpm_limit" : 0
}
3. Check if budget is enforced on key ​
curl -L -X POST 'http://0.0.0.0:4000/v1/chat/completions' \
-H 'Authorization: Bearer sk-...' \ # 👈 KEY from step 2.
"model": "<REPLACE_WITH_MODEL_NAME_FROM_CONFIG.YAML>",
"messages": [
{"role": "user", "content": "hi my email is ishaan"}
]
API Reference ​
1. Create a budget
2. Assign budget to a key
3. Check if budget is enforced on key
API Reference
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
