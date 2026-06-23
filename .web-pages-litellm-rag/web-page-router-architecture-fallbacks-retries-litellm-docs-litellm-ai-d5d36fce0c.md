# Router Architecture (Fallbacks / Retries) | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/router_architecture
- Final URL: https://docs.litellm.ai/docs/router_architecture
- Canonical URL: https://docs.litellm.ai/docs/router_architecture
- Fetched at: 2026-06-23T14:32:48Z
- Content type: text/html; charset=utf-8

## Description

High Level architecture

## Extracted Text

Skip to main content
On this page
Copy as Markdown
High Level architecture ​
Request Flow ​
User Sends Request : The process begins when a user sends a request to the LiteLLM Router endpoint. All unified endpoints ( .completion , .embeddings , etc) are supported by LiteLLM Router.
function_with_fallbacks : The initial request is sent to the function_with_fallbacks function. This function wraps the initial request in a try-except block, to handle any exceptions - doing fallbacks if needed. This request is then sent to the function_with_retries function.
function_with_retries : The function_with_retries function wraps the request in a try-except block and passes the initial request to a base litellm unified function ( litellm.completion , litellm.embeddings , etc) to handle LLM API calling. function_with_retries handles any exceptions - doing retries on the model group if needed (i.e. if the request fails, it will retry on an available model within the model group).
litellm.completion : The litellm.completion function is a base function that handles the LLM API calling. It is used by function_with_retries to make the actual request to the LLM API.
Legend ​
model_group : A group of LLM API deployments that share the same model_name , are part of the same model_group , and can be load balanced across.
High Level architecture
Request Flow
Legend
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
