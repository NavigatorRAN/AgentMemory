# Qualifire - LLM Evaluation, Guardrails & Observability | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/observability/qualifire_integration
- Final URL: https://docs.litellm.ai/docs/observability/qualifire_integration
- Canonical URL: https://docs.litellm.ai/docs/observability/qualifire_integration
- Fetched at: 2026-06-23T14:25:30Z
- Content type: text/html; charset=utf-8

## Description

Qualifire provides real-time Agentic evaluations, guardrails and observability for production AI applications.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Qualifire provides real-time Agentic evaluations, guardrails and observability for production AI applications.
Key Features:
Evaluation - Systematically assess AI behavior to detect hallucinations, jailbreaks, policy breaches, and other vulnerabilities
Guardrails - Real-time interventions to prevent risks like brand damage, data leaks, and compliance breaches
Observability - Complete tracing and logging for RAG pipelines, chatbots, and AI agents
Prompt Management - Centralized prompt management with versioning and no-code studio
tip
Looking for Qualifire Guardrails? Check out the Qualifire Guardrails Integration for real-time content moderation, prompt injection detection, PII checks, and more.
Pre-Requisites ​
Create an account on Qualifire
Get your API key and webhook URL from the Qualifire dashboard
uv add litellm
Quick Start ​
Use just 2 lines of code to instantly log your responses across all providers with Qualifire.
litellm . callbacks = [ "qualifire_eval" ]
import litellm
import os
# Set Qualifire credentials
os . environ [ "QUALIFIRE_API_KEY" ] = "your-qualifire-api-key"
os . environ [ "QUALIFIRE_WEBHOOK_URL" ] = "https://your-qualifire-webhook-url"
# LLM API Keys
os . environ [ 'OPENAI_API_KEY' ] = "your-openai-api-key"
# Set qualifire_eval as a callback & LiteLLM will send the data to Qualifire
# OpenAI call
response = litellm . completion (
model = "gpt-5" ,
messages = [
{ "role" : "user" , "content" : "Hi 👋 - i'm openai" }
]
)
Using with LiteLLM Proxy ​
Setup config.yaml
model_list :
- model_name : gpt - 4o
litellm_params :
model : openai/gpt - 4o
api_key : os.environ/OPENAI_API_KEY
litellm_settings :
callbacks : [ "qualifire_eval" ]
general_settings :
master_key : "sk-1234"
environment_variables :
QUALIFIRE_API_KEY : "your-qualifire-api-key"
QUALIFIRE_WEBHOOK_URL : "https://app.qualifire.ai/api/v1/webhooks/evaluations"
Start the proxy
litellm --config config.yaml
Test it!
curl -X POST 'http://0.0.0.0:4000/chat/completions' \
-H 'Content-Type: application/json' \
-H 'Authorization: Bearer sk-1234' \
-d '{ "model": "gpt-4o", "messages": [{"role": "user", "content": "Hi 👋 - i'm openai"}]}'
Environment Variables ​
Variable Description QUALIFIRE_API_KEY Your Qualifire API key for authentication QUALIFIRE_WEBHOOK_URL The Qualifire webhook endpoint URL from your dashboard
What Gets Logged? ​
The LiteLLM Standard Logging Payload is sent to your Qualifire endpoint on each successful LLM API call.
This includes:
Request messages and parameters
Response content and metadata
Token usage statistics
Latency metrics
Model information
Cost data
Once data is in Qualifire, you can:
Run evaluations to detect hallucinations, toxicity, and policy violations
Set up guardrails to block or modify responses in real-time
View traces across your entire AI pipeline
Track performance and quality metrics over time
Pre-Requisites
Quick Start
Using with LiteLLM Proxy
Environment Variables
What Gets Logged?
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
