# LiteLLM - Local Caching | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/caching/local_caching
- Final URL: https://docs.litellm.ai/docs/caching/local_caching
- Canonical URL: https://docs.litellm.ai/docs/caching/local_caching
- Fetched at: 2026-06-23T14:22:58Z
- Content type: text/html; charset=utf-8

## Description

Caching completion() and embedding() calls when switched on

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Caching completion() and embedding() calls when switched on ​
liteLLM implements exact match caching and supports the following Caching:
In-Memory Caching [Default]
Redis Caching Local
Redis Caching Hosted
Quick Start Usage - Completion ​
Caching - cache
Keys in the cache are model , the following example will lead to a cache hit
import litellm
from litellm import completion
from litellm . caching . caching import Cache
litellm . cache = Cache ( )
# Make completion calls
response1 = completion (
model = "gpt-3.5-turbo" ,
messages = [ { "role" : "user" , "content" : "Tell me a joke." } ]
caching = True
)
response2 = completion (
messages = [ { "role" : "user" , "content" : "Tell me a joke." } ] ,
# response1 == response2, response 1 is cached
Custom Key-Value Pairs ​
Add custom key-value pairs to your cache.
cache = Cache ( )
cache . add_cache ( cache_key = "test-key" , result = "1234" )
cache . get_cache ( cache_key = "test-key" )
Caching with Streaming ​
LiteLLM can cache your streamed responses for you
Usage ​
stream = True ,
caching = True )
for chunk in response1 :
print ( chunk )
for chunk in response2 :
Usage - Embedding() ​
import time
from litellm import embedding
start_time = time . time ( )
embedding1 = embedding ( model = "text-embedding-ada-002" , input = [ "hello from litellm" * 5 ] , caching = True )
end_time = time . time ( )
print ( f"Embedding 1 response time: { end_time - start_time } seconds" )
embedding2 = embedding ( model = "text-embedding-ada-002" , input = [ "hello from litellm" * 5 ] , caching = True )
print ( f"Embedding 2 response time: { end_time - start_time } seconds" )
Caching completion() and embedding() calls when switched on
Quick Start Usage - Completion
Custom Key-Value Pairs
Caching with Streaming
Usage
Usage - Embedding()
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
