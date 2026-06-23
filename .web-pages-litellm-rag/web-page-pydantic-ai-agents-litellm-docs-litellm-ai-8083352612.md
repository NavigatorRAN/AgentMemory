# Pydantic AI Agents | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/pydantic_ai_agent
- Final URL: https://docs.litellm.ai/docs/providers/pydantic_ai_agent
- Canonical URL: https://docs.litellm.ai/docs/providers/pydantic_ai_agent
- Fetched at: 2026-06-23T14:28:48Z
- Content type: text/html; charset=utf-8

## Description

Call Pydantic AI Agents via LiteLLM's A2A Gateway.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Call Pydantic AI Agents via LiteLLM's A2A Gateway.
Property Details Description Pydantic AI agents with native A2A support via the to_a2a() method. LiteLLM provides fake streaming support for agents that don't natively stream. Provider Route on LiteLLM A2A Gateway Supported Endpoints /v1/a2a/message/send Provider Doc Pydantic AI Agents ↗
LiteLLM A2A Gateway ​
All Pydantic AI agents need to be exposed as A2A agents using the to_a2a() method. Once your agent server is running, you can add it to the LiteLLM Gateway.
1. Setup Pydantic AI Agent Server ​
LiteLLM requires Pydantic AI agents to follow the A2A (Agent-to-Agent) protocol . Pydantic AI has native A2A support via the to_a2a() method, which exposes your agent as an A2A-compliant server.
Install Dependencies ​
uv add pydantic-ai fasta2a uvicorn
Create Agent ​
agent.py
from pydantic_ai import Agent
agent = Agent ( 'openai:gpt-4o-mini' , instructions = 'Be helpful!' )
@agent . tool_plain
def get_weather ( city : str ) - > str :
"""Get weather for a city."""
return f"Weather in { city } : Sunny, 72°F"
def calculator ( expression : str ) - > str :
"""Evaluate a math expression."""
return str ( eval ( expression ) )
# Native A2A server - Pydantic AI handles it automatically
app = agent . to_a2a ( )
Run Server ​
uvicorn agent:app --host 0.0.0.0 --port 9999
Server runs at http://localhost:9999
2. Navigate to Agents ​
From the sidebar, click "Agents" to open the agent management page, then click "+ Add New Agent".
3. Select Pydantic AI Agent Type ​
Click "A2A Standard" to see available agent types, then select "Pydantic AI".
4. Configure the Agent ​
Fill in the following fields:
Agent Name - A unique identifier for your agent (e.g., test-pydantic-agent )
Agent URL - The URL where your Pydantic AI agent is running. We use http://localhost:9999 because that's where we started our Pydantic AI agent server in the previous step.
5. Create Agent ​
Click "Create Agent" to save your configuration.
6. Test in Playground ​
Go to "Playground" in the sidebar to test your agent.
7. Select A2A Endpoint ​
Click the endpoint dropdown and search for "a2a", then select /v1/a2a/message/send .
8. Select Your Agent and Send a Message ​
Pick your Pydantic AI agent from the dropdown and send a test message.
Further Reading ​
Pydantic AI Documentation
Pydantic AI Agents
A2A Agent Gateway
A2A Cost Tracking
LiteLLM A2A Gateway
1. Setup Pydantic AI Agent Server
2. Navigate to Agents
3. Select Pydantic AI Agent Type
4. Configure the Agent
5. Create Agent
6. Test in Playground
7. Select A2A Endpoint
8. Select Your Agent and Send a Message
Further Reading
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
