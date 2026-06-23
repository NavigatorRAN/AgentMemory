# Morph | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/morph
- Final URL: https://docs.litellm.ai/docs/providers/morph
- Canonical URL: https://docs.litellm.ai/docs/providers/morph
- Fetched at: 2026-06-23T14:28:22Z
- Content type: text/html; charset=utf-8

## Description

LiteLLM supports all models on Morph

## Extracted Text

Skip to main content
On this page
Copy as Markdown
LiteLLM supports all models on Morph
Overview ​
Morph provides specialized AI models designed for agentic workflows, particularly excelling at precise code editing and manipulation. Their "Apply" models enable targeted code changes without full file rewrites, making them ideal for AI agents that need to make intelligent, context-aware code modifications.
API Key ​
import os
os . environ [ "MORPH_API_KEY" ] = "your-api-key"
Sample Usage ​
from litellm import completion
# set env variable
messages = [
{ "role" : "user" , "content" : "Write a Python function to calculate factorial" }
]
## Morph v3 Fast - Optimized for speed
response = completion (
model = "morph/morph-v3-fast" ,
messages = messages ,
)
print ( response )
## Morph v3 Large - Most capable model
model = "morph/morph-v3-large" ,
Sample Usage - Streaming ​
## Morph v3 Fast with streaming
stream = True ,
for chunk in response :
print ( chunk )
Supported Models ​
Model Name Function Call Description Context Window morph-v3-fast completion('morph/morph-v3-fast', messages) Fastest model, optimized for quick responses 16k tokens morph-v3-large completion('morph/morph-v3-large', messages) Most capable model for complex tasks 16k tokens
Usage - LiteLLM Proxy Server ​
Here's how to use Morph with the LiteLLM Proxy Server:
Save API key in your environment
export MORPH_API_KEY="your-api-key"
Add model to config.yaml
model_list :
- model_name : morph - v3 - fast
litellm_params :
model : morph/morph - v3 - fast
- model_name : morph - v3 - large
model : morph/morph - v3 - large
Start the proxy server
litellm --config config.yaml
Advanced Usage ​
Setting API Base ​
import litellm
# set custom api base
messages = [ { "role" : "user" , "content" : "Hello, world!" } ] ,
api_base = "https://api.morphllm.com/v1"
Setting API Key ​
# set api key via completion
api_key = "your-api-key"
Overview
API Key
Sample Usage
Sample Usage - Streaming
Supported Models
Usage - LiteLLM Proxy Server
Advanced Usage
Setting API Base
Setting API Key
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
