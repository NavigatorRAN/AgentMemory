# /images/edits | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/image_edits
- Final URL: https://docs.litellm.ai/docs/image_edits
- Canonical URL: https://docs.litellm.ai/docs/image_edits
- Fetched at: 2026-06-23T14:24:12Z
- Content type: text/html; charset=utf-8

## Description

LiteLLM provides image editing functionality that maps to OpenAI's /images/edits API endpoint. Now supports both single and multiple image editing.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
LiteLLM provides image editing functionality that maps to OpenAI's /images/edits API endpoint. Now supports both single and multiple image editing.
Feature Supported Notes Cost Tracking ✅ Works with all supported models Logging ✅ Works across all integrations End-user Tracking ✅ Fallbacks ✅ Works between supported models Loadbalancing ✅ Works between supported models Supported operations Create image edits Single and multiple images supported Supported LiteLLM SDK Versions 1.63.8+ Gemini support requires 1.79.3+ Supported LiteLLM Proxy Versions 1.71.1+ Gemini support requires 1.79.3+ Supported LLM providers OpenAI , Gemini (Google AI Studio) , Vertex AI , OpenRouter , Stability AI , AWS Bedrock (Stability) , Black Forest Labs Gemini supports the new gemini-2.5-flash-image family. Vertex AI supports both Gemini and Imagen models. OpenRouter routes image edits through chat completions. Stability AI and Bedrock Stability support various image editing operations. Black Forest Labs supports FLUX Kontext models. ⚡️See all supported models and providers at models.litellm.ai ​
Usage ​
LiteLLM Python SDK ​
OpenAI
Black Forest Labs
Vertex AI
OpenRouter
Basic Image Edit ​
OpenAI Image Edit
import litellm
# Edit an image with a prompt
response = litellm . image_edit (
model = "gpt-image-1" ,
image = open ( "original_image.png" , "rb" ) ,
prompt = "Add a red hat to the person in the image" ,
n = 1 ,
size = "1024x1024"
)
print ( response )
Multiple Images Edit ​
OpenAI Multiple Images Edit
# Edit multiple images with a prompt
image = [
open ( "image1.png" , "rb" ) ,
open ( "image2.png" , "rb" ) ,
open ( "image3.png" , "rb" )
] ,
prompt = "Apply vintage filter to all images" ,
Image Edit with Mask ​
OpenAI Image Edit with Mask
# Edit an image with a mask to specify the area to edit
mask = open ( "mask_image.png" , "rb" ) , # Transparent areas will be edited
prompt = "Replace the background with a beach scene" ,
n = 2 ,
size = "512x512" ,
response_format = "url"
Async Image Edit ​
Async OpenAI Image Edit
import asyncio
async def edit_image ( ) :
response = await litellm . aimage_edit (
prompt = "Make the image look like a painting" ,
size = "1024x1024" ,
response_format = "b64_json"
return response
# Run the async function
response = asyncio . run ( edit_image ( ) )
Async Multiple Images Edit ​
Async OpenAI Multiple Images Edit
async def edit_multiple_images ( ) :
open ( "portrait1.png" , "rb" ) ,
open ( "portrait2.png" , "rb" )
prompt = "Add professional lighting to the portraits" ,
response = asyncio . run ( edit_multiple_images ( ) )
Image Edit with Custom Parameters ​
OpenAI Image Edit with Custom Parameters
# Edit image with additional parameters
image = open ( "portrait.png" , "rb" ) ,
prompt = "Add sunglasses and a smile" ,
n = 3 ,
response_format = "url" ,
user = "user-123" ,
timeout = 60 ,
extra_headers = { "Custom-Header" : "value" }
print ( f"Generated { len ( response . data ) } image variations" )
for i , image_data in enumerate ( response . data ) :
print ( f"Image { i + 1 } : { image_data . url } " )
</TabItem>
<TabItem value="gemini" label="Gemini">
#### Basic Image Edit
```python showLineNumbers title="Gemini Image Edit"
import base64
import os
from litellm import image_edit
os.environ["GEMINI_API_KEY"] = "your-api-key"
response = image_edit(
model="gemini/gemini-2.5-flash-image",
image=open("original_image.png", "rb"),
prompt="Add aurora borealis to the night sky",
size="1792x1024", # mapped to aspectRatio=16:9 for Gemini
edited_image_bytes = base64.b64decode(response.data[0].b64_json)
with open("edited_image.png", "wb") as f:
f.write(edited_image_bytes)
Gemini Multiple Images Edit
os . environ [ "GEMINI_API_KEY" ] = "your-api-key"
response = image_edit (
model = "gemini/gemini-2.5-flash-image" ,
open ( "scene.png" , "rb" ) ,
open ( "style_reference.png" , "rb" ) ,
prompt = "Blend the reference style into the scene while keeping the subject sharp." ,
for idx , image_obj in enumerate ( response . data ) :
with open ( f"gemini_edit_ { idx } .png" , "wb" ) as f :
f . write ( base64 . b64decode ( image_obj . b64_json ) )
Black Forest Labs Image Edit
os . environ [ "BFL_API_KEY" ] = "your-api-key"
model = "black_forest_labs/flux-kontext-pro" ,
prompt = "Add a green leaf to the scene" ,
print ( response . data [ 0 ] . url )
Inpainting with Mask ​
Black Forest Labs Inpainting
# Use flux-pro-1.0-fill for inpainting
model = "black_forest_labs/flux-pro-1.0-fill" ,
mask = open ( "mask_image.png" , "rb" ) ,
prompt = "Replace with a garden" ,
Outpainting (Expand) ​
Black Forest Labs Outpainting
# Use flux-pro-1.0-expand to extend image borders
model = "black_forest_labs/flux-pro-1.0-expand" ,
prompt = "Continue the scene with mountains" ,
top = 256 ,
bottom = 256 ,
Basic Image Edit (Gemini) ​
Vertex AI Gemini Image Edit
# Set Vertex AI credentials
os . environ [ "VERTEXAI_PROJECT" ] = "your-gcp-project-id"
os . environ [ "VERTEXAI_LOCATION" ] = "us-central1"
os . environ [ "GOOGLE_APPLICATION_CREDENTIALS" ] = "/path/to/service-account.json"
model = "vertex_ai/gemini-2.5-flash" ,
prompt = "Add neon lights in the background" ,
Image Edit with Imagen (Supports Masks) ​
Vertex AI Imagen Image Edit
# Imagen supports mask for inpainting
model = "vertex_ai/imagen-3.0-capability-001" ,
mask = open ( "mask_image.png" , "rb" ) , # Optional: for inpainting
prompt = "Turn this into watercolor style scenery" ,
n = 2 , # Number of variations
OpenRouter Image Edit
os . environ [ "OPENROUTER_API_KEY" ] = "your-api-key"
model = "openrouter/google/gemini-2.5-flash-image" ,
prompt = "Add aurora borealis to the night sky" ,
OpenRouter Multiple Images Edit
prompt = "Blend the reference style into the scene" ,
size = "1536x1024" , # mapped to aspect_ratio 3:2
quality = "high" , # mapped to image_size 4K
LiteLLM Proxy with OpenAI SDK ​
First, add this to your litellm proxy config.yaml:
OpenAI Proxy Configuration
model_list :
- model_name : gpt - image - 1
litellm_params :
model : gpt - image - 1
api_key : os.environ/OPENAI_API_KEY
Start the LiteLLM proxy server:
Start LiteLLM Proxy Server
litellm --config /path/to/config.yaml
# RUNNING on http://0.0.0.0:4000
Basic Image Edit via Proxy ​
OpenAI Proxy Image Edit
from openai import OpenAI
# Initialize client with your proxy URL
client = OpenAI (
base_url = "http://localhost:4000" , # Your proxy URL
api_key = "your-api-key" # Your proxy API key
# Edit an image
response = client . images . edit (
cURL Example ​
cURL Image Edit Request
curl -X POST "http://localhost:4000/v1/images/edits" \
-H "Authorization: Bearer your-api-key" \
-F "model=gpt-image-1" \
-F "image=@original_image.png" \
-F "mask=@mask_image.png" \
-F "prompt=Add a beautiful sunset in the background" \
-F "n=1" \
-F "size=1024x1024" \
-F "response_format=url"
cURL Multiple Images Example ​
cURL Multiple Images Edit Request
-F "image=@image1.png" \
-F "image=@image2.png" \
-F "image=@image3.png" \
-F "prompt=Apply artistic filter to all images" \
1. Add the Gemini image edit model to your `config.yaml`:
```yaml showLineNumbers title="Gemini Proxy Configuration"
model_list:
- model_name: gemini-image-edit
litellm_params:
model: gemini/gemini-2.5-flash-image
api_key: os.environ/GEMINI_API_KEY
Make an image edit request (Gemini responses are base64-only):
Gemini Proxy Image Edit
curl -X POST "http://0.0.0.0:4000/v1/images/edits" \
-H "Authorization: Bearer <YOUR-LITELLM-KEY>" \
-F "model=gemini-image-edit" \
-F "prompt=Add a warm golden-hour glow to the scene" \
-F "size=1024x1024"
Add Black Forest Labs image edit models to your config.yaml :
Black Forest Labs Proxy Configuration
- model_name : bfl - kontext - pro
model : black_forest_labs/flux - kontext - pro
api_key : os.environ/BFL_API_KEY
model_info :
mode : image_edit
Make an image edit request:
Black Forest Labs Proxy Image Edit
-F "model=bfl-kontext-pro" \
-F "prompt=Add a sunset in the background"
Add Vertex AI image edit models to your config.yaml :
Vertex AI Proxy Configuration
- model_name : vertex - gemini - image - edit
model : vertex_ai/gemini - 2.5 - flash
vertex_project : os.environ/VERTEXAI_PROJECT
vertex_location : os.environ/VERTEXAI_LOCATION
vertex_credentials : os.environ/GOOGLE_APPLICATION_CREDENTIALS
- model_name : vertex - imagen - image - edit
model : vertex_ai/imagen - 3.0 - capability - 001
Vertex AI Gemini Proxy Image Edit
-F "model=vertex-gemini-image-edit" \
-F "prompt=Add neon lights in the background" \
Imagen image edit with mask:
Vertex AI Imagen Proxy Image Edit with Mask
-F "model=vertex-imagen-image-edit" \
-F "prompt=Turn this into watercolor style scenery" \
-F "n=2" \
Add the OpenRouter image edit model to your config.yaml :
OpenRouter Proxy Configuration
- model_name : openrouter - image - edit
model : openrouter/google/gemini - 2.5 - flash - image
api_key : os.environ/OPENROUTER_API_KEY
OpenRouter Proxy Image Edit
-F "model=openrouter-image-edit" \
-F "prompt=Make the sky a vibrant purple sunset" \
Supported Image Edit Parameters ​
Parameter Type Description Required image FileTypes The image to edit. Must be a valid PNG file, less than 4MB, and square. ✅ prompt str A text description of the desired image edit. ✅ model str The model to use for image editing Optional (defaults to dall-e-2 ) mask str An additional image whose fully transparent areas indicate where the original image should be edited. Must be a valid PNG file, less than 4MB, and have the same dimensions as image . Optional n int The number of images to generate. Must be between 1 and 10. Optional (defaults to 1) size str The size of the generated images. Must be one of 256x256 , 512x512 , or 1024x1024 . Optional (defaults to 1024x1024 ) response_format str The format in which the generated images are returned. Must be one of url or b64_json . Optional (defaults to url ) user str A unique identifier representing your end-user. Optional
Response Format ​
The response follows the OpenAI Images API format:
Image Edit Response Structure
{
"created" : 1677649800 ,
"data" : [
"url" : "https://example.com/edited_image_1.png"
} ,
"url" : "https://example.com/edited_image_2.png"
}
]
For b64_json format:
Base64 Response Structure
"b64_json" : "iVBORw0KGgoAAAANSUhEUgAA..."
Usage
LiteLLM Python SDK
LiteLLM Proxy with OpenAI SDK
Supported Image Edit Parameters
Response Format
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
