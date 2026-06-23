# Apertis AI (Stima API) | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/apertis
- Final URL: https://docs.litellm.ai/docs/providers/apertis
- Canonical URL: https://docs.litellm.ai/docs/providers/apertis
- Fetched at: 2026-06-23T14:26:50Z
- Content type: text/html; charset=utf-8

## Description

Overview

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Overview ​
Property Details Description Apertis AI (formerly Stima API) is a unified API platform providing access to 430+ AI models through a single interface, with cost savings of up to 50%. Provider Route on LiteLLM apertis/ Link to Provider Doc Apertis AI Website ↗ Base URL https://api.stima.tech/v1 Supported Operations /chat/completions
What is Apertis AI? ​
Apertis AI is a unified API platform that lets developers:
Access 430+ AI Models : All models through a single API
Save 50% on Costs : Competitive pricing with significant discounts
Unified Billing : Single bill for all model usage
Quick Setup : Start with just $2 registration
GitHub Integration : Link with your GitHub account
Required Variables ​
Environment Variables
os . environ [ "STIMA_API_KEY" ] = "" # your Apertis AI API key
Get your Apertis AI API key from api.stima.tech .
Usage - LiteLLM Python SDK ​
Non-streaming ​
Apertis AI Non-streaming Completion
import os
import litellm
from litellm import completion
messages = [ { "content" : "What is the capital of France?" , "role" : "user" } ]
# Apertis AI call
response = completion (
model = "apertis/model-name" , # Replace with actual model name
messages = messages
)
print ( response )
Streaming ​
Apertis AI Streaming Completion
messages = [ { "content" : "Write a short poem about AI" , "role" : "user" } ]
# Apertis AI call with streaming
messages = messages ,
stream = True
for chunk in response :
print ( chunk )
Usage - LiteLLM Proxy Server ​
1. Save key in your environment ​
export STIMA_API_KEY=""
2. Start the proxy ​
model_list :
- model_name : apertis - model
litellm_params :
model : apertis/model - name # Replace with actual model name
api_key : os.environ/STIMA_API_KEY
Supported OpenAI Parameters ​
Apertis AI supports all standard OpenAI-compatible parameters:
Parameter Type Description messages array Required . Array of message objects with 'role' and 'content' model string Required . Model ID from 430+ available models stream boolean Optional. Enable streaming responses temperature float Optional. Sampling temperature top_p float Optional. Nucleus sampling parameter max_tokens integer Optional. Maximum tokens to generate frequency_penalty float Optional. Penalize frequent tokens presence_penalty float Optional. Penalize tokens based on presence stop string/array Optional. Stop sequences tools array Optional. List of available tools/functions tool_choice string/object Optional. Control tool/function calling
Cost Benefits ​
Apertis AI offers significant cost advantages:
50% Cost Savings : Save money compared to direct provider costs
Unified Billing : Single invoice for all your AI model usage
Low Entry : Start with just $2 registration
Model Availability ​
With access to 430+ AI models, Apertis AI provides:
Multiple providers through one API
Latest model releases
Various model types (text, image, video)
Additional Resources ​
Apertis AI Website
Apertis AI Enterprise
Overview
What is Apertis AI?
Required Variables
Usage - LiteLLM Python SDK
Non-streaming
Streaming
Usage - LiteLLM Proxy Server
1. Save key in your environment
2. Start the proxy
Supported OpenAI Parameters
Cost Benefits
Model Availability
Additional Resources
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
