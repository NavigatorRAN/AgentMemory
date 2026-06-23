# Use Claude Code with MCPs | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/tutorials/claude_mcp
- Final URL: https://docs.litellm.ai/docs/tutorials/claude_mcp
- Canonical URL: https://docs.litellm.ai/docs/tutorials/claude_mcp
- Fetched at: 2026-06-23T14:33:54Z
- Content type: text/html; charset=utf-8

## Description

This tutorial shows how to connect MCP servers to Claude Code via LiteLLM Proxy.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
This tutorial shows how to connect MCP servers to Claude Code via LiteLLM Proxy.
Note: LiteLLM supports OAuth for MCP servers as well. Learn more
Connecting MCP Servers ​
You can connect MCP servers to Claude Code via LiteLLM Proxy.
Add the MCP server to your config.yaml
GitHub MCP
Atlassian MCP
In this example, we'll add the Github MCP server to our config.yaml
config.yaml
mcp_servers :
github_mcp :
url : "https://api.githubcopilot.com/mcp"
transport : "http"
auth_type : oauth2
client_id : os.environ/GITHUB_OAUTH_CLIENT_ID
client_secret : os.environ/GITHUB_OAUTH_CLIENT_SECRET
In this example, we'll add the Atlassian MCP server to our config.yaml
atlassian_mcp :
url : "https://mcp.atlassian.com/v1/mcp"
important
The server name under mcp_servers: (e.g. atlassian_mcp , github_mcp ) must match the name used in the Claude Code URL path ( /mcp/<server_name> ). A mismatch will cause a 404 error during OAuth.
Start LiteLLM Proxy
Since Claude Code needs a publicly accessible URL for the OAuth callback, expose your proxy via ngrok or a similar tool.
litellm --config /path/to/config.yaml
# RUNNING on http://0.0.0.0:4000
# In a separate terminal — expose proxy for OAuth callbacks
ngrok http 4000
Add the MCP server to Claude Code
claude mcp add --transport http litellm-github https://your-ngrok-url.ngrok-free.dev/mcp/github_mcp \
--header "x-litellm-api-key: Bearer sk-1234"
claude mcp add --transport http litellm-atlassian https://your-ngrok-url.ngrok-free.dev/mcp/atlassian_mcp \
Parameter breakdown:
Parameter Description --transport http Use HTTP transport for the MCP connection litellm-atlassian The name for this MCP server on Claude Code — can be anything you choose https://your-ngrok-url.ngrok-free.dev/mcp/atlassian_mcp The LiteLLM proxy URL. Format: <PROXY_URL>/mcp/<server_name_on_litellm> . The atlassian_mcp part must match the key under mcp_servers: in your LiteLLM proxy config --header "x-litellm-api-key: Bearer sk-1234" Your LiteLLM virtual key for authentication to the proxy
You can also add the MCP server directly to your ~/.claude.json file instead of using claude mcp add . See Claude Code docs .
note
For MCP servers that require OAuth (such as Atlassian), use x-litellm-api-key instead of Authorization for the LiteLLM virtual key. The Authorization header is reserved for the OAuth flow.
Authenticate via Claude Code
a. Start Claude Code
claude
b. Open the MCP menu
/mcp
c. Select the MCP server (e.g. litellm-atlassian )
d. Start the OAuth flow
> 1. Authenticate
2. Reconnect
3. Disable
e. Once completed, you should see this success message:
Connecting MCP Servers
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
