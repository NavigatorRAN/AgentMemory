# GradientAI | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/gradient_ai
- Final URL: https://docs.litellm.ai/docs/providers/gradient_ai
- Canonical URL: https://docs.litellm.ai/docs/providers/gradient_ai
- Fetched at: 2026-06-23T14:28:00Z
- Content type: text/html; charset=utf-8

## Description

https://digitalocean.com/products/gradientai

## Extracted Text

Skip to main content
On this page
Copy as Markdown
https://digitalocean.com/products/gradientai
LiteLLM provides native support for GradientAI models.
To use a GradientAI model, specify it as gradient_ai/<model-name> in your LiteLLM requests.
API Key & Endpoint ​
Set your credentials and endpoint as environment variables:
import os
os . environ [ 'GRADIENT_AI_API_KEY' ] = "your-api-key"
os . environ [ 'GRADIENT_AI_AGENT_ENDPOINT' ] = "https://api.gradient_ai.com/api/v1/chat" # default endpoint
Sample Usage ​
from litellm import completion
response = completion (
model = "gradient_ai/model-name" ,
messages = [
{ "role" : "user" , "content" : "Hello, how are you?" }
] ,
)
print ( response . choices [ 0 ] . message . content )
Streaming Example ​
{ "role" : "user" , "content" : "Write a story about a robot learning to love" }
stream = True ,
for chunk in response :
print ( chunk . choices [ 0 ] . delta . content or "" , end = "" )
Supported Parameters ​
Parameter Type Description temperature float Controls randomness (0.0-2.0) top_p float Nucleus sampling parameter (0.0-1.0) max_tokens int Maximum tokens to generate max_completion_tokens int Alternative to max_tokens stream bool Whether to stream the response k int Top results to return from knowledge bases retrieval_method string Retrieval strategy (rewrite/step_back/sub_queries/none) frequency_penalty float Penalizes repeated tokens (-2.0 to 2.0) presence_penalty float Penalizes tokens based on presence (-2.0 to 2.0) stop string/list Sequences to stop generation kb_filters List[Dict] Filters for knowledge base retrieval instruction_override string Override agent's default instruction include_retrieval_info bool Include document retrieval metadata include_guardrails_info bool Include guardrail trigger metadata provide_citations bool Include citations in response
For more details, see DigitalOcean GradientAI documentation .
API Key & Endpoint
Sample Usage
Streaming Example
Supported Parameters
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
