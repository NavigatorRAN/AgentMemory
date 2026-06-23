# /converse | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/bedrock_converse
- Final URL: https://docs.litellm.ai/docs/bedrock_converse
- Canonical URL: https://docs.litellm.ai/docs/bedrock_converse
- Fetched at: 2026-06-23T14:22:53Z
- Content type: text/html; charset=utf-8

## Description

Call Bedrock's /converse endpoint through LiteLLM Proxy.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Call Bedrock's /converse endpoint through LiteLLM Proxy.
Feature Supported Cost Tracking ✅ Logging ✅ Streaming ✅ via /converse-stream Load Balancing ✅
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
3. Call /converse endpoint ​
curl -X POST 'http://0.0.0.0:4000/bedrock/model/my-bedrock-model/converse' \
-H 'Authorization: Bearer sk-1234' \
-H 'Content-Type: application/json' \
-d '{
"messages": [
{
"role": "user",
"content": [{"text": "Hello, how are you?"}]
}
],
"inferenceConfig": {
"temperature": 0.5,
"maxTokens": 100
}'
Streaming ​
For streaming responses, use /converse-stream :
curl -X POST 'http://0.0.0.0:4000/bedrock/model/my-bedrock-model/converse-stream' \
"content": [{"text": "Tell me a short story"}]
"temperature": 0.7,
"maxTokens": 200
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
response = bedrock_runtime . converse (
modelId = 'my-bedrock-model' , # Your model_name from config.yaml
messages = [
"role" : "user" ,
"content" : [ { "text" : "Hello, how are you?" } ]
] ,
inferenceConfig = {
"temperature" : 0.5 ,
"maxTokens" : 100
print ( response [ 'output' ] [ 'message' ] [ 'content' ] [ 0 ] [ 'text' ] )
More Info ​
For complete documentation including Guardrails, Knowledge Bases, and Agents, see:
Full Bedrock Passthrough Docs
Quick Start
1. Setup config.yaml
2. Start Proxy
3. Call /converse endpoint
Streaming
Load Balancing
Using boto3 SDK
More Info
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
