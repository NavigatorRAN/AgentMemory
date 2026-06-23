# Adding OpenAI-Compatible Providers | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/contributing/adding_openai_compatible_providers
- Final URL: https://docs.litellm.ai/docs/contributing/adding_openai_compatible_providers
- Canonical URL: https://docs.litellm.ai/docs/contributing/adding_openai_compatible_providers
- Fetched at: 2026-06-23T14:23:41Z
- Content type: text/html; charset=utf-8

## Description

For simple OpenAI-compatible providers (like Hyperbolic, Nscale, etc.), you can add support by editing a single JSON file.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
For simple OpenAI-compatible providers (like Hyperbolic, Nscale, etc.), you can add support by editing a single JSON file.
Quick Start ​
Edit litellm/llms/openai_like/providers.json
Add your provider configuration
Test with: litellm.completion(model="your_provider/model-name", ...)
Basic Configuration ​
For a fully OpenAI-compatible provider:
{
"your_provider" : {
"base_url" : "https://api.yourprovider.com/v1" ,
"api_key_env" : "YOUR_PROVIDER_API_KEY"
}
That's it! The provider is now available.
Configuration Options ​
Required Fields ​
base_url - API endpoint (e.g., https://api.provider.com/v1 )
api_key_env - Environment variable name for API key (e.g., PROVIDER_API_KEY )
Optional Fields ​
api_base_env - Environment variable to override base_url
base_class - Use "openai_gpt" (default) or "openai_like"
param_mappings - Map OpenAI parameter names to provider-specific names
constraints - Parameter value constraints (min/max)
special_handling - Special behaviors like content format conversion
Examples ​
Simple Provider (Fully Compatible) ​
"hyperbolic" : {
"base_url" : "https://api.hyperbolic.xyz/v1" ,
"api_key_env" : "HYPERBOLIC_API_KEY"
Provider with Parameter Mapping ​
"publicai" : {
"base_url" : "https://api.publicai.co/v1" ,
"api_key_env" : "PUBLICAI_API_KEY" ,
"param_mappings" : {
"max_completion_tokens" : "max_tokens"
Provider with Constraints ​
"custom_provider" : {
"base_url" : "https://api.custom.com/v1" ,
"api_key_env" : "CUSTOM_API_KEY" ,
"constraints" : {
"temperature_max" : 1.0 ,
"temperature_min" : 0.0
Responses API Support ​
If your provider also supports the OpenAI Responses API ( /v1/responses ), add supported_endpoints :
"api_key_env" : "YOUR_PROVIDER_API_KEY" ,
"supported_endpoints" : [ "/v1/chat/completions" , "/v1/responses" ]
This enables litellm.responses() with zero additional code:
import litellm
response = litellm . responses (
model = "your_provider/model-name" ,
input = "Hello, what can you do?" ,
)
print ( response . output )
If supported_endpoints is omitted, it defaults to [] . Chat completions is always enabled for JSON providers regardless of this field.
The provider inherits all request/response handling from OpenAI's Responses API — streaming, tools, and all standard parameters work out of the box.
Usage ​
import os
# Set your API key
os . environ [ "YOUR_PROVIDER_API_KEY" ] = "your-key-here"
# Chat completions
response = litellm . completion (
messages = [ { "role" : "user" , "content" : "Hello" } ] ,
# Responses API (if supported_endpoints includes "/v1/responses")
input = "Hello" ,
When to Use Python Instead ​
Use a Python config class if you need:
Custom authentication flows (OAuth, JWT, etc.)
Complex request/response transformations
Provider-specific streaming logic
Advanced tool calling modifications
For chat completions, create a config class in litellm/llms/your_provider/chat/transformation.py that inherits from OpenAIGPTConfig or OpenAILikeChatConfig .
For responses API with small overrides, inherit from OpenAIResponsesAPIConfig and override only what's needed. See litellm/llms/perplexity/responses/transformation.py for a minimal example (~40 lines vs 400+).
Testing ​
Test your provider:
# Quick test
python -c "
os.environ['PROVIDER_API_KEY'] = 'your-key'
response = litellm.completion(
model='provider/model-name',
messages=[{'role': 'user', 'content': 'test'}]
print(response.choices[0].message.content)
"
Reference ​
See existing providers in litellm/llms/openai_like/providers.json for examples.
Quick Start
Basic Configuration
Configuration Options
Required Fields
Optional Fields
Examples
Simple Provider (Fully Compatible)
Provider with Parameter Mapping
Provider with Constraints
Responses API Support
Usage
When to Use Python Instead
Testing
Reference
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
