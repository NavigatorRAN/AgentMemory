# watsonx.ai Rerank | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/watsonx/rerank
- Final URL: https://docs.litellm.ai/docs/providers/watsonx/rerank
- Canonical URL: https://docs.litellm.ai/docs/providers/watsonx/rerank
- Fetched at: 2026-06-23T14:29:27Z
- Content type: text/html; charset=utf-8

## Description

Overview

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Overview ​
Property Details Description watsonx.ai rerank integration Provider Route on LiteLLM watsonx/ Supported Operations /ml/v1/text/rerank Link to Provider Doc IBM WatsonX.ai ↗
Quick Start ​
LiteLLM SDK ​
import os
from litellm import rerank
os . environ [ "WATSONX_APIKEY" ] = "YOUR_WATSONX_APIKEY"
os . environ [ "WATSONX_API_BASE" ] = "YOUR_WATSONX_API_BASE"
os . environ [ "WATSONX_PROJECT_ID" ] = "YOUR_WATSONX_PROJECT_ID"
query = "Best programming language for beginners?"
documents = [
"Python is great for beginners due to simple syntax." ,
"JavaScript runs in browsers and is versatile." ,
"Rust has a steep learning curve but is very safe." ,
]
response = rerank (
model = "watsonx/cross-encoder/ms-marco-minilm-l-12-v2" ,
query = query ,
documents = documents ,
top_n = 2 ,
return_documents = True ,
)
print ( response )
LiteLLM Proxy ​
model_list :
- model_name : cross - encoder/ms - marco - minilm - l - 12 - v2
litellm_params :
model : watsonx/cross - encoder/ms - marco - minilm - l - 12 - v2
api_key : os.environ/WATSONX_APIKEY
api_base : os.environ/WATSONX_API_BASE
project_id : os.environ/WATSONX_PROJECT_ID
Overview
Quick Start
LiteLLM SDK
LiteLLM Proxy
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
