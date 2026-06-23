# MCP Semantic Tool Filter | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/mcp_semantic_filter
- Final URL: https://docs.litellm.ai/docs/mcp_semantic_filter
- Canonical URL: https://docs.litellm.ai/docs/mcp_semantic_filter
- Fetched at: 2026-06-23T14:24:42Z
- Content type: text/html; charset=utf-8

## Description

Automatically filter MCP tools by semantic relevance. When you have many MCP tools registered, LiteLLM semantically matches the user's query against tool descriptions and sends only the most relevant tools to the LLM.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Automatically filter MCP tools by semantic relevance. When you have many MCP tools registered, LiteLLM semantically matches the user's query against tool descriptions and sends only the most relevant tools to the LLM.
How It Works ​
Tool search shifts tool selection from a prompt-engineering problem to a retrieval problem. Instead of injecting a large static list of tools into every prompt, the semantic filter:
Builds a semantic index of all available MCP tools on startup
On each request, semantically matches the user's query against tool descriptions
Returns only the top-K most relevant tools to the LLM
This approach improves context efficiency, increases reliability by reducing tool confusion, and enables scalability to ecosystems with hundreds or thousands of MCP tools.
Configuration ​
Enable semantic filtering in your LiteLLM config:
config.yaml
litellm_settings :
mcp_semantic_tool_filter :
enabled : true
embedding_model : "text-embedding-3-small" # Model for semantic matching
top_k : 5 # Max tools to return
similarity_threshold : 0.3 # Min similarity score
Configuration Options:
enabled - Enable/disable semantic filtering (default: false )
embedding_model - Model for generating embeddings (default: "text-embedding-3-small" )
top_k - Maximum number of tools to return (default: 10 )
similarity_threshold - Minimum similarity score for matches (default: 0.3 )
Usage ​
Use MCP tools normally with the Responses API or Chat Completions. The semantic filter runs automatically:
Responses API
Chat Completions
Responses API with Semantic Filtering
curl --location 'http://localhost:4000/v1/responses' \
--header 'Content-Type: application/json' \
--header "Authorization: Bearer sk-1234" \
--data '{
"model": "gpt-4o",
"input": [
{
"role": "user",
"content": "give me TLDR of what BerriAI/litellm repo is about",
"type": "message"
}
],
"tools": [
"type": "mcp",
"server_url": "litellm_proxy",
"require_approval": "never"
"tool_choice": "required"
}'
Chat Completions with Semantic Filtering
curl --location 'http://localhost:4000/v1/chat/completions' \
"messages": [
{"role": "user", "content": "Search Wikipedia for LiteLLM"}
"server_url": "litellm_proxy"
]
Response Headers ​
The semantic filter adds diagnostic headers to every response:
x-litellm-semantic-filter: 10->3
x-litellm-semantic-filter-tools: wikipedia-fetch,github-search,slack-post
x-litellm-semantic-filter - Shows before→after tool count (e.g., 10->3 means 10 tools were filtered down to 3)
x-litellm-semantic-filter-tools - CSV list of the filtered tool names (max 150 chars, clipped with ... if longer)
These headers help you understand which tools were selected for each request and verify the filter is working correctly.
Example ​
If you have 50 MCP tools registered and make a request asking about Wikipedia, the semantic filter will:
Semantically match your query "Search Wikipedia for LiteLLM" against all 50 tool descriptions
Select the top 5 most relevant tools (e.g., wikipedia-fetch , wikipedia-search , etc.)
Pass only those 5 tools to the LLM
Add headers showing x-litellm-semantic-filter: 50->5
This dramatically reduces prompt size while ensuring the LLM has access to the right tools for the task.
Performance ​
The semantic filter is optimized for production:
Router builds once on startup (no per-request overhead)
Semantic matching typically takes under 50ms
Fails gracefully - returns all tools if filtering fails
No impact on latency for requests without MCP tools
Related ​
MCP Overview - Learn about MCP in LiteLLM
MCP Permission Management - Control tool access by key/team
Using MCP - Complete MCP usage guide
How It Works
Configuration
Usage
Response Headers
Example
Performance
Related
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
