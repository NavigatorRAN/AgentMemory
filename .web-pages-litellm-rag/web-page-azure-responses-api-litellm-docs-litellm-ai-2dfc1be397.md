# Azure Responses API | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/azure/azure_responses
- Final URL: https://docs.litellm.ai/docs/providers/azure/azure_responses
- Canonical URL: https://docs.litellm.ai/docs/providers/azure/azure_responses
- Fetched at: 2026-06-23T14:26:56Z
- Content type: text/html; charset=utf-8

## Description

| Property | Details |

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Property Details Description Azure OpenAI Responses API custom_llm_provider on LiteLLM azure/ Supported Operations /v1/responses Azure OpenAI Responses API Azure OpenAI Responses API ↗ Cost Tracking, Logging Support ✅ LiteLLM will log, track cost for Responses API Requests Supported OpenAI Params ✅ All OpenAI params are supported, See here
Usage ​
Create a model response ​
LiteLLM SDK
OpenAI SDK with LiteLLM Proxy
Non-streaming ​
Azure Responses API
import litellm
# Non-streaming response
response = litellm . responses (
model = "azure/o1-pro" ,
input = "Tell me a three sentence bedtime story about a unicorn." ,
max_output_tokens = 100 ,
api_key = os . getenv ( "AZURE_RESPONSES_OPENAI_API_KEY" ) ,
api_base = "https://litellm8397336933.openai.azure.com/" ,
api_version = "2023-03-15-preview" ,
)
print ( response )
Streaming ​
# Streaming response
stream = True ,
for event in response :
print ( event )
First, add this to your litellm proxy config.yaml:
model_list :
- model_name : o1 - pro
litellm_params :
model : azure/o1 - pro
api_key : os.environ/AZURE_RESPONSES_OPENAI_API_KEY
api_base : https : //litellm8397336933.openai.azure.com/
api_version : 2023 - 03 - 15 - preview
Start your LiteLLM proxy:
litellm --config /path/to/config.yaml
# RUNNING on http://0.0.0.0:4000
Then use the OpenAI SDK pointed to your proxy: Non-streaming ​
from openai import OpenAI
# Initialize client with your proxy URL
client = OpenAI (
base_url = "http://localhost:4000" , # Your proxy URL
api_key = "your-api-key" # Your proxy API key
response = client . responses . create (
model = "o1-pro" ,
input = "Tell me a three sentence bedtime story about a unicorn."
stream = True
Azure Codex Models ​
Codex models use Azure's new /v1/preview API which provides ongoing access to the latest features with no need to update api-version each month.
LiteLLM will send your requests to the /v1/preview endpoint when you set api_version="preview" .
Azure Codex Models
# Non-streaming response with Codex models
model = "azure/codex-mini" ,
api_base = "https://litellm8397336933.openai.azure.com" ,
api_version = "preview" , # 👈 key difference
# Streaming response with Codex models
- model_name : codex - mini
model : azure/codex - mini
api_base : https : //litellm8397336933.openai.azure.com
api_version : preview # 👈 key difference
model = "codex-mini" ,
Calling via /chat/completions ​
You can also call the Azure Responses API via the /chat/completions endpoint.
from litellm import completion
import os
os . environ [ "AZURE_API_BASE" ] = "https://my-azure-endpoint.openai.azure.com/"
os . environ [ "AZURE_API_VERSION" ] = "2023-03-15-preview"
os . environ [ "AZURE_API_KEY" ] = "my-api-key"
response = completion (
model = "azure/responses/my-custom-o1-pro" ,
messages = [ { "role" : "user" , "content" : "Hello world" } ] ,
Setup config.yaml
- model_name : my - custom - o1 - pro
model : azure/responses/my - custom - o1 - pro
api_key : os.environ/AZURE_API_KEY
api_base : https : //my - azure - endpoint.openai.azure.com/
Start LiteLLM proxy
Test it!
curl http://localhost:4000/v1/chat/completions \
-X POST \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $LITELLM_API_KEY" \
-d '{
"model": "my-custom-o1-pro",
"messages": [{"role": "user", "content": "Hello world"}]
}'
Usage
Create a model response
Calling via /chat/completions
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
