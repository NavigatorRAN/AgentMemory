# Life of a Request | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/proxy/architecture
- Final URL: https://docs.litellm.ai/docs/proxy/architecture
- Canonical URL: https://docs.litellm.ai/docs/proxy/architecture
- Fetched at: 2026-06-23T14:29:39Z
- Content type: text/html; charset=utf-8

## Description

High Level architecture

## Extracted Text

Skip to main content
On this page
Copy as Markdown
High Level architecture ​
Request Flow ​
User Sends Request : The process begins when a user sends a request to the LiteLLM Proxy Server (Gateway).
Virtual Keys : At this stage the Bearer token in the request is checked to ensure it is valid and under it's budget. Here is the list of checks that run for each request
2.1 Check if the Virtual Key exists in Redis Cache or In Memory Cache
2.2 If not in Cache , Lookup Virtual Key in DB
Rate Limiting : The MaxParallelRequestsHandler checks the rate limit (rpm/tpm) for the the following components:
Global Server Rate Limit
Virtual Key Rate Limit
User Rate Limit
Team Limit
LiteLLM proxy_server.py : Contains the /chat/completions and /embeddings endpoints. Requests to these endpoints are sent through the LiteLLM Router
LiteLLM Router : The LiteLLM Router handles Load balancing, Fallbacks, Retries for LLM API deployments.
litellm.completion() / litellm.embedding() : The litellm Python SDK is used to call the LLM in the OpenAI API format (Translation and parameter mapping)
Post-Request Processing : After the response is sent back to the client, the following asynchronous tasks are performed:
Logging to Lunary, MLflow, LangFuse or other logging destinations
The MaxParallelRequestsHandler updates the rpm/tpm usage for the
The _ProxyDBLogger updates spend / usage in the LiteLLM database. Here is everything tracked in the DB per request
Frequently Asked Questions ​
Is a db transaction tied to the lifecycle of request?
No, a db transaction is not tied to the lifecycle of a request.
The check if a virtual key is valid relies on a DB read if it's not in cache.
All other DB transactions are async in background tasks
High Level architecture
Request Flow
Frequently Asked Questions
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
