# Ramp | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/observability/ramp_integration
- Final URL: https://docs.litellm.ai/docs/observability/ramp_integration
- Canonical URL: https://docs.litellm.ai/docs/observability/ramp_integration
- Fetched at: 2026-06-23T14:25:31Z
- Content type: text/html; charset=utf-8

## Description

Send AI usage and cost data to Ramp for automated spend tracking.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Send AI usage and cost data to Ramp for automated spend tracking.
Ramp is a finance automation platform that helps businesses manage expenses, corporate cards, and vendor payments. With the Ramp callback integration, your LiteLLM AI usage — including token counts, model costs, and request metadata — is automatically sent to Ramp for real-time spend visibility.
info
We want to learn how we can make the callbacks better! Meet the LiteLLM founders or
join our discord
Pre-Requisites ​
Log in to Ramp and search for "LiteLLM" using the search bar. Click the LiteLLM integration result.
Note: Only business owners and admins can access and configure integrations.
On the LiteLLM integration page, click the Connect button in the top right.
In the Connect LiteLLM drawer, click Generate API Key to create an API key.
Important: Copy the API key immediately — it won't be shown again. If you lose it, you can revoke the existing key and generate a new one from the integration settings.
pip install litellm
Quick Start ​
Set your RAMP_API_KEY and add "ramp" to your callbacks to start logging LLM usage to Ramp.
SDK
LiteLLM Proxy
litellm . callbacks = [ "ramp" ]
import litellm
import os
# Ramp API Key
os . environ [ "RAMP_API_KEY" ] = "your-ramp-api-key"
# LLM API Keys
os . environ [ 'OPENAI_API_KEY' ] = ""
# Set ramp as a callback
# OpenAI call
response = litellm . completion (
model = "gpt-3.5-turbo" ,
messages = [
{ "role" : "user" , "content" : "Hi - I'm testing Ramp integration" }
]
)
Setup config.yaml
model_list :
- model_name : gpt - 3.5 - turbo
litellm_params :
model : openai/gpt - 3.5 - turbo
api_key : os.environ/OPENAI_API_KEY
litellm_settings :
callbacks : [ "ramp" ]
environment_variables :
RAMP_API_KEY : os.environ/RAMP_API_KEY
Start LiteLLM Proxy
litellm --config /path/to/config.yaml
Test it!
curl -L -X POST 'http://0.0.0.0:4000/chat/completions' \
-H 'Content-Type: application/json' \
-H 'Authorization: Bearer sk-1234' \
-d '{
"model": "gpt-3.5-turbo",
"messages": [
{
"role": "user",
"content": "Hey, how are you?"
}
}'
What Data is Logged? ​
LiteLLM sends the Standard Logging Payload to Ramp on successful LLM API calls, which includes:
Request details : Model, messages, parameters
Response details : Completion text, token usage, latency
Metadata : User ID, custom metadata, timestamps
Cost tracking : Response cost based on token usage
Authentication ​
Set the RAMP_API_KEY environment variable with your Ramp API key.
Environment Variable Description RAMP_API_KEY Your Ramp API key (required)
Support & Talk to Founders ​
Schedule Demo 👋
Community Discord 💭
Our numbers 📞 +1 (770) 8783-106 / ‭+1 (412) 618-6238‬
Our emails ✉️ ishaan@berri.ai / krrish@berri.ai
Pre-Requisites
Quick Start
What Data is Logged?
Authentication
Support & Talk to Founders
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
