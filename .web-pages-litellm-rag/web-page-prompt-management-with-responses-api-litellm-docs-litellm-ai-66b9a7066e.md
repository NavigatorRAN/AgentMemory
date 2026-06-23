# Prompt Management with Responses API | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/prompt_management
- Final URL: https://docs.litellm.ai/docs/prompt_management
- Canonical URL: https://docs.litellm.ai/docs/prompt_management
- Fetched at: 2026-06-23T14:26:35Z
- Content type: text/html; charset=utf-8

## Description

Use LiteLLM Prompt Management with /v1/responses by passing promptid and optional promptvariables.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Use LiteLLM Prompt Management with /v1/responses by passing prompt_id and optional prompt_variables .
Basic Usage ​
curl -X POST "http://localhost:4000/v1/responses" \
-H "Authorization: Bearer sk-1234" \
-H "Content-Type: application/json" \
-d '{
"model": "gpt-4o",
"prompt_id": "my-responses-prompt",
"prompt_variables": {"topic": "large language models"},
"input": []
}'
Multi-turn Follow-up in input ​
To send follow-up turns in one request, pass message history in input .
"input": [
{"role": "user", "content": "Topic is LLMs. Start short."},
{"role": "assistant", "content": "Sure, go ahead."},
{"role": "user", "content": "Now give me 3 bullets and include pricing caveat."}
]
Notes ​
Prompt template messages are merged with your input messages.
Prompt variable substitution applies to prompt message content.
Tool call payload fields are not substituted by prompt variables.
For follow-ups with previous_response_id , include prompt_id again if you want prompt management applied on that turn.
Basic Usage
Multi-turn Follow-up in input
Notes
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
