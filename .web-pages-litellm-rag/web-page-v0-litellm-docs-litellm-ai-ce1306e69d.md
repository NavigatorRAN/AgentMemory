# v0 | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/v0
- Final URL: https://docs.litellm.ai/docs/providers/v0
- Canonical URL: https://docs.litellm.ai/docs/providers/v0
- Fetched at: 2026-06-23T14:29:08Z
- Content type: text/html; charset=utf-8

## Description

Overview

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Overview ​
Property Details Description v0 provides AI models optimized for code generation, particularly for creating Next.js applications, React components, and modern web development. Provider Route on LiteLLM v0/ Link to Provider Doc v0 API Documentation ↗ Base URL https://api.v0.dev/v1 Supported Operations /chat/completions
https://v0.dev/docs/v0-model-api
We support ALL v0 models, just set v0/ as a prefix when sending completion requests
Available Models ​
Model Description Context Window Max Output v0/v0-1.5-lg Large model for advanced code generation and reasoning 512,000 tokens 512,000 tokens v0/v0-1.5-md Medium model for everyday code generation tasks 128,000 tokens 128,000 tokens v0/v0-1.0-md Legacy medium model 128,000 tokens 128,000 tokens
Required Variables ​
Environment Variables
os . environ [ "V0_API_KEY" ] = "" # your v0 API key from v0.dev
Note: v0 API access requires a Premium or Team plan. Visit v0.dev/chat/settings/billing to upgrade.
Usage - LiteLLM Python SDK ​
Non-streaming ​
v0 Non-streaming Completion
import os
import litellm
from litellm import completion
os . environ [ "V0_API_KEY" ] = "" # your v0 API key
messages = [ { "content" : "Create a React button component with hover effects" , "role" : "user" } ]
# v0 call
response = completion (
model = "v0/v0-1.5-md" ,
messages = messages
)
print ( response )
Streaming ​
v0 Streaming Completion
# v0 call with streaming
messages = messages ,
stream = True
for chunk in response :
print ( chunk )
Vision/Multimodal Support ​
All v0 models support vision inputs, allowing you to send images along with text:
v0 Vision/Multimodal
messages = [ {
"role" : "user" ,
"content" : [
{
"type" : "text" ,
"text" : "Recreate this UI design in React"
} ,
"type" : "image_url" ,
"image_url" : {
"url" : "https://example.com/ui-design.png"
}
]
} ]
model = "v0/v0-1.5-lg" ,
Function Calling ​
v0 supports function calling for structured outputs:
v0 Function Calling
tools = [
"type" : "function" ,
"function" : {
"name" : "create_component" ,
"description" : "Create a React component" ,
"parameters" : {
"type" : "object" ,
"properties" : {
"component_name" : {
"type" : "string" ,
"description" : "The name of the component"
"props" : {
"type" : "array" ,
"items" : { "type" : "string" } ,
"description" : "List of component props"
"required" : [ "component_name" ]
messages = [ { "role" : "user" , "content" : "Create a Button component with onClick and disabled props" } ] ,
tools = tools ,
tool_choice = "auto"
Usage - LiteLLM Proxy ​
Add the following to your LiteLLM Proxy configuration file:
config.yaml
model_list :
- model_name : v0 - large
litellm_params :
model : v0/v0 - 1.5 - lg
api_key : os.environ/V0_API_KEY
- model_name : v0 - medium
model : v0/v0 - 1.5 - md
- model_name : v0 - legacy
model : v0/v0 - 1.0 - md
Start your LiteLLM Proxy server:
Start LiteLLM Proxy
litellm --config config.yaml
# RUNNING on http://0.0.0.0:4000
OpenAI SDK
LiteLLM SDK
cURL
v0 via Proxy - Non-streaming
from openai import OpenAI
# Initialize client with your proxy URL
client = OpenAI (
base_url = "http://localhost:4000" , # Your proxy URL
api_key = "your-proxy-api-key" # Your proxy API key
# Non-streaming response
response = client . chat . completions . create (
model = "v0-medium" ,
messages = [ { "role" : "user" , "content" : "Create a React card component" } ]
print ( response . choices [ 0 ] . message . content )
v0 via Proxy - Streaming
# Streaming response
messages = [ { "role" : "user" , "content" : "Create a React card component" } ] ,
if chunk . choices [ 0 ] . delta . content is not None :
print ( chunk . choices [ 0 ] . delta . content , end = "" )
v0 via Proxy - LiteLLM SDK
# Configure LiteLLM to use your proxy
response = litellm . completion (
model = "litellm_proxy/v0-medium" ,
api_base = "http://localhost:4000" ,
api_key = "your-proxy-api-key"
v0 via Proxy - LiteLLM SDK Streaming
# Configure LiteLLM to use your proxy with streaming
api_key = "your-proxy-api-key" ,
if hasattr ( chunk . choices [ 0 ] , 'delta' ) and chunk . choices [ 0 ] . delta . content is not None :
v0 via Proxy - cURL
curl http://localhost:4000/v1/chat/completions \
-H "Content-Type: application/json" \
-H "Authorization: Bearer your-proxy-api-key" \
-d '{
"model": "v0-medium",
"messages": [{"role": "user", "content": "Create a React card component"}]
}'
v0 via Proxy - cURL Streaming
"messages": [{"role": "user", "content": "Create a React card component"}],
"stream": true
For more detailed information on using the LiteLLM Proxy, see the LiteLLM Proxy documentation .
Supported OpenAI Parameters ​
v0 supports the following OpenAI-compatible parameters:
Parameter Type Description messages array Required . Array of message objects with 'role' and 'content' model string Required . Model ID (v0-1.5-lg, v0-1.5-md, v0-1.0-md) stream boolean Optional. Enable streaming responses tools array Optional. List of available tools/functions tool_choice string/object Optional. Control tool/function calling
Note: v0 has a limited set of supported parameters compared to the full OpenAI API. Parameters like temperature , max_tokens , top_p , etc. are not supported.
Advanced Usage ​
Custom API Base ​
If you're using a custom v0 deployment:
Custom API Base
messages = [ { "role" : "user" , "content" : "Hello" } ] ,
api_base = "https://your-custom-v0-endpoint.com/v1" ,
api_key = "your-api-key"
Pricing ​
v0 models require a Premium or Team subscription. Visit v0.dev/chat/settings/billing for current pricing information.
Additional Resources ​
v0 Official Documentation
v0 Model API Reference
Overview
Available Models
Required Variables
Usage - LiteLLM Python SDK
Non-streaming
Streaming
Vision/Multimodal Support
Function Calling
Usage - LiteLLM Proxy
Supported OpenAI Parameters
Advanced Usage
Pricing
Additional Resources
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
