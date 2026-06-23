# DeepInfra | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/deepinfra
- Final URL: https://docs.litellm.ai/docs/providers/deepinfra
- Canonical URL: https://docs.litellm.ai/docs/providers/deepinfra
- Fetched at: 2026-06-23T14:27:38Z
- Content type: text/html; charset=utf-8

## Description

https://deepinfra.com/

## Extracted Text

Skip to main content
On this page
Copy as Markdown
https://deepinfra.com/
tip
We support ALL DeepInfra models, just set model=deepinfra/<any-model-on-deepinfra> as a prefix when sending litellm requests
Table of Contents ​
API Key
Chat Models
Rerank Endpoint
API Key ​
# env variable
os . environ [ 'DEEPINFRA_API_KEY' ]
Sample Usage ​
from litellm import completion
import os
os . environ [ 'DEEPINFRA_API_KEY' ] = ""
response = completion (
model = "deepinfra/meta-llama/Llama-2-70b-chat-hf" ,
messages = [ { "role" : "user" , "content" : "write code for saying hi from LiteLLM" } ]
)
Sample Usage - Streaming ​
messages = [ { "role" : "user" , "content" : "write code for saying hi from LiteLLM" } ] ,
stream = True
for chunk in response :
print ( chunk )
Chat Models ​
Model Name Function Call meta-llama/Meta-Llama-3-8B-Instruct completion(model="deepinfra/meta-llama/Meta-Llama-3-8B-Instruct", messages) meta-llama/Meta-Llama-3-70B-Instruct completion(model="deepinfra/meta-llama/Meta-Llama-3-70B-Instruct", messages) meta-llama/Llama-2-70b-chat-hf completion(model="deepinfra/meta-llama/Llama-2-70b-chat-hf", messages) meta-llama/Llama-2-7b-chat-hf completion(model="deepinfra/meta-llama/Llama-2-7b-chat-hf", messages) meta-llama/Llama-2-13b-chat-hf completion(model="deepinfra/meta-llama/Llama-2-13b-chat-hf", messages) codellama/CodeLlama-34b-Instruct-hf completion(model="deepinfra/codellama/CodeLlama-34b-Instruct-hf", messages) mistralai/Mistral-7B-Instruct-v0.1 completion(model="deepinfra/mistralai/Mistral-7B-Instruct-v0.1", messages) jondurbin/airoboros-l2-70b-gpt4-1.4.1 completion(model="deepinfra/jondurbin/airoboros-l2-70b-gpt4-1.4.1", messages)
Rerank Endpoint ​
LiteLLM provides a Cohere API compatible /rerank endpoint for DeepInfra rerank models.
Supported Rerank Models ​
Model Name Description deepinfra/Qwen/Qwen3-Reranker-0.6B Lightweight rerank model (0.6B parameters) deepinfra/Qwen/Qwen3-Reranker-4B Medium rerank model (4B parameters) deepinfra/Qwen/Qwen3-Reranker-8B Large rerank model (8B parameters)
Usage - LiteLLM Python SDK ​
SDK
PROXY
from litellm import rerank
os . environ [ "DEEPINFRA_API_KEY" ] = "your-api-key"
response = rerank (
model = "deepinfra/Qwen/Qwen3-Reranker-0.6B" ,
query = "What is the capital of France?" ,
documents = [
"Paris is the capital of France." ,
"London is the capital of the United Kingdom." ,
"Berlin is the capital of Germany." ,
"Madrid is the capital of Spain." ,
"Rome is the capital of Italy."
]
print ( response )
Add to config.yaml
model_list :
- model_name : Qwen/Qwen3 - Reranker - 0.6B
litellm_params :
model : deepinfra/Qwen/Qwen3 - Reranker - 0.6B
api_key : os.environ/DEEPINFRA_API_KEY
Start proxy
litellm --config /path/to/config.yaml
# RUNNING on http://0.0.0.0:4000/
Test it!
curl -L -X POST 'http://0.0.0.0:4000/rerank' \
-H 'Authorization: Bearer sk-1234' \
-H 'Content-Type: application/json' \
-d '{
"model": "Qwen/Qwen3-Reranker-0.6B",
"query": "What is the capital of France?",
"documents": [
"Paris is the capital of France.",
"London is the capital of the United Kingdom.",
"Berlin is the capital of Germany.",
"Madrid is the capital of Spain.",
}'
Supported Cohere Rerank API Params ​
Param Type Description query str The query to rerank the documents against documents list[str] The documents to rerank
Provider-specific parameters ​
Pass any deepinfra specific parameters as a keyword argument to the rerank function, e.g.
response = rerank(
model="deepinfra/Qwen/Qwen3-Reranker-0.6B",
query="What is the capital of France?",
documents=[
],
my_custom_param="my_custom_value", # any other deepinfra specific parameters
Response Format ​
{
"id" : "request-id" ,
"results" : [
"index" : 0 ,
"relevance_score" : 0.9975274205207825
} ,
"index" : 1 ,
"relevance_score" : 0.011687257327139378
}
] ,
"meta" : {
"billed_units" : {
"total_tokens" : 427
"tokens" : {
"input_tokens" : 427 ,
"output_tokens" : 0
Table of Contents
Sample Usage
Sample Usage - Streaming
Supported Rerank Models
Usage - LiteLLM Python SDK
Supported Cohere Rerank API Params
Provider-specific parameters
Response Format
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
