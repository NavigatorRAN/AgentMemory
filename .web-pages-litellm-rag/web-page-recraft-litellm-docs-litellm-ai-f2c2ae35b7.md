# Recraft | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/recraft
- Final URL: https://docs.litellm.ai/docs/providers/recraft
- Canonical URL: https://docs.litellm.ai/docs/providers/recraft
- Fetched at: 2026-06-23T14:28:51Z
- Content type: text/html; charset=utf-8

## Description

https://www.recraft.ai/

## Extracted Text

Skip to main content
On this page
Copy as Markdown
https://www.recraft.ai/
Overview ​
Property Details Description Recraft is an AI-powered design tool that generates high-quality images with precise control over style and content. Provider Route on LiteLLM recraft/ Link to Provider Doc Recraft ↗ Supported Operations /images/generations , /images/edits
LiteLLM supports Recraft Image Generation and Image Edit calls.
API Base, Key ​
# env variable
os . environ [ 'RECRAFT_API_KEY' ] = "your-api-key"
os . environ [ 'RECRAFT_API_BASE' ] = "https://external.api.recraft.ai" # [optional]
Image Generation ​
Usage - LiteLLM Python SDK ​
from litellm import image_generation
import os
# recraft image generation call
response = image_generation (
model = "recraft/recraftv3" ,
prompt = "A beautiful sunset over a calm ocean" ,
)
print ( response )
Usage - LiteLLM Proxy Server ​
1. Setup config.yaml ​
model_list :
- model_name : recraft - v3
litellm_params :
model : recraft/recraftv3
api_key : os.environ/RECRAFT_API_KEY
model_info :
mode : image_generation
general_settings :
master_key : sk - 1234
2. Start the proxy ​
litellm --config config.yaml
# RUNNING on http://0.0.0.0:4000
3. Test it ​
curl --location 'http://0.0.0.0:4000/v1/images/generations' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer sk-1234' \
--data '{
"model": "recraft-v3",
"prompt": "A beautiful sunset over a calm ocean",
}'
Advanced Usage - With Additional Parameters ​
Supported Parameters ​
Recraft supports the following OpenAI-compatible parameters:
Parameter Type Description Example n integer Number of images to generate (1-4) 1 response_format string Format of response ( url or b64_json ) "url" size string Image dimensions "1024x1024" style string Image style/artistic direction "realistic"
Using Non-OpenAI Parameters ​
If you want to pass parameters that are not supported by OpenAI, you can pass them in your request body, LiteLLM will automatically route it to recraft.
In this example we will pass style_id parameter to the recraft image generation call.
Usage with LiteLLM Python SDK
style_id = "your-style-id" ,
Usage with LiteLLM Proxy Server + OpenAI Python SDK
from openai import OpenAI
client = OpenAI ( api_key = os . environ [ 'RECRAFT_API_KEY' ] )
response = client . images . generate (
extra_body = {
"style_id" : "your-style-id" ,
} ,
Supported Image Generation Models ​
Note: All recraft models are supported by LiteLLM Just pass the model name with recraft/<model_name> and litellm will route it to recraft.
Model Name Function Call recraftv3 image_generation(model="recraft/recraftv3", prompt="...") recraftv2 image_generation(model="recraft/recraftv2", prompt="...")
For more details on available models and features, see: https://www.recraft.ai/docs
Image Edit ​
from litellm import image_edit
# Open the image file
with open ( "reference_image.png" , "rb" ) as image_file :
# recraft image edit call
response = image_edit (
prompt = "Create a studio ghibli style image that combines all the reference images. Make sure the person looks like a CTO." ,
image = image_file ,
mode : image_edit
curl --location 'http://0.0.0.0:4000/v1/images/edits' \
--form 'model="recraft-v3"' \
--form 'prompt="Create a studio ghibli style image that combines all the reference images. Make sure the person looks like a CTO."' \
--form 'image=@"reference_image.png"'
prompt = "Create a studio ghibli style image" ,
n = 2 , # Generate 2 variations
response_format = "url" , # Return URLs instead of base64
style = "realistic_image" , # Set artistic style
strength = 0.5 # Control transformation strength (0-1)
Supported Image Edit Parameters ​
Recraft supports the following OpenAI-compatible parameters for image editing:
Parameter Type Description Default Example n integer Number of images to generate (1-4) 1 2 response_format string Format of response ( url or b64_json ) "url" "b64_json" style string Image style/artistic direction - "realistic_image" strength float Controls how much to transform the image (0.0-1.0) 0.2 0.5
You can pass Recraft-specific parameters that are not part of the OpenAI API by including them in your request:
style_id = "your-style-id" , # Recraft-specific parameter
strength = 0.7
client = OpenAI (
api_key = "sk-1234" , # your LiteLLM proxy master key
base_url = "http://0.0.0.0:4000" # your LiteLLM proxy URL
response = client . images . edit (
model = "recraft-v3" ,
"strength" : 0.7
}
Supported Image Edit Models ​
Model Name Function Call recraftv3 image_edit(model="recraft/recraftv3", ...)
API Key Setup ​
Get your API key from Recraft's website and set it as an environment variable:
export RECRAFT_API_KEY="your-api-key"
Overview
API Base, Key
Image Generation
Usage - LiteLLM Python SDK
Usage - LiteLLM Proxy Server
Advanced Usage - With Additional Parameters
Supported Parameters
Using Non-OpenAI Parameters
Supported Image Generation Models
Image Edit
Supported Image Edit Parameters
Supported Image Edit Models
API Key Setup
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
