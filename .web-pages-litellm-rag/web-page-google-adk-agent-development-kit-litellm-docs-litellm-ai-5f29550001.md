# Google ADK (Agent Development Kit) | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/projects/Google%20ADK
- Final URL: https://docs.litellm.ai/docs/projects/Google%20ADK
- Canonical URL: https://docs.litellm.ai/docs/projects/Google ADK
- Fetched at: 2026-06-23T14:26:10Z
- Content type: text/html; charset=utf-8

## Description

Google ADK is an open-source, code-first Python framework for building, evaluating, and deploying sophisticated AI agents. While optimized for Gemini, ADK is model-agnostic and supports LiteLLM for using 100+ providers.

## Extracted Text

Skip to main content
Copy as Markdown
Google ADK is an open-source, code-first Python framework for building, evaluating, and deploying sophisticated AI agents. While optimized for Gemini, ADK is model-agnostic and supports LiteLLM for using 100+ providers.
from google . adk . agents . llm_agent import Agent
from google . adk . models . lite_llm import LiteLlm
root_agent = Agent (
model = LiteLlm ( model = "openai/gpt-4o" ) , # Or any LiteLLM-supported model
name = "my_agent" ,
description = "An agent using LiteLLM" ,
instruction = "You are a helpful assistant." ,
tools = [ your_tools ] ,
)
GitHub
Documentation
LiteLLM Samples
