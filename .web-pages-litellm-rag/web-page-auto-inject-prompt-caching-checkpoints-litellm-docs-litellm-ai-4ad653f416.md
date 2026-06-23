# Auto-Inject Prompt Caching Checkpoints | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/tutorials/prompt_caching
- Final URL: https://docs.litellm.ai/docs/tutorials/prompt_caching
- Canonical URL: https://docs.litellm.ai/docs/tutorials/prompt_caching
- Fetched at: 2026-06-23T14:34:37Z
- Content type: text/html; charset=utf-8

## Description

Reduce costs by up to 90% by using LiteLLM to auto-inject prompt caching checkpoints.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Reduce costs by up to 90% by using LiteLLM to auto-inject prompt caching checkpoints.
Supported Providers ( cache_control marker):
Anthropic API ( anthropic/ )
AWS Bedrock - Claude ( bedrock/ )
Vertex AI - Claude and Gemini ( vertex_ai/ )
Google AI Studio - Gemini ( gemini/ )
Azure AI - Claude ( azure_ai/ )
OpenRouter - Claude, Gemini, MiniMax, GLM, z-ai routes ( openrouter/ )
Databricks - Claude ( databricks/ )
DashScope / Qwen ( dashscope/ )
MiniMax ( minimax/ )
Z.ai / GLM ( zai/ )
Provider Managed (automatic, no marker needed):
OpenAI ( openai/ )
DeepSeek ( deepseek/ )
xAI ( xai/ )
How it works ​
LiteLLM can automatically inject prompt caching checkpoints into your requests to LLM providers. This allows:
Cost Reduction : Long, static parts of your prompts can be cached to avoid repeated processing
No need to modify your application code : You can configure the auto-caching behavior in the LiteLLM UI or in the litellm config.yaml file.
Configuration ​
You need to specify cache_control_injection_points in your model configuration. This tells LiteLLM:
Where to add the caching directive ( location )
Which message to target ( role )
LiteLLM will then automatically add a cache_control directive to the specified messages in your requests:
cache_control_directive.json
"cache_control" : {
"type" : "ephemeral"
}
LiteLLM Python SDK Usage ​
Use the cache_control_injection_points parameter in your completion calls to automatically inject caching directives.
Basic Example - Cache System Messages ​
cache_system_messages.py
from litellm import completion
import os
os . environ [ "ANTHROPIC_API_KEY" ] = ""
response = completion (
model = "anthropic/claude-3-5-sonnet-20240620" ,
messages = [
{
"role" : "system" ,
"content" : [
"type" : "text" ,
"text" : "You are an AI assistant tasked with analyzing legal documents." ,
} ,
"text" : "Here is the full text of a complex legal agreement" * 400 ,
] ,
"role" : "user" ,
"content" : "what are the key terms and conditions in this agreement?" ,
# Auto-inject cache control to system messages
cache_control_injection_points = [
"location" : "message" ,
)
print ( response . usage )
Key Points:
Use cache_control_injection_points parameter to specify where to inject caching
location: "message" targets messages in the conversation
role: "system" targets all system messages
LiteLLM automatically adds cache_control to the last content block of matching messages (per Anthropic's API specification)
LiteLLM's Modified Request:
LiteLLM automatically transforms your request by adding cache_control to the last content block of the system message:
modified_request_system.json
"messages" : [
"text" : "You are an AI assistant tasked with analyzing legal documents."
"text" : "Here is the full text of a complex legal agreement..." ,
"cache_control" : { "type" : "ephemeral" } // Added by LiteLLM
]
"content" : "what are the key terms and conditions in this agreement?"
Target Specific Messages by Index ​
You can target specific messages by their index in the messages array. Use negative indices to target from the end.
cache_by_index.py
"content" : "First message" ,
"role" : "assistant" ,
"content" : "Response to first" ,
{ "type" : "text" , "text" : "Here is a long document to analyze:" } ,
{ "type" : "text" , "text" : "Document content..." * 500 } ,
# Target the last message (index -1)
"index" : - 1 , # -1 targets the last message, -2 would target second-to-last, etc.
Important Notes:
When a message has multiple content blocks (like images or multiple text blocks), cache_control is only added to the last content block
This follows Anthropic's API specification which requires: "When using multiple content blocks, only the last content block can have cache_control"
Anthropic has a maximum of 4 blocks with cache_control per request
LiteLLM adds cache_control to the last content block of the targeted message (index -1 = last message):
modified_request_index.json
"content" : "First message"
"content" : "Response to first"
"text" : "Here is a long document to analyze:"
"text" : "Document content..." ,
"cache_control" : { "type" : "ephemeral" } // Added by LiteLLM to last content block only
LiteLLM Proxy Usage ​
You can configure cache control injection in the proxy configuration file.
litellm config.yaml
LiteLLM UI
model_list :
- model_name : anthropic - auto - inject - cache - system - message
litellm_params :
model : anthropic/claude - 3 - 5 - sonnet - 20240620
api_key : os.environ/ANTHROPIC_API_KEY
cache_control_injection_points :
- location : message
role : system
On the LiteLLM UI, you can specify the cache_control_injection_points in the Advanced Settings tab when adding a model.
Detailed Example ​
1. Original Request to LiteLLM ​
In this example, we have a very long, static system message and a varying user message. It's efficient to cache the system message since it rarely changes.
original_request.json
"text" : "You are a helpful assistant. This is a set of very long instructions that you will follow. Here is a legal document that you will use to answer the user's question."
"text" : "What is the main topic of this legal document?"
2. LiteLLM's Modified Request ​
LiteLLM auto-injects the caching directive into the system message based on our configuration:
modified_request.json
"text" : "You are a helpful assistant. This is a set of very long instructions that you will follow. Here is a legal document that you will use to answer the user's question." ,
"cache_control" : { "type" : "ephemeral" }
When the model provider processes this request, it will recognize the caching directive and only process the system message once, caching it for subsequent requests.
Related Documentation ​
Manual Prompt Caching - Learn how to manually add cache_control directives to your messages
How it works
Configuration
LiteLLM Python SDK Usage
LiteLLM Proxy Usage
Detailed Example
1. Original Request to LiteLLM
2. LiteLLM's Modified Request
Related Documentation
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
