# LiteLLM Prompt Management (GitOps) | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/proxy/native_litellm_prompt
- Final URL: https://docs.litellm.ai/docs/proxy/native_litellm_prompt
- Canonical URL: https://docs.litellm.ai/docs/proxy/native_litellm_prompt
- Fetched at: 2026-06-23T14:31:35Z
- Content type: text/html; charset=utf-8

## Description

Store prompts as .prompt files in your repository and use them directly with LiteLLM. No external services required.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Store prompts as .prompt files in your repository and use them directly with LiteLLM. No external services required.
Supported Integrations ​
File System : Store .prompt files locally
BitBucket : Store .prompt files in BitBucket repositories with team-based access control
Gitlab : Store .prompt files in Gitlab repositories with team-based access control
Quick Start ​
SDK
BITBUCKET
GITLAB
PROXY
1. Create a .prompt file
Create prompts/hello.prompt :
---
model : gpt - 4
temperature : 0.7
System : You are a helpful assistant.
User : { { user_message } }
2. Use with LiteLLM
import litellm
# Set the global prompt directory
litellm . global_prompt_directory = "prompts/"
response = litellm . completion (
model = "dotprompt/gpt-4" ,
prompt_id = "hello" ,
prompt_variables = { "user_message" : "What is the capital of France?" }
)
1. Create a .prompt file in BitBucket
Create prompts/hello.prompt in your BitBucket repository:
2. Configure BitBucket access
# Configure BitBucket access
bitbucket_config = {
"workspace" : "your-workspace" ,
"repository" : "your-repo" ,
"access_token" : "your-access-token" ,
"branch" : "main"
}
# Set global BitBucket configuration
litellm . set_global_bitbucket_config ( bitbucket_config )
3. Use with LiteLLM
model = "bitbucket/gpt-4" ,
1. Create a .prompt file in a gitlab repo
Create prompts/hello.prompt in your gitlab repository:
2. Configure Gitlab access
# Configure gitlab access
gitlab_config = {
# Set global gitlab configuration
litellm . set_global_gitlab_config ( gitlab_config )
model = "gitlab/gpt-4" ,
2. Setup config.yaml
model_list :
- model_name : my - dotprompt - model
litellm_params :
model : dotprompt/gpt - 4
prompt_id : "hello"
api_key : os.environ/OPENAI_API_KEY
litellm_settings :
global_prompt_directory : "./prompts"
# Or use BitBucket for team-based prompt management
global_bitbucket_config :
workspace : "your-workspace"
repository : "your-repo"
access_token : "your-access-token"
branch : "main"
# Or use Gitlab for team-based prompt management
global_gitlab_config :
3. Start the proxy
litellm --config config.yaml --detailed_debug
4. Test it!
curl -L -X POST 'http://0.0.0.0:4000/v1/chat/completions' \
-H 'Content-Type: application/json' \
-H 'Authorization: Bearer sk-1234' \
-d '{
"model": "my-dotprompt-model",
"messages": [{"role": "user", "content": "IGNORED"}],
"prompt_variables": {
"user_message": "What is the capital of France?"
}'
.prompt File Format ​
.prompt files use YAML frontmatter for metadata and support Jinja2 templating:
model : gpt - 4 # Model to use
temperature : 0.7 # Optional parameters
max_tokens : 1000
input :
schema :
user_message : string # Input validation (optional)
System : You are a helpful { { role } } assistant.
Advanced Features ​
Multi-role conversations:
temperature : 0.3
System : You are a helpful coding assistant.
User : { { user_question } }
Dynamic model selection:
model : "{{preferred_model}}" # Model can be a variable
System : You are a helpful assistant specialized in { { domain } } .
API Reference ​
For prompt integrations, use these parameters:
File System (dotprompt):
model: dotprompt/<base_model> # required (e.g., dotprompt/gpt-4)
prompt_id: str # required - the .prompt filename without extension
prompt_variables: Optional[dict] # optional - variables for template rendering
BitBucket:
model: bitbucket/<base_model> # required (e.g., bitbucket/gpt-4)
bitbucket_config: Optional[dict] # optional - BitBucket configuration (if not set globally)
Gitlab:
model: gitlab/<base_model> # required (e.g., gitlab/gpt-4)
gitlab_config: Optional[dict] # optional - Gitlab configuration (if not set globally)
Example API calls:
# File system integration
prompt_variables = { "user_message" : "Hello world" } ,
messages = [ { "role" : "user" , "content" : "This will be ignored" } ]
# BitBucket integration
"access_token" : "your-token"
# Gitlab integration
"project" : "a/b/<repo_name>" ,
"base_url" : "gitlab url" ,
"prompts_path" : "src/prompts" , # folder to point to, defaults to root
"branch" : "main" # optional, defaults to main
Supported Integrations
Quick Start
.prompt File Format
Advanced Features
API Reference
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
