# [BETA] Public Teams | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/proxy/public_teams
- Final URL: https://docs.litellm.ai/docs/proxy/public_teams
- Canonical URL: https://docs.litellm.ai/docs/proxy/public_teams
- Fetched at: 2026-06-23T14:31:51Z
- Content type: text/html; charset=utf-8

## Description

Expose available teams to your users to join on signup.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Expose available teams to your users to join on signup.
Quick Start ​
Create a team on LiteLLM
curl -X POST '<PROXY_BASE_URL>/team/new' \
-H 'Content-Type: application/json' \
-H 'Authorization: Bearer <MASTER_KEY>' \
-d '{"name": "My Team", "team_id": "team_id_1"}'
Expose the team to your users
litellm_settings :
default_internal_user_params :
available_teams : [ "team_id_1" ] # 👈 Make team available to new SSO users
Test it!
curl -L -X POST 'http://0.0.0.0:4000/team/member_add' \
-H 'Authorization: Bearer sk-<USER_KEY>' \
--data-raw '{
"team_id": "team_id_1",
"member": [{"role": "user", "user_id": "my-test-user"}]
}'
Quick Start
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
