# OpenAI Agents SDK with LiteLLM | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/tutorials/openai_agents_sdk
- Final URL: https://docs.litellm.ai/docs/tutorials/openai_agents_sdk
- Canonical URL: https://docs.litellm.ai/docs/tutorials/openai_agents_sdk
- Fetched at: 2026-06-23T14:34:32Z
- Content type: text/html; charset=utf-8

## Description

Use OpenAI's Agents SDK with any LLM provider through LiteLLM Proxy.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Use OpenAI's Agents SDK with any LLM provider through LiteLLM Proxy.
This tutorial shows you how to build AI agents using the OpenAI Agents SDK with support for multiple LLM providers through LiteLLM.
Overview ​
The OpenAI Agents SDK provides a high-level interface for building AI agents. By integrating with LiteLLM, you can:
Use multiple LLM providers (Bedrock, Azure, Vertex AI, etc.) with the same agent code
Switch easily between models from different providers
Connect to a LiteLLM proxy for centralized model management
Built-in LiteLLM Extension
The OpenAI Agents SDK includes an official LiteLLM extension ( LitellmModel ) that works without a proxy. If you don't need centralized proxy features (cost tracking, rate limiting, load balancing), you can use it directly:
from agents import Agent , Runner
from agents . extensions . models . litellm_model import LitellmModel
agent = Agent (
name = "Assistant" ,
instructions = "You are a helpful assistant." ,
model = LitellmModel ( model = "anthropic/claude-sonnet-4-20250514" ) ,
)
result = Runner . run_sync ( agent , "Hello!" )
print ( result . final_output )
See the Docs for more details. The rest of this tutorial focuses on the proxy-based approach for teams that need centralized model management.
Prerequisites ​
Python environment setup
API keys for your LLM providers
Basic understanding of LLMs and agent concepts
Installation ​
Install dependencies
uv add openai-agents litellm
1. Start LiteLLM Proxy ​
Configure and start the LiteLLM proxy with the models you want to use:
config.yaml
model_list :
- model_name : bedrock - claude - sonnet - 4
litellm_params :
model : "bedrock/us.anthropic.claude-sonnet-4-20250514-v1:0"
aws_region_name : "us-east-1"
- model_name : gpt - 4o
model : "openai/gpt-4o"
- model_name : claude - sonnet - 4
model : "anthropic/claude-sonnet-4-20250514"
- model_name : bedrock - claude - haiku
model : "bedrock/us.anthropic.claude-3-5-haiku-20241022-v1:0"
- model_name : bedrock - nova - premier
model : "bedrock/amazon.nova-premier-v1:0"
litellm --config config.yaml
Required environment variables:
Variable Value Description LITELLM_BASE_URL http://localhost:4000 LiteLLM proxy URL LITELLM_API_KEY sk-1234 Your LiteLLM API key (not your provider's key)
2. Setting Up Environment ​
Import the necessary libraries and configure your LiteLLM proxy connection:
Setup environment
from __future__ import annotations
import asyncio
import os
from openai import AsyncOpenAI
from agents import (
Agent ,
Model ,
ModelProvider ,
OpenAIChatCompletionsModel ,
RunConfig ,
Runner ,
function_tool ,
set_tracing_disabled ,
# Point to LiteLLM proxy
BASE_URL = os . getenv ( "LITELLM_BASE_URL" ) or "http://localhost:4000"
API_KEY = os . getenv ( "LITELLM_API_KEY" ) or "sk-1234"
# Define model constants for cleaner code
MODEL_BEDROCK_SONNET = "bedrock-claude-sonnet-4"
MODEL_BEDROCK_HAIKU = "bedrock-claude-haiku"
MODEL_GPT_4O = "gpt-4o"
# Create the OpenAI client pointed at LiteLLM
client = AsyncOpenAI ( base_url = BASE_URL , api_key = API_KEY )
# Disable tracing since we're not using OpenAI's platform directly
set_tracing_disabled ( disabled = True )
3. Create a Custom Model Provider ​
The Agents SDK uses a ModelProvider to resolve model names. Create a custom provider that routes all requests through LiteLLM:
Custom LiteLLM model provider
class LiteLLMModelProvider ( ModelProvider ) :
def get_model ( self , model_name : str | None ) - > Model :
return OpenAIChatCompletionsModel (
model = model_name or MODEL_BEDROCK_SONNET ,
openai_client = client ,
LITELLM_MODEL_PROVIDER = LiteLLMModelProvider ( )
4. Define a Simple Tool ​
Create a tool that your agent can use:
Weather tool implementation
@function_tool
def get_weather ( city : str ) - > str :
"""Retrieves the current weather report for a specified city.
Args:
city: The name of the city (e.g., "New York", "London", "Tokyo").
Returns:
A string containing the weather information for the city.
"""
print ( f"[debug] getting weather for { city } " )
mock_weather_db = {
"new york" : "The weather in New York is sunny with a temperature of 25°C." ,
"london" : "It's cloudy in London with a temperature of 15°C." ,
"tokyo" : "Tokyo is experiencing light rain and a temperature of 18°C." ,
}
city_normalized = city . lower ( )
if city_normalized in mock_weather_db :
return mock_weather_db [ city_normalized ]
else :
return f"Sorry, I don't have weather information for ' { city } '."
5. Using Different Models with Agents ​
5.1 Using Bedrock Models ​
Bedrock model via LiteLLM proxy
async def test_bedrock_agent ( ) :
print ( "\n--- Testing Bedrock Claude Agent ---" )
name = "weather_agent_bedrock" ,
instructions = "You are a helpful weather assistant powered by Claude. "
"Use the 'get_weather' tool for city weather requests. "
"Present information clearly." ,
tools = [ get_weather ] ,
result = await Runner . run (
agent ,
"What's the weather in Tokyo?" ,
run_config = RunConfig (
model_provider = LITELLM_MODEL_PROVIDER ,
model = "bedrock-claude-sonnet-4" , # Uses the model name from your LiteLLM config
) ,
print ( f"<<< Agent Response: { result . final_output } " )
asyncio . run ( test_bedrock_agent ( ) )
5.2 Using OpenAI Models ​
OpenAI model via LiteLLM proxy
async def test_openai_agent ( ) :
print ( "\n--- Testing OpenAI GPT Agent ---" )
name = "weather_agent_gpt" ,
instructions = "You are a helpful weather assistant powered by GPT-4o. "
"What's the weather in London?" ,
model = "gpt-4o" , # Uses the model name from your LiteLLM config
asyncio . run ( test_openai_agent ( ) )
5.3 Using Anthropic Models ​
Anthropic model via LiteLLM proxy
async def test_anthropic_agent ( ) :
print ( "\n--- Testing Anthropic Claude Agent ---" )
name = "weather_agent_claude" ,
"What's the weather in New York?" ,
model = "claude-sonnet-4" , # Uses the model name from your LiteLLM config
asyncio . run ( test_anthropic_agent ( ) )
6. Complete Working Example ​
Here's a full end-to-end script you can copy and run:
complete_agent.py
MODEL_NAME = os . getenv ( "MODEL_NAME" ) or "bedrock-claude-sonnet-4"
model = model_name or MODEL_NAME ,
"""Retrieves the current weather report for a specified city."""
async def main ( ) :
instructions = "You are a helpful weather assistant. "
"Present information clearly and concisely." ,
# Run with the default model (bedrock-claude-sonnet-4)
run_config = RunConfig ( model_provider = LITELLM_MODEL_PROVIDER ) ,
# Switch to a different model by passing model in RunConfig
model = "gpt-4o" ,
if __name__ == "__main__" :
asyncio . run ( main ( ) )
Why Use LiteLLM with Agents SDK? ​
Feature Benefit Multi-Provider Use the same agent code with OpenAI, Bedrock, Azure, Vertex AI, etc. Cost Tracking Track spending across all agent conversations Rate Limiting Set budgets and limits on agent usage Load Balancing Distribute requests across multiple API keys or regions Fallbacks Automatically retry with different models if one fails
Related Resources ​
OpenAI Agents SDK Documentation
LiteLLM Proxy Quick Start
Overview
Prerequisites
Installation
1. Start LiteLLM Proxy
2. Setting Up Environment
3. Create a Custom Model Provider
4. Define a Simple Tool
5. Using Different Models with Agents
5.1 Using Bedrock Models
5.2 Using OpenAI Models
5.3 Using Anthropic Models
6. Complete Working Example
Why Use LiteLLM with Agents SDK?
Related Resources
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
