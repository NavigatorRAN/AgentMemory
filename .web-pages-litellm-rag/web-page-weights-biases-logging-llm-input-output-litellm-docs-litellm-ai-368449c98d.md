# Weights & Biases - Logging LLM Input/Output | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/observability/wandb_integration
- Final URL: https://docs.litellm.ai/docs/observability/wandb_integration
- Canonical URL: https://docs.litellm.ai/docs/observability/wandb_integration
- Fetched at: 2026-06-23T14:25:43Z
- Content type: text/html; charset=utf-8

## Description

This is community maintained, Please make an issue if you run into a bug

## Extracted Text

Skip to main content
On this page
Copy as Markdown
tip
This is community maintained, Please make an issue if you run into a bug
https://github.com/BerriAI/litellm
Weights & Biases helps AI developers build better models faster https://wandb.ai
info
We want to learn how we can make the callbacks better! Meet the LiteLLM founders or
join our discord
Pre-Requisites ​
Ensure you have run uv add wandb for this integration
uv add wandb litellm
Quick Start ​
Use just 2 lines of code, to instantly log your responses across all providers with Weights & Biases
litellm . success_callback = [ "wandb" ]
# uv add wandb
import litellm
import os
os . environ [ "WANDB_API_KEY" ] = ""
# LLM API Keys
os . environ [ 'OPENAI_API_KEY' ] = ""
# set wandb as a callback, litellm will send the data to Weights & Biases
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
