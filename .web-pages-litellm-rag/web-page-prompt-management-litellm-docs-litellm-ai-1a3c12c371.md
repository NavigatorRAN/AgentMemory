# Prompt Management | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/proxy/prompt_management
- Final URL: https://docs.litellm.ai/docs/proxy/prompt_management
- Canonical URL: https://docs.litellm.ai/docs/proxy/prompt_management
- Fetched at: 2026-06-23T14:31:47Z
- Content type: text/html; charset=utf-8

## Description

Run experiments or change the specific model (e.g. from gpt-4o to gpt4o-mini finetune) from your prompt management tool (e.g. Langfuse) instead of making changes in the application.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Run experiments or change the specific model (e.g. from gpt-4o to gpt4o-mini finetune) from your prompt management tool (e.g. Langfuse) instead of making changes in the application.
Supported Integrations Link Native LiteLLM GitOps (.prompt files) Get Started Langfuse Get Started Humanloop Get Started Generic Prompt Management API Get Started
Onboarding Prompts via config.yaml ​
You can onboard and initialize prompts directly in your config.yaml file. This allows you to:
Load prompts at proxy startup
Manage prompts as code alongside your proxy configuration
Use any supported prompt integration (dotprompt, Langfuse, BitBucket, GitLab, custom)
Basic Structure ​
Add a prompts field to your config.yaml:
model_list :
- model_name : gpt - 4
litellm_params :
model : openai/gpt - 4
api_key : os.environ/OPENAI_API_KEY
prompts :
- prompt_id : "my_prompt_id"
prompt_id : "my_prompt_id"
prompt_integration : "dotprompt" # or langfuse, bitbucket, gitlab, generic_prompt_management, custom
# integration-specific parameters below
Understanding prompt_integration ​
The prompt_integration field determines where and how prompts are loaded:
dotprompt : Load from local .prompt files or inline content
langfuse : Fetch prompts from Langfuse prompt management
bitbucket : Load from BitBucket repository .prompt files (team-based access control)
gitlab : Load from GitLab repository .prompt files (team-based access control)
generic_prompt_management : Integrate any prompt management system via a simple API endpoint (no PR required)
custom : Use your own custom prompt management implementation
Each integration has its own configuration parameters and access control mechanisms.
Supported Integrations ​
DotPrompt (File-based)
Langfuse
BitBucket
GitLab
Generic Prompt Management
Option 1: Using a prompt directory
- prompt_id : "hello"
prompt_id : "hello"
prompt_integration : "dotprompt"
prompt_directory : "./prompts" # Directory containing .prompt files
litellm_settings :
global_prompt_directory : "./prompts" # Global setting for all dotprompt integrations
Option 2: Using inline prompt data
- prompt_id : "my_inline_prompt"
prompt_id : "my_inline_prompt"
prompt_data :
my_inline_prompt :
content : "Hello {{name}}! How can I help you with {{topic}}?"
metadata :
model : "gpt-4"
temperature : 0.7
max_tokens : 150
Option 3: Using dotprompt_content for single prompts
- prompt_id : "simple_prompt"
prompt_id : "simple_prompt"
dotprompt_content : |
---
model: gpt-4
temperature: 0.7
System: You are a helpful assistant.
User : { { user_message } }
Create .prompt files in your prompt directory:
# prompts/hello.prompt
model : gpt - 4
System : You are a helpful assistant.
- prompt_id : "my_langfuse_prompt"
prompt_id : "my_langfuse_prompt"
prompt_integration : "langfuse"
langfuse_public_key : "os.environ/LANGFUSE_PUBLIC_KEY"
langfuse_secret_key : "os.environ/LANGFUSE_SECRET_KEY"
langfuse_host : "https://cloud.langfuse.com" # optional
langfuse_public_key : "os.environ/LANGFUSE_PUBLIC_KEY" # Global setting
langfuse_secret_key : "os.environ/LANGFUSE_SECRET_KEY" # Global setting
- prompt_id : "my_bitbucket_prompt"
prompt_id : "my_bitbucket_prompt"
prompt_integration : "bitbucket"
bitbucket_workspace : "your-workspace"
bitbucket_repository : "your-repo"
bitbucket_access_token : "os.environ/BITBUCKET_ACCESS_TOKEN"
bitbucket_branch : "main" # optional, defaults to main
global_bitbucket_config :
workspace : "your-workspace"
repository : "your-repo"
access_token : "os.environ/BITBUCKET_ACCESS_TOKEN"
branch : "main"
Your BitBucket repository should contain .prompt files:
# prompts/my_bitbucket_prompt.prompt
- prompt_id : "my_gitlab_prompt"
prompt_id : "my_gitlab_prompt"
prompt_integration : "gitlab"
gitlab_project : "group/sub/repo"
gitlab_access_token : "os.environ/GITLAB_ACCESS_TOKEN"
gitlab_branch : "main" # optional
gitlab_prompts_path : "prompts" # optional, defaults to root
global_gitlab_config :
project : "group/sub/repo"
access_token : "os.environ/GITLAB_ACCESS_TOKEN"
Your GitLab repository should contain .prompt files:
# prompts/my_gitlab_prompt.prompt
prompt_integration : "generic_prompt_management"
provider_specific_query_params :
project_name : litellm
slug : hello - world - prompt - 2bac
api_base : http : //localhost : 8080
api_key : os.environ/GENERIC_PROMPT_API_KEY
ignore_prompt_manager_model : true # optional
ignore_prompt_manager_optional_params : true # optional
What you need to implement:
A GET endpoint at /beta/litellm_prompt_management that returns:
{
"prompt_id" : "simple_prompt" ,
"prompt_template" : [
"role" : "system" ,
"content" : "You are a helpful assistant."
} ,
"role" : "user" ,
"content" : "Help me with {task}"
}
] ,
"prompt_template_model" : "gpt-4" ,
"prompt_template_optional_params" : {
"temperature" : 0.7 ,
"max_tokens" : 500
Benefits:
No PR required - integrate any prompt management system
Full control over your prompt storage and versioning
Support for variable substitution with {variable} syntax
Custom query parameters for filtering and access control
Learn more: Generic Prompt Management API Documentation
Complete Example ​
Here's a complete example showing multiple prompts with different integrations:
# File-based dotprompt
- prompt_id : "coding_assistant"
prompt_id : "coding_assistant"
prompt_directory : "./prompts"
# Inline dotprompt
- prompt_id : "simple_chat"
prompt_id : "simple_chat"
simple_chat :
content : "You are a {{personality}} assistant. User: {{message}}"
temperature : 0.8
# Langfuse prompt
- prompt_id : "langfuse_chat"
prompt_id : "langfuse_chat"
global_prompt_directory : "./prompts"
How It Works ​
At Startup : When the proxy starts, it reads the prompts field from config.yaml
Initialization : Each prompt is initialized based on its prompt_integration type
In-Memory Storage : Prompts are stored in the IN_MEMORY_PROMPT_REGISTRY
Access : Use these prompts via /v1/chat/completions or /v1/responses with prompt_id in the request
Using Config-Loaded Prompts ​
After loading prompts via config.yaml, use them in your API requests:
curl -L -X POST 'http://0.0.0.0:4000/v1/chat/completions' \
-H 'Content-Type: application/json' \
-H 'Authorization: Bearer sk-1234' \
-d '{
"model": "gpt-4",
"prompt_id": "coding_assistant",
"prompt_variables": {
"language": "python",
"task": "create a web scraper"
}'
You can also use the same prompt_id with the Responses API:
curl -L -X POST 'http://0.0.0.0:4000/v1/responses' \
"model": "gpt-4o",
},
"input": []
Prompt Schema Reference ​
Each prompt in the prompts list requires:
prompt_id (string, required): Unique identifier for the prompt
litellm_params (object, required): Configuration for the prompt
prompt_id (string, required): Must match the top-level prompt_id
prompt_integration (string, required): One of: dotprompt , langfuse , bitbucket , gitlab , custom
Additional integration-specific parameters (see tabs above)
prompt_info (object, optional): Metadata about the prompt
prompt_type (string): Defaults to "config" for config-loaded prompts
Notes ​
Config-loaded prompts have prompt_type: "config" and cannot be updated via the API
To update config prompts, modify your config.yaml and restart the proxy
For dynamic prompts that can be updated via API, use the /prompts endpoints instead
All supported integrations work with config-loaded prompts
Quick Start ​
SDK
PROXY
import os
import litellm
os . environ [ "LANGFUSE_PUBLIC_KEY" ] = "public_key" # [OPTIONAL] set here or in `.completion`
os . environ [ "LANGFUSE_SECRET_KEY" ] = "secret_key" # [OPTIONAL] set here or in `.completion`
litellm . set_verbose = True # see raw request to provider
resp = litellm . completion (
model = "langfuse/gpt-3.5-turbo" ,
prompt_id = "test-chat-prompt" ,
prompt_variables = { "user_message" : "this is used" } , # [OPTIONAL]
messages = [ { "role" : "user" , "content" : "<IGNORED>" } ] ,
)
Setup config.yaml
- model_name : my - langfuse - model
model : langfuse/openai - model
prompt_id : "<langfuse_prompt_id>"
- model_name : openai - model
model : openai/gpt - 3.5 - turbo
Start the proxy
litellm --config config.yaml --detailed_debug
Test it!
CURL
OpenAI Python SDK
"model": "my-langfuse-model",
"messages": [
"role": "user",
"content": "THIS WILL BE IGNORED"
],
"key": "this is used"
import openai
client = openai . OpenAI (
api_key = "anything" ,
base_url = "http://0.0.0.0:4000"
# request sent to model set on litellm proxy, `litellm --model`
response = client . chat . completions . create (
model = "gpt-3.5-turbo" ,
messages = [
"content" : "this is a test request, write a short poem"
extra_body = {
"prompt_variables" : { # [OPTIONAL]
"key" : "this is used"
print ( response )
Expected Logs:
POST Request Sent from LiteLLM:
curl -X POST \
https://api.openai.com/v1/ \
-d '{'model': 'gpt-3.5-turbo', 'messages': <YOUR LANGFUSE PROMPT TEMPLATE>}'
How to set model ​
Set the model on LiteLLM ​
You can do langfuse/<litellm_model_name>
litellm . completion (
model = "langfuse/gpt-3.5-turbo" , # or `langfuse/anthropic/claude-3-5-sonnet`
. . .
- model_name : gpt - 3.5 - turbo
model : langfuse/gpt - 3.5 - turbo # OR langfuse/anthropic/claude-3-5-sonnet
prompt_id : <langfuse_prompt_id >
Set the model in Langfuse ​
If the model is specified in the Langfuse config, it will be used.
model : azure/chatgpt - v - 2
api_key : os.environ/AZURE_API_KEY
api_base : os.environ/AZURE_API_BASE
What is 'prompt_variables'? ​
prompt_variables : A dictionary of variables that will be used to replace parts of the prompt.
What is 'prompt_id'? ​
prompt_id : The ID of the prompt that will be used for the request.
What will the formatted prompt look like? ​
/chat/completions messages ​
The messages field sent in by the client is ignored.
The Langfuse prompt will replace the messages field.
To replace parts of the prompt, use the prompt_variables field. See how prompt variables are used
If the Langfuse prompt is a string, it will be sent as a user message (not all providers support system messages).
If the Langfuse prompt is a list, it will be sent as is (Langfuse chat prompts are OpenAI compatible).
Architectural Overview ​
API Reference ​
These are the params you can pass to the litellm.completion function in SDK and litellm_params in config.yaml
prompt_id: str # required
prompt_variables: Optional[dict] # optional
prompt_version: Optional[int] # optional
langfuse_public_key: Optional[str] # optional
langfuse_secret: Optional[str] # optional
langfuse_secret_key: Optional[str] # optional
langfuse_host: Optional[str] # optional
Onboarding Prompts via config.yaml
Basic Structure
Understanding prompt_integration
Supported Integrations
Complete Example
How It Works
Using Config-Loaded Prompts
Prompt Schema Reference
Notes
Quick Start
How to set model
Set the model on LiteLLM
Set the model in Langfuse
What is 'prompt_variables'?
What is 'prompt_id'?
What will the formatted prompt look like?
/chat/completions messages
Architectural Overview
API Reference
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
