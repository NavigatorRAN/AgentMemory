# Google GenAI SDK with LiteLLM | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/tutorials/google_genai_sdk
- Final URL: https://docs.litellm.ai/docs/tutorials/google_genai_sdk
- Canonical URL: https://docs.litellm.ai/docs/tutorials/google_genai_sdk
- Fetched at: 2026-06-23T14:34:13Z
- Content type: text/html; charset=utf-8

## Description

Use Google's official GenAI SDK (JavaScript/TypeScript and Python) with any LLM provider through LiteLLM Proxy.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Use Google's official GenAI SDK (JavaScript/TypeScript and Python) with any LLM provider through LiteLLM Proxy.
The Google GenAI SDK ( @google/genai for JS, google-genai for Python) provides a native interface for calling Gemini models. By pointing it to LiteLLM, you can use the same SDK with OpenAI, Anthropic, Bedrock, Azure, Vertex AI, or any other provider — while keeping the native Gemini request/response format.
Why Use LiteLLM with Google GenAI SDK? ​
Developer Benefits:
Universal Model Access : Use any LiteLLM-supported model (Anthropic, OpenAI, Vertex AI, Bedrock, etc.) through the Google GenAI SDK interface
Higher Rate Limits & Reliability : Load balance across multiple models and providers to avoid hitting individual provider limits, with fallbacks to ensure you get responses even if one provider fails
Proxy Admin Benefits:
Centralized Management : Control access to all models through a single LiteLLM proxy instance without giving developers API keys to each provider
Budget Controls : Set spending limits and track costs across all SDK usage
Logging & Observability : Track all requests with cost tracking, logging, and analytics
Feature Supported Notes Cost Tracking ✅ All models on /generateContent endpoint Logging ✅ Works across all integrations Streaming ✅ streamGenerateContent supported Virtual Keys ✅ Use LiteLLM keys instead of Google keys Load Balancing ✅ Via native router endpoints Fallbacks ✅ Via native router endpoints
Quick Start ​
1. Install the SDK ​
JavaScript/TypeScript
Python
npm install @google/genai
uv add google-genai
2. Start LiteLLM Proxy ​
config.yaml
model_list :
- model_name : gemini - 2.5 - flash
litellm_params :
model : gemini/gemini - 2.5 - flash
api_key : os.environ/GEMINI_API_KEY
litellm --config config.yaml
3. Call the SDK through LiteLLM ​
curl
index.js
const { GoogleGenAI } = require ( "@google/genai" ) ;
const ai = new GoogleGenAI ( {
apiKey : "sk-1234" , // LiteLLM virtual key (not a Google key)
httpOptions : {
baseUrl : "http://localhost:4000/gemini" , // LiteLLM proxy URL
} ,
} ) ;
async function main ( ) {
const response = await ai . models . generateContent ( {
model : "gemini-2.5-flash" ,
contents : "Explain how AI works" ,
console . log ( response . text ) ;
}
main ( ) ;
main.py
from google import genai
client = genai . Client (
api_key = "sk-1234" , # LiteLLM virtual key (not a Google key)
http_options = { "base_url" : "http://localhost:4000/gemini" } , # LiteLLM proxy URL
)
response = client . models . generate_content (
model = "gemini-2.5-flash" ,
contents = "Explain how AI works" ,
print ( response . text )
curl "http://localhost:4000/gemini/v1beta/models/gemini-2.5-flash:generateContent?key=sk-1234" \
-H 'Content-Type: application/json' \
-X POST \
-d '{
"contents": [{
"parts": [{"text": "Explain how AI works"}]
}]
}'
Streaming ​
streaming.js
apiKey : "sk-1234" ,
baseUrl : "http://localhost:4000/gemini" ,
const response = await ai . models . generateContentStream ( {
contents : "Write a short poem about the ocean" ,
for await ( const chunk of response ) {
process . stdout . write ( chunk . text ) ;
streaming.py
api_key = "sk-1234" ,
http_options = { "base_url" : "http://localhost:4000/gemini" } ,
response = client . models . generate_content_stream (
contents = "Write a short poem about the ocean" ,
for chunk in response :
print ( chunk . text , end = "" )
Multi-turn Chat ​
chat.js
const chat = ai . chats . create ( {
const response1 = await chat . sendMessage ( { message : "I have 2 dogs and 3 cats." } ) ;
console . log ( response1 . text ) ;
const response2 = await chat . sendMessage ( { message : "How many pets is that in total?" } ) ;
console . log ( response2 . text ) ;
chat.py
chat = client . chats . create ( model = "gemini-2.5-flash" )
response1 = chat . send_message ( "I have 2 dogs and 3 cats." )
print ( response1 . text )
response2 = chat . send_message ( "How many pets is that in total?" )
print ( response2 . text )
Advanced: Use Any Model with the GenAI SDK ​
By default, the GenAI SDK talks to Gemini models. But with LiteLLM's router, you can route GenAI SDK requests to any provider — Anthropic, OpenAI, Bedrock, etc.
This works by using model_group_alias to map Gemini model names to your desired provider models. LiteLLM handles the format translation internally.
info
For this to work, point the SDK baseUrl to http://localhost:4000 (without /gemini ). This routes requests through LiteLLM's native Google endpoints, which go through the router and support model aliasing.
Anthropic
OpenAI
Bedrock
Multi-Provider Load Balancing
Route gemini-2.5-flash requests to Claude Sonnet:
- model_name : claude - sonnet
model : anthropic/claude - sonnet - 4 - 20250514
api_key : os.environ/ANTHROPIC_API_KEY
router_settings :
model_group_alias : { "gemini-2.5-flash" : "claude-sonnet" }
Route gemini-2.5-flash requests to GPT-4o:
- model_name : gpt - 4o - model
model : gpt - 4o
api_key : os.environ/OPENAI_API_KEY
model_group_alias : { "gemini-2.5-flash" : "gpt-4o-model" }
Route gemini-2.5-flash requests to Claude on Bedrock:
- model_name : bedrock - claude
model : bedrock/anthropic.claude - haiku - 4 - 5 - 20251001 : 0
aws_access_key_id : os.environ/AWS_ACCESS_KEY_ID
aws_secret_access_key : os.environ/AWS_SECRET_ACCESS_KEY
aws_region_name : us - east - 1
model_group_alias : { "gemini-2.5-flash" : "bedrock-claude" }
Load balance across Anthropic and OpenAI:
- model_name : my - model
model_group_alias : { "gemini-2.5-flash" : "my-model" }
Then use the SDK with baseUrl pointing to LiteLLM (without /gemini ):
any_model.js
baseUrl : "http://localhost:4000" , // No /gemini — goes through the router
// This calls Claude/GPT-4o/Bedrock under the hood via model_group_alias
contents : "Hello from any model!" ,
any_model.py
http_options = { "base_url" : "http://localhost:4000" } , # No /gemini
# This calls Claude/GPT-4o/Bedrock under the hood via model_group_alias
contents = "Hello from any model!" ,
Pass-through vs Native Router Endpoints ​
LiteLLM offers two ways to handle GenAI SDK requests:
Pass-through ( /gemini ) Native Router ( / ) baseUrl http://localhost:4000/gemini http://localhost:4000 Models Gemini only Any provider via model_group_alias Translation None — proxies directly to Google Translates internally Cost Tracking ✅ ✅ Virtual Keys ✅ ✅ Load Balancing ❌ ✅ Fallbacks ❌ ✅ Best for Simple Gemini proxy Multi-provider routing
Environment Variable Configuration ​
You can also configure the SDK via environment variables instead of code:
# For JavaScript SDK (@google/genai)
export GOOGLE_GEMINI_BASE_URL="http://localhost:4000/gemini"
export GEMINI_API_KEY="sk-1234"
# For Python SDK (google-genai)
# Note: The Python SDK does not support a base URL env var.
# Configure it in code with http_options={"base_url": "..."} instead.
This is especially useful for tools built on top of the GenAI SDK (like Gemini CLI ).
Related Resources ​
Gemini CLI with LiteLLM
Google AI Studio Pass-Through
Google ADK with LiteLLM
LiteLLM Proxy Quick Start
@google/genai npm package
google-genai PyPI package
Why Use LiteLLM with Google GenAI SDK?
Quick Start
1. Install the SDK
2. Start LiteLLM Proxy
3. Call the SDK through LiteLLM
Streaming
Multi-turn Chat
Advanced: Use Any Model with the GenAI SDK
Pass-through vs Native Router Endpoints
Environment Variable Configuration
Related Resources
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
