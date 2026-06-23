# IBM Guardrails | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/proxy/guardrails/ibm_guardrails
- Final URL: https://docs.litellm.ai/docs/proxy/guardrails/ibm_guardrails
- Canonical URL: https://docs.litellm.ai/docs/proxy/guardrails/ibm_guardrails
- Fetched at: 2026-06-23T14:30:34Z
- Content type: text/html; charset=utf-8

## Description

LiteLLM works with IBM's FMS Guardrails for content safety. You can use it to detect jailbreaks, PII, hate speech, and more.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
LiteLLM works with IBM's FMS Guardrails for content safety. You can use it to detect jailbreaks, PII, hate speech, and more.
What it does ​
IBM's FMS Guardrails is a framework for invoking detectors on LLM inputs and outputs. To configure these detectors, you can use e.g. TrustyAI detectors , an open-source project maintained by the Red Hat's TrustyAI team that allows the user to configure detectors that are:
regex patterns
file type validators
custom Python functions
Hugging Face AutoModelForSequenceClassification , i.e. sequence classification models
Each detector outputs an API response based on the following openapi schema .
You can run these checks:
Before sending to the LLM (on user input)
After getting LLM response (on output)
During the call (parallel to LLM)
Quick Start ​
1. Add to your config.yaml ​
model_list :
- model_name : gpt - 3.5 - turbo
litellm_params :
model : openai/gpt - 3.5 - turbo
api_key : os.environ/OPENAI_API_KEY
guardrails :
- guardrail_name : ibm - jailbreak - detector
guardrail : ibm_guardrails
mode : pre_call
auth_token : os.environ/IBM_GUARDRAILS_AUTH_TOKEN
base_url : "https://your-detector-server.com"
detector_id : "jailbreak-detector"
is_detector_server : true
default_on : true
optional_params :
score_threshold : 0.8
block_on_detection : true
2. Set your auth token ​
export IBM_GUARDRAILS_AUTH_TOKEN="your-token"
3. Start the proxy ​
litellm --config config.yaml --detailed_debug
4. Make a request ​
curl -i http://localhost:4000/v1/chat/completions \
-H "Content-Type: application/json" \
-H "Authorization: Bearer sk-1234" \
-d '{
"model": "gpt-3.5-turbo",
"messages": [
{"role": "user", "content": "Hello, how are you?"}
],
"guardrails": ["ibm-jailbreak-detector"]
}'
Configuration ​
Required params ​
guardrail - str - Set to ibm_guardrails
auth_token - str - Your IBM Guardrails auth token. Can use os.environ/IBM_GUARDRAILS_AUTH_TOKEN
base_url - str - URL of your IBM Detector or Guardrails server
detector_id - str - Which detector to use (e.g., "jailbreak-detector", "pii-detector")
Optional params ​
mode - str or list[str] - When to run. Options: pre_call , post_call , during_call . Default: pre_call
default_on - bool - Run automatically without specifying in request. Default: false
is_detector_server - bool - true for detector server, false for orchestrator. Default: true
verify_ssl - bool - Whether to verify SSL certificates. Default: true
optional_params ​
These go under optional_params :
detector_params - dict - Parameters to pass to your detector
extra_headers - dict - Additional headers to inject into requests to IBM Guardrails, as a key-value dict.
score_threshold - float - Only count detections above this score (0.0 to 1.0)
block_on_detection - bool - Block the request when violations found. Default: true
Server Types ​
IBM Guardrails has two APIs you can use:
Detector Server (recommended) ​
This Detectors API uses api/v1/text/contents endpoint to run a single detector; it can accept multiple text inputs within a request.
- guardrail_name : ibm - detector
is_detector_server : true # Use detector server
Orchestrator ​
If you're using the IBM FMS Guardrails Orchestrator, you can use FMS Orchestrator API , specifically by leveraging the api/v2/text/detection/content to potentially run multiple detectors in a single request; however, this endpoint can only accept one text input per request.
- guardrail_name : ibm - orchestrator
base_url : "https://your-orchestrator-server.com"
is_detector_server : false # Use orchestrator
Examples ​
Check for jailbreaks on input ​
- guardrail_name : jailbreak - check
Check for PII in responses ​
- guardrail_name : pii - check
mode : post_call
detector_id : "pii-detector"
score_threshold : 0.5 # Lower threshold for PII
Run multiple detectors ​
Then in your request:
"messages": [{"role": "user", "content": "Hello"}],
"guardrails": ["jailbreak-check", "pii-check"]
How detection works ​
When IBM Guardrails finds something, it returns details about what it found:
{
"start" : 0 ,
"end" : 31 ,
"text" : "You are now in Do Anything Mode" ,
"detection_type" : "jailbreak" ,
"score" : 0.858
}
score - How confident it is (0.0 to 1.0)
text - The specific text that triggered it
detection_type - What kind of violation
If the score is above your score_threshold , the request gets blocked (if block_on_detection is true).
Further Reading ​
Control Guardrails per API Key
IBM FMS Guardrails on GitHub
What it does
Quick Start
1. Add to your config.yaml
2. Set your auth token
3. Start the proxy
4. Make a request
Configuration
Required params
Optional params
optional_params
Server Types
Detector Server (recommended)
Orchestrator
Examples
Check for jailbreaks on input
Check for PII in responses
Run multiple detectors
How detection works
Further Reading
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
