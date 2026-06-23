# OpenAI Moderation | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/proxy/guardrails/openai_moderation
- Final URL: https://docs.litellm.ai/docs/proxy/guardrails/openai_moderation
- Canonical URL: https://docs.litellm.ai/docs/proxy/guardrails/openai_moderation
- Fetched at: 2026-06-23T14:30:44Z
- Content type: text/html; charset=utf-8

## Description

Overview

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Overview ​
Property Details Description Use OpenAI's built-in Moderation API to detect and block harmful content including hate speech, harassment, self-harm, sexual content, and violence. Provider OpenAI Moderation API Supported Actions BLOCK (raises HTTP 400 exception when violations detected) Supported Modes pre_call , during_call , post_call Streaming Support ✅ Full support for streaming responses API Requirements OpenAI API key
Quick Start ​
1. Define Guardrails on your LiteLLM config.yaml ​
Define your guardrails under the guardrails section:
Config.yaml
Environment Variables
config.yaml
model_list :
- model_name : gpt - 4
litellm_params :
model : openai/gpt - 4
api_key : os.environ/OPENAI_API_KEY
guardrails :
- guardrail_name : "openai-moderation-pre"
guardrail : openai_moderation
mode : "pre_call"
api_key : os.environ/OPENAI_API_KEY # Optional if already set globally
model : "omni-moderation-latest" # Optional, defaults to omni-moderation-latest
api_base : "https://api.openai.com/v1" # Optional, defaults to OpenAI API
Supported values for mode ​
pre_call Run before LLM call, on user input
during_call Run during LLM call, on user input . Same as pre_call but runs in parallel as LLM call. Response not returned until guardrail check completes.
post_call Run after LLM call, on LLM response
Supported OpenAI Moderation Models ​
omni-moderation-latest (default) - Latest multimodal moderation model
text-moderation-latest - Latest text-only moderation model
Set your OpenAI API key:
Setup Environment Variables
export OPENAI_API_KEY="your-openai-api-key"
2. Start LiteLLM Gateway ​
litellm --config config.yaml --detailed_debug
3. Test request ​
Blocked Request
Successful Call
Expect this to fail since the request contains harmful content:
curl -i http://0.0.0.0:4000/v1/chat/completions \
-H "Content-Type: application/json" \
-H "Authorization: Bearer sk-1234" \
-d '{
"model": "gpt-4",
"messages": [
{"role": "user", "content": "I hate all people and want to hurt them"}
],
"guardrails": ["openai-moderation-pre"]
}'
Expected response on failure:
{
"error" : {
"message" : {
"error" : "Violated OpenAI moderation policy" ,
"moderation_result" : {
"violated_categories" : [ "hate" , "violence" ] ,
"category_scores" : {
"hate" : 0.95 ,
"violence" : 0.87 ,
"harassment" : 0.12 ,
"self-harm" : 0.01 ,
"sexual" : 0.02
}
} ,
"type" : "None" ,
"param" : "None" ,
"code" : "400"
{"role": "user", "content": "What is the capital of France?"}
Expected response:
"id" : "chatcmpl-4a1c1a4a-3e1d-4fa4-ae25-7ebe84c9a9a2" ,
"created" : 1741082354 ,
"model" : "gpt-4" ,
"object" : "chat.completion" ,
"choices" : [
"finish_reason" : "stop" ,
"index" : 0 ,
"content" : "The capital of France is Paris." ,
"role" : "assistant"
] ,
"usage" : {
"completion_tokens" : 8 ,
"prompt_tokens" : 13 ,
"total_tokens" : 21
Advanced Configuration ​
Multiple Guardrails for Input and Output ​
You can configure separate guardrails for user input and LLM responses:
Multiple Guardrails Config
- guardrail_name : "openai-moderation-input"
- guardrail_name : "openai-moderation-output"
mode : "post_call"
Custom API Configuration ​
Configure custom OpenAI API endpoints or different models:
Custom API Config
- guardrail_name : "openai-moderation-custom"
api_base : "https://your-custom-openai-endpoint.com/v1"
model : "text-moderation-latest"
Streaming Support ​
The OpenAI Moderation guardrail fully supports streaming responses. When used in post_call mode, it will:
Collect all streaming chunks
Assemble the complete response
Apply moderation to the full content
Block the entire stream if violations are detected
Return the original stream if content is safe
Streaming Config
- guardrail_name : "openai-moderation-streaming"
mode : "post_call" # Works with streaming responses
Content Categories ​
The OpenAI Moderation API detects the following categories of harmful content:
Category Description hate Content that expresses, incites, or promotes hate based on race, gender, ethnicity, religion, nationality, sexual orientation, disability status, or caste harassment Content that harasses, bullies, or intimidates an individual self-harm Content that promotes, encourages, or depicts acts of self-harm sexual Content meant to arouse sexual excitement or promote sexual services violence Content that depicts death, violence, or physical injury
Each category is evaluated with both a boolean flag and a confidence score (0.0 to 1.0).
Error Handling ​
When content violates OpenAI's moderation policy:
HTTP Status : 400 Bad Request
Error Type : HTTPException
Error Details : Includes violated categories and confidence scores
Behavior : Request is immediately blocked
Best Practices ​
1. Use Pre-call for User Input ​
- guardrail_name : "input-moderation"
mode : "pre_call" # Block harmful user inputs early
2. Use Post-call for LLM Responses ​
- guardrail_name : "output-moderation"
mode : "post_call" # Ensure LLM responses are safe
3. Combine with Other Guardrails ​
- guardrail_name : "openai-moderation"
- guardrail_name : "custom-pii-detection"
guardrail : presidio
Troubleshooting ​
Common Issues ​
Invalid API Key : Ensure your OpenAI API key is correctly set
export OPENAI_API_KEY="sk-your-actual-key"
Rate Limiting : OpenAI Moderation API has rate limits. Monitor usage in high-volume scenarios.
Network Issues : Verify connectivity to OpenAI's API endpoints.
Debug Mode ​
Enable detailed logging to troubleshoot issues:
Look for logs starting with OpenAI Moderation: to trace guardrail execution.
API Costs ​
The OpenAI Moderation API is free to use for content policy compliance. This makes it a cost-effective guardrail option compared to other commercial moderation services.
Need Help? ​
For additional support:
Check the OpenAI Moderation API documentation
Review LiteLLM Guardrails documentation
Join our Discord community
Overview
Quick Start
1. Define Guardrails on your LiteLLM config.yaml
2. Start LiteLLM Gateway
3. Test request
Advanced Configuration
Multiple Guardrails for Input and Output
Custom API Configuration
Streaming Support
Content Categories
Error Handling
Best Practices
1. Use Pre-call for User Input
2. Use Post-call for LLM Responses
3. Combine with Other Guardrails
Troubleshooting
Common Issues
Debug Mode
API Costs
Need Help?
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
