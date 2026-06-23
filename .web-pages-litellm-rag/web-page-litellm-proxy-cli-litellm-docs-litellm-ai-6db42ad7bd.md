# LiteLLM Proxy CLI | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/proxy/management_cli
- Final URL: https://docs.litellm.ai/docs/proxy/management_cli
- Canonical URL: https://docs.litellm.ai/docs/proxy/management_cli
- Fetched at: 2026-06-23T14:31:22Z
- Content type: text/html; charset=utf-8

## Description

The lite CLI is a command-line tool for managing your LiteLLM proxy

## Extracted Text

Skip to main content
On this page
Copy as Markdown
The lite CLI is a command-line tool for managing your LiteLLM proxy
server. It provides commands for managing models, credentials, API keys, users,
and more, as well as making chat and HTTP requests to the proxy server.
Feature What you can do Models Management List, add, update, and delete models Credentials Management Manage provider credentials Keys Management Generate, list, and delete API keys User Management Create, list, and delete users Chat Completions Run chat completions HTTP Requests Make custom HTTP requests to the proxy server
Quick Start ​
Install the CLI
The lite client is a thin laptop install: it points at a LiteLLM proxy and runs your coding agents through it, with none of the proxy server runtime pulled in. The one-line installer needs only curl ; it bootstraps uv when it's missing and lets uv provision a compatible Python for you:
curl -fsSL https://raw.githubusercontent.com/BerriAI/litellm/main/scripts/install-cli.sh | sh
On macOS you can install it with Homebrew instead:
brew install BerriAI/litellm/lite
Already have uv and prefer to drive it yourself? Install the package directly:
uv tool install 'litellm[cli]'
Any of these gives you the lite command; if you already run a proxy server from litellm[proxy] , it ships there too. Start by typing it in your terminal:
lite
Set up environment variables
export LITELLM_PROXY_URL=http://localhost:4000
export LITELLM_PROXY_API_KEY=sk-your-key
(Replace with your actual proxy URL and API key)
Make your first request (list models)
lite models list
If the CLI is set up correctly, you should see a list of available models or a table output.
Troubleshooting
If you see an error, check your environment variables and proxy server status.
Authentication using CLI ​
You can use the CLI to authenticate to the LiteLLM Gateway. This is great if you're trying to give a large number of developers self-serve access to the LiteLLM Gateway.
info
For an indepth guide, see CLI Authentication .
Prerequisites ​
Beta Feature - Required Environment Variable
CLI SSO Authentication is currently in beta. You must set this environment variable when starting up your LiteLLM Proxy :
export EXPERIMENTAL_UI_LOGIN="True"
litellm --config config.yaml
Or add it to your proxy startup command:
EXPERIMENTAL_UI_LOGIN="True" litellm --config config.yaml
Steps ​
Set up the proxy URL
(Replace with your actual proxy URL)
Login
lite login
This will open a browser window to authenticate. If you have connected LiteLLM Proxy to your SSO provider, you can login with your SSO credentials. Once logged in, you can use the CLI to make requests to the LiteLLM Gateway.
Test your authentication
This will list all the models available to you.
Main Commands ​
Models Management ​
List, add, update, get, and delete models on the proxy.
Example:
lite models add gpt-4 \
--param api_key=sk-123 \
--param max_tokens=2048
lite models update <model-id> -p temperature=0.7
lite models delete <model-id>
API used (OpenAPI)
Credentials Management ​
List, create, get, and delete credentials for LLM providers.
lite credentials list
lite credentials create azure-prod \
--info='{"custom_llm_provider": "azure"}' \
--values='{"api_key": "sk-123", "api_base": "https://prod.azure.openai.com"}'
lite credentials get azure-cred
lite credentials delete azure-cred
Keys Management ​
List, generate, get info, and delete API keys.
lite keys list
lite keys generate \
--models=gpt-4 \
--spend=100 \
--duration=24h \
--key-alias=my-key
lite keys info --key sk-key1
lite keys delete --keys sk-key1,sk-key2 --key-aliases alias1,alias2
User Management ​
List, create, get info, and delete users.
lite users list
lite users create \
--email=user@example.com \
--role=internal_user \
--alias="Alice" \
--team=team1 \
--max-budget=100.0
lite users get --id <user-id>
lite users delete <user-id>
Chat Completions ​
Ask for chat completions from the proxy server.
lite chat completions gpt-4 -m "user:Hello, how are you?"
General HTTP Requests ​
Make direct HTTP requests to the proxy server.
lite http request \
POST /chat/completions \
--json '{"model": "gpt-4", "messages": [{"role": "user", "content": "Hello"}]}'
All APIs (OpenAPI)
Environment Variables ​
LITELLM_PROXY_URL : Base URL of the proxy server
LITELLM_PROXY_API_KEY : API key for authentication
Examples ​
List all models:
Add a new model:
Create a credential:
Generate an API key:
Chat completion:
lite chat completions gpt-4 \
-m "user:Write a story"
Custom HTTP request:
Error Handling ​
The CLI will display error messages for:
Server not accessible
Authentication failures
Invalid parameters or JSON
Nonexistent models/credentials
Any other operation failures
Use the --debug flag for detailed debugging output.
For full command reference and advanced usage, see the CLI README .
Quick Start
Authentication using CLI
Prerequisites
Steps
Main Commands
Models Management
Credentials Management
Keys Management
User Management
Chat Completions
General HTTP Requests
Environment Variables
Examples
Error Handling
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
