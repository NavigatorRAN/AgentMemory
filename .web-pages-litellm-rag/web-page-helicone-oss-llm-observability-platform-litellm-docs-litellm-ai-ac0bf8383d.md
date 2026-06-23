# Helicone - OSS LLM Observability Platform | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/observability/helicone_integration
- Final URL: https://docs.litellm.ai/docs/observability/helicone_integration
- Canonical URL: https://docs.litellm.ai/docs/observability/helicone_integration
- Fetched at: 2026-06-23T14:25:09Z
- Content type: text/html; charset=utf-8

## Description

This is community maintained. Please make an issue if you run into a bug:

## Extracted Text

Skip to main content
On this page
Copy as Markdown
tip
This is community maintained. Please make an issue if you run into a bug:
https://github.com/BerriAI/litellm
Helicone is an open sourced observability platform providing key insights into your usage, spend, latency and more.
Quick Start ​
Python SDK
LiteLLM Proxy
Use just 1 line of code to instantly log your responses across all providers with Helicone:
import os
from litellm import completion
## Set env variables
os . environ [ "HELICONE_API_KEY" ] = "your-helicone-key"
# OpenAI call
response = completion (
model = "helicone/gpt-4o-mini" ,
messages = [ { "role" : "user" , "content" : "Hi 👋 - I'm OpenAI" } ] ,
)
print ( response )
Add Helicone to your LiteLLM proxy configuration:
config.yaml
model_list :
- model_name : gpt - 4
litellm_params :
model : gpt - 4
api_key : os.environ/OPENAI_API_KEY
# Add Helicone callback
litellm_settings :
success_callback : [ "helicone" ]
# Set Helicone API key
environment_variables :
HELICONE_API_KEY : "your-helicone-key"
Start the proxy:
litellm --config config.yaml
Integration Methods ​
There are two main approaches to integrate Helicone with LiteLLM:
As a Provider : Use Helicone to log requests for all models supported
Callbacks : Log to Helicone while using any provider
Supported LLM Providers ​
Helicone can log requests across all major LLM providers , including:
OpenAI
Azure
Anthropic
Gemini
Groq
Cohere
Replicate
And more
Method 1: Using Helicone as a Provider ​
Helicone's AI Gateway provides advanced functionality like caching, rate limiting, LLM security, and more.
Set Helicone as your base URL and pass authentication headers:
import litellm
os . environ [ "HELICONE_API_KEY" ] = "" # your Helicone API key
messages = [ { "content" : "What is the capital of France?" , "role" : "user" } ]
# Helicone call - routes through Helicone gateway to any model
model = "helicone/gpt-4o-mini" , # or any 100+ models
messages = messages
Advanced Usage ​
You can add custom metadata and properties to your requests using Helicone headers. Here are some examples:
litellm . metadata = {
"Helicone-User-Id" : "user-abc" , # Specify the user making the request
"Helicone-Property-App" : "web" , # Custom property to add additional information
"Helicone-Property-Custom" : "any-value" , # Add any custom property
"Helicone-Prompt-Id" : "prompt-supreme-court" , # Assign an ID to associate this prompt with future versions
"Helicone-Cache-Enabled" : "true" , # Enable caching of responses
"Cache-Control" : "max-age=3600" , # Set cache limit to 1 hour
"Helicone-RateLimit-Policy" : "10;w=60;s=user" , # Set rate limit policy
"Helicone-Retry-Enabled" : "true" , # Enable retry mechanism
"helicone-retry-num" : "3" , # Set number of retries
"helicone-retry-factor" : "2" , # Set exponential backoff factor
"Helicone-Model-Override" : "gpt-3.5-turbo-0613" , # Override the model used for cost calculation
"Helicone-Session-Id" : "session-abc-123" , # Set session ID for tracking
"Helicone-Session-Path" : "parent-trace/child-trace" , # Set session path for hierarchical tracking
"Helicone-Omit-Response" : "false" , # Include response in logging (default behavior)
"Helicone-Omit-Request" : "false" , # Include request in logging (default behavior)
"Helicone-LLM-Security-Enabled" : "true" , # Enable LLM security features
"Helicone-Moderations-Enabled" : "true" , # Enable content moderation
}
Caching and Rate Limiting ​
Enable caching and set up rate limiting policies:
"Helicone-RateLimit-Policy" : "100;w=3600;s=user" , # Set rate limit policy
Method 2: Using Callbacks ​
Log requests to Helicone while using any LLM provider directly.
os . environ [ "OPENAI_API_KEY" ] = "your-openai-key"
# os.environ["HELICONE_API_BASE"] = "" # [OPTIONAL] defaults to `https://api.helicone.ai`
# Set callbacks
litellm . success_callback = [ "helicone" ]
model = "gpt-4o" ,
- model_name : claude - 3
model : anthropic/claude - 3 - sonnet - 20240229
api_key : os.environ/ANTHROPIC_API_KEY
# Add Helicone logging
# Environment variables
OPENAI_API_KEY : "your-openai-key"
ANTHROPIC_API_KEY : "your-anthropic-key"
Make requests to your proxy:
import openai
client = openai . OpenAI (
api_key = "anything" , # proxy doesn't require real API key
base_url = "http://localhost:4000"
response = client . chat . completions . create (
model = "gpt-4" , # This gets logged to Helicone
messages = [ { "role" : "user" , "content" : "Hello!" } ]
Session Tracking and Tracing ​
Track multi-step and agentic LLM interactions using session IDs and paths:
model = "helicone/gpt-4" ,
messages = messages ,
metadata = {
"Helicone-Session-Id" : "session-abc-123" ,
"Helicone-Session-Path" : "parent-trace/child-trace" ,
api_key = "anything" ,
# First request in session
response1 = client . chat . completions . create (
model = "gpt-4" ,
messages = [ { "role" : "user" , "content" : "Hello" } ] ,
extra_headers = {
"Helicone-Session-Path" : "conversation/greeting"
# Follow-up request in same session
response2 = client . chat . completions . create (
messages = [ { "role" : "user" , "content" : "Tell me more" } ] ,
"Helicone-Session-Path" : "conversation/follow-up"
Helicone-Session-Id : Unique identifier for the session to group related requests
Helicone-Session-Path : Hierarchical path to represent parent/child traces (e.g., "parent/child")
Retry and Fallback Mechanisms ​
litellm . api_base = "https://ai-gateway.helicone.ai/"
"Helicone-Retry-Enabled" : "true" ,
"helicone-retry-num" : "3" ,
"helicone-retry-factor" : "2" ,
response = litellm . completion (
model = "helicone/gpt-4o-mini/openai,claude-3-5-sonnet-20241022/anthropic" , # Try OpenAI first, then fallback to Anthropic, then continue with other models
messages = [ { "role" : "user" , "content" : "Hello" } ]
api_base : "https://oai.hconeai.com/v1"
default_litellm_params :
headers :
Helicone-Auth : "Bearer ${HELICONE_API_KEY}"
Helicone-Retry-Enabled : "true"
helicone-retry-num : "3"
helicone-retry-factor : "2"
Helicone-Fallbacks : '["gpt-3.5-turbo", "gpt-4"]'
Supported Headers - For a full list of supported Helicone headers and their descriptions, please refer to the Helicone documentation .
By utilizing these headers and metadata options, you can gain deeper insights into your LLM usage, optimize performance, and better manage your AI workflows with Helicone and LiteLLM.
Quick Start
Integration Methods
Supported LLM Providers
Method 1: Using Helicone as a Provider
Advanced Usage
Caching and Rate Limiting
Method 2: Using Callbacks
Session Tracking and Tracing
Retry and Fallback Mechanisms
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
