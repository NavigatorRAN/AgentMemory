# Image Generation in Chat Completions, Responses API | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/completion/image_generation_chat
- Final URL: https://docs.litellm.ai/docs/completion/image_generation_chat
- Canonical URL: https://docs.litellm.ai/docs/completion/image_generation_chat
- Fetched at: 2026-06-23T14:23:11Z
- Content type: text/html; charset=utf-8

## Description

This guide covers how to generate images when using the chat/completions. Note - if you want this on Responses API please file a Feature Request here.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
This guide covers how to generate images when using the chat/completions . Note - if you want this on Responses API please file a Feature Request here .
info
Requires LiteLLM v1.76.1+
Supported Providers:
Google AI Studio ( gemini )
Vertex AI ( vertex_ai/ )
LiteLLM will standardize the images response in the assistant message for models that support image generation during chat completions.
Example response from litellm
"message" : {
. . .
"content" : "Here's the image you requested:" ,
"images" : [
{
"image_url" : {
"url" : "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAA..." ,
"detail" : "auto"
} ,
"index" : 0 ,
"type" : "image_url"
}
]
Quick Start ​
SDK
PROXY
Image generation with chat completion
from litellm import completion
import os
os . environ [ "GEMINI_API_KEY" ] = "your-api-key"
response = completion (
model = "gemini/gemini-2.5-flash-image-preview" ,
messages = [
{ "role" : "user" , "content" : "Generate an image of a banana wearing a costume that says LiteLLM" }
] ,
)
print ( response . choices [ 0 ] . message . content ) # Text response
print ( response . choices [ 0 ] . message . images ) # List of image objects
Setup config.yaml
config.yaml
model_list :
- model_name : gemini - image - gen
litellm_params :
model : gemini/gemini - 2.5 - flash - image - preview
api_key : os.environ/GEMINI_API_KEY
Run proxy server
Start the proxy
litellm --config config.yaml
# RUNNING on http://0.0.0.0:4000
Test it!
Make request
curl http://0.0.0.0:4000/v1/chat/completions \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $LITELLM_KEY" \
-d '{
"model": "gemini-image-gen",
"messages": [
"role": "user",
"content": "Generate an image of a banana wearing a costume that says LiteLLM"
}'
Expected Response
"id": "chatcmpl-3b66124d79a708e10c603496b363574c",
"choices": [
"finish_reason": "stop",
"index": 0,
"message": {
"content": "Here's the image you requested:",
"role": "assistant",
"images": [
"image_url": {
"url": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAA...",
"detail": "auto"
},
"type": "image_url"
],
"created": 1723323084,
"model": "gemini/gemini-2.5-flash-image-preview",
"object": "chat.completion",
"usage": {
"completion_tokens": 12,
"prompt_tokens": 16,
"total_tokens": 28
Streaming Support ​
Streaming image generation
stream = True ,
for chunk in response :
if hasattr ( chunk . choices [ 0 ] . delta , "images" ) and chunk . choices [ 0 ] . delta . images is not None :
print ( "Generated image:" , chunk . choices [ 0 ] . delta . images [ 0 ] [ "image_url" ] [ "url" ] )
break
Streaming request
"stream": true
Expected Streaming Response
data: {"id":"chatcmpl-123","object":"chat.completion.chunk","created":1723323084,"model":"gemini/gemini-2.5-flash-image-preview","choices":[{"index":0,"delta":{"role":"assistant"},"finish_reason":null}]}
data: {"id":"chatcmpl-123","object":"chat.completion.chunk","created":1723323084,"model":"gemini/gemini-2.5-flash-image-preview","choices":[{"index":0,"delta":{"content":"Here's the image you requested:"},"finish_reason":null}]}
data: {"id":"chatcmpl-123","object":"chat.completion.chunk","created":1723323084,"model":"gemini/gemini-2.5-flash-image-preview","choices":[{"index":0,"delta":{"images":[{"image_url":{"url":"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAA...","detail":"auto"},"index":0,"type":"image_url"}]},"finish_reason":null}]}
data: {"id":"chatcmpl-123","object":"chat.completion.chunk","created":1723323084,"model":"gemini/gemini-2.5-flash-image-preview","choices":[{"index":0,"delta":{},"finish_reason":"stop"}]}
data: [DONE]
Async Support ​
Async image generation
from litellm import acompletion
import asyncio
async def generate_image ( ) :
response = await acompletion (
return response
# Run the async function
asyncio . run ( generate_image ( ) )
Supported Models ​
Provider Model Google AI Studio gemini/gemini-2.0-flash-preview-image-generation , gemini/gemini-2.5-flash-image-preview , gemini/gemini-3-pro-image-preview Vertex AI vertex_ai/gemini-2.0-flash-preview-image-generation , vertex_ai/gemini-2.5-flash-image-preview , vertex_ai/gemini-3-pro-image-preview
Spec ​
The images field in the response follows this structure:
"url" : "data:image/png;base64,<base64_encoded_image>" ,
images - List[ImageURLListItem]: Array of generated images
image_url - ImageURLObject: Container for image data
url - str: Base64 encoded image data in data URI format
detail - str: Image detail level (always "auto" for generated images)
index - int: Index of the image in the response
type - str: Type identifier (always "image_url")
The images are returned as base64-encoded data URIs that can be directly used in HTML <img> tags or saved to files.
Quick Start
Streaming Support
Async Support
Supported Models
Spec
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
