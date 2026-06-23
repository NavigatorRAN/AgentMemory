# /rerank | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/rerank
- Final URL: https://docs.litellm.ai/docs/rerank
- Canonical URL: https://docs.litellm.ai/docs/rerank
- Fetched at: 2026-06-23T14:32:45Z
- Content type: text/html; charset=utf-8

## Description

LiteLLM Follows the cohere api request / response for the rerank api

## Extracted Text

Skip to main content
On this page
Copy as Markdown
tip
LiteLLM Follows the cohere api request / response for the rerank api
Overview ​
Feature Supported Notes Cost Tracking ✅ Works with all supported models Logging ✅ Works across all integrations End-user Tracking ✅ Fallbacks ✅ Works between supported models Loadbalancing ✅ Works between supported models Guardrails ✅ Applies to input query only (not documents) Supported Providers Cohere, Together AI, Azure AI, DeepInfra, Nvidia NIM, Infinity, Fireworks AI, Voyage AI, watsonx.ai
LiteLLM Python SDK Usage ​
Quick Start ​
from litellm import rerank
import os
os . environ [ "COHERE_API_KEY" ] = "sk-.."
query = "What is the capital of the United States?"
documents = [
"Carson City is the capital city of the American state of Nevada." ,
"The Commonwealth of the Northern Mariana Islands is a group of islands in the Pacific Ocean. Its capital is Saipan." ,
"Washington, D.C. is the capital of the United States." ,
"Capital punishment has existed in the United States since before it was a country." ,
]
response = rerank (
model = "cohere/rerank-english-v3.0" ,
query = query ,
documents = documents ,
top_n = 3 ,
)
print ( response )
Async Usage ​
from litellm import arerank
import os , asyncio
async def test_async_rerank ( ) :
response = await arerank (
asyncio . run ( test_async_rerank ( ) )
LiteLLM Proxy Usage ​
LiteLLM provides an cohere api compatible /rerank endpoint for Rerank calls.
Setup
Add this to your litellm proxy config.yaml
model_list :
- model_name : Salesforce/Llama - Rank - V1
litellm_params :
model : together_ai/Salesforce/Llama - Rank - V1
api_key : os.environ/TOGETHERAI_API_KEY
- model_name : rerank - english - v3.0
model : cohere/rerank - english - v3.0
api_key : os.environ/COHERE_API_KEY
Start litellm
litellm --config /path/to/config.yaml
# RUNNING on http://0.0.0.0:4000
Test request
curl http://0.0.0.0:4000/rerank \
-H "Authorization: Bearer sk-1234" \
-H "Content-Type: application/json" \
-d '{
"model": "rerank-english-v3.0",
"query": "What is the capital of the United States?",
"documents": [
"Carson City is the capital city of the American state of Nevada.",
"The Commonwealth of the Northern Mariana Islands is a group of islands in the Pacific Ocean. Its capital is Saipan.",
"Washington, D.C. is the capital of the United States.",
"Capital punishment has existed in the United States since before it was a country."
],
"top_n": 3
}'
Supported Providers ​
⚡️See all supported models and providers at models.litellm.ai ​ Provider Link to Usage Cohere (v1 + v2 clients) Usage Together AI Usage Azure AI Usage Jina AI Usage AWS Bedrock Usage HuggingFace Usage Infinity Usage vLLM Usage DeepInfra Usage Vertex AI Usage Fireworks AI Usage Voyage AI Usage IBM watsonx.ai Usage
Overview
LiteLLM Python SDK Usage
Quick Start
Async Usage
LiteLLM Proxy Usage
Supported Providers
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
