# MCP Overview | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/mcp
- Final URL: https://docs.litellm.ai/docs/mcp
- Canonical URL: https://docs.litellm.ai/docs/mcp
- Fetched at: 2026-06-23T14:24:31Z
- Content type: text/html; charset=utf-8

## Description

LiteLLM Proxy provides an MCP Gateway that allows you to use a fixed endpoint for all MCP tools and control MCP access by Key, Team.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
LiteLLM Proxy provides an MCP Gateway that allows you to use a fixed endpoint for all MCP tools and control MCP access by Key, Team.
LiteLLM MCP Architecture: Use MCP tools with all LiteLLM supported models
Overview ​
Feature Description MCP Operations • List Tools
• Call Tools
• Prompts
• Resources Direct REST API /mcp-rest/tools/list and /mcp-rest/tools/call — call tools with curl without an LLM Supported MCP Transports • Streamable HTTP
• SSE
• Standard Input/Output (stdio) LiteLLM Permission Management • By Key
• By Team
• By Organization
MCP protocol update
Starting in LiteLLM v1.80.18, the LiteLLM MCP protocol version is 2025-11-25 .
LiteLLM namespaces multiple MCP servers by prefixing each tool name with its MCP server name, so newly created servers now must use names that comply with SEP-986—noncompliant names cannot be added anymore. Existing servers that still violate SEP-986 only emit warnings today, but future MCP-side rollouts may block those names entirely, so we recommend updating any legacy server names proactively before MCP enforcement makes them unusable.
Adding your MCP ​
Prerequisites ​
To store MCP servers in the database, you need to enable database storage:
Environment Variable:
export STORE_MODEL_IN_DB=True
OR in config.yaml:
general_settings :
store_model_in_db : true
Fine-grained Database Storage Control ​
By default, when store_model_in_db is true , all object types (models, MCPs, guardrails, vector stores, etc.) are stored in the database. If you want to store only specific object types, use the supported_db_objects setting.
Example: Store only MCP servers in the database
config.yaml
supported_db_objects : [ "mcp" ] # Only store MCP servers in DB
model_list :
- model_name : gpt - 4o
litellm_params :
model : openai/gpt - 4o
api_key : sk - xxxxxxx
See all available object types: Config Settings - supported_db_objects
If supported_db_objects is not set, all object types are loaded from the database (default behavior).
For diagnosing connectivity problems after setup, see the MCP Troubleshooting Guide .
LiteLLM UI
On the LiteLLM UI, Navigate to "MCP Servers" and click "Add New MCP Server".
On this form, you should enter your MCP Server URL and the transport you want to use.
LiteLLM supports the following MCP transports:
Streamable HTTP
SSE (Server-Sent Events)
Standard Input/Output (stdio)
Add HTTP MCP Server ​
This video walks through adding and using an HTTP MCP server on LiteLLM UI and using it in Cursor IDE.
Add SSE MCP Server ​
This video walks through adding and using an SSE MCP server on LiteLLM UI and using it in Cursor IDE.
Add STDIO MCP Server ​
For stdio MCP servers, select "Standard Input/Output (stdio)" as the transport type and provide the stdio configuration in JSON format:
OAuth Configuration & Overrides ​
LiteLLM attempts OAuth 2.0 Authorization Server Discovery by default. When you create an MCP server in the UI and set Authentication: OAuth , LiteLLM will locate the provider metadata, dynamically register a client, and perform PKCE-based authorization without you providing any additional details.
Customize the OAuth flow when needed:
Provide explicit client credentials – If the MCP provider does not offer dynamic client registration or you prefer to manage the client yourself, fill in client_id , client_secret , and the desired scopes .
Override discovery URLs – In some environments, LiteLLM might not be able to reach the provider's metadata endpoints. Use the optional authorization_url , token_url , and registration_url fields to point LiteLLM directly to the correct endpoints.
AWS SigV4 Authentication ​
For MCP servers hosted on AWS Bedrock AgentCore , select AWS SigV4 as the authentication type. LiteLLM will sign every outgoing MCP request with your AWS credentials using Signature Version 4 .
Fill in your AWS region, service name (defaults to bedrock-agentcore ), and optionally your AWS access key and secret. If credentials are omitted, LiteLLM falls back to the boto3 credential chain (IAM roles, environment variables, etc.).
See full SigV4 setup guide
Static Headers ​
Sometimes your MCP server needs specific headers on every request. Maybe it's an API key, maybe it's a custom header the server expects. Instead of configuring auth, you can just set them directly.
These headers get sent with every request to the server. That's it.
When to use this:
Your server needs custom headers that don't fit the standard auth patterns
You want full control over exactly what headers are sent
You're debugging and need to quickly add headers without changing auth configuration
Server Variables ​
Store credentials on the server and reference them in static headers or authentication with ${VAR_NAME} (e.g. ${DB_PROTOCOL}://${CORP_USERNAME}:${CORP_PASSWORD}@${DB_HOSTNAME} ). Scope each variable as Instance (shared) or Per-user (each user supplies their own).
Each user needs to connect with their own static credentials
You want to reuse certain shared details (e.g., DB url) across users
Add your MCP servers directly in your config.yaml file:
litellm_settings :
# MCP Aliases - Map aliases to server names for easier tool access
mcp_aliases :
"github" : "github_mcp_server"
"zapier" : "zapier_mcp_server"
"deepwiki" : "deepwiki_mcp_server"
mcp_servers :
# HTTP Streamable Server
deepwiki_mcp :
url : "https://mcp.deepwiki.com/mcp"
# SSE Server
zapier_mcp :
url : "https://actions.zapier.com/mcp/sk-akxxxxx/sse"
# Standard Input/Output (stdio) Server - CircleCI Example
circleci_mcp :
transport : "stdio"
command : "npx"
args : [ "-y" , "@circleci/mcp-server-circleci" ]
env :
CIRCLECI_TOKEN : "your-circleci-token"
CIRCLECI_BASE_URL : "https://circleci.com"
# Full configuration with all optional fields
my_http_server :
url : "https://my-mcp-server.com/mcp"
transport : "http"
description : "My custom MCP server"
auth_type : "api_key"
auth_value : "abc123"
Configuration Options:
Server Name : Use any descriptive name for your MCP server (e.g., zapier_mcp , deepwiki_mcp , circleci_mcp )
Alias : This name will be prefilled with the server name with "_" replacing spaces, else edit it to be the prefix in tool names
URL : The endpoint URL for your MCP server (required for HTTP/SSE transports)
Transport : Optional transport type (defaults to sse )
sse - SSE (Server-Sent Events) transport
http - Streamable HTTP transport
stdio - Standard Input/Output transport
Command : The command to execute for stdio transport (required for stdio)
allow_all_keys : Set to true to make the server available to every LiteLLM API key, even if the key/team doesn't list the server in its MCP permissions.
Args : Array of arguments to pass to the command (optional for stdio)
Env : Environment variables to set for the stdio process (optional for stdio)
Description : Optional description for the server
Auth Type : Optional authentication type. Supported values:
Value Header sent (managed SSE/HTTP transport) none No auth header added api_key X-API-Key: <auth_value> bearer_token Authorization: Bearer <auth_value> basic Authorization: Basic <auth_value> authorization Authorization: <auth_value> (verbatim, no prefix) token Authorization: token <auth_value> (GitHub-style) oauth2 Authorization: Bearer <resolved_token> — PKCE or M2M client_credentials . See MCP OAuth oauth2_token_exchange Authorization: Bearer <exchanged_token> — RFC 8693 On-Behalf-Of. See MCP OBO Auth aws_sigv4 Per-request AWS SigV4 signature. See MCP AWS SigV4
Note: the header table above describes the managed SSE/HTTP transport path. The OpenAPI-tool path emits Authorization: ApiKey <value> instead of X-API-Key for auth_type: api_key ; the deprecated x-mcp-auth broadcast header also uses the ApiKey form.
Extra Headers : Optional list of additional header names that should be forwarded from client to the MCP server
Static Headers : Optional map of header key/value pairs to include every request to the MCP server.
Spec Version : Optional MCP specification version (defaults to 2025-06-18 )
Examples for each auth type:
MCP auth examples (config.yaml)
api_key_example :
auth_value : "abc123" # headers={"X-API-Key": "abc123"}
# NEW – OAuth 2.0 Client Credentials (v1.77.5)
oauth2_example :
auth_type : "oauth2" # 👈 KEY CHANGE
authorization_url : "https://my-mcp-server.com/oauth/authorize" # optional override
token_url : "https://my-mcp-server.com/oauth/token" # optional override
registration_url : "https://my-mcp-server.com/oauth/register" # optional override
client_id : os.environ/OAUTH_CLIENT_ID
client_secret : os.environ/OAUTH_CLIENT_SECRET
scopes : [ "tool.read" , "tool.write" ] # optional override
bearer_example :
auth_type : "bearer_token"
auth_value : "abc123" # headers={"Authorization": "Bearer abc123"}
basic_example :
auth_type : "basic"
auth_value : "dXNlcjpwYXNz" # headers={"Authorization": "Basic dXNlcjpwYXNz"}
custom_auth_example :
auth_type : "authorization"
auth_value : "Token example123" # headers={"Authorization": "Token example123"}
# AWS SigV4 for Bedrock AgentCore MCP servers
agentcore_mcp :
url : "https://bedrock-agentcore.us-east-1.amazonaws.com/runtimes/<url-encoded-ARN>/invocations"
auth_type : "aws_sigv4"
aws_role_name : os.environ/AWS_ROLE_ARN # optional — IAM role to assume
aws_access_key_id : os.environ/AWS_ACCESS_KEY_ID # optional — falls back to IAM role
aws_secret_access_key : os.environ/AWS_SECRET_ACCESS_KEY
aws_region_name : us - east - 1
aws_service_name : bedrock - agentcore
# Example with extra headers forwarding
github_mcp :
url : "https://api.githubcopilot.com/mcp"
auth_value : "ghp_example_token"
extra_headers : [ "custom_key" , "x-custom-header" ] # These headers will be forwarded from client
# Example with static headers
my_mcp_server :
static_headers : # These headers will be requested to the MCP server
X-API-Key : "abc123"
X-Custom-Header : "some-value"
MCP Walkthroughs ​
Strands (STDIO) – watch tutorial
Add it from the UI
strands-mcp
{
"mcpServers" : {
"strands-agents" : {
"command" : "uvx" ,
"args" : [ "strands-agents-mcp-server" ] ,
"env" : {
"FASTMCP_LOG_LEVEL" : "INFO"
} ,
"disabled" : false ,
"autoApprove" : [ "search_docs" , "fetch_doc" ]
}
config.yml
config.yml – strands MCP
strands_mcp :
command : "uvx"
args : [ "strands-agents-mcp-server" ]
FASTMCP_LOG_LEVEL : "INFO"
MCP Aliases ​
You can define aliases for your MCP servers in the litellm_settings section. This allows you to:
Map friendly names to server names : Use shorter, more memorable aliases
Override server aliases : If a server doesn't have an alias defined, the system will use the first matching alias from mcp_aliases
Ensure uniqueness : Only the first alias for each server is used, preventing conflicts
Example:
"github" : "github_mcp_server" # Maps "github" alias to "github_mcp_server"
"zapier" : "zapier_mcp_server" # Maps "zapier" alias to "zapier_mcp_server"
"docs" : "deepwiki_mcp_server" # Maps "docs" alias to "deepwiki_mcp_server"
"github_alt" : "github_mcp_server" # This will be ignored since "github" already maps to this server
Benefits:
Simplified tool access : Use github_create_issue instead of github_mcp_server_create_issue
Consistent naming : Standardize alias patterns across your organization
Easy migration : Change server names without breaking existing tool references
Converting OpenAPI Specs to MCP Servers ​
LiteLLM can convert OpenAPI specifications into MCP servers, exposing any REST API as MCP tools without writing custom server code.
See the MCP from OpenAPI Specs guide for full setup, usage examples, and how to override tool names and descriptions.
MCP OAuth ​
LiteLLM supports OAuth 2.0 for MCP servers -- both interactive (PKCE) flows for user-facing clients and machine-to-machine (M2M) client_credentials for backend services.
See the MCP OAuth guide for setup instructions, sequence diagrams, and a test server.
Detailed OAuth reference (click to expand)
LiteLLM v 1.77.6 added support for OAuth 2.0 Client Credentials for MCP servers.
You can configure this either in config.yaml or directly from the LiteLLM UI (MCP Servers → Authentication → OAuth).
auth_type : oauth2
client_id : os.environ/GITHUB_OAUTH_CLIENT_ID
client_secret : os.environ/GITHUB_OAUTH_CLIENT_SECRET
See Claude Code Tutorial
How It Works ​
Participants
Client – The MCP-capable AI agent (e.g., Claude Code, Cursor, or another IDE/agent) that initiates OAuth discovery, authorization, and tool invocations on behalf of the user.
LiteLLM Proxy – Mediates all OAuth discovery, registration, token exchange, and MCP traffic while protecting stored credentials.
Authorization Server – Issues OAuth 2.0 tokens via dynamic client registration, PKCE authorization, and token endpoints.
MCP Server (Resource Server) – The protected MCP endpoint that receives LiteLLM’s authenticated JSON-RPC requests.
User-Agent (Browser) – Temporarily involved so the end user can grant consent during the authorization step.
Flow Steps
Resource Discovery : The client fetches MCP resource metadata from LiteLLM’s .well-known/oauth-protected-resource endpoint to understand scopes and capabilities.
Authorization Server Discovery : The client retrieves the OAuth server metadata (token endpoint, authorization endpoint, supported PKCE methods) through LiteLLM’s .well-known/oauth-authorization-server endpoint.
Dynamic Client Registration : The client registers through LiteLLM, which forwards the request to the authorization server (RFC 7591). If the provider doesn’t support dynamic registration, you can pre-store client_id / client_secret in LiteLLM (e.g., GitHub MCP) and the flow proceeds the same way.
User Authorization : The client launches a browser session (with code challenge and resource hints). The user approves access, the authorization server sends the code through LiteLLM back to the client.
Token Exchange : The client calls LiteLLM with the authorization code, code verifier, and resource. LiteLLM exchanges them with the authorization server and returns the issued access/refresh tokens.
MCP Invocation : With a valid token, the client sends the MCP JSON-RPC request (plus LiteLLM API key) to LiteLLM, which forwards it to the MCP server and relays the tool response.
See the official MCP Authorization Flow for additional reference.
Forwarding Custom Headers to MCP Servers ​
LiteLLM supports forwarding additional custom headers from MCP clients to backend MCP servers using the extra_headers configuration parameter. This allows you to pass custom authentication tokens, API keys, or other headers that your MCP server requires.
Configuration
Dynamically on Client Side
Configure extra_headers in your MCP server configuration to specify which header names should be forwarded:
config.yaml with extra_headers
auth_value : "ghp_default_token"
extra_headers : [ "custom_key" , "x-custom-header" , "Authorization" ]
description : "GitHub MCP server with custom header forwarding"
Use this when giving users access to a group of MCP servers .
Format: x-mcp-{server_alias}-{header_name}: value
This allows you to use different authentication for different MCP servers.
Examples:
x-mcp-github-authorization: Bearer ghp_xxxxxxxxx - GitHub MCP server with Bearer token
x-mcp-zapier-x-api-key: sk-xxxxxxxxx - Zapier MCP server with API key
x-mcp-deepwiki-authorization: Basic base64_encoded_creds - DeepWiki MCP server with Basic auth
Python Client with Server-Specific Auth
from fastmcp import Client
import asyncio
# Standard MCP configuration with multiple servers
config = {
"mcp_group" : {
"url" : "http://localhost:4000/mcp/" ,
"headers" : {
"x-mcp-servers" : "dev_group" , # assume this gives access to github, zapier and deepwiki
"x-litellm-api-key" : "Bearer sk-1234" ,
"x-mcp-github-authorization" : "Bearer gho_token" ,
"x-mcp-zapier-x-api-key" : "sk-xxxxxxxxx" ,
"x-mcp-deepwiki-authorization" : "Basic base64_encoded_creds" ,
"custom_key" : "value"
# Create a client that connects to all servers
client = Client ( config )
async def main ( ) :
async with client :
tools = await client . list_tools ( )
print ( f"Available tools: { tools } " )
# call mcp
await client . call_tool (
name = "github_mcp-search_issues" ,
arguments = { 'query' : 'created:>2024-01-01' , 'sort' : 'created' , 'order' : 'desc' , 'perPage' : 30 }
)
if __name__ == "__main__" :
asyncio . run ( main ( ) )
Server-specific authentication : Each MCP server can use different auth methods
Better security : No need to share the same auth token across all servers
Flexible header names : Support for different auth header types (authorization, x-api-key, etc.)
Clean separation : Each server's auth is clearly identified
Client Usage ​
When connecting from MCP clients, include the custom headers that match the extra_headers configuration:
Python FastMCP
Cursor IDE
HTTP Client
FastMCP Client with Custom Headers
# MCP client configuration with custom headers
"github" : {
"url" : "http://localhost:4000/github_mcp/mcp" ,
"Authorization" : "Bearer gho_token" ,
"custom_key" : "custom_value" ,
"x-custom-header" : "additional_data"
# Create a client that connects to the server
# List available tools
# Call a tool if available
if tools :
result = await client . call_tool ( tools [ 0 ] . name , { } )
print ( f"Tool result: { result } " )
# Run the client
Cursor MCP Configuration with Custom Headers
"GitHub" : {
"x-litellm-api-key" : "Bearer $LITELLM_API_KEY" ,
"Authorization" : "Bearer $GITHUB_TOKEN" ,
cURL with Custom Headers
curl --location 'http://localhost:4000/github_mcp/mcp' \
--header 'Content-Type: application/json' \
--header 'x-litellm-api-key: Bearer sk-1234' \
--header 'Authorization: Bearer gho_token' \
--header 'custom_key: custom_value' \
--header 'x-custom-header: additional_data' \
--data '{
"jsonrpc": "2.0",
"id": 1,
"method": "tools/list"
}'
Configuration : Define extra_headers in your MCP server config with the header names you want to forward
Client Headers : Include the corresponding headers in your MCP client requests
Header Forwarding : LiteLLM automatically forwards matching headers to the backend MCP server
Authentication : The backend MCP server receives both the configured auth headers and the custom headers
Passing Request Headers to STDIO env Vars ​
If your stdio MCP server needs per-request credentials, you can map HTTP headers from the client request directly into the environment for the launched stdio process. Reference the header name in the env value using the ${X-HEADER_NAME} syntax. LiteLLM will read that header from the incoming request and set the env var before starting the command.
Forward X-GITHUB_PERSONAL_ACCESS_TOKEN header to stdio env
"command" : "docker" ,
"args" : [
"run" ,
"-i" ,
"--rm" ,
"-e" ,
"GITHUB_PERSONAL_ACCESS_TOKEN" ,
"ghcr.io/github/github-mcp-server"
] ,
"GITHUB_PERSONAL_ACCESS_TOKEN" : "${X-GITHUB_PERSONAL_ACCESS_TOKEN}"
In this example, when a client makes a request with the X-GITHUB_PERSONAL_ACCESS_TOKEN header, the proxy forwards that value into the stdio process as the GITHUB_PERSONAL_ACCESS_TOKEN environment variable.
Control MCP Access for End Users ​
Control which MCP servers end users of your AI application can access (e.g. users of an internal chat UI). Pass the customer ID in the x-litellm-end-user-id header to:
Enforce object permissions (limit which MCP servers they can access)
Apply customer-specific budgets
Track spend per customer
FastMCP Client Example:
Track customer spend with x-litellm-end-user-id
# MCP client configuration with customer tracking
"x-litellm-end-user-id" : "customer_123" , # 👈 CUSTOMER ID
"Authorization" : "Bearer gho_token"
# All MCP calls will be tracked under customer_123
Cursor IDE Example:
Cursor config with customer tracking
"x-litellm-end-user-id" : "customer_123"
What happens:
Customer-specific object permissions are enforced (only allowed MCP servers are accessible)
Customer budgets are applied
All tool calls are tracked under customer_123
Learn more about customer management →
Calling the Proxy's /v1/responses Endpoint ​
When calling your LiteLLM Proxy's /v1/responses endpoint to use MCP tools, always use server_url: "litellm_proxy" in the tools array. This tells the proxy to use its configured MCP servers.
Do not use the full proxy URL
Using server_url: "https://your-proxy.com/mcp" is incorrect when the request is already going to the proxy. The proxy needs the literal value litellm_proxy to route to its configured MCP servers.
Correct: Using litellm_proxy
curl --location 'https://your-proxy.com/v1/responses' \
--header "Authorization: Bearer $LITELLM_API_KEY" \
"model": "gpt-4",
"tools": [
"type": "mcp",
"server_label": "litellm",
"server_url": "litellm_proxy",
"require_approval": "never"
],
"input": "Run available tools",
"tool_choice": "required"
Sending Custom Headers to MCP Servers ​
To pass custom headers (e.g., API keys, auth tokens) to specific MCP servers, use either:
Option 1: Request headers – Add x-mcp-{server_alias}-{header_name} to your request headers. The proxy forwards these to the matching MCP server.
# Send Authorization header to the "weather2" MCP server
--header 'x-mcp-weather2-authorization: Bearer your-token'
# Send custom header to the "github" MCP server
--header 'x-mcp-github-x-api-key: your-api-key'
Option 2: Headers in tool config – Include a headers object in the tool definition. These are merged with request headers.
"type" : "mcp" ,
"server_label" : "litellm" ,
"server_url" : "litellm_proxy" ,
"require_approval" : "never" ,
"x-litellm-api-key" : "Bearer YOUR_LITELLM_API_KEY" ,
"x-mcp-servers" : "Zapier_MCP,dev-group" ,
"x-mcp-weather2-authorization" : "Bearer your-weather-api-token"
Using your MCP with client side credentials ​
Use this if you want to pass a client side authentication token to LiteLLM to then pass to your MCP to auth to your MCP.
New Server-Specific Auth Headers (Recommended) ​
You can specify MCP auth tokens using server-specific headers in the format x-mcp-{server_alias}-{header_name} . This allows you to use different authentication for different MCP servers.
Legacy Auth Header (Deprecated) ​
You can also specify your MCP auth token using the header x-mcp-auth . This will be forwarded to all MCP servers and is deprecated in favor of server-specific headers.
OpenAI API
LiteLLM Proxy
Connect via OpenAI Responses API with Server-Specific Auth ​
Use the OpenAI Responses API and include server-specific auth headers:
cURL Example with Server-Specific Auth
curl --location 'https://api.openai.com/v1/responses' \
--header "Authorization: Bearer $OPENAI_API_KEY" \
"model": "gpt-4o",
"require_approval": "never",
"headers": {
"x-litellm-api-key": "Bearer YOUR_LITELLM_API_KEY",
"x-mcp-github-authorization": "Bearer YOUR_GITHUB_TOKEN",
"x-mcp-zapier-x-api-key": "YOUR_ZAPIER_API_KEY"
Connect via OpenAI Responses API with Legacy Auth ​
Use the OpenAI Responses API and include the x-mcp-auth header for your MCP server authentication:
cURL Example with Legacy MCP Auth
"x-mcp-auth": YOUR_MCP_AUTH_TOKEN
Connect via LiteLLM Proxy Responses API with Server-Specific Auth ​
Use this when calling LiteLLM Proxy for LLM API requests to /v1/responses endpoint with server-specific authentication:
curl --location '<your-litellm-proxy-base-url>/v1/responses' \
Connect via LiteLLM Proxy Responses API with Legacy Auth ​
Use this when calling LiteLLM Proxy for LLM API requests to /v1/responses endpoint with MCP authentication:
"x-mcp-auth": "YOUR_MCP_AUTH_TOKEN"
Connect via Cursor IDE with Server-Specific Auth ​
Use tools directly from Cursor IDE with LiteLLM MCP and include server-specific authentication:
Setup Instructions:
Open Cursor Settings : Use ⇧+⌘+J (Mac) or Ctrl+Shift+J (Windows/Linux)
Navigate to MCP Tools : Go to the "MCP Tools" tab and click "New MCP Server"
Add Configuration : Copy and paste the JSON configuration below, then save with Cmd+S or Ctrl+S
Cursor MCP Configuration with Server-Specific Auth
"LiteLLM" : {
"url" : "litellm_proxy" ,
"x-mcp-github-authorization" : "Bearer $GITHUB_TOKEN" ,
"x-mcp-zapier-x-api-key" : "$ZAPIER_API_KEY"
Connect via Cursor IDE with Legacy Auth ​
Use tools directly from Cursor IDE with LiteLLM MCP and include your MCP authentication token:
Cursor MCP Configuration with Legacy Auth
"x-mcp-auth" : "$MCP_AUTH_TOKEN"
Connect via Streamable HTTP Transport with Server-Specific Auth ​
Connect to LiteLLM MCP using HTTP transport with server-specific authentication:
Server URL:
litellm_proxy
Headers:
x-litellm-api-key: Bearer YOUR_LITELLM_API_KEY
x-mcp-github-authorization: Bearer YOUR_GITHUB_TOKEN
x-mcp-zapier-x-api-key: YOUR_ZAPIER_API_KEY
Connect via Streamable HTTP Transport with Legacy Auth ​
Connect to LiteLLM MCP using HTTP transport with MCP authentication:
x-mcp-auth: Bearer YOUR_MCP_AUTH_TOKEN
This URL can be used with any MCP client that supports HTTP transport. The x-mcp-auth header will be forwarded to your MCP server for authentication.
Connect via Python FastMCP Client with Server-Specific Auth ​
Use the Python FastMCP client to connect to your LiteLLM MCP server with server-specific authentication:
Python FastMCP Example with Server-Specific Auth
import json
from fastmcp . client . transports import StreamableHttpTransport
# Create the transport with your LiteLLM MCP server URL and server-specific auth headers
server_url = "litellm_proxy"
transport = StreamableHttpTransport (
server_url ,
headers = {
"x-mcp-github-authorization" : "Bearer YOUR_GITHUB_TOKEN" ,
"x-mcp-zapier-x-api-key" : "YOUR_ZAPIER_API_KEY"
# Initialize the client with the transport
client = Client ( transport = transport )
# Connection is established here
print ( "Connecting to LiteLLM MCP server with server-specific authentication..." )
print ( f"Client connected: { client . is_connected ( ) } " )
# Make MCP calls within the context
print ( "Fetching available tools..." )
print ( f"Available tools: { json . dumps ( [ t . name for t in tools ] , indent = 2 ) } " )
# Example: Call a tool (replace 'tool_name' with an actual tool name)
tool_name = tools [ 0 ] . name
print ( f"Calling tool: { tool_name } " )
# Call the tool with appropriate arguments
result = await client . call_tool ( tool_name , arguments = { } )
# Run the example
Connect via Python FastMCP Client with Legacy Auth ​
Use the Python FastMCP client to connect to your LiteLLM MCP server with MCP authentication:
Python FastMCP Example with Legacy MCP Auth
# Create the transport with your LiteLLM MCP server URL and auth headers
"x-mcp-auth" : "Bearer YOUR_MCP_AUTH_TOKEN"
print ( "Connecting to LiteLLM MCP server with authentication..." )
Customize the MCP Auth Header Name ​
By default, LiteLLM uses x-mcp-auth to pass your credentials to MCP servers. You can change this header name in one of the following ways:
Set the LITELLM_MCP_CLIENT_SIDE_AUTH_HEADER_NAME environment variable
Environment Variable
export LITELLM_MCP_CLIENT_SIDE_AUTH_HEADER_NAME="authorization"
Set the mcp_client_side_auth_header_name in the general settings on the config.yaml file
mcp_client_side_auth_header_name : "authorization"
Using the authorization header ​
In this example the authorization header will be passed to the MCP server for authentication.
cURL with authorization header
"authorization": "Bearer sk-zapier-token-123"
Use MCP tools with /chat/completions ​
Works with all providers
This flow is provider-agnostic : the same MCP tool definition works for every LLM backend behind LiteLLM (OpenAI, Azure OpenAI, Anthropic, Amazon Bedrock, Vertex, self-hosted deployments, etc.).
LiteLLM Proxy also supports MCP-aware tooling on the classic /v1/chat/completions endpoint. Provide the MCP tool definition directly in the tools array and LiteLLM will fetch and transform the MCP server's tools into OpenAI-compatible function calls. When require_approval is set to "never" , the proxy automatically executes the returned tool calls and feeds the results back into the model before returning the assistant response.
Chat Completions with MCP Tools
curl --location '<your-litellm-proxy-base-url>/v1/chat/completions' \
"model": "gpt-4o-mini",
"messages": [
{"role": "user", "content": "Summarize the latest open PR."}
"server_url": "litellm_proxy/mcp/github",
"server_label": "github_mcp",
]
If you omit require_approval or set it to any value other than "never" , the MCP tool calls are returned to the client so that you can review and execute them manually, matching the upstream OpenAI behavior.
LiteLLM Proxy - Walk through MCP Gateway ​
LiteLLM exposes an MCP Gateway for admins to add all their MCP servers to LiteLLM. The key benefits of using LiteLLM Proxy with MCP are:
Use a fixed endpoint for all MCP tools
MCP Permission management by Key, Team, or User
This video demonstrates how you can onboard an MCP server to LiteLLM Proxy, use it and set access controls.
LiteLLM Python SDK MCP Bridge ​
LiteLLM Python SDK acts as a MCP bridge to utilize MCP tools with all LiteLLM supported models. LiteLLM offers the following features for using MCP
List Available MCP Tools: OpenAI clients can view all available MCP tools
litellm.experimental_mcp_client.load_mcp_tools to list all available MCP tools
Call MCP Tools: OpenAI clients can call MCP tools
litellm.experimental_mcp_client.call_openai_tool to call an OpenAI tool on an MCP server
1. List Available MCP Tools ​
In this example we'll use litellm.experimental_mcp_client.load_mcp_tools to list all available MCP tools on any MCP server. This method can be used in two ways:
format="mcp" - (default) Return MCP tools
Returns: mcp.types.Tool
format="openai" - Return MCP tools converted to OpenAI API compatible tools. Allows using with OpenAI endpoints.
Returns: openai.types.chat.ChatCompletionToolParam
LiteLLM Python SDK
OpenAI SDK + LiteLLM Proxy
MCP Client List Tools
# Create server parameters for stdio connection
from mcp import ClientSession , StdioServerParameters
from mcp . client . stdio import stdio_client
import os
import litellm
from litellm import experimental_mcp_client
server_params = StdioServerParameters (
command = "python3" ,
# Make sure to update to the full absolute path to your mcp_server.py file
args = [ "./mcp_server.py" ] ,
async with stdio_client ( server_params ) as ( read , write ) :
async with ClientSession ( read , write ) as session :
# Initialize the connection
await session . initialize ( )
# Get tools
tools = await experimental_mcp_client . load_mcp_tools ( session = session , format = "openai" )
print ( "MCP TOOLS: " , tools )
messages = [ { "role" : "user" , "content" : "what's (3 + 5)" } ]
llm_response = await litellm . acompletion (
model = "gpt-4o" ,
api_key = os . getenv ( "OPENAI_API_KEY" ) ,
messages = messages ,
tools = tools ,
print ( "LLM RESPONSE: " , json . dumps ( llm_response , indent = 4 , default = str ) )
In this example we'll walk through how you can use the OpenAI SDK pointed to the LiteLLM proxy to call MCP tools. The key difference here is we use the OpenAI SDK to make the LLM API request
from openai import OpenAI
# Get tools using litellm mcp client
# Use OpenAI SDK pointed to LiteLLM proxy
client = OpenAI (
api_key = "your-api-key" , # Your LiteLLM proxy API key
base_url = "http://localhost:4000" # Your LiteLLM proxy URL
llm_response = client . chat . completions . create (
model = "gpt-4" ,
tools = tools
print ( "LLM RESPONSE: " , llm_response )
2. List and Call MCP Tools ​
In this example we'll use
litellm.experimental_mcp_client.load_mcp_tools to list all available MCP tools on any MCP server
The first llm response returns a list of OpenAI tools. We take the first tool call from the LLM response and pass it to litellm.experimental_mcp_client.call_openai_tool to call the tool on the MCP server.
How litellm.experimental_mcp_client.call_openai_tool works ​
Accepts an OpenAI Tool Call from the LLM response
Converts the OpenAI Tool Call to an MCP Tool
Calls the MCP Tool on the MCP server
Returns the result of the MCP Tool call
MCP Client List and Call Tools
openai_tool = llm_response [ "choices" ] [ 0 ] [ "message" ] [ "tool_calls" ] [ 0 ]
# Call the tool using MCP client
call_result = await experimental_mcp_client . call_openai_tool (
session = session ,
openai_tool = openai_tool ,
print ( "MCP TOOL CALL RESULT: " , call_result )
# send the tool result to the LLM
messages . append ( llm_response [ "choices" ] [ 0 ] [ "message" ] )
messages . append (
"role" : "tool" ,
"content" : str ( call_result . content [ 0 ] . text ) ,
"tool_call_id" : openai_tool [ "id" ] ,
print ( "final messages with tool result: " , messages )
print (
"FINAL LLM RESPONSE: " , json . dumps ( llm_response , indent = 4 , default = str )
MCP Client with OpenAI SDK
base_url = "http://localhost:8000" # Your LiteLLM proxy URL
# Get the first tool call
tool_call = llm_response . choices [ 0 ] . message . tool_calls [ 0 ]
openai_tool = tool_call . model_dump ( ) ,
# Send the tool result back to the LLM
messages . append ( llm_response . choices [ 0 ] . message . model_dump ( ) )
messages . append ( {
"tool_call_id" : tool_call . id ,
} )
final_response = client . chat . completions . create (
print ( "FINAL RESPONSE: " , final_response )
FAQ ​
Q: How do I use OAuth2 client_credentials (machine-to-machine) with MCP servers behind LiteLLM?
LiteLLM supports automatic token management for the client_credentials grant. Configure client_id , client_secret , and token_url on your MCP server and LiteLLM will fetch, cache, and refresh tokens automatically. See the MCP OAuth M2M guide for setup instructions.
Q: When I fetch an OAuth token from the LiteLLM UI, where is it stored?
The UI keeps only transient state in sessionStorage so the OAuth redirect flow can finish; the token is not persisted in the server or database.
Q: I'm seeing MCP connection errors—what should I check?
Walk through the MCP Troubleshooting Guide for step-by-step isolation (Client → LiteLLM vs. LiteLLM → MCP), log examples, and verification methods like MCP Inspector and curl .
Overview
Adding your MCP
Prerequisites
Add HTTP MCP Server
Add SSE MCP Server
Add STDIO MCP Server
OAuth Configuration & Overrides
AWS SigV4 Authentication
Static Headers
Server Variables
MCP Walkthroughs
MCP Aliases
Converting OpenAPI Specs to MCP Servers
MCP OAuth
How It Works
Forwarding Custom Headers to MCP Servers
Passing Request Headers to STDIO env Vars
Control MCP Access for End Users
Calling the Proxy's /v1/responses Endpoint
Sending Custom Headers to MCP Servers
Using your MCP with client side credentials
New Server-Specific Auth Headers (Recommended)
Legacy Auth Header (Deprecated)
Customize the MCP Auth Header Name
Use MCP tools with /chat/completions
LiteLLM Proxy - Walk through MCP Gateway
LiteLLM Python SDK MCP Bridge
1. List Available MCP Tools
2. List and Call MCP Tools
FAQ
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
