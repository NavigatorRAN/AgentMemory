# Moonshot AI | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/moonshot
- Final URL: https://docs.litellm.ai/docs/providers/moonshot
- Canonical URL: https://docs.litellm.ai/docs/providers/moonshot
- Fetched at: 2026-06-23T14:28:21Z
- Content type: text/html; charset=utf-8

## Description

Overview

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Overview ​
Property Details Description Moonshot AI provides large language models including the moonshot-v1 series and kimi models. Provider Route on LiteLLM moonshot/ Link to Provider Doc Moonshot AI ↗ Base URL https://api.moonshot.ai/ Supported Operations /chat/completions
https://platform.moonshot.ai/
We support ALL Moonshot AI models, just set moonshot/ as a prefix when sending completion requests
Required Variables ​
Environment Variables
os . environ [ "MOONSHOT_API_KEY" ] = "" # your Moonshot AI API key
ATTENTION:
Moonshot AI offers two distinct API endpoints: a global one and a China-specific one.
Global API Base URL: https://api.moonshot.ai/v1 (This is the one currently implemented)
China API Base URL: https://api.moonshot.cn/v1
You can overwrite the base url with:
os.environ["MOONSHOT_API_BASE"] = "https://api.moonshot.cn/v1"
Usage - LiteLLM Python SDK ​
Non-streaming ​
Moonshot Non-streaming Completion
import os
import litellm
from litellm import completion
messages = [ { "content" : "Hello, how are you?" , "role" : "user" } ]
# Moonshot call
response = completion (
model = "moonshot/moonshot-v1-8k" ,
messages = messages
)
print ( response )
Streaming ​
Moonshot Streaming Completion
# Moonshot call with streaming
messages = messages ,
stream = True
for chunk in response :
print ( chunk )
Usage - LiteLLM Proxy ​
Add the following to your LiteLLM Proxy configuration file:
config.yaml
model_list :
- model_name : moonshot - v1 - 8k
litellm_params :
model : moonshot/moonshot - v1 - 8k
api_key : os.environ/MOONSHOT_API_KEY
- model_name : moonshot - v1 - 32k
model : moonshot/moonshot - v1 - 32k
- model_name : moonshot - v1 - 128k
model : moonshot/moonshot - v1 - 128k
Start your LiteLLM Proxy server:
Start LiteLLM Proxy
litellm --config config.yaml
# RUNNING on http://0.0.0.0:4000
OpenAI SDK
LiteLLM SDK
cURL
Moonshot via Proxy - Non-streaming
from openai import OpenAI
# Initialize client with your proxy URL
client = OpenAI (
base_url = "http://localhost:4000" , # Your proxy URL
api_key = "your-proxy-api-key" # Your proxy API key
# Non-streaming response
response = client . chat . completions . create (
model = "moonshot-v1-8k" ,
messages = [ { "role" : "user" , "content" : "hello from litellm" } ]
print ( response . choices [ 0 ] . message . content )
Moonshot via Proxy - Streaming
# Streaming response
messages = [ { "role" : "user" , "content" : "hello from litellm" } ] ,
if chunk . choices [ 0 ] . delta . content is not None :
print ( chunk . choices [ 0 ] . delta . content , end = "" )
Moonshot via Proxy - LiteLLM SDK
# Configure LiteLLM to use your proxy
response = litellm . completion (
model = "litellm_proxy/moonshot-v1-8k" ,
api_base = "http://localhost:4000" ,
api_key = "your-proxy-api-key"
Moonshot via Proxy - LiteLLM SDK Streaming
# Configure LiteLLM to use your proxy with streaming
api_key = "your-proxy-api-key" ,
if hasattr ( chunk . choices [ 0 ] , 'delta' ) and chunk . choices [ 0 ] . delta . content is not None :
Moonshot via Proxy - cURL
curl http://localhost:4000/v1/chat/completions \
-H "Content-Type: application/json" \
-H "Authorization: Bearer your-proxy-api-key" \
-d '{
"model": "moonshot-v1-8k",
"messages": [{"role": "user", "content": "hello from litellm"}]
}'
Moonshot via Proxy - cURL Streaming
"messages": [{"role": "user", "content": "hello from litellm"}],
"stream": true
For more detailed information on using the LiteLLM Proxy, see the LiteLLM Proxy documentation .
Image / Vision Support ​
Moonshot vision models ( kimi-k2.5 , kimi-latest , moonshot-v1-*-vision-preview , etc.) accept the standard OpenAI content array with image_url blocks.
LiteLLM automatically detects when your messages contain images and preserves the content array so the image payload reaches the Moonshot API. For text-only requests the content is flattened to a plain string, as required by Moonshot text models.
Moonshot Vision Example
os . environ [ "MOONSHOT_API_KEY" ] = ""
model = "moonshot/kimi-k2.5" ,
messages = [
{
"role" : "user" ,
"content" : [
{ "type" : "text" , "text" : "What is in this image?" } ,
"type" : "image_url" ,
"image_url" : { "url" : "https://example.com/image.png" } ,
} ,
] ,
}
Moonshot AI Limitations & LiteLLM Handling ​
LiteLLM automatically handles the following Moonshot AI limitations to provide seamless OpenAI compatibility:
Temperature Range Limitation ​
Limitation : Moonshot AI only supports temperature range [0, 1] (vs OpenAI's [0, 2])
LiteLLM Handling : Automatically clamps any temperature > 1 to 1
Temperature + Multiple Outputs Limitation ​
Limitation : If temperature < 0.3 and n > 1, Moonshot AI raises an exception
LiteLLM Handling : Automatically sets temperature to 0.3 when this condition is detected
Tool Choice "Required" Not Supported ​
Limitation : Moonshot AI doesn't support tool_choice="required"
LiteLLM Handling : Converts this by:
Adding message: "Please select a tool to handle the current issue."
Removing the tool_choice parameter from the request
Overview
Required Variables
Usage - LiteLLM Python SDK
Non-streaming
Streaming
Usage - LiteLLM Proxy
Image / Vision Support
Moonshot AI Limitations & LiteLLM Handling
Temperature Range Limitation
Temperature + Multiple Outputs Limitation
Tool Choice "Required" Not Supported
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
