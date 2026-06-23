# Bedrock Agents | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/bedrock_agents
- Final URL: https://docs.litellm.ai/docs/providers/bedrock_agents
- Canonical URL: https://docs.litellm.ai/docs/providers/bedrock_agents
- Fetched at: 2026-06-23T14:27:12Z
- Content type: text/html; charset=utf-8

## Description

Call Bedrock Agents in the OpenAI Request/Response format.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Call Bedrock Agents in the OpenAI Request/Response format.
Property Details Description Amazon Bedrock Agents use the reasoning of foundation models (FMs), APIs, and data to break down user requests, gather relevant information, and efficiently complete tasks. Provider Route on LiteLLM bedrock/agent/{AGENT_ID}/{ALIAS_ID} Provider Doc AWS Bedrock Agents ↗
Quick Start ​
Model Format to LiteLLM ​
To call a bedrock agent through LiteLLM, you need to use the following model format to call the agent.
Here the model=bedrock/agent/ tells LiteLLM to call the bedrock InvokeAgent API.
Model Format to LiteLLM
bedrock/agent/{AGENT_ID}/{ALIAS_ID}
Example:
bedrock/agent/L1RT58GYRW/MFPSBCXYTW
bedrock/agent/ABCD1234/LIVE
You can find these IDs in your AWS Bedrock console under Agents.
LiteLLM Python SDK ​
Basic Agent Completion
import litellm
# Make a completion request to your Bedrock Agent
response = litellm . completion (
model = "bedrock/agent/L1RT58GYRW/MFPSBCXYTW" , # agent/{AGENT_ID}/{ALIAS_ID}
messages = [
{
"role" : "user" ,
"content" : "Hi, I need help with analyzing our Q3 sales data and generating a summary report"
}
] ,
)
print ( response . choices [ 0 ] . message . content )
print ( f"Response cost: $ { response . _hidden_params [ 'response_cost' ] } " )
Streaming Agent Responses
# Stream responses from your Bedrock Agent
model = "bedrock/agent/L1RT58GYRW/MFPSBCXYTW" ,
"content" : "Can you help me plan a marketing campaign and provide step-by-step execution details?"
stream = True ,
for chunk in response :
if chunk . choices [ 0 ] . delta . content :
print ( chunk . choices [ 0 ] . delta . content , end = "" )
LiteLLM Proxy ​
1. Configure your model in config.yaml ​
config.yaml
LiteLLM Proxy Configuration
model_list :
- model_name : bedrock - agent - 1
litellm_params :
model : bedrock/agent/L1RT58GYRW/MFPSBCXYTW
aws_access_key_id : os.environ/AWS_ACCESS_KEY_ID
aws_secret_access_key : os.environ/AWS_SECRET_ACCESS_KEY
aws_region_name : us - west - 2
- model_name : bedrock - agent - 2
model : bedrock/agent/AGENT456/ALIAS789
aws_region_name : us - east - 1
2. Start the LiteLLM Proxy ​
Start LiteLLM Proxy
litellm --config config.yaml
3. Make requests to your Bedrock Agents ​
Curl
OpenAI Python SDK
Basic Agent Request
curl http://localhost:4000/v1/chat/completions \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $LITELLM_API_KEY" \
-d '{
"model": "bedrock-agent-1",
"messages": [
"role": "user",
"content": "Analyze our customer data and suggest retention strategies"
]
}'
Streaming Agent Request
"model": "bedrock-agent-2",
"content": "Create a comprehensive social media strategy for our new product"
],
"stream": true
Using OpenAI SDK with LiteLLM Proxy
from openai import OpenAI
# Initialize client with your LiteLLM proxy URL
client = OpenAI (
base_url = "http://localhost:4000" ,
api_key = "your-litellm-api-key"
# Make a completion request to your agent
response = client . chat . completions . create (
model = "bedrock-agent-1" ,
"content" : "Help me prepare for the quarterly business review meeting"
Streaming with OpenAI SDK
# Stream agent responses
stream = client . chat . completions . create (
model = "bedrock-agent-2" ,
"content" : "Walk me through launching a new feature beta program"
stream = True
for chunk in stream :
if chunk . choices [ 0 ] . delta . content is not None :
Provider-specific Parameters ​
Any non-openai parameters will be passed to the agent as custom parameters.
SDK
Proxy
Using custom parameters
from litellm import completion
"content" : "Hi who is ishaan cto of litellm, tell me 10 things about him" ,
invocationId = "my-test-invocation-id" , # PROVIDER-SPECIFIC VALUE
invocationId : my - test - invocation - id
Further Reading ​
AWS Bedrock Agents Documentation
LiteLLM Authentication to Bedrock
Quick Start
LiteLLM Python SDK
LiteLLM Proxy
Provider-specific Parameters
Further Reading
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
