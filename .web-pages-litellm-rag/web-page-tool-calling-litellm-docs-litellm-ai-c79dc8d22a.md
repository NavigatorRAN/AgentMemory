# Tool Calling | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/guides/tools_integrations
- Final URL: https://docs.litellm.ai/docs/guides/tools_integrations
- Canonical URL: https://docs.litellm.ai/docs/guides/tools_integrations
- Fetched at: 2026-06-23T14:24:11Z
- Content type: text/html; charset=utf-8

## Description

Function calling, web tools, interception patterns, computer use, code interpreter, and tool-call hygiene

## Extracted Text

Skip to main content
📄️ Function Calling
Checking if a model supports function calling
📄️ Web Search
Use web search with litellm
📄️ Web Search Interception
Enable transparent server-side web search execution for any LLM provider. LiteLLM automatically intercepts web search tool calls and executes them using your configured search provider (Perplexity, Tavily, etc.).
📄️ Web Fetch
The web fetch tool allows LLMs to retrieve full content from specified web pages and PDF documents. This enables AI models to access real-time information from the internet and incorporate web content into their responses.
📄️ Computer Use
Computer use allows models to interact with computer interfaces by taking screenshots and performing actions like clicking, typing, and scrolling. This enables AI models to autonomously operate desktop environments.
📄️ Code Interpreter
Use OpenAI's Code Interpreter tool to execute Python code in a secure, sandboxed environment.
📄️ Code Interpreter Sandbox Interception
Run model-generated code inside an isolated sandbox and get its output back. The API is provider-agnostic; e2b is the first supported backend, talked to directly over HTTPS with no extra SDK dependency.
📄️ Advisor Tool
Pair a faster executor model with a higher-intelligence advisor model that provides strategic guidance mid-generation.
📄️ Message Sanitization for Tool Calling for anthropic models
Automatically fix common message formatting issues when using tool calling with modify_params=True
