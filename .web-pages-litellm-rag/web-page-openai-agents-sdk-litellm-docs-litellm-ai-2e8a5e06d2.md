# OpenAI Agents SDK | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/projects/openai-agents
- Final URL: https://docs.litellm.ai/docs/projects/openai-agents
- Canonical URL: https://docs.litellm.ai/docs/projects/openai-agents
- Fetched at: 2026-06-23T14:26:32Z
- Content type: text/html; charset=utf-8

## Description

Use OpenAI Agents SDK with any LLM provider through LiteLLM Proxy.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Use OpenAI Agents SDK with any LLM provider through LiteLLM Proxy.
The OpenAI Agents SDK is a lightweight framework for building multi-agent workflows. It includes an official LiteLLM extension that lets you use any of the 100+ supported providers.
Quick Start ​
1. Install Dependencies ​
uv add "openai-agents[litellm]"
2. Add Model to Config ​
config.yaml
model_list :
- model_name : gpt - 4o
litellm_params :
model : "openai/gpt-4o"
api_key : "os.environ/OPENAI_API_KEY"
- model_name : claude - sonnet
model : "anthropic/claude-3-5-sonnet-20241022"
api_key : "os.environ/ANTHROPIC_API_KEY"
- model_name : gemini - pro
model : "gemini/gemini-2.0-flash-exp"
api_key : "os.environ/GEMINI_API_KEY"
3. Start LiteLLM Proxy ​
litellm --config config.yaml
4. Use with Proxy ​
Via Proxy
Direct (No Proxy)
from agents import Agent , Runner
from agents . extensions . models . litellm_model import LitellmModel
# Point to LiteLLM proxy
agent = Agent (
name = "Assistant" ,
instructions = "You are a helpful assistant." ,
model = LitellmModel (
model = "claude-sonnet" , # Model from config.yaml
api_key = "sk-1234" , # LiteLLM API key
base_url = "http://localhost:4000"
)
result = await Runner . run ( agent , "What is LiteLLM?" )
print ( result . final_output )
# Use any provider directly
model = "anthropic/claude-3-5-sonnet-20241022" ,
api_key = "your-anthropic-key"
Track Usage ​
Enable usage tracking to monitor token consumption:
from agents import Agent , ModelSettings
model = LitellmModel ( model = "claude-sonnet" , api_key = "sk-1234" ) ,
model_settings = ModelSettings ( include_usage = True )
result = await Runner . run ( agent , "Hello" )
print ( result . context_wrapper . usage ) # Token counts
Environment Variables ​
Variable Value Description LITELLM_BASE_URL http://localhost:4000 LiteLLM proxy URL LITELLM_API_KEY sk-1234 Your LiteLLM API key
Related Resources ​
OpenAI Agents SDK Documentation
LiteLLM Extension Docs
LiteLLM Proxy Quick Start
Quick Start
1. Install Dependencies
2. Add Model to Config
3. Start LiteLLM Proxy
4. Use with Proxy
Track Usage
Environment Variables
Related Resources
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
