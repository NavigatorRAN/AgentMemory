# /responses | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/response_api
- Final URL: https://docs.litellm.ai/docs/response_api
- Canonical URL: https://docs.litellm.ai/docs/response_api
- Fetched at: 2026-06-23T14:32:46Z
- Content type: text/html; charset=utf-8

## Description

LiteLLM provides an endpoint in the spec of OpenAI's /responses API

## Extracted Text

Skip to main content
On this page
Copy as Markdown
LiteLLM provides an endpoint in the spec of OpenAI's /responses API
Requests to /chat/completions may be bridged here automatically when the provider lacks support for that endpoint. The model’s default mode determines how bridging works.(see model_prices_and_context_window )
Feature Supported Notes Cost Tracking ✅ Works with all supported models Logging ✅ Works across all integrations End-user Tracking ✅ Streaming ✅ WebSocket Mode ✅ Lower-latency persistent connections for all providers Image Generation Streaming ✅ Progressive image generation with partial images (1-3) Fallbacks ✅ Works between supported models Loadbalancing ✅ Works between supported models Guardrails ✅ Applies to input and output text (non-streaming only) Supported operations Create a response, Get a response, Delete a response Supported LiteLLM Versions 1.63.8+ Supported LLM providers All LiteLLM supported providers openai , anthropic , bedrock , vertex_ai , gemini , azure , azure_ai etc.
Usage ​
LiteLLM Python SDK ​
OpenAI
Anthropic
Vertex AI
AWS Bedrock
Google AI Studio
Non-streaming ​
OpenAI Non-streaming Response
import litellm
# Non-streaming response
response = litellm . responses (
model = "openai/o1-pro" ,
input = "Tell me a three sentence bedtime story about a unicorn." ,
max_output_tokens = 100
)
print ( response )
Response Format (OpenAI Responses API Format) ​
{
"id" : "resp_abc123" ,
"object" : "response" ,
"created_at" : 1734366691 ,
"status" : "completed" ,
"model" : "o1-pro-2025-01-30" ,
"output" : [
"type" : "message" ,
"id" : "msg_abc123" ,
"role" : "assistant" ,
"content" : [
"type" : "output_text" ,
"text" : "Once upon a time, a little unicorn named Stardust lived in a magical meadow where flowers sang lullabies. One night, she discovered that her horn could paint dreams across the sky, and she spent the evening creating the most beautiful aurora for all the forest creatures to enjoy. As the animals drifted off to sleep beneath her shimmering lights, Stardust curled up on a cloud of moonbeams, happy to have shared her magic with her friends." ,
"annotations" : [ ]
}
]
] ,
"usage" : {
"input_tokens" : 18 ,
"output_tokens" : 98 ,
"total_tokens" : 116
Streaming ​
OpenAI Streaming Response
# Streaming response
stream = True
for event in response :
print ( event )
Image Generation with Streaming ​
OpenAI Streaming Image Generation
import base64
# Streaming image generation with partial images
stream = litellm . responses (
model = "gpt-4.1" , # Use an actual image generation model
input = "Generate a gorgeous image of a river made of white owl feathers" ,
stream = True ,
tools = [ { "type" : "image_generation" , "partial_images" : 2 } ] ,
for event in stream :
if event . type == "response.image_generation_call.partial_image" :
idx = event . partial_image_index
image_base64 = event . partial_image_b64
image_bytes = base64 . b64decode ( image_base64 )
with open ( f"river { idx } .png" , "wb" ) as f :
f . write ( image_bytes )
Image Generation (Non-streaming) ​
Image generation is supported for models that generate images. Generated images are returned in the output array with type: "image_generation_call" .
Gemini (Google AI Studio):
Gemini Image Generation
# Gemini image generation models don't require tools parameter
model = "gemini/gemini-2.5-flash-image" ,
input = "Generate a cute cat playing with yarn"
# Access generated images from output
for item in response . output :
if item . type == "image_generation_call" :
# item.result contains pure base64 (no data: prefix)
image_bytes = base64 . b64decode ( item . result )
# Save the image
with open ( f"generated_ { item . id } .png" , "wb" ) as f :
print ( f"Image saved: generated_ { response . output [ 0 ] . id } .png" )
OpenAI:
OpenAI Image Generation
# OpenAI models require tools parameter for image generation
model = "openai/gpt-4o" ,
input = "Generate a futuristic city at sunset" ,
tools = [ { "type" : "image_generation" } ]
Response Format:
When image generation is successful, the response contains:
"type" : "image_generation_call" ,
"id" : "resp_abc123_img_0" ,
"result" : "iVBORw0KGgo..." // Pure base64 string (no data: prefix)
Supported Models: Provider Models Requires tools Parameter Google AI Studio gemini/gemini-2.5-flash-image ❌ No Vertex AI vertex_ai/gemini-2.5-flash-image-preview ❌ No OpenAI gpt-4o , gpt-4o-mini , gpt-4.1 , gpt-4.1-mini , gpt-4.1-nano , o3 ✅ Yes AWS Bedrock Stability AI, Amazon Nova Canvas models Model-specific Fal AI Various image generation models Check model docs
Note: The result field contains pure base64-encoded image data without the data:image/png;base64, prefix. You must decode it with base64.b64decode() before saving. GET a Response ​
Get Response by ID
# First, create a response
# Get the response ID
response_id = response . id
# Retrieve the response by ID
retrieved_response = litellm . get_responses (
response_id = response_id
print ( retrieved_response )
# For async usage
# retrieved_response = await litellm.aget_responses(response_id=response_id)
CANCEL a Response ​
You can cancel an in-progress response (if supported by the provider):
Cancel Response by ID
# Cancel the response by ID
cancel_response = litellm . cancel_responses (
print ( cancel_response )
# cancel_response = await litellm.acancel_responses(response_id=response_id)
REST API:
curl -X POST http://localhost:4000/v1/responses/response_id/cancel \
-H "Authorization: Bearer sk-1234"
This will attempt to cancel the in-progress response with the given ID.
Note: Not all providers support response cancellation. If unsupported, an error will be raised. DELETE a Response ​
Delete Response by ID
# Delete the response by ID
delete_response = litellm . delete_responses (
print ( delete_response )
# delete_response = await litellm.adelete_responses(response_id=response_id)
Anthropic Non-streaming Response
import os
# Set API key
os . environ [ "ANTHROPIC_API_KEY" ] = "your-anthropic-api-key"
model = "anthropic/claude-3-5-sonnet-20240620" ,
Anthropic Streaming Response
Vertex AI Non-streaming Response
# Set credentials - Vertex AI uses application default credentials
# Run 'gcloud auth application-default login' to authenticate
os . environ [ "VERTEXAI_PROJECT" ] = "your-gcp-project-id"
os . environ [ "VERTEXAI_LOCATION" ] = "us-central1"
model = "vertex_ai/gemini-1.5-pro" ,
Vertex AI Streaming Response
AWS Bedrock Non-streaming Response
# Set AWS credentials
os . environ [ "AWS_ACCESS_KEY_ID" ] = "your-access-key-id"
os . environ [ "AWS_SECRET_ACCESS_KEY" ] = "your-secret-access-key"
os . environ [ "AWS_REGION_NAME" ] = "us-west-2" # or your AWS region
model = "bedrock/anthropic.claude-3-sonnet-20240229-v1:0" ,
AWS Bedrock Streaming Response
Google AI Studio Non-streaming Response
# Set API key for Google AI Studio
os . environ [ "GEMINI_API_KEY" ] = "your-gemini-api-key"
model = "gemini/gemini-1.5-flash" ,
Google AI Studio Streaming Response
LiteLLM Proxy with OpenAI SDK ​
First, set up and start your LiteLLM proxy server.
Start LiteLLM Proxy Server
litellm --config /path/to/config.yaml
# RUNNING on http://0.0.0.0:4000
First, add this to your litellm proxy config.yaml:
OpenAI Proxy Configuration
model_list :
- model_name : openai/o1 - pro
litellm_params :
model : openai/o1 - pro
api_key : os.environ/OPENAI_API_KEY
OpenAI Proxy Non-streaming Response
from openai import OpenAI
# Initialize client with your proxy URL
client = OpenAI (
base_url = "http://localhost:4000" , # Your proxy URL
api_key = "your-api-key" # Your proxy API key
response = client . responses . create (
input = "Tell me a three sentence bedtime story about a unicorn."
OpenAI Proxy Streaming Response
OpenAI Proxy Streaming Image Generation
client = OpenAI ( api_key = "sk-1234" , base_url = "http://localhost:4000" )
stream = client . responses . create (
model = "gpt-4.1" ,
input = "Draw a gorgeous image of a river made of white owl feathers, snaking its way through a serene winter landscape" ,
print ( f"event: { event } " )
GET a Response ​
Get Response by ID with OpenAI SDK
retrieved_response = client . responses . retrieve ( response_id )
DELETE a Response ​
Delete Response by ID with OpenAI SDK
delete_response = client . responses . delete ( response_id )
Anthropic Proxy Configuration
- model_name : anthropic/claude - 3 - 5 - sonnet - 20240620
model : anthropic/claude - 3 - 5 - sonnet - 20240620
api_key : os.environ/ANTHROPIC_API_KEY
Anthropic Proxy Non-streaming Response
Anthropic Proxy Streaming Response
Vertex AI Proxy Configuration
- model_name : vertex_ai/gemini - 1.5 - pro
model : vertex_ai/gemini - 1.5 - pro
vertex_project : your - gcp - project - id
vertex_location : us - central1
Vertex AI Proxy Non-streaming Response
Vertex AI Proxy Streaming Response
AWS Bedrock Proxy Configuration
- model_name : bedrock/anthropic.claude - 3 - sonnet - 20240229 - v1 : 0
model : bedrock/anthropic.claude - 3 - sonnet - 20240229 - v1 : 0
aws_access_key_id : os.environ/AWS_ACCESS_KEY_ID
aws_secret_access_key : os.environ/AWS_SECRET_ACCESS_KEY
aws_region_name : us - west - 2
AWS Bedrock Proxy Non-streaming Response
AWS Bedrock Proxy Streaming Response
Google AI Studio Proxy Configuration
- model_name : gemini/gemini - 1.5 - flash
model : gemini/gemini - 1.5 - flash
api_key : os.environ/GEMINI_API_KEY
Google AI Studio Proxy Non-streaming Response
Google AI Studio Proxy Streaming Response
WebSocket Mode ​
The Responses API supports WebSocket mode for lower-latency, persistent connections ideal for agentic workflows. WebSocket mode works with all LiteLLM providers , not just those with native WebSocket support.
Architecture ​
LiteLLM provides two WebSocket modes:
Native WebSocket : Direct wss:// connection to providers that support it (OpenAI, Azure)
Managed WebSocket : HTTP streaming over WebSocket for all other providers (Anthropic, Gemini, Bedrock, etc.)
The system automatically selects the appropriate mode based on provider capabilities.
Python (websocket-client)
JavaScript (ws)
curl (websocat)
WebSocket with Python
import json
from websocket import create_connection # uv add websocket-client
# Connect to LiteLLM proxy WebSocket endpoint
ws = create_connection (
"ws://localhost:4000/v1/responses?model=gemini-2.5-flash" ,
header = [ "Authorization: Bearer sk-1234" ]
try :
# Send initial message
ws . send ( json . dumps ( {
"type" : "response.create" ,
"model" : "gemini-2.5-flash" ,
"store" : True ,
"input" : [ {
"role" : "user" ,
"content" : [ { "type" : "input_text" , "text" : "My favorite color is blue." } ]
} ]
} ) )
# Collect response events
response_id = None
while True :
event = json . loads ( ws . recv ( ) )
print ( f"Event: { event [ 'type' ] } " )
if event [ "type" ] == "response.completed" :
response_id = event [ "response" ] [ "id" ]
break
elif event [ "type" ] == "response.output_text.delta" :
print ( f"Text: { event . get ( 'delta' , '' ) } " , end = "" , flush = True )
print ( f"\nResponse ID: { response_id } " )
# Send follow-up with previous_response_id for multi-turn
"previous_response_id" : response_id ,
"content" : [ { "type" : "input_text" , "text" : "What is my favorite color?" } ]
# Collect follow-up response
print ( event . get ( "delta" , "" ) , end = "" , flush = True )
finally :
ws . close ( )
WebSocket with JavaScript
const WebSocket = require ( 'ws' ) ; // npm install ws
const ws = new WebSocket (
'ws://localhost:4000/v1/responses?model=gemini-2.5-flash' ,
headers : {
'Authorization' : 'Bearer sk-1234'
) ;
ws . on ( 'open' , ( ) => {
// Send initial message
ws . send ( JSON . stringify ( {
type : 'response.create' ,
model : 'gemini-2.5-flash' ,
store : true ,
input : [ {
type : 'message' ,
role : 'user' ,
content : [ { type : 'input_text' , text : 'My favorite color is blue.' } ]
} ) ) ;
} ) ;
let responseId = null ;
ws . on ( 'message' , ( data ) => {
const event = JSON . parse ( data . toString ( ) ) ;
console . log ( ` Event: ${ event . type } ` ) ;
if ( event . type === 'response.completed' ) {
responseId = event . response . id ;
console . log ( ` Response ID: ${ responseId } ` ) ;
// Send follow-up
previous_response_id : responseId ,
content : [ { type : 'input_text' , text : 'What is my favorite color?' } ]
} else if ( event . type === 'response.output_text.delta' ) {
process . stdout . write ( event . delta || '' ) ;
ws . on ( 'error' , ( error ) => {
console . error ( 'WebSocket error:' , error ) ;
WebSocket with websocat
# Install websocat: brew install websocat (macOS) or cargo install websocat
# Connect to WebSocket endpoint
websocat "ws://localhost:4000/v1/responses?model=gemini-2.5-flash" \
-H="Authorization: Bearer sk-1234"
# Then send JSON events (paste and press Enter):
{"type":"response.create","model":"gemini-2.5-flash","input":[{"type":"message","role":"user","content":[{"type":"input_text","text":"Hello!"}]}]}
# You'll receive streaming events back:
# {"type":"response.created",...}
# {"type":"response.in_progress",...}
# {"type":"response.output_text.delta","delta":"Hello",...}
# {"type":"response.completed",...}
Event Types ​
WebSocket connections receive Server-Sent Events (SSE) formatted as JSON:
Event Type Description response.created Response generation started response.in_progress Response is being generated response.output_item.added New output item (message, tool call, etc.) added response.output_text.delta Incremental text chunk response.output_text.done Text output completed response.content_part.done Content part completed response.output_item.done Output item completed response.completed Full response completed successfully response.failed Response generation failed response.incomplete Response incomplete (e.g., max tokens reached) error Error occurred
Multi-Turn Conversations ​
Use previous_response_id to maintain conversation context across multiple WebSocket messages:
Multi-turn WebSocket Conversation
# Turn 1
"store" : True , # Required for multi-turn
"input" : [ { "type" : "message" , "role" : "user" , "content" : [ { "type" : "input_text" , "text" : "Hello" } ] } ]
# ... collect events and get response_id from response.completed event ...
# Turn 2 - reference previous response
"previous_response_id" : response_id , # Links to previous turn
"input" : [ { "type" : "message" , "role" : "user" , "content" : [ { "type" : "input_text" , "text" : "Continue" } ] } ]
Provider Support ​
Provider WebSocket Mode Notes OpenAI Native Direct wss:// connection to OpenAI Azure OpenAI Native Direct wss:// connection to Azure Anthropic Managed HTTP streaming over WebSocket Google AI Studio (Gemini) Managed HTTP streaming over WebSocket Vertex AI Managed HTTP streaming over WebSocket AWS Bedrock Managed HTTP streaming over WebSocket All other providers Managed HTTP streaming over WebSocket
Note : Both native and managed modes provide the same event stream format. The difference is transparent to clients.
Configuration ​
No special configuration needed. WebSocket mode is automatically available on the /v1/responses endpoint when accessed via WebSocket protocol ( ws:// or wss:// ).
For LiteLLM Proxy, ensure your models are configured normally:
config.yaml
- model_name : gemini - 2.5 - flash
model : gemini/gemini - 2.5 - flash
- model_name : gpt - 4o
model : openai/gpt - 4o
Both models will automatically support WebSocket mode at ws://localhost:4000/v1/responses .
Response ID Security ​
By default, LiteLLM Proxy prevents users from accessing other users' response IDs.
This is done by encrypting the response ID with the user ID, enabling users to only access their own response IDs.
Trying to access someone else's response ID returns 403:
"error" : {
"message" : "Forbidden. The response id is not associated with the user, who this key belongs to." ,
"code" : 403
To disable this, set disable_responses_id_security: true :
general_settings :
disable_responses_id_security : true
This allows any user to access any response ID.
Supported Responses API Parameters ​
Provider Supported Parameters openai All Responses API parameters are supported azure All Responses API parameters are supported anthropic See supported parameters here bedrock See supported parameters here gemini See supported parameters here vertex_ai See supported parameters here azure_ai See supported parameters here All other llm api providers See supported parameters here
Load Balancing with Session Continuity. ​
When using the Responses API with multiple deployments of the same model (e.g., multiple Azure OpenAI endpoints), LiteLLM provides session continuity. This ensures that follow-up requests using a previous_response_id are routed to the same deployment that generated the original response.
Example Usage ​
Python SDK
Proxy Server
Python SDK with Session Continuity
# Set up router with multiple deployments of the same model
router = litellm . Router (
model_list = [
"model_name" : "azure-gpt4-turbo" ,
"litellm_params" : {
"model" : "azure/gpt-4-turbo" ,
"api_key" : "your-api-key-1" ,
"api_version" : "2024-06-01" ,
"api_base" : "https://endpoint1.openai.azure.com" ,
} ,
"api_key" : "your-api-key-2" ,
"api_base" : "https://endpoint2.openai.azure.com" ,
# `responses_api_deployment_check` ensures Requests with `previous_response_id`
# are routed to the same deployment. `deployment_affinity` adds sticky sessions
# for requests without `previous_response_id` (useful for implicit caching).
# `session_affinity` adds sticky sessions based on `session_id` metadata.
optional_pre_call_checks = [ "responses_api_deployment_check" , "deployment_affinity" , "session_affinity" ] ,
# Optional (default is 3600 seconds / 1 hour)
deployment_affinity_ttl_seconds = 3600 ,
# Initial request
response = await router . aresponses (
model = "azure-gpt4-turbo" ,
input = "Hello, who are you?" ,
truncation = "auto" ,
# Store the response ID
# Follow-up request - will be automatically routed to the same deployment
follow_up = await router . aresponses (
input = "Tell me more about yourself" ,
previous_response_id = response_id # This ensures routing to the same deployment
1. Setup session continuity on proxy config.yaml ​
To enable session continuity for Responses API in your LiteLLM proxy, set optional_pre_call_checks in your proxy config.yaml.
responses_api_deployment_check : high priority routing when previous_response_id is provided
encrypted_content_affinity : [Recommended] content-aware routing for encrypted items (e.g., rs_... reasoning items) ( requires LiteLLM >= 1.82.3 )
session_affinity : sticky sessions based on session id (takes priority over deployment_affinity )
deployment_affinity : sticky sessions based on user key (applies even without previous_response_id )
Recommended: Use encrypted_content_affinity
For Responses API with load balancing across deployments with different API keys , use encrypted_content_affinity instead of deployment_affinity . It only pins requests that contain encrypted content, avoiding quota reduction while preventing invalid_encrypted_content errors. (Requires LiteLLM >= 1.82.3.)
Notes:
User-key affinity is keyed on metadata.user_api_key_hash (the API key hash). The OpenAI user request parameter is an end-user identifier and is intentionally not used for deployment affinity.
Session-ID affinity is keyed on metadata.session_id . For proxy requests, this can be passed via the x-litellm-session-id or x-litellm-trace-id HTTP header (they are interchangeable for call chaining). For Python SDK requests, you can pass it via litellm_metadata={"session_id": "value"} in request args.
user_api_key_hash is already SHA-256, and is used as-is (no double hashing).
Affinity is scoped by a stable model identifier (the model-map key, e.g. model_map_information.model_map_key ) so model aliases map to the same stickiness bucket.
The mapping TTL is controlled by deployment_affinity_ttl_seconds (configured on Router init / proxy startup).
config.yaml with Session Continuity
- model_name : azure - gpt4 - turbo
model : azure/gpt - 4 - turbo
api_key : your - api - key - 1
api_version : 2024-06-01
api_base : https : //endpoint1.openai.azure.com
api_key : your - api - key - 2
api_base : https : //endpoint2.openai.azure.com
router_settings :
optional_pre_call_checks :
- responses_api_deployment_check
- session_affinity
- deployment_affinity
deployment_affinity_ttl_seconds : 3600
2. Use the OpenAI Python SDK to make requests to LiteLLM Proxy ​
OpenAI Client with Proxy Server
base_url = "http://localhost:4000" ,
api_key = "your-api-key"
input = "Hello, who are you?"
follow_up = client . responses . create (
Encrypted Content Affinity (Multi-Region Load Balancing) ​
When load balancing Responses API across deployments with different API keys (e.g., different Azure regions or OpenAI organizations), encrypted content items (like rs_... reasoning items) can only be decrypted by the API key that created them.
The Problem ​
"message" : "The encrypted content for item rs_0d09d6e56879e76500699d6feee41c8197bd268aae76141f87 could not be verified. Reason: Encrypted content organization_id did not match the target organization." ,
"type" : "invalid_request_error" ,
"code" : "invalid_encrypted_content"
This error occurs when:
Initial request goes to Deployment A (API Key 1) → produces encrypted item rs_xyz
Follow-up request with rs_xyz in input gets load balanced to Deployment B (API Key 2)
Deployment B cannot decrypt content created by Deployment A → request fails
The Solution: encrypted_content_affinity ​
The encrypted_content_affinity pre-call check routes follow-up requests containing encrypted items to the originating deployment only when necessary
Key Benefits:
✅ No quota reduction : Unlike deployment_affinity , only pins requests that contain encrypted items
✅ Bypasses rate limits : When encrypted content requires a specific deployment, RPM/TPM limits are bypassed (the request would fail on any other deployment anyway)
✅ No previous_response_id required : Works by encoding model_id directly into item IDs
✅ No cache required : model_id is decoded on-the-fly — no Redis dependency, no TTL to manage
✅ Globally safe : Can be enabled for all models; non-Responses-API calls (chat, embeddings) are unaffected
How It Works ​
Encoding Phase (on response):
For each output item that contains encrypted_content , LiteLLM rewrites the item ID to embed the originating model_id : rs_xyz → encitem_{base64("litellm:model_id:{model_id};item_id:rs_xyz")}
The original item ID is restored before forwarding the request to the upstream provider
Routing Phase (before request):
Scans request input for encitem_ prefixed IDs
If found → decodes model_id , pins to originating deployment, bypasses rate limits
If no encoded items → normal load balancing
from litellm import Router
router = Router (
"model_name" : "gpt-5.1-codex" ,
"model" : "openai/gpt-5.1-codex" ,
"api_key" : "org-1-api-key" , # Different API key
"model_info" : { "id" : "deployment-us-east" } ,
"api_key" : "org-2-api-key" , # Different API key
"model_info" : { "id" : "deployment-eu-west" } ,
optional_pre_call_checks = [ "encrypted_content_affinity" ] ,
# Initial request - routes to any deployment
response1 = await router . aresponses (
model = "gpt-5.1-codex" ,
input = "Explain quantum computing" ,
# Follow-up with encrypted items - automatically routes to same deployment
response2 = await router . aresponses (
input = response1 . output , # Contains encrypted items from response1
- model_name : gpt - 5.1 - codex
model : azure/gpt - 5.1 - codex
api_base : https : //eastus.openai.azure.com/
api_key : os.environ/AZURE_API_KEY_EASTUS
rpm : 600
tpm : 100000
model_info :
id : "gpt-5.1-codex-eastus"
api_base : https : //westeurope.openai.azure.com/
api_key : os.environ/AZURE_API_KEY_WESTEUROPE
id : "gpt-5.1-codex-westeurope"
routing_strategy : usage - based - routing - v2
enable_pre_call_checks : true
- encrypted_content_affinity
Start proxy:
litellm --config config.yaml
When to Use Each Affinity Type ​
Affinity Type Use Case Scope Quota Impact encrypted_content_affinity [Recommended] Multi-region Responses API with different API keys Only requests with tracked encrypted items ✅ None (surgical pinning) responses_api_deployment_check When previous_response_id is available Requests with previous_response_id ✅ None session_affinity Session-based applications All requests with same session_id ⚠️ Reduces quota by # of sessions deployment_affinity Simple sticky sessions All requests from same API key ❌ Reduces quota by # of users
Per-Model-Group Affinity Configuration ​
By default, optional_pre_call_checks applies globally to all model groups. Use model_group_affinity_config when you want different affinity behavior per model group — for example, enabling stickiness only for models spread across providers (Azure + Bedrock) while leaving single-provider groups free to load-balance.
Groups not listed fall back to the global optional_pre_call_checks settings.
"model_name" : "gpt-4" ,
"litellm_params" : { "model" : "azure/gpt-4" , "api_key" : "..." , "api_base" : "https://endpoint1.openai.azure.com" } ,
"litellm_params" : { "model" : "bedrock/anthropic.claude-v2" , "aws_region_name" : "us-east-1" } ,
"model_name" : "text-embedding-ada-002" ,
"litellm_params" : { "model" : "azure/text-embedding-ada-002" , "api_key" : "..." , "api_base" : "https://endpoint1.openai.azure.com" } ,
"litellm_params" : { "model" : "azure/text-embedding-ada-002" , "api_key" : "..." , "api_base" : "https://endpoint2.openai.azure.com" } ,
# gpt-4: cross-provider (Azure + Bedrock) — enable deployment affinity
# text-embedding-ada-002: same provider — no affinity, let it load balance freely
model_group_affinity_config = {
"gpt-4" : [ "deployment_affinity" , "responses_api_deployment_check" ] ,
- model_name : gpt - 4
model : azure/gpt - 4
api_key : os.environ/AZURE_API_KEY_1
model : bedrock/anthropic.claude - v2
aws_region_name : us - east - 1
- model_name : text - embedding - ada - 002
model : azure/text - embedding - ada - 002
api_key : os.environ/AZURE_API_KEY_2
# gpt-4: cross-provider — enable stickiness
# text-embedding-ada-002: not listed — load balances freely
model_group_affinity_config :
"gpt-4" :
Supported values: deployment_affinity , responses_api_deployment_check , session_affinity
Calling non-Responses API endpoints ( /responses to /chat/completions Bridge) ​
LiteLLM allows you to call non-Responses API models via a bridge to LiteLLM's /chat/completions endpoint. This is useful for calling Anthropic, Gemini and even non-Responses API OpenAI models.
Python SDK Usage ​
SDK Usage
LiteLLM Proxy Usage ​
Setup Config:
Example Configuration
- model_name : anthropic - model
Start Proxy:
Start LiteLLM Proxy
Make Request:
non-Responses API Model Request
curl http://localhost:4000/v1/responses \
-H "Content-Type: application/json" \
-H "Authorization: Bearer sk-1234" \
-d '{
"model": "anthropic-model",
"input": "who is Michael Jordan"
}'
Opt-in bridge for openai/ models with custom api_base ​
If you're using an OpenAI-compatible third-party provider (e.g. llama.cpp, vLLM, LM Studio) via openai/ prefix with a custom api_base , LiteLLM will normally forward /responses requests directly to that endpoint. If the provider only supports /chat/completions , the request will fail.
Use either of these to force the /responses → /chat/completions bridge:
use_chat_completions_api: true — makes it explicit that LiteLLM will call the provider’s chat-completions API.
openai/chat_completions/<model_name> — same pattern as responses/ on chat completions: the model id encodes the routing choice.
Force bridge for custom openai/ endpoint (flag)
model = "openai/my-custom-model" ,
input = "Hello!" ,
api_base = "http://localhost:8080" ,
api_key = "fake-key" ,
use_chat_completions_api = True ,
Or encode it in the model id:
Force bridge via openai/chat_completions/ model prefix
model = "openai/chat_completions/my-custom-model" ,
config.yaml — bridge for custom openai/ endpoint
- model_name : my - local - model
model : openai/my - custom - model
api_base : http : //localhost : 8080/v1
api_key : fake - key
use_chat_completions_api : true
Alternatively set model: openai/chat_completions/my-custom-model instead of the flag.
Request via bridge
"model": "my-local-model",
"input": "Hello!"
This is particularly useful when connecting clients that hardcode the /responses endpoint (e.g. OpenAI Codex CLI with wire_api = "responses" ) to local or third-party OpenAI-compatible providers that only expose /chat/completions .
Server-side compaction ​
For long-running conversations, you can enable server-side compaction so that when the rendered context size crosses a threshold, the server automatically runs compaction in-stream and emits a compaction item—no separate POST /v1/responses/compact call is required.
Supported on the OpenAI Responses API when using the openai or azure provider. Pass context_management with a compaction entry and compact_threshold (token count; minimum 1000). When the context crosses the threshold, the server compacts in-stream and continues. Chain turns with previous_response_id or by appending output items to your next input array. See OpenAI Compaction guide for details.
Note: You can use openai context_management format with Anthropic models via LiteLLM via responses API. LiteLLM will automatically translate this format for Anthropic and handle context management for you.
For explicit control over when compaction runs, use the standalone compact endpoint ( POST /v1/responses/compact ) instead.
Python SDK ​
Server-side compaction with LiteLLM Python SDK
# Non-streaming: enable compaction when context exceeds 200k tokens
input = "Your conversation input..." ,
context_management = [ { "type" : "compaction" , "compact_threshold" : 200000 } ] ,
max_output_tokens = 1024 ,
# Streaming: same context_management, compaction runs in-stream if threshold is crossed
LiteLLM Proxy (AI Gateway) ​
Use the OpenAI SDK with your proxy as base_url , or call the proxy with curl. The proxy forwards context_management to the provider.
OpenAI Python SDK (proxy as base_url):
Server-side compaction via LiteLLM Proxy
base_url = "http://localhost:4000" , # LiteLLM Proxy (AI Gateway)
api_key = "your-proxy-api-key" ,
curl (proxy):
Server-side compaction via curl to LiteLLM Proxy
curl -X POST "http://localhost:4000/v1/responses" \
-H "Authorization: Bearer your-proxy-api-key" \
"model": "openai/gpt-4o",
"input": "Your conversation input...",
"context_management": [{"type": "compaction", "compact_threshold": 200000}],
"max_output_tokens": 1024
Shell tool ​
The Shell tool lets the model run commands in a hosted container or local runtime (OpenAI Responses API). You pass tools=[{"type": "shell", "environment": {...}}] ; the environment object configures the runtime (e.g. type: "container_auto" for auto-provisioned containers). See OpenAI Shell tool guide for full options.
Supported when using the openai or azure provider with a model that supports the Shell tool.
Shell tool with LiteLLM Python SDK
model = "openai/gpt-5.2" ,
input = "List files in /mnt/data and run python --version." ,
tools = [ { "type" : "shell" , "environment" : { "type" : "container_auto" } } ] ,
tool_choice = "auto" ,
Use the OpenAI SDK with your proxy as base_url , or call the proxy with curl. The proxy forwards tools (including type: "shell" ) to the provider.
Shell tool via LiteLLM Proxy
input = "List files in /mnt/data." ,
curl:
Shell tool via curl to LiteLLM Proxy
"model": "openai/gpt-5.2",
"input": "List files in /mnt/data.",
"tools": [{"type": "shell", "environment": {"type": "container_auto"}}],
"tool_choice": "auto",
File Search (Vector Stores) ​
For full file_search usage (native + emulated fallback), SDK/Proxy examples, architecture diagram, and Q&A, see:
File Search in the Responses API — E2E Testing Guide
Session Management ​
LiteLLM Proxy supports session management for all supported models. This allows you to store and fetch conversation history (state) in LiteLLM Proxy.
Enable storing request / response content in the database
Set store_prompts_in_cold_storage: true in your proxy config.yaml. When this is enabled, LiteLLM will store the request and response content in the s3 bucket you specify.
litellm_settings :
callbacks : [ "s3_v2" ]
cold_storage_custom_logger : s3_v2
s3_callback_params : # learn more https://docs.litellm.ai/docs/proxy/logging#s3-buckets
s3_bucket_name : litellm - logs # AWS Bucket Name for S3
s3_region_name : us - west - 2
store_prompts_in_cold_storage : true
store_prompts_in_spend_logs : true
Make request 1 with no previous_response_id (new session)
Start a new conversation by making a request without specifying a previous response ID.
Curl
OpenAI Python SDK
"model": "anthropic/claude-3-5-sonnet-latest",
# Initialize the client with your LiteLLM proxy URL
api_key = "sk-1234"
# Make initial request to start a new conversation
model = "anthropic/claude-3-5-sonnet-latest" ,
input = "who is Michael Jordan"
print ( response . id ) # Store this ID for future requests in same session
print ( response . output [ 0 ] . content [ 0 ] . text )
Response:
"id" : "resp_123abc" ,
"model" : "claude-3-5-sonnet-20241022" ,
"output" : [ {
"content" : [ {
"text" : "Michael Jordan is widely considered one of the greatest basketball players of all time. He played for the Chicago Bulls (1984-1993, 1995-1998) and Washington Wizards (2001-2003), winning 6 NBA Championships with the Bulls."
Make request 2 with previous_response_id (same session)
Continue the conversation by referencing the previous response ID to maintain conversation context.
"input": "can you tell me more about him",
"previous_response_id": "resp_123abc"
# Make follow-up request in the same conversation session
follow_up_response = client . responses . create (
input = "can you tell me more about him" ,
previous_response_id = "resp_123abc" # ID from the previous response
print ( follow_up_response . output [ 0 ] . content [ 0 ] . text )
"id" : "resp_456def" ,
"text" : "Michael Jordan was born February 17, 1963. He attended University of North Carolina before being drafted 3rd overall by the Bulls in 1984. Beyond basketball, he built the Air Jordan brand with Nike and later became owner of the Charlotte Hornets."
Make request 3 with no previous_response_id (new session)
Start a brand new conversation without referencing previous context to demonstrate how context is not maintained between sessions.
"input": "can you tell me more about him"
# Make a new request without previous context
new_session_response = client . responses . create (
input = "can you tell me more about him"
# No previous_response_id means this starts a new conversation
print ( new_session_response . output [ 0 ] . content [ 0 ] . text )
"id" : "resp_789ghi" ,
"text" : "I don't see who you're referring to in our conversation. Could you let me know which person you'd like to learn more about?"
Usage
LiteLLM Python SDK
LiteLLM Proxy with OpenAI SDK
WebSocket Mode
Architecture
Event Types
Multi-Turn Conversations
Provider Support
Configuration
Response ID Security
Supported Responses API Parameters
Load Balancing with Session Continuity.
Encrypted Content Affinity (Multi-Region Load Balancing)
The Problem
The Solution: encrypted_content_affinity
How It Works
When to Use Each Affinity Type
Per-Model-Group Affinity Configuration
Calling non-Responses API endpoints ( /responses to /chat/completions Bridge)
Opt-in bridge for openai/ models with custom api_base
Server-side compaction
LiteLLM Proxy (AI Gateway)
Shell tool
File Search (Vector Stores)
Session Management
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
