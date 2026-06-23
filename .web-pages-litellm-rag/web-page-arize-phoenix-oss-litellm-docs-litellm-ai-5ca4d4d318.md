# Arize Phoenix OSS | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/observability/phoenix_integration
- Final URL: https://docs.litellm.ai/docs/observability/phoenix_integration
- Canonical URL: https://docs.litellm.ai/docs/observability/phoenix_integration
- Fetched at: 2026-06-23T14:25:27Z
- Content type: text/html; charset=utf-8

## Description

Open source tracing and evaluation platform

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Open source tracing and evaluation platform
tip
This is community maintained. Please make an issue if you run into a bug:
https://github.com/BerriAI/litellm
Pre-Requisites ​
Make an account on Phoenix OSS
OR self-host your own instance of Phoenix
Quick Start ​
Use just 2 lines of code, to instantly log your responses across all providers with Phoenix
You can also use the instrumentor option instead of the callback, which you can find here .
uv add opentelemetry-api opentelemetry-sdk opentelemetry-exporter-otlp litellm[proxy]
litellm . callbacks = [ "arize_phoenix" ]
import litellm
import os
# Set env variables
os . environ [ "PHOENIX_API_KEY" ] = "d0*****" # Set the Phoenix API key here. It is necessary only when using Phoenix Cloud.
os . environ [ "PHOENIX_COLLECTOR_HTTP_ENDPOINT" ] = "https://app.phoenix.arize.com/s/<space-name>/v1/traces" # Set the URL of your Phoenix OSS instance, otherwise tracer would use https://app.phoenix.arize.com/v1/traces for Phoenix Cloud.
os . environ [ "PHOENIX_PROJECT_NAME" ] = "litellm" # Configure the project name, otherwise traces would go to "default" project.
os . environ [ 'OPENAI_API_KEY' ] = "fake-key" # Set the OpenAI API key here.
# Set arize_phoenix as a callback & LiteLLM will send the data to Phoenix.
# OpenAI call
response = litellm . completion (
model = "gpt-3.5-turbo" ,
messages = [
{ "role" : "user" , "content" : "Hi 👋 - i'm openai" }
]
)
Using with LiteLLM Proxy ​
Setup config.yaml
model_list :
- model_name : gpt - 4o
litellm_params :
model : openai/fake
api_key : fake - key
api_base : https : //exampleopenaiendpoint - production.up.railway.app/
litellm_settings :
callbacks : [ "arize_phoenix" ]
general_settings :
master_key : "sk-1234"
environment_variables :
PHOENIX_API_KEY : "d0*****"
PHOENIX_COLLECTOR_ENDPOINT : "https://app.phoenix.arize.com/s/<space-name>/v1/traces" # OPTIONAL - For setting the gRPC endpoint
PHOENIX_COLLECTOR_HTTP_ENDPOINT : "https://app.phoenix.arize.com/s/<space-name>/v1/traces" # OPTIONAL - For setting the HTTP endpoint
Note: If you set the gRPC endpoint, install grpcio via uv add "litellm[grpc]" (or grpcio ).
Start the proxy
litellm --config config.yaml
Test it!
curl -X POST 'http://0.0.0.0:4000/chat/completions' \
-H 'Content-Type: application/json' \
-H 'Authorization: Bearer sk-1234' \
-d '{ "model": "gpt-4o", "messages": [{"role": "user", "content": "Hi 👋 - i'm openai"}]}'
Supported Phoenix Endpoints ​
Phoenix now supports multiple deployment types. The correct endpoint depends on which version of Phoenix Cloud you are using.
Phoenix Cloud (With Spaces - New Version)
Use this if your Phoenix URL contains /s/<space-name> path.
https://app.phoenix.arize.com/s/<space-name>/v1/traces
Phoenix Cloud (Legacy - Deprecated)
Use this only if your deployment still shows the /legacy pattern.
https://app.phoenix.arize.com/legacy/v1/traces
Phoenix Cloud (Without Spaces - Old Version)
Use this if your Phoenix Cloud URL does not contain /s/<space-name> or /legacy path.
https://app.phoenix.arize.com/v1/traces
Self-Hosted Phoenix (Local Instance)
Use this when running Phoenix on your machine or a private server.
http://localhost:6006/v1/traces
Depending on which Phoenix Cloud version or deployment you are using, you should set the corresponding endpoint in PHOENIX_COLLECTOR_HTTP_ENDPOINT or PHOENIX_COLLECTOR_ENDPOINT .
Support & Talk to Founders ​
Schedule Demo 👋
Community Discord 💭
Our emails ✉️ ishaan@berri.ai / krrish@berri.ai
Pre-Requisites
Quick Start
Using with LiteLLM Proxy
Supported Phoenix Endpoints
Support & Talk to Founders
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
