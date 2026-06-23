# Why Pass-Through Endpoints? | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/pass_through/intro
- Final URL: https://docs.litellm.ai/docs/pass_through/intro
- Canonical URL: https://docs.litellm.ai/docs/pass_through/intro
- Fetched at: 2026-06-23T14:25:53Z
- Content type: text/html; charset=utf-8

## Description

These endpoints are useful for 2 scenarios:

## Extracted Text

Skip to main content
On this page
Copy as Markdown
These endpoints are useful for 2 scenarios:
Migrate existing projects to litellm proxy. E.g: If you have users already in production with Anthropic's SDK, you just need to change the base url to get cost tracking/logging/budgets/etc.
Use provider-specific endpoints E.g: If you want to use Vertex AI's token counting endpoint
How is your request handled? ​
The request is passed through to the provider's endpoint. The response is then passed back to the client. No translation is done.
Request Forwarding Process ​
Request Reception : LiteLLM receives your request at /provider/endpoint
Authentication : Your LiteLLM API key is validated and mapped to the provider's API key
Request Transformation : Request is reformatted for the target provider's API
Forwarding : Request is sent to the actual provider endpoint
Response Handling : Provider response is returned directly to you
Authentication Flow ​
Key Points:
Use your LiteLLM API key in requests, not the provider's key
LiteLLM handles the provider authentication internally
Same authentication works across all passthrough endpoints
Error Handling ​
Provider Errors : Forwarded directly to you with original error codes and messages
LiteLLM Errors :
401 : Invalid LiteLLM API key
404 : Provider or endpoint not supported
500 : Internal routing/forwarding errors
Benefits ​
Unified Authentication : One API key for all providers
Centralized Logging : All requests logged through LiteLLM
Cost Tracking : Usage tracked across all endpoints
Access Control : Same permissions apply to passthrough endpoints
How is your request handled?
Request Forwarding Process
Authentication Flow
Error Handling
Benefits
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
