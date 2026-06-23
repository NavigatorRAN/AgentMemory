# Volcano Engine (Volcengine) | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/volcano
- Final URL: https://docs.litellm.ai/docs/providers/volcano
- Canonical URL: https://docs.litellm.ai/docs/providers/volcano
- Fetched at: 2026-06-23T14:29:22Z
- Content type: text/html; charset=utf-8

## Description

https://www.volcengine.com/docs/82379/1263482

## Extracted Text

Skip to main content
On this page
Copy as Markdown
https://www.volcengine.com/docs/82379/1263482
tip
We support ALL Volcengine models including Chat and Embeddings, just set model=volcengine/<any-model-on-volcengine> as a prefix when sending litellm requests
API Key ​
# env variable
os . environ [ 'VOLCENGINE_API_KEY' ]
# or
os . environ [ 'ARK_API_KEY' ]
Sample Usage ​
from litellm import completion
import os
os . environ [ 'VOLCENGINE_API_KEY' ] = ""
response = completion (
model = "volcengine/<OUR_ENDPOINT_ID>" ,
messages = [
{
"role" : "user" ,
"content" : "What's the weather like in Boston today in Fahrenheit?" ,
}
] ,
temperature = 0.2 , # optional
top_p = 0.9 , # optional
frequency_penalty = 0.1 , # optional
presence_penalty = 0.1 , # optional
max_tokens = 10 , # optional
stop = [ "\n\n" ] , # optional
)
print ( response )
Sample Usage - Streaming ​
stream = True ,
for chunk in response :
print ( chunk )
Sample Usage - Embedding ​
from litellm import embedding
response = embedding (
model = "volcengine/doubao-embedding-text-240715" ,
input = [ "hello world" , "good morning" ]
Supported Embedding Models ​
doubao-embedding-large (2048 dimensions)
doubao-embedding-large-text-250515 (2048 dimensions)
doubao-embedding-large-text-240915 (4096 dimensions)
doubao-embedding (2560 dimensions)
doubao-embedding-text-240715 (2560 dimensions)
Embedding Parameters ​
input = [ "sample text" ] ,
encoding_format = "float" , # optional: "float" (default), "base64"
user = "user-123" , # optional: user identifier for tracking
Supported Models - 💥 ALL Volcengine Models Supported! ​
We support ALL volcengine models for both chat completions and embeddings:
Chat Models : Set volcengine/<OUR_ENDPOINT_ID> as a prefix when sending completion requests
Embedding Models : Use the specific model names listed above (e.g., volcengine/doubao-embedding-text-240715 )
Sample Usage - LiteLLM Proxy ​
Config.yaml setting ​
model_list :
# Chat model
- model_name : volcengine - model
litellm_params :
model : volcengine/<OUR_ENDPOINT_ID >
api_key : os.environ/VOLCENGINE_API_KEY
# Embedding model
- model_name : volcengine - embedding
model : volcengine/doubao - embedding - text - 240715
Send Request ​
Chat Completion ​
curl --location 'http://localhost:4000/chat/completions' \
--header 'Authorization: Bearer sk-1234' \
--header 'Content-Type: application/json' \
--data '{
"model": "volcengine-model",
"messages": [
"role": "user",
"content": "here is my api key. openai_api_key=sk-1234"
]
}'
Embedding ​
curl --location 'http://localhost:4000/embeddings' \
"model": "volcengine-embedding",
"input": ["hello world", "good morning"]
API Key
Sample Usage
Sample Usage - Streaming
Sample Usage - Embedding
Supported Embedding Models
Embedding Parameters
Supported Models - 💥 ALL Volcengine Models Supported!
Sample Usage - LiteLLM Proxy
Config.yaml setting
Send Request
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
