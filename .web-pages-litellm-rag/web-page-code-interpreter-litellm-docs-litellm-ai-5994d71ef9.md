# Code Interpreter | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/guides/code_interpreter
- Final URL: https://docs.litellm.ai/docs/guides/code_interpreter
- Canonical URL: https://docs.litellm.ai/docs/guides/code_interpreter
- Fetched at: 2026-06-23T14:24:03Z
- Content type: text/html; charset=utf-8

## Description

Use OpenAI's Code Interpreter tool to execute Python code in a secure, sandboxed environment.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Use OpenAI's Code Interpreter tool to execute Python code in a secure, sandboxed environment.
Feature Supported LiteLLM Python SDK ✅ LiteLLM AI Gateway ✅ Supported Providers openai
Route code interpreter to your own sandbox
The proxy can intercept code_interpreter on /v1/responses and run the code in a configured sandbox (e2b today) instead of OpenAI's container, with no change to the client request. The response shape stays identical ( code_interpreter_call next to message ). See Code Interpreter Sandbox Interception .
LiteLLM AI Gateway ​
API (OpenAI SDK) ​
Use the OpenAI SDK pointed at your LiteLLM Gateway:
code_interpreter_gateway.py
from openai import OpenAI
client = OpenAI (
api_key = "sk-1234" , # Your LiteLLM API key
base_url = "http://localhost:4000"
)
response = client . responses . create (
model = "openai/gpt-4o" ,
tools = [ { "type" : "code_interpreter" } ] ,
input = "Calculate the first 20 fibonacci numbers and plot them"
print ( response )
Streaming ​
code_interpreter_streaming.py
api_key = "sk-1234" ,
stream = client . responses . create (
input = "Generate sample sales data CSV and create a visualization" ,
stream = True
for event in stream :
print ( event )
Get Generated File Content ​
get_file_content_gateway.py
# 1. Run code interpreter
input = "Create a scatter plot and save as PNG"
# 2. Get container_id from response
container_id = response . output [ 0 ] . container_id
# 3. List files
files = client . containers . files . list ( container_id = container_id )
# 4. Download file content
for file in files . data :
content = client . containers . files . content (
container_id = container_id ,
file_id = file . id
with open ( file . filename , "wb" ) as f :
f . write ( content . read ( ) )
print ( f"Downloaded: { file . filename } " )
AI Gateway UI ​
The LiteLLM Admin UI includes built-in Code Interpreter support.
Steps:
Go to Playground in the LiteLLM UI
Select an OpenAI model (e.g., openai/gpt-4o )
Select /v1/responses as the endpoint under Endpoint Type
Toggle Code Interpreter in the left panel
Send a prompt requesting code execution or file generation
The UI will display:
Executed Python code (collapsible)
Generated images inline
Download links for files (CSVs, etc.)
LiteLLM Python SDK ​
Run Code Interpreter ​
code_interpreter.py
import litellm
response = litellm . responses (
input = "Generate a bar chart of quarterly sales and save as PNG" ,
tools = [ { "type" : "code_interpreter" } ]
After Code Interpreter runs, retrieve the generated files:
get_file_content.py
input = "Create a pie chart of market share and save as PNG" ,
# 2. Extract container_id from response
container_id = response . output [ 0 ] . container_id # e.g. "cntr_abc123..."
# 3. List files in container
files = litellm . list_container_files (
custom_llm_provider = "openai"
# 4. Download each file
content = litellm . retrieve_container_file_content (
file_id = file . id ,
f . write ( content )
Related ​
Containers API - Manage containers
Container Files API - Manage files within containers
OpenAI Code Interpreter Docs - Official OpenAI documentation
LiteLLM AI Gateway
API (OpenAI SDK)
AI Gateway UI
LiteLLM Python SDK
Run Code Interpreter
Get Generated File Content
Related
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
