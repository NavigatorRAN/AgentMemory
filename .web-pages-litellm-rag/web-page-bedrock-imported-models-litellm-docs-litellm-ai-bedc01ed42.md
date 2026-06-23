# Bedrock Imported Models | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/bedrock_imported
- Final URL: https://docs.litellm.ai/docs/providers/bedrock_imported
- Canonical URL: https://docs.litellm.ai/docs/providers/bedrock_imported
- Fetched at: 2026-06-23T14:27:15Z
- Content type: text/html; charset=utf-8

## Description

Bedrock Imported Models (Deepseek, Deepseek R1, Qwen, OpenAI-compatible models)

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Bedrock Imported Models (Deepseek, Deepseek R1, Qwen, OpenAI-compatible models)
Deepseek R1 ​
This is a separate route, as the chat template is different.
Property Details Provider Route bedrock/deepseek_r1/{model_arn} Provider Documentation Bedrock Imported Models , Deepseek Bedrock Imported Model
SDK
Proxy
from litellm import completion
import os
response = completion (
model = "bedrock/deepseek_r1/arn:aws:bedrock:us-east-1:086734376398:imported-model/r4c4kewx2s0n" , # bedrock/deepseek_r1/{your-model-arn}
messages = [ { "role" : "user" , "content" : "Tell me a joke" } ] ,
)
1. Add to config
model_list :
- model_name : DeepSeek - R1 - Distill - Llama - 70B
litellm_params :
model : bedrock/deepseek_r1/arn : aws : bedrock : us - east - 1 : 086734376398 : imported - model/r4c4kewx2s0n
2. Start proxy
litellm --config /path/to/config.yaml
# RUNNING at http://0.0.0.0:4000
3. Test it!
curl --location 'http://0.0.0.0:4000/chat/completions' \
--header 'Authorization: Bearer sk-1234' \
--header 'Content-Type: application/json' \
--data '{
"model": "DeepSeek-R1-Distill-Llama-70B", # 👈 the 'model_name' in config
"messages": [
{
"role": "user",
"content": "what llm are you"
}
],
}'
Deepseek (not R1) ​
Property Details Provider Route bedrock/llama/{model_arn} Provider Documentation Bedrock Imported Models , Deepseek Bedrock Imported Model
Use this route to call Bedrock Imported Models that follow the llama Invoke Request / Response spec
model = "bedrock/llama/arn:aws:bedrock:us-east-1:086734376398:imported-model/r4c4kewx2s0n" , # bedrock/llama/{your-model-arn}
model : bedrock/llama/arn : aws : bedrock : us - east - 1 : 086734376398 : imported - model/r4c4kewx2s0n
Qwen3 Imported Models ​
Property Details Provider Route bedrock/qwen3/{model_arn} Provider Documentation Bedrock Imported Models , Qwen3 Models
model = "bedrock/qwen3/arn:aws:bedrock:us-east-1:086734376398:imported-model/your-qwen3-model" , # bedrock/qwen3/{your-model-arn}
max_tokens = 100 ,
temperature = 0.7
- model_name : Qwen3 - 32B
model : bedrock/qwen3/arn : aws : bedrock : us - east - 1 : 086734376398 : imported - model/your - qwen3 - model
"model": "Qwen3-32B", # 👈 the 'model_name' in config
Qwen2 Imported Models ​
Property Details Provider Route bedrock/qwen2/{model_arn} Provider Documentation Bedrock Imported Models Note Qwen2 and Qwen3 architectures are mostly similar. The main difference is in the response format: Qwen2 uses "text" field while Qwen3 uses "generation" field.
model = "bedrock/qwen2/arn:aws:bedrock:us-east-1:086734376398:imported-model/your-qwen2-model" , # bedrock/qwen2/{your-model-arn}
- model_name : Qwen2 - 72B
model : bedrock/qwen2/arn : aws : bedrock : us - east - 1 : 086734376398 : imported - model/your - qwen2 - model
"model": "Qwen2-72B", # 👈 the 'model_name' in config
OpenAI-Compatible Imported Models (Qwen 2.5 VL, etc.) ​
Use this route for Bedrock imported models that follow the OpenAI Chat Completions API spec . This includes models like Qwen 2.5 VL that accept OpenAI-formatted messages with support for vision (images), tool calling, and other OpenAI features.
Property Details Provider Route bedrock/openai/{model_arn} Provider Documentation Bedrock Imported Models Supported Features Vision (images), tool calling, streaming, system messages LiteLLMSDK Usage ​
Basic Usage
model = "bedrock/openai/arn:aws:bedrock:us-east-1:046319184608:imported-model/0m2lasirsp6z" , # bedrock/openai/{your-model-arn}
max_tokens = 300 ,
temperature = 0.5
With Vision (Images)
import base64
# Load and encode image
with open ( "image.jpg" , "rb" ) as f :
image_base64 = base64 . b64encode ( f . read ( ) ) . decode ( "utf-8" )
model = "bedrock/openai/arn:aws:bedrock:us-east-1:046319184608:imported-model/0m2lasirsp6z" ,
messages = [
"role" : "system" ,
"content" : "You are a helpful assistant that can analyze images."
} ,
"role" : "user" ,
"content" : [
{ "type" : "text" , "text" : "What's in this image?" } ,
"type" : "image_url" ,
"image_url" : { "url" : f"data:image/jpeg;base64, { image_base64 } " }
]
] ,
Comparing Multiple Images
# Load images
with open ( "image1.jpg" , "rb" ) as f :
image1_base64 = base64 . b64encode ( f . read ( ) ) . decode ( "utf-8" )
with open ( "image2.jpg" , "rb" ) as f :
image2_base64 = base64 . b64encode ( f . read ( ) ) . decode ( "utf-8" )
{ "type" : "text" , "text" : "Spot the difference between these two images?" } ,
"image_url" : { "url" : f"data:image/jpeg;base64, { image1_base64 } " }
"image_url" : { "url" : f"data:image/jpeg;base64, { image2_base64 } " }
LiteLLM Proxy Usage (AI Gateway) ​
- model_name : qwen - 25vl - 72b
model : bedrock/openai/arn : aws : bedrock : us - east - 1 : 046319184608 : imported - model/0m2lasirsp6z
Basic text request:
"model": "qwen-25vl-72b",
"max_tokens": 300
With vision (image):
"role": "system",
"content": "You are a helpful assistant that can analyze images."
},
"content": [
{"type": "text", "text": "What is in this image?"},
"type": "image_url",
"image_url": {"url": "data:image/jpeg;base64,/9j/4AAQSkZ..."}
"max_tokens": 300,
"temperature": 0.5
Moonshot Kimi K2 Thinking ​
Moonshot AI's Kimi K2 Thinking model is now available on Amazon Bedrock. This model features advanced reasoning capabilities with automatic reasoning content extraction.
Property Details Provider Route bedrock/moonshot.kimi-k2-thinking , bedrock/invoke/moonshot.kimi-k2-thinking Provider Documentation AWS Bedrock Moonshot Announcement ↗ Supported Parameters temperature , max_tokens , top_p , stream , tools , tool_choice Special Features Reasoning content extraction, Tool calling Supported Features ​
Reasoning Content Extraction : Automatically extracts <reasoning> tags and returns them as reasoning_content (similar to OpenAI's o1 models)
Tool Calling : Full support for function/tool calling with tool responses
Streaming : Both streaming and non-streaming responses
System Messages : System message support
Basic Usage ​
Moonshot Kimi K2 SDK Usage
os . environ [ "AWS_ACCESS_KEY_ID" ] = "your-aws-access-key"
os . environ [ "AWS_SECRET_ACCESS_KEY" ] = "your-aws-secret-key"
os . environ [ "AWS_REGION_NAME" ] = "us-west-2" # or your preferred region
# Basic completion
model = "bedrock/moonshot.kimi-k2-thinking" , # or bedrock/invoke/moonshot.kimi-k2-thinking
{ "role" : "user" , "content" : "What is 2+2? Think step by step." }
temperature = 0.7 ,
max_tokens = 200
print ( response . choices [ 0 ] . message . content )
# Access reasoning content if present
if response . choices [ 0 ] . message . reasoning_content :
print ( "Reasoning:" , response . choices [ 0 ] . message . reasoning_content )
config.yaml
- model_name : kimi - k2
model : bedrock/moonshot.kimi - k2 - thinking
aws_access_key_id : os.environ/AWS_ACCESS_KEY_ID
aws_secret_access_key : os.environ/AWS_SECRET_ACCESS_KEY
aws_region_name : us - west - 2
Start LiteLLM Proxy
Test Kimi K2 via Proxy
"model": "kimi-k2",
"content": "What is 2+2? Think step by step."
"temperature": 0.7,
"max_tokens": 200
Tool Calling Example ​
Kimi K2 with Tool Calling
os . environ [ "AWS_REGION_NAME" ] = "us-west-2"
# Tool calling example
model = "bedrock/moonshot.kimi-k2-thinking" ,
{ "role" : "user" , "content" : "What's the weather in Tokyo?" }
tools = [
"type" : "function" ,
"function" : {
"name" : "get_weather" ,
"description" : "Get the current weather in a location" ,
"parameters" : {
"type" : "object" ,
"properties" : {
"location" : {
"type" : "string" ,
"description" : "The city name"
"required" : [ "location" ]
if response . choices [ 0 ] . message . tool_calls :
tool_call = response . choices [ 0 ] . message . tool_calls [ 0 ]
print ( f"Tool called: { tool_call . function . name } " )
print ( f"Arguments: { tool_call . function . arguments } " )
Streaming Example ​
Kimi K2 Streaming
{ "role" : "user" , "content" : "Explain quantum computing in simple terms." }
stream = True ,
for chunk in response :
if chunk . choices [ 0 ] . delta . content :
print ( chunk . choices [ 0 ] . delta . content , end = "" )
# Check for reasoning content in streaming
if hasattr ( chunk . choices [ 0 ] . delta , 'reasoning_content' ) and chunk . choices [ 0 ] . delta . reasoning_content :
print ( f"\n[Reasoning: { chunk . choices [ 0 ] . delta . reasoning_content } ]" )
Supported Parameters ​ Parameter Type Description Supported temperature float (0-1) Controls randomness in output ✅ max_tokens integer Maximum tokens to generate ✅ top_p float Nucleus sampling parameter ✅ stream boolean Enable streaming responses ✅ tools array Tool/function definitions ✅ tool_choice string/object Tool choice specification ✅ stop array Stop sequences ❌ (Not supported on Bedrock)
Deepseek R1
Deepseek (not R1)
Qwen3 Imported Models
Qwen2 Imported Models
OpenAI-Compatible Imported Models (Qwen 2.5 VL, etc.)
Moonshot Kimi K2 Thinking
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
