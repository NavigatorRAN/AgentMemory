# Computer Use | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/completion/computer_use
- Final URL: https://docs.litellm.ai/docs/completion/computer_use
- Canonical URL: https://docs.litellm.ai/docs/completion/computer_use
- Fetched at: 2026-06-23T14:23:05Z
- Content type: text/html; charset=utf-8

## Description

Computer use allows models to interact with computer interfaces by taking screenshots and performing actions like clicking, typing, and scrolling. This enables AI models to autonomously operate desktop environments.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Computer use allows models to interact with computer interfaces by taking screenshots and performing actions like clicking, typing, and scrolling. This enables AI models to autonomously operate desktop environments.
Supported Providers:
Anthropic API ( anthropic/ )
Bedrock (Anthropic) ( bedrock/ )
Vertex AI (Anthropic) ( vertex_ai/ )
Supported Tool Types:
computer - Computer interaction tool with display parameters
bash - Bash shell tool
text_editor - Text editor tool
web_search - Web search tool
LiteLLM will standardize the computer use tools across all supported providers.
Quick Start ​
LiteLLM Python SDK
LiteLLM Proxy Server
import os
from litellm import completion
os . environ [ "ANTHROPIC_API_KEY" ] = "your-api-key"
# Computer use tool
tools = [
{
"type" : "computer_20241022" ,
"name" : "computer" ,
"display_height_px" : 768 ,
"display_width_px" : 1024 ,
"display_number" : 0 ,
}
]
messages = [
"role" : "user" ,
"content" : [
"type" : "text" ,
"text" : "Take a screenshot and tell me what you see"
} ,
"type" : "image_url" ,
"image_url" : {
"url" : "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8/5+hHgAHggJ/PchI7wAAAABJRU5ErkJggg=="
response = completion (
model = "anthropic/claude-3-5-sonnet-latest" ,
messages = messages ,
tools = tools ,
)
print ( response )
Define computer use models on config.yaml
model_list :
- model_name : claude - 3 - 5 - sonnet - latest # Anthropic claude-3-5-sonnet-latest
litellm_params :
model : anthropic/claude - 3 - 5 - sonnet - latest
api_key : os.environ/ANTHROPIC_API_KEY
- model_name : claude - bedrock # Bedrock Anthropic model
model : bedrock/anthropic.claude - haiku - 4 - 5 - 20251001 : 0
aws_access_key_id : os.environ/AWS_ACCESS_KEY_ID
aws_secret_access_key : os.environ/AWS_SECRET_ACCESS_KEY
aws_region_name : us - west - 2
model_info :
supports_computer_use : True # set supports_computer_use to True so /model/info returns this attribute as True
Run proxy server
litellm --config config.yaml
Test it using the OpenAI Python SDK
from openai import OpenAI
client = OpenAI (
api_key = "sk-1234" , # your litellm proxy api key
base_url = "http://0.0.0.0:4000"
response = client . chat . completions . create (
model = "claude-3-5-sonnet-latest" ,
] ,
Checking if a model supports computer use ​
Use litellm.supports_computer_use(model="") -> returns True if model supports computer use and False if not
import litellm
assert litellm . supports_computer_use ( model = "anthropic/claude-3-5-sonnet-latest" ) == True
assert litellm . supports_computer_use ( model = "anthropic/claude-3-7-sonnet-20250219" ) == True
assert litellm . supports_computer_use ( model = "bedrock/anthropic.claude-haiku-4-5-20251001:0" ) == True
assert litellm . supports_computer_use ( model = "vertex_ai/claude-3-5-sonnet" ) == True
assert litellm . supports_computer_use ( model = "openai/gpt-4" ) == False
Call /model_group/info to check if your model supports computer use
curl -X 'GET' \
'http://localhost:4000/model_group/info' \
-H 'accept: application/json' \
-H 'x-api-key: sk-1234'
Expected Response
"data" : [
"model_group" : "claude-3-5-sonnet-latest" ,
"providers" : [ "anthropic" ] ,
"max_input_tokens" : 200000 ,
"max_output_tokens" : 8192 ,
"mode" : "chat" ,
"supports_computer_use" : true , # 👈 supports_computer_use is true
"supports_vision" : true ,
"supports_function_calling" : true
"model_group" : "claude-bedrock" ,
"providers" : [ "bedrock" ] ,
Different Tool Types ​
Computer use supports several different tool types for various interaction modes:
Computer Tool
Bash Tool
Text Editor Tool
The computer_20241022 tool provides direct screen interaction capabilities.
"text" : "Click on the search button in the screenshot"
The bash_20241022 tool provides command line interface access.
"type" : "bash_20241022" ,
"name" : "bash"
"content" : "List the files in the current directory using bash"
The text_editor_20250124 tool provides text file editing capabilities.
"type" : "text_editor_20250124" ,
"name" : "str_replace_editor"
"content" : "Create a simple Python hello world script"
Advanced Usage with Multiple Tools ​
You can combine different computer use tools in a single request:
"text" : "Take a screenshot, then create a file describing what you see, and finally use bash to show the file contents"
Spec ​
Computer Tool ( computer_20241022 ) ​
"display_height_px" : 768 , // Required: Screen height in pixels
"display_width_px" : 1024 , // Required: Screen width in pixels
"display_number" : 0 // Optional: Display number (default: 0)
Bash Tool ( bash_20241022 ) ​
"name" : "bash" // Required: Tool name
Text Editor Tool ( text_editor_20250124 ) ​
"name" : "str_replace_editor" // Required: Tool name
Web Search Tool ( web_search_20250305 ) ​
"type" : "web_search_20250305" ,
"name" : "web_search" // Required: Tool name
Quick Start
Checking if a model supports computer use
Different Tool Types
Advanced Usage with Multiple Tools
Spec
Computer Tool ( computer_20241022 )
Bash Tool ( bash_20241022 )
Text Editor Tool ( text_editor_20250124 )
Web Search Tool ( web_search_20250305 )
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
