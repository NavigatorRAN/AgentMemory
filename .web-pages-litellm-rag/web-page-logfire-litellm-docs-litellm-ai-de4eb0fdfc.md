# Logfire | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/observability/logfire_integration
- Final URL: https://docs.litellm.ai/docs/observability/logfire_integration
- Canonical URL: https://docs.litellm.ai/docs/observability/logfire_integration
- Fetched at: 2026-06-23T14:25:18Z
- Content type: text/html; charset=utf-8

## Description

Logfire is open Source Observability & Analytics for LLM Apps

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Logfire is open Source Observability & Analytics for LLM Apps
Detailed production traces and a granular view on quality, cost and latency
info
We want to learn how we can make the callbacks better! Meet the LiteLLM founders or
join our discord
Pre-Requisites ​
Ensure you have installed the following packages to use this integration
uv add litellm
uv add opentelemetry-api==1.25.0
uv add opentelemetry-sdk==1.25.0
uv add opentelemetry-exporter-otlp==1.25.0
Quick Start ​
Get your Logfire token from Logfire
litellm . callbacks = [ "logfire" ]
# uv add logfire
import litellm
import os
# from https://logfire.pydantic.dev/
os . environ [ "LOGFIRE_TOKEN" ] = ""
# Optionally customize the base url
os . environ [ "LOGFIRE_BASE_URL" ] = ""
# LLM API Keys
os . environ [ 'OPENAI_API_KEY' ] = ""
# set logfire as a callback, litellm will send the data to logfire
litellm . success_callback = [ "logfire" ]
# openai call
response = litellm . completion (
model = "gpt-3.5-turbo" ,
messages = [
{ "role" : "user" , "content" : "Hi 👋 - i'm openai" }
]
)
Support & Talk to Founders ​
Schedule Demo 👋
Community Discord 💭
Our emails ✉️ ishaan@berri.ai / krrish@berri.ai
Pre-Requisites
Quick Start
Support & Talk to Founders
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
