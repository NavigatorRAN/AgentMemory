# Langfuse SDK | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/pass_through/langfuse
- Final URL: https://docs.litellm.ai/docs/pass_through/langfuse
- Canonical URL: https://docs.litellm.ai/docs/pass_through/langfuse
- Fetched at: 2026-06-23T14:25:54Z
- Content type: text/html; charset=utf-8

## Description

Pass-through endpoints for Langfuse - call langfuse endpoints with LiteLLM Virtual Key.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Pass-through endpoints for Langfuse - call langfuse endpoints with LiteLLM Virtual Key.
Just replace https://us.cloud.langfuse.com with LITELLM_PROXY_BASE_URL/langfuse 🚀
Example Usage ​
from langfuse import Langfuse
langfuse = Langfuse (
host = "http://localhost:4000/langfuse" , # your litellm proxy endpoint
public_key = "anything" , # no key required since this is a pass through
secret_key = "LITELLM_VIRTUAL_KEY" , # no key required since this is a pass through
)
print ( "sending langfuse trace request" )
trace = langfuse . trace ( name = "test-trace-litellm-proxy-passthrough" )
print ( "flushing langfuse request" )
langfuse . flush ( )
print ( "flushed langfuse request" )
Supports ALL Langfuse Endpoints.
See All Langfuse Endpoints
Quick Start ​
Let's log a trace to Langfuse.
Add Langfuse Public/Private keys to environment
export LANGFUSE_PUBLIC_KEY=""
export LANGFUSE_PRIVATE_KEY=""
Start LiteLLM Proxy
litellm
# RUNNING on http://0.0.0.0:4000
Test it!
Let's log a trace to Langfuse!
secret_key = "anything" , # no key required since this is a pass through
Advanced - Use with Virtual Keys ​
Pre-requisites
Setup proxy with DB
Use this, to avoid giving developers the raw Google AI Studio key, but still letting them use Google AI Studio endpoints.
Usage ​
Setup environment
export DATABASE_URL=""
export LITELLM_MASTER_KEY=""
Generate virtual key
curl -X POST 'http://0.0.0.0:4000/key/generate' \
-H 'Authorization: Bearer sk-1234' \
-H 'Content-Type: application/json' \
-d '{}'
Expected Response
{
...
"key": "sk-1234ewknldferwedojwojw"
}
secret_key = "sk-1234ewknldferwedojwojw" , # no key required since this is a pass through
Advanced - Log to separate langfuse projects (by key/team) ​
Quick Start
Advanced - Use with Virtual Keys
Usage
Advanced - Log to separate langfuse projects (by key/team)
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
