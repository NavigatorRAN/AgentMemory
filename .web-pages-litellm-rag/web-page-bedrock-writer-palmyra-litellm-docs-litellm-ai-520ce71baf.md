# Bedrock - Writer Palmyra | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/bedrock_writer
- Final URL: https://docs.litellm.ai/docs/providers/bedrock_writer
- Canonical URL: https://docs.litellm.ai/docs/providers/bedrock_writer
- Fetched at: 2026-06-23T14:27:21Z
- Content type: text/html; charset=utf-8

## Description

Overview

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Overview ​
Property Details Description Writer Palmyra X5 and X4 foundation models on Amazon Bedrock, offering advanced reasoning, tool calling, and document processing capabilities Provider Route on LiteLLM bedrock/ Supported Operations /chat/completions Link to Provider Doc Writer on AWS Bedrock ↗
Quick Start ​
LiteLLM SDK ​
SDK Usage
import litellm
import os
os . environ [ "AWS_ACCESS_KEY_ID" ] = ""
os . environ [ "AWS_SECRET_ACCESS_KEY" ] = ""
os . environ [ "AWS_REGION_NAME" ] = "us-west-2"
response = litellm . completion (
model = "bedrock/us.writer.palmyra-x5-v1:0" ,
messages = [ { "role" : "user" , "content" : "Hello, how are you?" } ]
)
print ( response . choices [ 0 ] . message . content )
LiteLLM Proxy ​
1. Setup config.yaml
proxy_config.yaml
model_list :
- model_name : writer - palmyra - x5
litellm_params :
model : bedrock/us.writer.palmyra - x5 - v1 : 0
aws_access_key_id : os.environ/AWS_ACCESS_KEY_ID
aws_secret_access_key : os.environ/AWS_SECRET_ACCESS_KEY
aws_region_name : us - west - 2
2. Start the proxy
Start Proxy
litellm --config config.yaml
3. Call the proxy
curl
OpenAI SDK
curl Request
curl -X POST http://localhost:4000/v1/chat/completions \
-H "Content-Type: application/json" \
-H "Authorization: Bearer sk-1234" \
-d '{
"model": "writer-palmyra-x5",
"messages": [{"role": "user", "content": "Hello, how are you?"}]
}'
from openai import OpenAI
client = OpenAI (
api_key = "sk-1234" ,
base_url = "http://localhost:4000/v1"
response = client . chat . completions . create (
model = "writer-palmyra-x5" ,
Tool Calling ​
Writer Palmyra models support multi-step tool calling for complex workflows.
Tool Calling - SDK
tools = [
{
"type" : "function" ,
"function" : {
"name" : "get_weather" ,
"description" : "Get the current weather in a location" ,
"parameters" : {
"type" : "object" ,
"properties" : {
"location" : {
"type" : "string" ,
"description" : "The city and state"
}
} ,
"required" : [ "location" ]
]
messages = [ { "role" : "user" , "content" : "What's the weather in Boston?" } ] ,
tools = tools
Tool Calling - curl
"messages": [{"role": "user", "content": "What'\''s the weather in Boston?"}],
"tools": [{
"type": "function",
"function": {
"name": "get_weather",
"description": "Get the current weather in a location",
"parameters": {
"type": "object",
"properties": {
"location": {"type": "string", "description": "The city and state"}
},
"required": ["location"]
}]
Tool Calling - OpenAI SDK
Document Input ​
Writer Palmyra models support document inputs including PDFs.
PDF Document Input - SDK
import base64
# Read and encode PDF
with open ( "document.pdf" , "rb" ) as f :
pdf_base64 = base64 . b64encode ( f . read ( ) ) . decode ( "utf-8" )
messages = [
"role" : "user" ,
"content" : [
"type" : "image_url" ,
"image_url" : {
"url" : f"data:application/pdf;base64, { pdf_base64 } "
"type" : "text" ,
"text" : "Summarize this document"
PDF Document Input - curl
# First, base64 encode your PDF
PDF_BASE64=$(base64 -i document.pdf)
"messages": [{
"role": "user",
"content": [
"type": "image_url",
"image_url": {"url": "data:application/pdf;base64,'$PDF_BASE64'"}
"type": "text",
"text": "Summarize this document"
PDF Document Input - OpenAI SDK
Supported Models ​
Model ID Context Window Input Cost (per 1K tokens) Output Cost (per 1K tokens) bedrock/us.writer.palmyra-x5-v1:0 1M tokens $0.0006 $0.006 bedrock/us.writer.palmyra-x4-v1:0 128K tokens $0.0025 $0.010 bedrock/writer.palmyra-x5-v1:0 1M tokens $0.0006 $0.006 bedrock/writer.palmyra-x4-v1:0 128K tokens $0.0025 $0.010
Cross-Region Inference
The us.writer.* model IDs use cross-region inference profiles. Use these for production workloads.
Overview
Quick Start
LiteLLM SDK
LiteLLM Proxy
Tool Calling
Document Input
Supported Models
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
