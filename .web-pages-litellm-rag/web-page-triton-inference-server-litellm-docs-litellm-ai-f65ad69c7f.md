# Triton Inference Server | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/triton-inference-server
- Final URL: https://docs.litellm.ai/docs/providers/triton-inference-server
- Canonical URL: https://docs.litellm.ai/docs/providers/triton-inference-server
- Fetched at: 2026-06-23T14:29:07Z
- Content type: text/html; charset=utf-8

## Description

LiteLLM supports Embedding Models on Triton Inference Servers

## Extracted Text

Skip to main content
On this page
Copy as Markdown
LiteLLM supports Embedding Models on Triton Inference Servers
Property Details Description NVIDIA Triton Inference Server Provider Route on LiteLLM triton/ Supported Operations /chat/completion , /completion , /embedding Supported Triton endpoints /infer , /generate , /embeddings Link to Provider Doc Triton Inference Server ↗
Triton /generate - Chat Completion ​
SDK
PROXY
Use the triton/ prefix to route to triton server
from litellm import completion
response = completion (
model = "triton/llama-3-8b-instruct" ,
messages = [ { "role" : "user" , "content" : "who are u?" } ] ,
max_tokens = 10 ,
api_base = "http://localhost:8000/generate" ,
)
Add models to your config.yaml
model_list :
- model_name : my - triton - model
litellm_params :
model : triton/<your - triton - model > "
api_base : https : //your - triton - api - base/triton/generate
Start the proxy
$ litellm --config /path/to/config.yaml --detailed_debug
Send Request to LiteLLM Proxy Server
OpenAI Python v1.0.0+
curl
import openai
from openai import OpenAI
# set base_url to your proxy server
# set api_key to send to proxy server
client = OpenAI ( api_key = "<proxy-api-key>" , base_url = "http://0.0.0.0:4000" )
response = client . chat . completions . create (
model = "my-triton-model" ,
print ( response )
--header is optional, only required if you're using litellm proxy with Virtual Keys
curl --location 'http://0.0.0.0:4000/chat/completions' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer sk-1234' \
--data ' {
"model": "my-triton-model",
"messages": [{"role": "user", "content": "who are u?"}]
}'
Triton /infer - Chat Completion ​
api_base = "http://localhost:8000/infer" ,
api_base : https : //your - triton - api - base/triton/infer
Triton /embeddings - Embedding ​
from litellm import embedding
import os
response = await litellm . aembedding (
model = "triton/<your-triton-model>" ,
api_base = "https://your-triton-api-base/triton/embeddings" , # /embeddings endpoint you want litellm to call on your server
input = [ "good morning from litellm" ] ,
api_base : https : //your - triton - api - base/triton/embeddings
response = client . embeddings . create (
input = [ "hello from litellm" ] ,
model = "my-triton-model"
curl --location 'http://0.0.0.0:4000/embeddings' \
"input": ["write a litellm poem"]
Triton /generate - Chat Completion
Triton /infer - Chat Completion
Triton /embeddings - Embedding
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
