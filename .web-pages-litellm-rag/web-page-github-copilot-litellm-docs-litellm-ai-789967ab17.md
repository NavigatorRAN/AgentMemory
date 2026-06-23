# GitHub Copilot | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/github_copilot
- Final URL: https://docs.litellm.ai/docs/providers/github_copilot
- Canonical URL: https://docs.litellm.ai/docs/providers/github_copilot
- Fetched at: 2026-06-23T14:27:55Z
- Content type: text/html; charset=utf-8

## Description

https://docs.github.com/en/copilot

## Extracted Text

Skip to main content
On this page
Copy as Markdown
https://docs.github.com/en/copilot
tip
We support GitHub Copilot Chat API with automatic authentication handling
Property Details Description GitHub Copilot Chat API provides access to GitHub's AI-powered coding assistant. Provider Route on LiteLLM github_copilot/ Supported Endpoints /chat/completions , /embeddings API Reference GitHub Copilot docs
Authentication ​
GitHub Copilot uses OAuth device flow for authentication. On first use, you'll be prompted to authenticate via GitHub:
LiteLLM will display a device code and verification URL
Visit the URL and enter the code to authenticate
Your credentials will be stored locally for future use
Usage - LiteLLM Python SDK ​
Chat Completion ​
GitHub Copilot Chat Completion
from litellm import completion
response = completion (
model = "github_copilot/gpt-4" ,
messages = [
{ "role" : "system" , "content" : "You are a helpful coding assistant" } ,
{ "role" : "user" , "content" : "Write a Python function to calculate fibonacci numbers" }
]
)
print ( response )
GitHub Copilot Chat Completion - Streaming
stream = completion (
messages = [ { "role" : "user" , "content" : "Explain async/await in Python" } ] ,
stream = True
for chunk in stream :
if chunk . choices [ 0 ] . delta . content is not None :
print ( chunk . choices [ 0 ] . delta . content , end = "" )
Responses ​
For GPT Codex models, only responses API is supported.
GitHub Copilot Responses
import litellm
response = await litellm . aresponses (
model = "github_copilot/gpt-5.1-codex" ,
input = "Write a Python hello world" ,
max_output_tokens = 500
Embedding ​
GitHub Copilot Embedding
response = litellm . embedding (
model = "github_copilot/text-embedding-3-small" ,
input = [ "good morning from litellm" ]
Usage - LiteLLM Proxy ​
Add the following to your LiteLLM Proxy configuration file:
config.yaml
model_list :
- model_name : github_copilot/gpt - 4
litellm_params :
model : github_copilot/gpt - 4
- model_name : github_copilot/gpt - 5.1 - codex
model_info :
mode : responses
model : github_copilot/gpt - 5.1 - codex
- model_name : github_copilot/text - embedding - ada - 002
mode : embedding
model : github_copilot/text - embedding - ada - 002
Start your LiteLLM Proxy server:
Start LiteLLM Proxy
litellm --config config.yaml
# RUNNING on http://0.0.0.0:4000
OpenAI SDK
LiteLLM SDK
cURL
GitHub Copilot via Proxy - Non-streaming
from openai import OpenAI
# Initialize client with your proxy URL
client = OpenAI (
base_url = "http://localhost:4000" , # Your proxy URL
api_key = "your-proxy-api-key" # Your proxy API key
# Non-streaming response
response = client . chat . completions . create (
messages = [ { "role" : "user" , "content" : "How do I optimize this SQL query?" } ]
print ( response . choices [ 0 ] . message . content )
GitHub Copilot via Proxy - LiteLLM SDK
# Configure LiteLLM to use your proxy
response = litellm . completion (
model = "litellm_proxy/github_copilot/gpt-4" ,
messages = [ { "role" : "user" , "content" : "Review this code for bugs" } ] ,
api_base = "http://localhost:4000" ,
api_key = "your-proxy-api-key"
GitHub Copilot via Proxy - cURL
curl http://localhost:4000/v1/chat/completions \
-H "Content-Type: application/json" \
-H "Authorization: Bearer your-proxy-api-key" \
-d '{
"model": "github_copilot/gpt-4",
"messages": [{"role": "user", "content": "Explain this error message"}]
}'
Getting Started ​
Ensure you have GitHub Copilot access (paid GitHub subscription required)
Run your first LiteLLM request - you'll be prompted to authenticate
Follow the device flow authentication process
Start making requests to GitHub Copilot through LiteLLM
Configuration ​
Environment Variables ​
You can customize token storage locations:
Environment Variables
# Optional: Custom token directory
export GITHUB_COPILOT_TOKEN_DIR="~/.config/litellm/github_copilot"
# Optional: Custom access token file name
export GITHUB_COPILOT_ACCESS_TOKEN_FILE="access-token"
# Optional: Custom API key file name
export GITHUB_COPILOT_API_KEY_FILE="api-key.json"
# Optional: Custom Copilot endpoints for authentication and usage
# (needed when using GitHub Enterprise subscriptions with custom endpoints or self-hosted GitHub servers
export GITHUB_COPILOT_API_BASE="https://copilot-api.my-company.ghe.com"
export GITHUB_COPILOT_DEVICE_CODE_URL="https://my-company.ghe.com/login/device/code"
export GITHUB_COPILOT_ACCESS_TOKEN_URL="https://my-company.ghe.com/login/oauth/access_token"
export GITHUB_COPILOT_API_KEY_URL="https://my-company.ghe.com/api/v3/copilot_internal/v2/token"
Headers ​
LiteLLM automatically injects the required GitHub Copilot headers (simulating VSCode). You don't need to specify them manually.
If you want to override the defaults (e.g., to simulate a different editor), you can use extra_headers :
Custom Headers (Optional)
extra_headers = {
"editor-version" : "vscode/1.85.1" , # Editor version
"editor-plugin-version" : "copilot/1.155.0" , # Plugin version
"Copilot-Integration-Id" : "vscode-chat" , # Integration ID
"user-agent" : "GithubCopilot/1.155.0" # User agent
}
Authentication
Usage - LiteLLM Python SDK
Chat Completion
Responses
Embedding
Usage - LiteLLM Proxy
Getting Started
Configuration
Headers
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
