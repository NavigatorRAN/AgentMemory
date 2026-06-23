# OpenCode Quickstart | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/tutorials/opencode_integration
- Final URL: https://docs.litellm.ai/docs/tutorials/opencode_integration
- Canonical URL: https://docs.litellm.ai/docs/tutorials/opencode_integration
- Fetched at: 2026-06-23T14:34:35Z
- Content type: text/html; charset=utf-8

## Description

This tutorial shows how to connect OpenCode to your existing LiteLLM instance and switch between models.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
This tutorial shows how to connect OpenCode to your existing LiteLLM instance and switch between models.
info
This integration allows you to use any LiteLLM supported model through OpenCode with centralized authentication, usage tracking, and cost controls.
Video Walkthrough ​
Prerequisites ​
LiteLLM already configured and running (e.g., http://localhost:4000 )
LiteLLM API key
Installation ​
Step 1: Install OpenCode ​
Choose your preferred installation method:
One-line install (recommended)
NPM
Homebrew
curl -fsSL https://opencode.ai/install | bash
npm install -g opencode-ai
brew install sst/tap/opencode
Verify installation:
opencode --version
Step 2: Configure LiteLLM Provider ​
Create your OpenCode configuration file. You can place this in different locations depending on your needs:
Configuration locations:
Global : ~/.config/opencode/opencode.json (applies to all projects)
Project : opencode.json in your project root (project-specific settings)
Custom : Set OPENCODE_CONFIG environment variable
Create ~/.config/opencode/opencode.json (global config):
{
"$schema" : "https://opencode.ai/config.json" ,
"provider" : {
"litellm" : {
"npm" : "@ai-sdk/openai-compatible" ,
"name" : "LiteLLM" ,
"options" : {
"baseURL" : "http://localhost:4000/v1"
} ,
"models" : {
"gpt-4" : {
"name" : "GPT-4"
"claude-3-5-sonnet-20241022" : {
"name" : "Claude 3.5 Sonnet"
"deepseek-chat" : {
"name" : "DeepSeek Chat"
}
tip
The keys in the "models" object (e.g., "gpt-4", "claude-3-5-sonnet-20241022") should match the model_name values from your LiteLLM configuration. The "name" field provides a friendly display name that will appear as an alias in OpenCode.
Step 3: Connect to LiteLLM Provider ​
Launch OpenCode:
opencode
Add your API key:
/connect
Then:
Enter provider name : LiteLLM (must match the "name" field in your config)
Enter your LiteLLM API key : Your LiteLLM master key or virtual key
Step 4: Switch Between Models ​
In OpenCode, run:
/models
Select any model from your LiteLLM configuration. OpenCode will route all requests through your LiteLLM instance.
Advanced Configuration ​
Model Parameters ​
You can customize model parameters like context limits:
"name" : "GPT-4" ,
"limit" : {
"context" : 128000 ,
"output" : 4096
"name" : "Claude 3.5 Sonnet" ,
"context" : 200000 ,
"output" : 8192
Multi-Provider Setup ​
You can configure multiple LiteLLM instances or mix with other providers:
Multiple LiteLLM Instances
Mixed Providers
"litellm-prod" : {
"name" : "LiteLLM Production" ,
"baseURL" : "https://your-prod-instance.com/v1"
"name" : "GPT-4 (Production)"
"litellm-dev" : {
"name" : "LiteLLM Development" ,
"name" : "GPT-4 (Development)"
"name" : "GPT-4 via LiteLLM"
"name" : "Claude 3.5 Sonnet via LiteLLM"
"openai" : {
"npm" : "@ai-sdk/openai" ,
"name" : "OpenAI Direct" ,
"gpt-4o" : {
"name" : "GPT-4o (Direct)"
Example LiteLLM Configuration ​
Here's an example LiteLLM config.yaml that works well with OpenCode:
model_list :
# OpenAI models
- model_name : gpt - 4
litellm_params :
model : openai/gpt - 4
api_key : os.environ/OPENAI_API_KEY
- model_name : gpt - 4o
model : openai/gpt - 4o
# Anthropic models
- model_name : claude - 3 - 5 - sonnet - 20241022
model : anthropic/claude - 3 - 5 - sonnet - 20241022
api_key : os.environ/ANTHROPIC_API_KEY
# DeepSeek models
- model_name : deepseek - chat
model : deepseek/deepseek - chat
api_key : os.environ/DEEPSEEK_API_KEY
Dropping OpenCode-specific parameters ​
OpenCode sends a reasoningSummary parameter with reasoning-capable models such as gpt-5 . This parameter is not supported by the Chat Completions API and will cause errors. Add additional_drop_params to every model entry in your model_list that will receive requests from OpenCode with reasoning enabled:
- model_name : gpt - 5
model : openai/gpt - 5
additional_drop_params : [ "reasoningSummary" ]
Troubleshooting ​
OpenCode not connecting:
Verify your LiteLLM proxy is running: curl http://localhost:4000/health
Check that the baseURL in your OpenCode config matches your LiteLLM instance
Ensure the provider name in /connect matches exactly with your config
Authentication errors:
Verify your LiteLLM API key is correct
Check that your LiteLLM instance has authentication properly configured
Ensure your API key has access to the models you're trying to use
Model not found:
Ensure the model names in OpenCode config match your LiteLLM model_name values
Check LiteLLM logs for detailed error messages
Verify the models are properly configured in your LiteLLM instance
Configuration not loading:
Check the config file path and permissions
Validate JSON syntax using a JSON validator
Ensure the $schema URL is accessible
Unknown parameter: 'reasoningSummary' error:
OpenCode sends a reasoningSummary parameter that is not supported by the Chat Completions API. Add additional_drop_params: ["reasoningSummary"] to each affected model entry in your litellm_params :
Tips ​
Add more models to the config as needed - they'll appear in /models
Use project-specific configs for different codebases with different model requirements
Monitor your LiteLLM proxy logs to see OpenCode requests in real-time
Video Walkthrough
Prerequisites
Installation
Step 1: Install OpenCode
Step 2: Configure LiteLLM Provider
Step 3: Connect to LiteLLM Provider
Step 4: Switch Between Models
Advanced Configuration
Model Parameters
Multi-Provider Setup
Example LiteLLM Configuration
Dropping OpenCode-specific parameters
Troubleshooting
Tips
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
