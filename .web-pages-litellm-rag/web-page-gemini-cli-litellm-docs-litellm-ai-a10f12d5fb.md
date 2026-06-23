# Gemini CLI | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/tutorials/litellm_gemini_cli
- Final URL: https://docs.litellm.ai/docs/tutorials/litellm_gemini_cli
- Canonical URL: https://docs.litellm.ai/docs/tutorials/litellm_gemini_cli
- Fetched at: 2026-06-23T14:34:21Z
- Content type: text/html; charset=utf-8

## Description

This tutorial shows you how to integrate the Gemini CLI with LiteLLM Proxy, allowing you to route requests through LiteLLM's unified interface.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
This tutorial shows you how to integrate the Gemini CLI with LiteLLM Proxy, allowing you to route requests through LiteLLM's unified interface.
info
This integration is supported from LiteLLM v1.73.3-nightly and above.
Benefits of using gemini-cli with LiteLLM ​
When you use gemini-cli with LiteLLM you get the following benefits:
Developer Benefits:
Universal Model Access: Use any LiteLLM supported model (Anthropic, OpenAI, Vertex AI, Bedrock, etc.) through the gemini-cli interface.
Higher Rate Limits & Reliability: Load balance across multiple models and providers to avoid hitting individual provider limits, with fallbacks to ensure you get responses even if one provider fails.
Proxy Admin Benefits:
Centralized Management: Control access to all models through a single LiteLLM proxy instance without giving your developers API Keys to each provider.
Budget Controls: Set spending limits and track costs across all gemini-cli usage.
Prerequisites ​
Before you begin, ensure you have:
Node.js and npm installed on your system
A running LiteLLM Proxy instance
A valid LiteLLM Proxy API key
Git installed for cloning the repository
Quick Start Guide ​
Step 1: Install Gemini CLI ​
Clone the Gemini CLI repository and navigate to the project directory:
npm install -g @google/gemini-cli
Step 2: Configure Gemini CLI for LiteLLM Proxy ​
Configure the Gemini CLI to point to your LiteLLM Proxy instance by setting the required environment variables:
export GOOGLE_GEMINI_BASE_URL="http://localhost:4000"
export GEMINI_API_KEY=sk-1234567890
Note: Replace the values with your actual LiteLLM Proxy configuration:
BASE_URL : The URL where your LiteLLM Proxy is running
GEMINI_API_KEY : Your LiteLLM Proxy API key
Step 3: Build and Start Gemini CLI ​
Build the project and start the CLI:
gemini
Step 4: Test the Integration ​
Once the CLI is running, you can send test requests. These requests will be automatically routed through LiteLLM Proxy to the configured Gemini model.
The CLI will now use LiteLLM Proxy as the backend, giving you access to LiteLLM's features like:
Request/response logging
Rate limiting
Cost tracking
Model routing and fallbacks
Advanced ​
Use Anthropic, OpenAI, Bedrock, etc. models on gemini-cli ​
In order to use non-gemini models on gemini-cli, you need to set a model_group_alias in the LiteLLM Proxy config. This tells LiteLLM that requests with model = gemini-2.5-pro should be routed to your desired model from any provider.
Anthropic
OpenAI
Bedrock
Multi-Provider Load Balancing
Route gemini-2.5-pro requests to Claude Sonnet:
proxy_config.yaml
model_list :
- model_name : claude - sonnet - 4 - 20250514
litellm_params :
model : anthropic/claude - 3 - 5 - sonnet - 20241022
api_key : os.environ/ANTHROPIC_API_KEY
router_settings :
model_group_alias : { "gemini-2.5-pro" : "claude-sonnet-4-20250514" }
Route gemini-2.5-pro requests to GPT-4o:
- model_name : gpt - 4o - model
model : gpt - 4o
api_key : os.environ/OPENAI_API_KEY
model_group_alias : { "gemini-2.5-pro" : "gpt-4o-model" }
Route gemini-2.5-pro requests to Claude on Bedrock:
- model_name : bedrock - claude
model : bedrock/anthropic.claude - haiku - 4 - 5 - 20251001 : 0
aws_access_key_id : os.environ/AWS_ACCESS_KEY_ID
aws_secret_access_key : os.environ/AWS_SECRET_ACCESS_KEY
aws_region_name : us - east - 1
model_group_alias : { "gemini-2.5-pro" : "bedrock-claude" }
All deployments with model_name= anthropic-claude will be load balanced. In this example we load balance between Anthropic and Bedrock.
- model_name : anthropic - claude
model_group_alias : { "gemini-2.5-pro" : "anthropic-claude" }
With this configuration, when you use gemini-2.5-pro in the CLI, LiteLLM will automatically route your requests to the configured provider(s) with load balancing and fallbacks.
Troubleshooting ​
If you encounter issues:
Connection errors : Verify that your LiteLLM Proxy is running and accessible at the configured GOOGLE_GEMINI_BASE_URL
Authentication errors : Ensure your GEMINI_API_KEY is valid and has the necessary permissions
Build failures : Make sure all dependencies are installed with npm install
Benefits of using gemini-cli with LiteLLM
Prerequisites
Quick Start Guide
Step 1: Install Gemini CLI
Step 2: Configure Gemini CLI for LiteLLM Proxy
Step 3: Build and Start Gemini CLI
Step 4: Test the Integration
Advanced
Use Anthropic, OpenAI, Bedrock, etc. models on gemini-cli
Troubleshooting
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
