# Use Claude Code with Non-Anthropic Models | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/tutorials/claude_non_anthropic_models
- Final URL: https://docs.litellm.ai/docs/tutorials/claude_non_anthropic_models
- Canonical URL: https://docs.litellm.ai/docs/tutorials/claude_non_anthropic_models
- Fetched at: 2026-06-23T14:33:55Z
- Content type: text/html; charset=utf-8

## Description

This tutorial shows how to use Claude Code with non-Anthropic models like OpenAI, Gemini, and other LLM providers through LiteLLM proxy.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
This tutorial shows how to use Claude Code with non-Anthropic models like OpenAI, Gemini, and other LLM providers through LiteLLM proxy.
info
LiteLLM automatically translates between different provider formats, allowing you to use any supported LLM provider with Claude Code while maintaining the Anthropic Messages API format.
Prerequisites ​
Claude Code installed
API keys for your chosen providers (OpenAI, Vertex AI, etc.)
Installation ​
First, install LiteLLM with proxy support:
uv tool install 'litellm[proxy]'
Configuration ​
1. Setup config.yaml ​
Create a configuration file with your preferred non-Anthropic models:
OpenAI
Google AI Studio
Vertex AI
Azure OpenAI
model_list :
# OpenAI GPT-4o
- model_name : gpt - 4o
litellm_params :
model : openai/gpt - 4o
api_key : os.environ/OPENAI_API_KEY
# OpenAI GPT-4o-mini
- model_name : gpt - 4o - mini
model : openai/gpt - 4o - mini
Set your environment variables:
export OPENAI_API_KEY="your-openai-api-key"
export LITELLM_MASTER_KEY="sk-1234567890" # Generate a secure key
# Google Gemini
- model_name : gemini - 3.0 - flash - exp
model : gemini/gemini - 3.0 - flash - exp
api_key : os.environ/GEMINI_API_KEY
export GEMINI_API_KEY="your-gemini-api-key"
- model_name : vertex - gemini - 3 - flash - preview
model : vertex_ai/gemini - 3 - flash - preview
vertex_credentials : os.environ/VERTEX_FILE_PATH_ENV_VAR # os.environ["VERTEX_FILE_PATH_ENV_VAR"] = "/path/to/service_account.json"
vertex_project : "my-test-project"
vertex_location : "us-east-1"
# Anthropic Claude
- model_name : anthropic - vertex
model : vertex_ai/claude - 3 - sonnet@20240229
vertex_ai_project : "my-test-project"
vertex_ai_location : "us-east-1"
export VERTEX_FILE_PATH_ENV_VAR="/path/to/service_account.json"
export LITELLM_MASTER_KEY="sk-1234567890"
# Azure OpenAI
- model_name : azure - gpt - 4
model : azure/gpt - 4
api_key : os.environ/AZURE_API_KEY
api_base : os.environ/AZURE_API_BASE
api_version : "2024-02-01"
export AZURE_API_KEY="your-azure-api-key"
export AZURE_API_BASE="https://your-resource.openai.azure.com"
2. Start LiteLLM Proxy ​
litellm --config /path/to/config.yaml
# RUNNING on http://0.0.0.0:4000
3. Verify Setup ​
Test that your proxy is working correctly:
curl -X POST http://0.0.0.0:4000/v1/messages \
-H "Authorization: Bearer $LITELLM_MASTER_KEY" \
-H "Content-Type: application/json" \
-d '{
"model": "gpt-4o",
"max_tokens": 1000,
"messages": [{"role": "user", "content": "What is the capital of France?"}]
}'
"model": "gemini-3.0-flash-exp",
"model": "azure-gpt-4",
4. Configure Claude Code ​
Configure Claude Code to use your LiteLLM proxy:
export ANTHROPIC_BASE_URL="http://0.0.0.0:4000"
export ANTHROPIC_AUTH_TOKEN="$LITELLM_MASTER_KEY"
tip
The LITELLM_MASTER_KEY gives Claude Code access to all proxy models. You can also create virtual keys in the LiteLLM UI to limit access to specific models.
5. Use Claude Code with Non-Anthropic Models ​
Start Claude Code and specify which model to use:
# Use OpenAI GPT-4o
claude --model gpt-4o
# Use OpenAI GPT-4o-mini for faster responses
claude --model gpt-4o-mini
# Use Google Gemini
claude --model gemini-3.0-flash-exp
# Use Vertex AI Gemini
claude --model vertex-gemini-3-flash-preview
# Use Vertex AI Anthropic Claude
claude --model anthropic-vertex
# Use Azure OpenAI
claude --model azure-gpt-4
6. Switch Models at Runtime with /model ​
Once Claude Code is running, you can switch between any of the models exposed by your LiteLLM proxy using the built-in /model command. By default the picker only shows Anthropic's hardcoded models, so to populate it with the models from your LiteLLM proxy you must opt in to gateway model discovery .
Set the following environment variable before launching Claude Code:
export CLAUDE_CODE_ENABLE_GATEWAY_MODEL_DISCOVERY=1
On startup, Claude Code will call GET /v1/models against your ANTHROPIC_BASE_URL (your LiteLLM proxy) and add each returned model to the /model picker, labeled From gateway . Inside Claude Code, run:
/model
and select any LiteLLM-managed model ( gpt-4o , gemini-3.0-flash-exp , anthropic-vertex , etc.) to switch without restarting the session.
Requirements
Claude Code v2.1.129 or later.
ANTHROPIC_BASE_URL must point at a gateway that serves the Anthropic Messages API format — LiteLLM does this on /v1/messages .
Discovery is opt-in. Without CLAUDE_CODE_ENABLE_GATEWAY_MODEL_DISCOVERY=1 , Claude Code will not query your proxy's /v1/models .
Surface only specific models
If you only want a subset of your LiteLLM models to show up in the /model picker, issue a virtual key scoped to those models and use that key as ANTHROPIC_AUTH_TOKEN . /v1/models will only return models the key can access.
You can also add individual model entries manually via ANTHROPIC_CUSTOM_MODEL_OPTION instead of (or in addition to) enabling discovery.
How It Works ​
LiteLLM acts as a unified interface that:
Receives requests from Claude Code in Anthropic Messages API format
Translates the request to the target provider's format (OpenAI, Gemini, etc.)
Forwards the request to the actual provider
Translates the response back to Anthropic Messages API format
Returns the response to Claude Code
This allows you to use Claude Code's interface with any LLM provider supported by LiteLLM.
Advanced Features ​
Load Balancing and Fallbacks ​
Configure multiple deployments with automatic fallback:
- model_name : gpt - 4o # virtual model name
- model_name : gpt - 4o # same virtual name
model : azure/gpt - 4o
router_settings :
routing_strategy : simple - shuffle # Load balance between deployments
num_retries : 2
timeout : 30
Usage Tracking and Budgets ​
Track usage and set budgets through the LiteLLM UI:
litellm_settings :
master_key : os.environ/LITELLM_MASTER_KEY
database_url : "postgresql://..." # Enable database for tracking
general_settings :
store_model_in_db : true
Start the proxy with the UI:
litellm --config /path/to/config.yaml --detailed_debug
Access the UI at http://0.0.0.0:4000/ui to:
View usage analytics
Set budget limits per user/key
Monitor costs across different providers
Create virtual keys with specific permissions
Supported Providers ​
LiteLLM supports 100+ providers. Here are some popular ones for use with Claude Code:
OpenAI : GPT-4o, GPT-4o-mini, o1, o3-mini
Google : Gemini 2.0 Flash, Gemini 1.5 Pro/Flash
Azure OpenAI : All OpenAI models via Azure
AWS Bedrock : Llama, Mistral, and other models
Vertex AI : Gemini, Claude, and other models on Google Cloud
Groq : Fast inference for Llama and Mixtral
Together AI : Llama, Mixtral, and other open source models
Deepseek : Deepseek-chat, Deepseek-coder
View full list of supported providers →
Prerequisites
Installation
Configuration
1. Setup config.yaml
2. Start LiteLLM Proxy
3. Verify Setup
4. Configure Claude Code
5. Use Claude Code with Non-Anthropic Models
6. Switch Models at Runtime with /model
How It Works
Advanced Features
Load Balancing and Fallbacks
Usage Tracking and Budgets
Supported Providers
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
