# User Onboarding Guide | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/proxy/user_onboarding
- Final URL: https://docs.litellm.ai/docs/proxy/user_onboarding
- Canonical URL: https://docs.litellm.ai/docs/proxy/user_onboarding
- Fetched at: 2026-06-23T14:32:33Z
- Content type: text/html; charset=utf-8

## Description

A step-by-step guide to help admins onboard users to your LiteLLM proxy instance and help users get started with their API key.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
A step-by-step guide to help admins onboard users to your LiteLLM proxy instance and help users get started with their API key.
For Administrators ​
Step 1: Create a User Account ​
You can create a user account via the Admin UI or using the API.
Admin UI ​
Go to the ( /ui endpoint)
Navigate to the Internal Users section
Click "Add User" and fill in the required details
API ​
curl -X POST http://localhost:4000/user/new \
-H "Authorization: Bearer <admin-key>" \
-H "Content-Type: application/json" \
-d '{"user_email": "user@example.com"}'
Step 2: Grant Access & Permissions ​
Assign the user to a team (optional)
Set budgets, rate limits, and allowed models as needed
Generate an API key for the user (via UI or API)
Generate API Key (API Example) ​
curl -X POST http://localhost:4000/key/generate \
-d '{"user_id": "<user-id>", "max_budget": 100}'
For End Users ​
Step 3: Validate Your API Key ​
Before making LLM calls, validate your key works by calling the /v1/models endpoint:
curl -X GET http://localhost:4000/v1/models \
-H "Authorization: Bearer <your-api-key>"
If your key is valid, you'll get a list of available models.
If invalid, you'll get a 401 error.
Step 4: Hello World - Make Your First LLM Call ​
curl -X POST http://localhost:4000/v1/chat/completions \
-H "Authorization: Bearer <your-api-key>" \
-d '{
"model": "gpt-3.5-turbo",
"messages": [{"role": "user", "content": "Hello!"}]
}'
Troubleshooting ​
If you get a 401 error, check with your admin that your key is active and you have access to the requested model.
Use the /v1/models endpoint to quickly check if your key is valid without consuming LLM tokens.
See Also ​
Proxy Quick Start
User Management
Key Management
For Administrators
Step 1: Create a User Account
Step 2: Grant Access & Permissions
For End Users
Step 3: Validate Your API Key
Step 4: Hello World - Make Your First LLM Call
Troubleshooting
See Also
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
