# Invoking A2A Agents | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/a2a_invoking_agents
- Final URL: https://docs.litellm.ai/docs/a2a_invoking_agents
- Canonical URL: https://docs.litellm.ai/docs/a2a_invoking_agents
- Fetched at: 2026-06-23T14:22:32Z
- Content type: text/html; charset=utf-8

## Description

Learn how to invoke A2A agents through LiteLLM using different methods.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Learn how to invoke A2A agents through LiteLLM using different methods.
Deploy Your Own A2A Agent
Want to test with your own agent? Deploy this template A2A agent powered by Google Gemini:
shin-bot-litellm/a2a-gemini-agent - Simple deployable A2A agent with streaming support
A2A SDK ​
Use the A2A Python SDK to invoke agents through LiteLLM using the A2A protocol.
Non-Streaming ​
This example shows how to:
List available agents - Query /v1/agents to see which agents your key can access
Select an agent - Pick an agent from the list
Invoke via A2A - Use the A2A protocol to send messages to the agent
invoke_a2a_agent.py
from uuid import uuid4
import httpx
import asyncio
from a2a . client import A2ACardResolver , A2AClient
from a2a . types import MessageSendParams , SendMessageRequest
# === CONFIGURE THESE ===
LITELLM_BASE_URL = "http://localhost:4000" # Your LiteLLM proxy URL
LITELLM_VIRTUAL_KEY = "sk-1234" # Your LiteLLM Virtual Key
# =======================
async def main ( ) :
headers = { "Authorization" : f"Bearer { LITELLM_VIRTUAL_KEY } " }
async with httpx . AsyncClient ( headers = headers ) as client :
# Step 1: List available agents
response = await client . get ( f" { LITELLM_BASE_URL } /v1/agents" )
agents = response . json ( )
print ( "Available agents:" )
for agent in agents :
print ( f" - { agent [ 'agent_name' ] } (ID: { agent [ 'agent_id' ] } )" )
if not agents :
print ( "No agents available for this key" )
return
# Step 2: Select an agent and invoke it
selected_agent = agents [ 0 ]
agent_id = selected_agent [ "agent_id" ]
agent_name = selected_agent [ "agent_name" ]
print ( f"\nInvoking: { agent_name } " )
# Step 3: Use A2A protocol to invoke the agent
base_url = f" { LITELLM_BASE_URL } /a2a/ { agent_id } "
resolver = A2ACardResolver ( httpx_client = client , base_url = base_url )
agent_card = await resolver . get_agent_card ( )
a2a_client = A2AClient ( httpx_client = client , agent_card = agent_card )
request = SendMessageRequest (
id = str ( uuid4 ( ) ) ,
params = MessageSendParams (
message = {
"role" : "user" ,
"parts" : [ { "kind" : "text" , "text" : "Hello, what can you do?" } ] ,
"messageId" : uuid4 ( ) . hex ,
}
) ,
)
response = await a2a_client . send_message ( request )
print ( f"Response: { response . model_dump ( mode = 'json' , exclude_none = True , indent = 4 ) } " )
if __name__ == "__main__" :
asyncio . run ( main ( ) )
Streaming ​
For streaming responses, use send_message_streaming :
invoke_a2a_agent_streaming.py
from a2a . types import MessageSendParams , SendStreamingMessageRequest
LITELLM_AGENT_NAME = "ij-local" # Agent name registered in LiteLLM
base_url = f" { LITELLM_BASE_URL } /a2a/ { LITELLM_AGENT_NAME } "
async with httpx . AsyncClient ( headers = headers ) as httpx_client :
# Resolve agent card and create client
resolver = A2ACardResolver ( httpx_client = httpx_client , base_url = base_url )
client = A2AClient ( httpx_client = httpx_client , agent_card = agent_card )
# Send a streaming message
request = SendStreamingMessageRequest (
"parts" : [ { "kind" : "text" , "text" : "Tell me a long story" } ] ,
# Stream the response
async for chunk in client . send_message_streaming ( request ) :
print ( chunk . model_dump ( mode = "json" , exclude_none = True ) )
/chat/completions API (OpenAI SDK) ​
You can also invoke A2A agents using the familiar OpenAI SDK by using the a2a/ model prefix.
Python
TypeScript
cURL
openai_non_streaming.py
import openai
client = openai . OpenAI (
api_key = "sk-1234" , # Your LiteLLM Virtual Key
base_url = "http://localhost:4000" # Your LiteLLM proxy URL
response = client . chat . completions . create (
model = "a2a/my-agent" , # Use a2a/ prefix with your agent name
messages = [
{ "role" : "user" , "content" : "Hello, what can you do?" }
]
print ( response . choices [ 0 ] . message . content )
openai_non_streaming.ts
import OpenAI from 'openai' ;
const client = new OpenAI ( {
apiKey : 'sk-1234' , // Your LiteLLM Virtual Key
baseURL : 'http://localhost:4000' // Your LiteLLM proxy URL
} ) ;
const response = await client . chat . completions . create ( {
model : 'a2a/my-agent' , // Use a2a/ prefix with your agent name
messages : [
{ role : 'user' , content : 'Hello, what can you do?' }
console . log ( response . choices [ 0 ] . message . content ) ;
curl_non_streaming.sh
curl -X POST http://localhost:4000/v1/chat/completions \
-H "Authorization: Bearer sk-1234" \
-H "Content-Type: application/json" \
-d '{
"model": "a2a/my-agent",
"messages": [
{"role": "user", "content": "Hello, what can you do?"}
}'
openai_streaming.py
stream = client . chat . completions . create (
{ "role" : "user" , "content" : "Tell me a long story" }
] ,
stream = True
for chunk in stream :
if chunk . choices [ 0 ] . delta . content :
print ( chunk . choices [ 0 ] . delta . content , end = "" , flush = True )
openai_streaming.ts
const stream = await client . chat . completions . create ( {
{ role : 'user' , content : 'Tell me a long story' }
stream : true
for await ( const chunk of stream ) {
const content = chunk . choices [ 0 ] ?. delta ?. content ;
if ( content ) {
process . stdout . write ( content ) ;
curl_streaming.sh
{"role": "user", "content": "Tell me a long story"}
],
"stream": true
Task APIs ( tasks/get , tasks/list , …) ​
Agents that return a submitted task from message/send expect clients to poll with tasks/get . Call the same LiteLLM base URL with JSON-RPC:
tasks_get.sh
curl -X POST "http://localhost:4000/a2a/${AGENT_ID}" \
"jsonrpc": "2.0",
"id": "req-2",
"method": "tasks/get",
"params": {"id": "TASK_ID_FROM_SEND_RESPONSE"}
LiteLLM forwards tasks/get , tasks/list , tasks/cancel , push-notification methods, and agent/getAuthenticatedExtendedCard to the upstream agent URL. See the full method list in Supported A2A methods .
Key Differences ​
Method Use Case Advantages A2A SDK Native A2A protocol integration • Full A2A protocol support
• Access to task states and artifacts
• Context management OpenAI SDK Familiar OpenAI-style interface • Drop-in replacement for OpenAI calls
• Easier migration from LLM to agent workflows
• Works with existing OpenAI tooling
Model Prefix
When using the OpenAI SDK, always prefix your agent name with a2a/ (e.g., a2a/my-agent ) to route requests to the A2A agent instead of an LLM provider.
A2A SDK
Non-Streaming
Streaming
/chat/completions API (OpenAI SDK)
Task APIs ( tasks/get , tasks/list , …)
Key Differences
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
