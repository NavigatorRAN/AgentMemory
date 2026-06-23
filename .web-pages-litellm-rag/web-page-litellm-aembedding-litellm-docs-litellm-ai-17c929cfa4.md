# litellm.aembedding() | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/embedding/async_embedding
- Final URL: https://docs.litellm.ai/docs/embedding/async_embedding
- Canonical URL: https://docs.litellm.ai/docs/embedding/async_embedding
- Fetched at: 2026-06-23T14:23:48Z
- Content type: text/html; charset=utf-8

## Description

LiteLLM provides an asynchronous version of the embedding function called aembedding

## Extracted Text

Skip to main content
On this page
Copy as Markdown
LiteLLM provides an asynchronous version of the embedding function called aembedding
Usage ​
from litellm import aembedding
import asyncio
async def test_get_response ( ) :
response = await aembedding ( 'text-embedding-ada-002' , input = [ "good morning from litellm" ] )
return response
response = asyncio . run ( test_get_response ( ) )
print ( response )
Usage
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
