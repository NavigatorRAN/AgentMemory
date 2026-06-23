# Amazon Bedrock Mantle | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/bedrock_mantle
- Final URL: https://docs.litellm.ai/docs/providers/bedrock_mantle
- Canonical URL: https://docs.litellm.ai/docs/providers/bedrock_mantle
- Fetched at: 2026-06-23T14:27:16Z
- Content type: text/html; charset=utf-8

## Description

Amazon Bedrock Mantle is Amazon Bedrock's distributed inference engine (Project Mantle) that exposes an OpenAI-compatible API for Bedrock-hosted models.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Amazon Bedrock Mantle is Amazon Bedrock's distributed inference engine (Project Mantle) that exposes an OpenAI-compatible API for Bedrock-hosted models.
Use this provider to call Bedrock Mantle models with accurate AWS Bedrock pricing instead of OpenAI pricing.
tip
We support ALL Bedrock Mantle models, just set model=bedrock_mantle/<model-id> as a prefix when sending litellm requests
Claude Mythos ​
Claude Mythos ( anthropic.claude-mythos-preview ) is available on Bedrock Mantle with 1M token input context , 128K output, and support for reasoning, vision, and tool use.
Use the bedrock_mantle/ route prefix with standard AWS credentials.
/messages ​
SDK
AI Gateway
import asyncio
import litellm
import os
os . environ [ 'AWS_ACCESS_KEY_ID' ] = "your-aws-access-key"
os . environ [ 'AWS_SECRET_ACCESS_KEY' ] = "your-aws-secret-key"
os . environ [ 'AWS_REGION_NAME' ] = "us-east-1"
async def main ( ) :
response = await litellm . anthropic_messages (
model = "bedrock_mantle/anthropic.claude-mythos-preview" ,
max_tokens = 1024 ,
messages = [ { "role" : "user" , "content" : "Explain quantum entanglement simply." } ] ,
)
print ( response )
asyncio . run ( main ( ) )
1. Add to config.yaml
model_list :
- model_name : claude - mythos
litellm_params :
model : bedrock_mantle/anthropic.claude - mythos - preview
aws_region_name : us - east - 1
2. Start LiteLLM AI Gateway
litellm --config /path/to/config.yaml
3. Call /v1/messages via curl
curl -X POST http://0.0.0.0:4000/v1/messages \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $LITELLM_API_KEY" \
-d '{
"model": "claude-mythos",
"max_tokens": 1024,
"messages": [
{"role": "user", "content": "Explain quantum entanglement simply."}
]
}'
/chat/completions ​
from litellm import completion
response = completion (
3. Call /v1/chat/completions via curl
curl -X POST http://0.0.0.0:4000/v1/chat/completions \
OpenAI Models (GPT-5.4 / GPT-5.5) ​
/responses ​
os . environ [ 'BEDROCK_MANTLE_API_KEY' ] = "your-bedrock-api-key"
os . environ [ 'BEDROCK_MANTLE_REGION' ] = "us-east-2"
response = litellm . responses (
model = "bedrock_mantle/openai.gpt-5.5" ,
input = "Hello! How can you help me today?" ,
Streaming ​
input = "Tell me a three sentence bedtime story about a unicorn." ,
stream = True ,
for event in response :
print ( event )
- model_name : gpt - 5.5 - mantle
model : bedrock_mantle/openai.gpt - 5.5
api_key : os.environ/BEDROCK_MANTLE_API_KEY
api_base : https : //bedrock - mantle.us - east - 2.api.aws/v1
3. Call /v1/responses via curl
curl -X POST http://0.0.0.0:4000/v1/responses \
"model": "gpt-5.5-mantle",
"input": "Hello! How can you help me today?"
4. Or use the OpenAI SDK
from openai import OpenAI
client = OpenAI (
api_key = "sk-1234" ,
base_url = "http://0.0.0.0:4000" ,
response = client . responses . create (
model = "gpt-5.5-mantle" ,
API Key ​
# env variable
os . environ [ 'BEDROCK_MANTLE_API_KEY' ] = "your-aws-bedrock-api-key"
# optional: override region (defaults to us-east-1)
os . environ [ 'BEDROCK_MANTLE_REGION' ] = "us-east-1" # or use AWS_REGION
Supported Models ​
Model Endpoint Context Window Input (per 1M tokens) Output (per 1M tokens) openai.gpt-5.5 /responses 272K $5.50 $33.00 openai.gpt-5.4 /responses 272K $2.75 $16.50 openai.gpt-oss-120b /chat/completions 131K $0.15 $0.60 openai.gpt-oss-20b /chat/completions 131K $0.075 $0.30 openai.gpt-oss-safeguard-120b /chat/completions 131K $0.15 $0.60 openai.gpt-oss-safeguard-20b /chat/completions 131K $0.075 $0.30
Sample Usage ​
Streaming
Async
model = "bedrock_mantle/openai.gpt-oss-120b" ,
messages = [ { "role" : "user" , "content" : "hello from litellm" } ] ,
for chunk in response :
print ( chunk )
from litellm import acompletion
response = await acompletion (
Region Configuration ​
The API base URL is https://bedrock-mantle.{region}.api.aws/v1 . Region is resolved in this order:
BEDROCK_MANTLE_REGION env var
AWS_REGION env var
Default: us-east-1
Supported regions: us-east-1 , us-east-2 , us-west-2 , eu-west-1 , eu-west-2 , eu-central-1 , eu-south-1 , eu-north-1 , ap-northeast-1 , ap-south-1 , ap-southeast-3 , sa-east-1
os . environ [ 'BEDROCK_MANTLE_REGION' ] = "eu-west-1"
# or pass api_base directly
messages = [ { "role" : "user" , "content" : "hello" } ] ,
api_base = "https://bedrock-mantle.eu-west-1.api.aws/v1" ,
Usage with LiteLLM Proxy ​
1. Set Bedrock Mantle models on config.yaml ​
api_base : "https://bedrock-mantle.us-east-2.api.aws/v1"
- model_name : gpt - oss - 120b
model : bedrock_mantle/openai.gpt - oss - 120b
# optional region override:
api_base : "https://bedrock-mantle.us-east-1.api.aws/v1"
- model_name : gpt - oss - 20b
model : bedrock_mantle/openai.gpt - oss - 20b
2. Start the proxy ​
3. Send a request ​
import openai
client = openai . OpenAI (
api_key = "anything" ,
response = client . chat . completions . create (
model = "gpt-oss-120b" ,
Claude Mythos
/messages
/chat/completions
OpenAI Models (GPT-5.4 / GPT-5.5)
/responses
API Key
Supported Models
Sample Usage
Region Configuration
Usage with LiteLLM Proxy
1. Set Bedrock Mantle models on config.yaml
2. Start the proxy
3. Send a request
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
