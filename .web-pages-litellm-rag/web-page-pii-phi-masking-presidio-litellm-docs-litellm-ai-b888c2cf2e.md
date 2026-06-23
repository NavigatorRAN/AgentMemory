# PII, PHI Masking - Presidio | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/proxy/guardrails/pii_masking_v2
- Final URL: https://docs.litellm.ai/docs/proxy/guardrails/pii_masking_v2
- Canonical URL: https://docs.litellm.ai/docs/proxy/guardrails/pii_masking_v2
- Fetched at: 2026-06-23T14:30:47Z
- Content type: text/html; charset=utf-8

## Description

Overview

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Overview ​
Property Details Description Use this guardrail to mask PII (Personally Identifiable Information), PHI (Protected Health Information), and other sensitive data. Provider Microsoft Presidio Supported Entity Types All Presidio Entity Types Supported Actions MASK , BLOCK Supported Modes pre_call , during_call , post_call , logging_only , pre_mcp_call Language Support Configurable via presidio_language parameter (supports multiple languages including English, Spanish, German, etc.)
Deployment options ​
For this guardrail you need a deployed Presidio Analyzer and Presido Anonymizer containers.
Deployment Option Details Deploy Presidio Docker Containers - Presidio Analyzer Docker Container
- Presidio Anonymizer Docker Container
Quick Start ​
LiteLLM UI
Config.yaml
1. Create a PII, PHI Masking Guardrail ​
On the LiteLLM UI, navigate to Guardrails. Click "Add Guardrail". On this dropdown select "Presidio PII" and enter your presidio analyzer and anonymizer endpoints.
1.2 Configure Entity Types ​
Now select the entity types you want to mask. See the supported actions here
1.3 Set Default Language (Optional) ​
You can also configure a default language for PII analysis using the presidio_language field in the UI. This sets the default language that will be used for all requests unless overridden by a per-request language setting.
Supported language codes include:
en - English (default)
es - Spanish
de - German
If not specified, English ( en ) will be used as the default language.
Define your guardrails under the guardrails section
config.yaml
model_list :
- model_name : gpt - 3.5 - turbo
litellm_params :
model : openai/gpt - 3.5 - turbo
api_key : os.environ/OPENAI_API_KEY
guardrails :
- guardrail_name : "presidio-pii"
guardrail : presidio # supported values: "aporia", "bedrock", "lakera", "presidio"
mode : "pre_call"
presidio_language : "en" # optional: set default language for PII analysis
Set the following env vars
Setup Environment Variables
export PRESIDIO_ANALYZER_API_BASE="http://localhost:5002"
export PRESIDIO_ANONYMIZER_API_BASE="http://localhost:5001"
Supported values for mode ​
pre_call Run before LLM call, on input
post_call Run after LLM call, on input & output
logging_only Run after LLM call, only apply PII Masking before logging to Langfuse, etc. Not on the actual llm api request / response.
2. Start LiteLLM Gateway ​
Start Gateway
litellm --config config.yaml --detailed_debug
3. Test it! ​
3.1 LiteLLM UI ​
On the litellm UI, navigate to the 'Test Keys' page, select the guardrail you created and send the following messaged filled with PII data.
PII Request
My credit card is 4111-1111-1111-1111 and my email is test@example.com.
3.2 Test in code ​
In order to apply a guardrail for a request send guardrails=["presidio-pii"] in the request body.
Langchain, OpenAI SDK Usage Examples
Masked PII call
No PII Call
Expect this to mask Jane Doe since it's PII
Masked PII Request
curl http://localhost:4000/chat/completions \
-H "Content-Type: application/json" \
-H "Authorization: Bearer sk-1234" \
-d '{
"model": "gpt-3.5-turbo",
"messages": [
{"role": "user", "content": "Hello my name is Jane Doe"}
],
"guardrails": ["presidio-pii"],
}'
Expected response on failure
Response with Masked PII
{
"id": "chatcmpl-A3qSC39K7imjGbZ8xCDacGJZBoTJQ",
"choices": [
"finish_reason": "stop",
"index": 0,
"message": {
"content": "Hello, <PERSON>! How can I assist you today?",
"role": "assistant",
"tool_calls": null,
"function_call": null
}
"created": 1725479980,
"model": "gpt-3.5-turbo-2024-07-18",
"object": "chat.completion",
"system_fingerprint": "fp_5bd87c427a",
"usage": {
"completion_tokens": 13,
"prompt_tokens": 14,
"total_tokens": 27
},
"service_tier": null
No PII Request
{"role": "user", "content": "Hello good morning"}
Tracing Guardrail requests ​
Once your guardrail is live in production, you will also be able to trace your guardrail on LiteLLM Logs, Langfuse, Arize Phoenix, etc, all LiteLLM logging integrations.
LiteLLM UI ​
On the LiteLLM logs page you can see that the PII content was masked for this specific request. And you can see detailed tracing for the guardrail. This allows you to monitor entity types masked with their corresponding confidence score and the duration of the guardrail execution.
Langfuse ​
When connecting Litellm to Langfuse, you can see the guardrail information on the Langfuse Trace.
Entity Types, Detection Confidence Score Threshold, and Scope Configuration ​
Entity Types
You can configure specific entity types for PII detection and decide how to handle each entity type (mask or block).
Detection Confidence Score Threshold
You can also provide an optional confidence score threshold at which detections will be passed to the anonymizer. Entities without an entry in presidio_score_thresholds keep all detections (no minimum score).
Scope
Use the optional presidio_filter_scope to choose where checks run:
input : only user → model content is scanned
output : only model → user content is scanned
both (default): scan both directions
What about output_parse_pii ?
This flag only un-masks tokens back to the originals after the model call; it does not run Presidio detection on outputs. Use presidio_filter_scope: output (or both ) when you want Presidio to actively scan and mask the model’s response before it reaches the user.
When to pick input vs output:
input : Protect upstream providers; strip PII before it leaves your boundary.
output : Catch PII the model might generate or leak back to users.
both : End-to-end protection in both directions.
Configure Entity Types, Detection Confidence Score Threshold, and Scope in config.yaml ​
Define your guardrails with specific entity type configuration:
config.yaml with Entity Types
- guardrail_name : "presidio-mask-guard"
guardrail : presidio
mode : "pre_mcp_call" # Use this mode for MCP requests
presidio_filter_scope : both # input | output | both, optional
presidio_score_thresholds : # Optional
ALL : 0.7 # Default confidence threshold applied to all entities
CREDIT_CARD : 0.8 # Override for credit cards
EMAIL_ADDRESS : 0.6 # Override for emails
pii_entities_config :
CREDIT_CARD : "MASK" # Will mask credit card numbers
EMAIL_ADDRESS : "MASK" # Will mask email addresses
- guardrail_name : "presidio-block-guard"
mode : "pre_call" # Use this mode for regular LLM requests
CREDIT_CARD : 0.8 # Only keep credit card detections scoring 0.8+
CREDIT_CARD : "BLOCK" # Will block requests containing credit card numbers
Confidence threshold behavior: ​
No presidio_score_thresholds : keep all detections (no thresholds applied)
presidio_score_thresholds.ALL : apply this confidence threshold to every detection
presidio_score_thresholds.<ENTITY> : apply only to that entity
If both ALL and an entity override exist, ALL applies globally and the entity override takes precedence for that entity
Supported Entity Types ​
LiteLLM Supports all Presidio entity types. See the complete list of presidio entity types here .
Supported Actions ​
For each entity type, you can specify one of the following actions:
MASK : Replace the entity with a placeholder (e.g., <PERSON> )
BLOCK : Block the request entirely if this entity type is detected
Test request with Entity Type Configuration ​
Masking PII entities
Blocking PII entities
When using the masking configuration, entities will be replaced with placeholders:
Masking PII Request
{"role": "user", "content": "My credit card is 4111-1111-1111-1111 and my email is test@example.com"}
"guardrails": ["presidio-mask-guard"]
Example response with masked entities:
"id" : "chatcmpl-123abc" ,
"choices" : [
"message" : {
"content" : "I can see you provided a <CREDIT_CARD> and an <EMAIL_ADDRESS>. For security reasons, I recommend not sharing this sensitive information." ,
"role" : "assistant"
} ,
"index" : 0 ,
"finish_reason" : "stop"
] ,
// ... other response fields
When using the blocking configuration, requests containing the configured entity types will be blocked completely with an exception:
Blocking PII Request
{"role": "user", "content": "My credit card is 4111-1111-1111-1111"}
"guardrails": ["presidio-block-guard"]
When running this request, the proxy will raise a BlockedPiiEntityError exception.
"error" : {
"message" : "Blocked PII entity detected: CREDIT_CARD by Guardrail: presidio-block-guard."
The exception includes the entity type that was blocked ( CREDIT_CARD in this case) and the guardrail name that caused the blocking.
Advanced ​
Supported Modes ​
The Presidio guardrail supports the following modes:
pre_call : Run before LLM call, on input
post_call : Run after LLM call, on input & output
logging_only : Run after LLM call, only apply PII Masking before logging to Langfuse, etc. Not on the actual llm api request / response
pre_mcp_call : Run before MCP call, on input . Use this mode when you want to apply PII masking/blocking for MCP requests
MCP Usage Example ​
Here's how to use Presidio guardrails with MCP:
MCP Configuration Example
- guardrail_name : "presidio-mcp-guard"
mode : "pre_mcp_call"
presidio_filter_scope : both # input | output | both
presidio_score_thresholds :
EMAIL_ADDRESS : 0.6 # Only keep email detections scoring 0.6+
EMAIL_ADDRESS : "BLOCK" # Will block email addresses
PHONE_NUMBER : "MASK" # Will mask phone numbers
MEDICAL_LICENSE : "BLOCK" # Will block medical license numbers
default_on : true
Test the MCP guardrail with a request:
Test MCP Guardrail
{"role": "user", "content": "My credit card is 4111-1111-1111-1111 and my medical license is ABC123"}
"guardrails": ["presidio-mcp-guard"]
The request will be processed as follows:
Credit card number will be masked (e.g., replaced with <CREDIT_CARD> )
If a medical license is detected, the request will be blocked with a BlockedPiiEntityError
Set language per request ​
The Presidio API supports passing the language param . Here is how to set the language per request
curl
OpenAI Python SDK
Language Parameter - curl
{"role": "user", "content": "is this credit card number 9283833 correct?"}
"guardrails": ["presidio-pre-guard"],
"guardrail_config": {"language": "es"}
Language Parameter - Python
import openai
client = openai . OpenAI (
api_key = "anything" ,
base_url = "http://0.0.0.0:4000"
)
# request sent to model set on litellm proxy, `litellm --model`
response = client . chat . completions . create (
model = "gpt-3.5-turbo" ,
messages = [
"role" : "user" ,
"content" : "this is a test request, write a short poem"
extra_body = {
"metadata" : {
"guardrails" : [ "presidio-pre-guard" ] ,
"guardrail_config" : { "language" : "es" }
print ( response )
Set default language in config.yaml ​
You can configure a default language for PII analysis in your YAML configuration using the presidio_language parameter. This language will be used for all requests unless overridden by a per-request language setting.
Default Language Configuration
- guardrail_name : "presidio-german"
presidio_language : "de" # Default to German for PII analysis
CREDIT_CARD : "MASK"
EMAIL_ADDRESS : "MASK"
PERSON : "MASK"
- guardrail_name : "presidio-spanish"
presidio_language : "es" # Default to Spanish for PII analysis
PHONE_NUMBER : "MASK"
Supported Language Codes ​
Presidio supports multiple languages for PII detection. Common language codes include:
For a complete list of supported languages, refer to the Presidio documentation .
Language Precedence ​
The language setting follows this precedence order:
Per-request language (via guardrail_config.language ) - highest priority
YAML config language (via presidio_language ) - medium priority
Default language ( en ) - lowest priority
Example with mixed languages:
Mixed Language Configuration
- guardrail_name : "presidio-multilingual"
presidio_language : "de" # Default to German
Override with per-request language
{"role": "user", "content": "Mi tarjeta de crédito es 4111-1111-1111-1111"}
"guardrails": ["presidio-multilingual"],
In this example, the request will use Spanish ( es ) for PII detection even though the guardrail is configured with German ( de ) as the default language.
Output parsing ​
LLM responses can sometimes contain the masked tokens.
For presidio 'replace' operations, LiteLLM can check the LLM response and replace the masked token with the user-submitted values.
Output Parsing Config
- guardrail_name : "presidio-pre-guard"
output_parse_pii : True
**Expected Flow: **
User Input: "hello world, my name is Jane Doe. My number is: 034453334"
LLM Input: "hello world, my name is [PERSON]. My number is: [PHONE_NUMBER]"
LLM Response: "Hey [PERSON], nice to meet you!"
User Response: "Hey Jane Doe, nice to meet you!"
Ad Hoc Recognizers ​
Send ad-hoc recognizers to presidio /analyze by passing a json file to the proxy
Example ad-hoc recognizer
Define ad-hoc recognizer on your LiteLLM config.yaml ​
Ad Hoc Recognizers Config
presidio_ad_hoc_recognizers : "./hooks/example_presidio_ad_hoc_recognizer.json"
Ad Hoc Recognizers Environment Variables
You can see this working, when you run the proxy:
Run Proxy with Debug
litellm --config /path/to/config.yaml --debug
Make a chat completions request, example:
Custom PII Request
"model" : "azure-gpt-3.5" ,
"messages" : [ { "role" : "user" , "content" : "John Smith AHV number is 756.3026.0705.92. Zip code: 1334023" } ]
And search for any log starting with Presidio PII Masking , example:
PII Masking Log
Presidio PII Masking: Redacted pii message: <PERSON> AHV number is <AHV_NUMBER>. Zip code: <US_DRIVER_LICENSE>
Logging Only ​
Only apply PII Masking before logging to Langfuse, etc.
Not on the actual llm api request / response.
note
This is currently only applied for
/chat/completion requests
on 'success' logging
Define mode: logging_only on your LiteLLM config.yaml
Logging Only Config
mode : "logging_only"
Logging Only Environment Variables
Start proxy
Start Proxy
litellm --config /path/to/config.yaml
Test it!
Test Logging Only
curl -X POST 'http://0.0.0.0:4000/chat/completions' \
-H 'Content-Type: application/json' \
-H 'Authorization: Bearer sk-1234' \
-D '{
"role": "user",
"content": "Hi, my name is Jane!"
]
Expected Logged Response
Logged Response with Masked PII
Hi, my name is <PERSON>!
Overview
Deployment options
Quick Start
1. Create a PII, PHI Masking Guardrail
2. Start LiteLLM Gateway
3. Test it!
Tracing Guardrail requests
Langfuse
Entity Types, Detection Confidence Score Threshold, and Scope Configuration
Configure Entity Types, Detection Confidence Score Threshold, and Scope in config.yaml
Supported Entity Types
Supported Actions
Test request with Entity Type Configuration
Advanced
Supported Modes
MCP Usage Example
Set language per request
Set default language in config.yaml
Output parsing
Ad Hoc Recognizers
Logging Only
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
