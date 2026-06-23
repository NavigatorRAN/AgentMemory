# Hosted Cache - api.litellm.ai | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/caching/caching_api
- Final URL: https://docs.litellm.ai/docs/caching/caching_api
- Canonical URL: https://docs.litellm.ai/docs/caching/caching_api
- Fetched at: 2026-06-23T14:22:57Z
- Content type: text/html; charset=utf-8

## Description

Use api.litellm.ai for caching completion() and embedding() responses

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Use api.litellm.ai for caching completion() and embedding() responses
Quick Start Usage - Completion ​
import litellm
from litellm import completion
from litellm . caching . caching import Cache
litellm . cache = Cache ( type = "hosted" ) # init cache to use api.litellm.ai
# Make completion calls
response1 = completion (
model = "gpt-3.5-turbo" ,
messages = [ { "role" : "user" , "content" : "Tell me a joke." } ]
caching = True
)
response2 = completion (
messages = [ { "role" : "user" , "content" : "Tell me a joke." } ] ,
# response1 == response2, response 1 is cached
Usage - Embedding() ​
import time
from litellm import completion , embedding
litellm . cache = Cache ( type = "hosted" )
start_time = time . time ( )
embedding1 = embedding ( model = "text-embedding-ada-002" , input = [ "hello from litellm" * 5 ] , caching = True )
end_time = time . time ( )
print ( f"Embedding 1 response time: { end_time - start_time } seconds" )
embedding2 = embedding ( model = "text-embedding-ada-002" , input = [ "hello from litellm" * 5 ] , caching = True )
print ( f"Embedding 2 response time: { end_time - start_time } seconds" )
Caching with Streaming ​
LiteLLM can cache your streamed responses for you
Usage ​
stream = True ,
caching = True )
for chunk in response1 :
print ( chunk )
time . sleep ( 1 ) # cache is updated asynchronously
for chunk in response2 :
Quick Start Usage - Completion
Usage - Embedding()
Caching with Streaming
Usage
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
