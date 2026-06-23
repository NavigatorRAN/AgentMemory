# 🖇️ AgentOps - LLM Observability Platform | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/observability/agentops_integration
- Final URL: https://docs.litellm.ai/docs/observability/agentops_integration
- Canonical URL: https://docs.litellm.ai/docs/observability/agentops_integration
- Fetched at: 2026-06-23T14:24:52Z
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
AgentOps is an observability platform that enables tracing and monitoring of LLM calls, providing detailed insights into your AI operations.
Using AgentOps with LiteLLM ​
LiteLLM provides success_callbacks and failure_callbacks , allowing you to easily integrate AgentOps for comprehensive tracing and monitoring of your LLM operations.
Integration ​
Use just a few lines of code to instantly trace your responses across all providers with AgentOps:
Get your AgentOps API Keys from https://app.agentops.ai/
import litellm
# Configure LiteLLM to use AgentOps
litellm . success_callback = [ "agentops" ]
# Make your LLM calls as usual
response = litellm . completion (
model = "gpt-3.5-turbo" ,
messages = [ { "role" : "user" , "content" : "Hello, how are you?" } ] ,
)
Complete Code:
import os
from litellm import completion
# Set env variables
os . environ [ "OPENAI_API_KEY" ] = "your-openai-key"
os . environ [ "AGENTOPS_API_KEY" ] = "your-agentops-api-key"
# OpenAI call
response = completion (
model = "gpt-4" ,
messages = [ { "role" : "user" , "content" : "Hi 👋 - I'm OpenAI" } ] ,
print ( response )
Configuration Options ​
The AgentOps integration can be configured through environment variables:
AGENTOPS_API_KEY (str, optional): Your AgentOps API key
AGENTOPS_ENVIRONMENT (str, optional): Deployment environment (defaults to "production")
AGENTOPS_SERVICE_NAME (str, optional): Service name for tracing (defaults to "agentops")
Advanced Usage ​
You can configure additional settings through environment variables:
# Configure AgentOps settings
os . environ [ "AGENTOPS_ENVIRONMENT" ] = "staging"
os . environ [ "AGENTOPS_SERVICE_NAME" ] = "my-service"
# Enable AgentOps tracing
Support ​
For issues or questions, please refer to:
AgentOps Documentation
LiteLLM Documentation
Using AgentOps with LiteLLM
Integration
Configuration Options
Advanced Usage
Support
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
