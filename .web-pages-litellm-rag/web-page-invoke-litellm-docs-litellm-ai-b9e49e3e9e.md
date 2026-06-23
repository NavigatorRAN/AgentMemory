# /invoke | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/bedrock_invoke
- Final URL: https://docs.litellm.ai/docs/bedrock_invoke
- Canonical URL: https://docs.litellm.ai/docs/bedrock_invoke
- Fetched at: 2026-06-23T14:22:54Z
- Content type: text/html; charset=utf-8

## Description

Call Bedrock's /invoke endpoint through LiteLLM Proxy.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Call Bedrock's /invoke endpoint through LiteLLM Proxy.
Feature Supported Cost Tracking ✅ Logging ✅ Streaming ✅ via /invoke-with-response-stream Load Balancing ✅
Quick Start ​
1. Setup config.yaml ​
model_list :
- model_name : my - bedrock - model
litellm_params :
model : bedrock/us.anthropic.claude - 3 - 5 - sonnet - 20240620 - v1 : 0
aws_region_name : us - west - 2
aws_access_key_id : os.environ/AWS_ACCESS_KEY_ID # reads from environment
aws_secret_access_key : os.environ/AWS_SECRET_ACCESS_KEY
custom_llm_provider : bedrock
Set AWS credentials in your environment:
export AWS_ACCESS_KEY_ID="your-access-key"
export AWS_SECRET_ACCESS_KEY="your-secret-key"
2. Start Proxy ​
litellm --config config.yaml
# RUNNING on http://0.0.0.0:4000
3. Call /invoke endpoint ​
curl -X POST 'http://0.0.0.0:4000/bedrock/model/my-bedrock-model/invoke' \
-H 'Authorization: Bearer sk-1234' \
-H 'Content-Type: application/json' \
-d '{
"max_tokens": 100,
"messages": [
{
"role": "user",
"content": "Hello, how are you?"
}
],
"anthropic_version": "bedrock-2023-05-31"
}'
Streaming ​
For streaming responses, use /invoke-with-response-stream :
curl -X POST 'http://0.0.0.0:4000/bedrock/model/my-bedrock-model/invoke-with-response-stream' \
"content": "Tell me a short story"
Load Balancing ​
Define multiple deployments with the same model_name for automatic load balancing:
# Deployment 1 - us-west-2
aws_access_key_id : os.environ/AWS_ACCESS_KEY_ID
# Deployment 2 - us-east-1
aws_region_name : us - east - 1
The proxy automatically distributes requests across both regions.
Using boto3 SDK ​
import boto3
import json
import os
# Set dummy AWS credentials (required by boto3, but not used by LiteLLM proxy)
os . environ [ 'AWS_ACCESS_KEY_ID' ] = 'dummy'
os . environ [ 'AWS_SECRET_ACCESS_KEY' ] = 'dummy'
os . environ [ 'AWS_BEARER_TOKEN_BEDROCK' ] = "sk-1234" # your litellm proxy api key
# Point boto3 to the LiteLLM proxy
bedrock_runtime = boto3 . client (
service_name = 'bedrock-runtime' ,
region_name = 'us-west-2' ,
endpoint_url = 'http://0.0.0.0:4000/bedrock'
)
response = bedrock_runtime . invoke_model (
modelId = 'my-bedrock-model' , # Your model_name from config.yaml
contentType = 'application/json' ,
accept = 'application/json' ,
body = json . dumps ( {
"max_tokens" : 100 ,
"messages" : [ { "role" : "user" , "content" : "Hello" } ] ,
"anthropic_version" : "bedrock-2023-05-31"
} )
response_body = json . loads ( response [ 'body' ] . read ( ) )
print ( response_body [ 'content' ] [ 0 ] [ 'text' ] )
More Info ​
For complete documentation including Guardrails, Knowledge Bases, and Agents, see:
Full Bedrock Passthrough Docs
Quick Start
1. Setup config.yaml
2. Start Proxy
3. Call /invoke endpoint
Streaming
Load Balancing
Using boto3 SDK
More Info
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
