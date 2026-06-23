# EnkryptAI Guardrails | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/proxy/guardrails/enkryptai
- Final URL: https://docs.litellm.ai/docs/proxy/guardrails/enkryptai
- Canonical URL: https://docs.litellm.ai/docs/proxy/guardrails/enkryptai
- Fetched at: 2026-06-23T14:30:27Z
- Content type: text/html; charset=utf-8

## Description

LiteLLM supports EnkryptAI guardrails for content moderation and safety checks on LLM inputs and outputs.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
LiteLLM supports EnkryptAI guardrails for content moderation and safety checks on LLM inputs and outputs.
Quick Start ​
1. Define Guardrails on your LiteLLM config.yaml ​
Define your guardrails under the guardrails section:
model_list :
- model_name : gpt - 3.5 - turbo
litellm_params :
model : openai/gpt - 3.5 - turbo
api_key : os.environ/OPENAI_API_KEY
guardrails :
- guardrail_name : "enkryptai-guard"
guardrail : enkryptai
mode : "pre_call"
api_key : os.environ/ENKRYPTAI_API_KEY
detectors :
toxicity :
enabled : true
nsfw :
pii :
entities : [ "email" , "phone" , "secrets" ]
injection_attack :
Supported values for mode ​
pre_call - Run before LLM call, on input
post_call - Run after LLM call, on output
during_call - Run during LLM call, on input . Same as pre_call but runs in parallel as LLM call
Available Detectors ​
EnkryptAI supports multiple content detection types:
toxicity - Detect toxic language
nsfw - Detect NSFW (Not Safe For Work) content
pii - Detect personally identifiable information
Configure entities: ["pii", "email", "phone", "secrets", "ip_address", "url"]
injection_attack - Detect prompt injection attempts
keyword_detector - Detect custom keywords/phrases
policy_violation - Detect policy violations
bias - Detect biased content
sponge_attack - Detect sponge attacks
2. Set Environment Variables ​
export ENKRYPTAI_API_KEY="your-api-key"
3. Start LiteLLM Gateway ​
litellm --config config.yaml --detailed_debug
4. Test Request ​
Langchain, OpenAI SDK Usage Examples
Successful Call
Unsuccessful Call
curl -i http://localhost:4000/v1/chat/completions \
-H "Content-Type: application/json" \
-H "Authorization: Bearer sk-1234" \
-d '{
"model": "gpt-3.5-turbo",
"messages": [
{"role": "user", "content": "Hello, how can you help me today?"}
],
"guardrails": ["enkryptai-guard"]
}'
Response: HTTP 200 Success
Content passes all detector checks and is allowed through.
Expect this to fail if content violates detector policies:
{"role": "user", "content": "My email is test@example.com and my SSN is 123-45-6789"}
Expected Response on Failure: HTTP 400 Error
{
"error" : {
"message" : {
"error" : "Content blocked by EnkryptAI guardrail" ,
"detected" : true ,
"violations" : [ "pii" ] ,
"response" : {
"summary" : {
"pii" : 1
} ,
"details" : {
"pii" : {
"detected" : [ "email" , "ssn" ]
}
"type" : "None" ,
"param" : "None" ,
"code" : "400"
Video Walkthrough ​
Advanced Configuration ​
Using Custom Policies ​
You can specify a custom EnkryptAI policy:
- guardrail_name : "enkryptai-custom"
policy_name : "my-custom-policy" # Sent via x-enkrypt-policy header
Using Deployments ​
Specify an EnkryptAI deployment:
- guardrail_name : "enkryptai-deployment"
deployment_name : "production" # Sent via X-Enkrypt-Deployment header
Monitor Mode (Logging Without Blocking) ​
Set block_on_violation: false to log violations without blocking requests:
- guardrail_name : "enkryptai-monitor"
block_on_violation : false # Log violations but don't block
In monitor mode, all violations are logged but requests are never blocked.
Input and Output Guardrails ​
Configure separate guardrails for input and output:
# Input guardrail
- guardrail_name : "enkryptai-input"
entities : [ "email" , "phone" , "ssn" ]
# Output guardrail
- guardrail_name : "enkryptai-output"
mode : "post_call"
Configuration Options ​
Parameter Type Description Default api_key string EnkryptAI API key ENKRYPTAI_API_KEY env var api_base string EnkryptAI API base URL https://api.enkryptai.com policy_name string Custom policy name (sent via x-enkrypt-policy header) None deployment_name string Deployment name (sent via X-Enkrypt-Deployment header) None detectors object Detector configuration {} block_on_violation boolean Block requests on violations true mode string When to run: pre_call , post_call , or during_call Required
Observability ​
EnkryptAI guardrail logs include:
guardrail_status : success , guardrail_intervened , or guardrail_failed_to_respond
guardrail_provider : enkryptai
guardrail_json_response : Full API response with detection details
duration : Time taken for guardrail check
start_time and end_time : Timestamps
These logs are available through your configured LiteLLM logging callbacks.
Error Handling ​
The guardrail handles errors gracefully:
API Failures : Logs error and raises exception
Rate Limits (429) : Logs error and raises exception
Invalid Configuration : Raises ValueError on initialization
Set block_on_violation: false to continue processing even when violations are detected (monitor mode).
Support ​
For more information about EnkryptAI:
Documentation: https://docs.enkryptai.com
Website: https://enkryptai.com
Quick Start
1. Define Guardrails on your LiteLLM config.yaml
2. Set Environment Variables
3. Start LiteLLM Gateway
4. Test Request
Video Walkthrough
Advanced Configuration
Using Custom Policies
Using Deployments
Monitor Mode (Logging Without Blocking)
Input and Output Guardrails
Configuration Options
Observability
Error Handling
Support
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
