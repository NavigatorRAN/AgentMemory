# Guardrails - Quick Start | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/proxy/guardrails/quick_start
- Final URL: https://docs.litellm.ai/docs/proxy/guardrails/quick_start
- Canonical URL: https://docs.litellm.ai/docs/proxy/guardrails/quick_start
- Fetched at: 2026-06-23T14:30:58Z
- Content type: text/html; charset=utf-8

## Description

Setup Prompt Injection Detection, PII Masking on LiteLLM Proxy (AI Gateway)

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Setup Prompt Injection Detection, PII Masking on LiteLLM Proxy (AI Gateway)
1. Define guardrails on your LiteLLM config.yaml ​
Set your guardrails under the guardrails section
model_list :
- model_name : gpt - 3.5 - turbo
litellm_params :
model : openai/gpt - 3.5 - turbo
api_key : os.environ/OPENAI_API_KEY
guardrails :
- guardrail_name : general - guard
guardrail : cato_networks
mode : [ pre_call , post_call ]
api_key : os.environ/CATO_API_KEY
api_base : os.environ/CATO_API_BASE
default_on : true # Optional
- guardrail_name : "aporia-pre-guard"
guardrail : aporia # supported values: "aporia", "lakera"
mode : "during_call"
api_key : os.environ/APORIA_API_KEY_1
api_base : os.environ/APORIA_API_BASE_1
- guardrail_name : "aporia-post-guard"
mode : "post_call"
api_key : os.environ/APORIA_API_KEY_2
api_base : os.environ/APORIA_API_BASE_2
guardrail_info : # Optional field, info is returned on GET /guardrails/list
# you can enter any fields under info for consumers of your guardrail
params :
- name : "toxicity_score"
type : "float"
description : "Score between 0-1 indicating content toxicity level"
- name : "pii_detection"
type : "boolean"
# Example Presidio guardrail config with entity actions + confidence score thresholds
- guardrail_name : "presidio-pii"
guardrail : presidio
mode : "pre_call"
presidio_language : "en"
pii_entities_config :
CREDIT_CARD : "MASK"
EMAIL_ADDRESS : "MASK"
US_SSN : "MASK"
presidio_score_thresholds : # minimum confidence scores for keeping detections
CREDIT_CARD : 0.8
EMAIL_ADDRESS : 0.6
# Example Pillar Security config via Generic Guardrail API
- guardrail_name : "pillar-security"
guardrail : generic_guardrail_api
api_base : https : //api.pillar.security/api/v1/integrations/litellm
api_key : os.environ/PILLAR_API_KEY
additional_provider_specific_params :
plr_mask : true
plr_evidence : true
plr_scanners : true
For generic guardrail APIs you can also set static headers ( headers : key/value sent on every request) and dynamic headers ( extra_headers : list of client header names to forward). See Generic Guardrail API - Static and dynamic headers .
Supported values for mode (Event Hooks) ​
pre_call Run before LLM call, on input
post_call Run after LLM call, on input & output
during_call Run during LLM call, on input Same as pre_call but runs in parallel as LLM call. Response not returned until guardrail check completes
A list of the above values to run multiple modes, e.g. mode: [pre_call, post_call]
Skip system messages in guardrail evaluation ​
You can stop unified guardrails from scanning role: system content while still sending the full messages list to the model.
Global — in litellm_settings :
litellm_settings :
skip_system_message_in_guardrail : true
Per guardrail — under that guardrail’s litellm_params : set skip_system_message_in_guardrail: true or false . If omitted, the global litellm_settings value is used; per-guardrail false forces system messages to be included even when the global flag is true .
Via LiteLLM UI — when creating or editing a guardrail in the LiteLLM Admin Dashboard, set Skip system messages in guardrail (under Basic Info on create, or in the edit / guardrail settings flows):
UI option Effect Use global default Uses litellm_settings.skip_system_message_in_guardrail from your proxy config Yes — exclude from guardrail scan Sets per-guardrail skip_system_message_in_guardrail: true No — always include in scan Sets per-guardrail skip_system_message_in_guardrail: false (overrides a global skip)
Where this applies: Only the unified guardrail path (providers that implement apply_guardrail and run through LiteLLM’s message translation layer) on OpenAI Chat Completions ( /v1/chat/completions ) and Anthropic Messages ( /v1/messages ). Examples include Presidio, Bedrock guardrails, litellm_content_filter , OpenAI Moderation, Generic Guardrail API, and custom code guardrails that define apply_guardrail .
Where this does not apply: Guardrails that run only via direct hooks on the raw request (e.g. Lakera v2, Aporia, DynamoAI, Javelin, Lasso, Pangea, Model Armor, Azure Content Safety hooks, Guardrails AI, AIM, Cato Networks, tool permission, MCP security). It also does not apply to other routes until those endpoints use the same translation layer (e.g. Responses API, embeddings, speech).
Load Balancing Guardrails ​
Need to distribute guardrail requests across multiple accounts or regions? See Guardrail Load Balancing for details on:
Load balancing across multiple AWS Bedrock accounts (useful for rate limit management)
Weighted distribution across guardrail instances
Multi-region guardrail deployments
2. Start LiteLLM Gateway ​
litellm --config config.yaml --detailed_debug
3. Test request ​
Langchain, OpenAI SDK Usage Examples
Expect this to fail since since ishaan@berri.ai in the request is PII
curl -i http://localhost:4000/v1/chat/completions \
-H "Content-Type: application/json" \
-H "Authorization: Bearer sk-npnwjPQciVRok5yNZgKmFQ" \
-d '{
"model": "gpt-3.5-turbo",
"messages": [
{"role": "user", "content": "hi my email is ishaan@berri.ai"}
],
"guardrails": ["aporia-pre-guard", "aporia-post-guard"]
}'
Expected response on failure
{
"error": {
"message": {
"error": "Violated guardrail policy",
"aporia_ai_response": {
"action": "block",
"revised_prompt": null,
"revised_response": "Aporia detected and blocked PII",
"explain_log": null
}
},
"type": "None",
"param": "None",
"code": "400"
{"role": "user", "content": "hi what is the weather"}
Default On Guardrails ​
Set default_on: true in your guardrail config to run the guardrail on every request. This is useful if you want to run a guardrail on every request without the user having to specify it.
Note: These will run even if user specifies a different guardrail or empty guardrails array.
guardrail : aporia
default_on : true
Test Request
In this request, the guardrail aporia-pre-guard will run on every request because default_on: true is set.
]
Expected response
Your response headers will include x-litellm-applied-guardrails with the guardrail applied
x-litellm-applied-guardrails: aporia-pre-guard
Guardrail Policies ​
Need more control? Use Guardrail Policies to:
Group guardrails into reusable policies
Enable/disable guardrails for specific teams, keys, or models
Inherit from existing policies and override specific guardrails
Using Guardrails Client Side ​
Test yourself (OSS) ​
Pass guardrails to your request body to test it
Expose to your users (Enterprise) ​
Follow this simple workflow to implement and tune guardrails:
1. View Available Guardrails ​
First, check what guardrails are available and their parameters:
Call /guardrails/list to view available guardrails and the guardrail info (supported parameters, description, etc)
curl -X GET 'http://0.0.0.0:4000/guardrails/list'
"guardrails" : [
"guardrail_name" : "aporia-post-guard" ,
"guardrail_info" : {
"params" : [
"name" : "toxicity_score" ,
"type" : "float" ,
"description" : "Score between 0-1 indicating content toxicity level"
} ,
"name" : "pii_detection" ,
"type" : "boolean"
This config will return the /guardrails/list response above. The guardrail_info field is optional and you can add any fields under info for consumers of your guardrail
2. Apply Guardrails ​
Add selected guardrails to your chat completion request:
"messages": [{"role": "user", "content": "your message"}],
3. Test with Mock LLM completions ​
Send mock_response to test guardrails without making an LLM call. More info on mock_response here
"mock_response": "This is a mock response",
4. ✨ Pass Dynamic Parameters to Guardrail ​
info
✨ This is an Enterprise only feature Get a free trial
Use this to pass additional parameters to the guardrail API call. e.g. things like success threshold. See guardrails spec for more details
Set guardrails={"aporia-pre-guard": {"extra_body": {"success_threshold": 0.9}}} to pass additional parameters to the guardrail
In this example success_threshold=0.9 is passed to the aporia-pre-guard guardrail request body
import openai
client = openai . OpenAI (
api_key = "anything" ,
base_url = "http://0.0.0.0:4000"
)
response = client . chat . completions . create (
model = "gpt-3.5-turbo" ,
messages = [
"role" : "user" ,
"content" : "this is a test request, write a short poem"
] ,
extra_body = {
"guardrails" : {
"aporia-pre-guard" : {
"extra_body" : {
"success_threshold" : 0.9
print ( response )
curl --location 'http://0.0.0.0:4000/chat/completions' \
--header 'Content-Type: application/json' \
--data '{
"role": "user",
"content": "what llm are you"
"guardrails": {
"aporia-pre-guard": {
"extra_body": {
"success_threshold": 0.9
Proxy Admin Controls ​
Monitoring Guardrails ​
Monitor which guardrails were executed and whether they passed or failed. e.g. guardrail going rogue and failing requests we don't intend to fail
:::
Setup ​
Connect LiteLLM to a supported logging provider
Make a request with a guardrails parameter
Check your logging provider for the guardrail trace
Traced Guardrail Success ​
Traced Guardrail Failure ​
✨ Control Guardrails per API Key ​
Use this to control what guardrails run per API Key. In this tutorial we only want the following guardrails to run for 1 API Key
guardrails : ["aporia-pre-guard", "aporia-post-guard"]
Step 1 Create Key with guardrail settings
curl -X POST 'http://0.0.0.0:4000/key/generate' \
-H 'Authorization: Bearer sk-1234' \
-H 'Content-Type: application/json' \
curl --location 'http://0.0.0.0:4000/key/update' \
--header 'Authorization: Bearer sk-1234' \
"key": "sk-jNm1Zar7XfNdZXp49Z1kSQ",
Step 2 Test it with new key
--header 'Authorization: Bearer sk-jNm1Zar7XfNdZXp49Z1kSQ' \
"content": "my email is ishaan@berri.ai"
✨ Tag-based Guardrail Modes ​
Run guardrails based on the user-agent header. This is useful for running pre-call checks on OpenWebUI but only masking in logs for Claude CLI.
Both default and tag values can be a single mode string or a list of modes.
model : gpt - 3.5 - turbo
- guardrail_name : "guardrails_ai-guard"
guardrail : guardrails_ai
guard_name : "pii_detect" # 👈 Guardrail AI guard name
mode :
tags :
"User-Agent: claude-cli" : "logging_only" # Claude CLI - only mask in logs
default : "pre_call" # Default mode when no tags match
api_base : os.environ/GUARDRAILS_AI_API_BASE # 👈 Guardrails AI API Base. Defaults to "http://0.0.0.0:8000"
default_on : true # run on every request
Per guardrailmodel_list :
guard_name : "pii_detect"
"User-Agent: claude-cli" : "logging_only"
default : [ "pre_call" , "post_call" ] # Run on both pre and post call when no tags match
api_base : os.environ/GUARDRAILS_AI_API_BASE
"User-Agent: claude-cli" : [ "pre_call" , "post_call" ] # Run both pre and post call for claude-cli
default : "logging_only" # Default to logging only when no tags match
✨ Model-level Guardrails ​
This is great for cases when you have an on-prem and hosted model, and just want to run prevent sending PII to the hosted model.
- model_name : claude - sonnet - 4
model : anthropic/claude - sonnet - 4 - 20250514
api_key : os.environ/ANTHROPIC_API_KEY
api_base : https : //api.anthropic.com/v1
guardrails : [ "azure-text-moderation" ]
- model_name : openai - gpt - 4o
model : openai/gpt - 4o
guardrail : presidio # supported values: "aporia", "bedrock", "lakera", "presidio"
presidio_language : "en" # optional: set default language for PII analysis
PERSON : "BLOCK" # Will mask credit card numbers
- guardrail_name : azure - text - moderation
guardrail : azure/text_moderations
api_key : os.environ/AZURE_GUARDRAIL_API_KEY
api_base : os.environ/AZURE_GUARDRAIL_API_BASE
✨ Disable team from turning on/off guardrails ​
1. Disable team from modifying guardrails ​
curl -X POST 'http://0.0.0.0:4000/team/update' \
"team_id": "4198d93c-d375-4c83-8d5a-71e7c5473e50",
"metadata": {"guardrails": {"modify_guardrails": false}}
2. Try to disable guardrails for a call ​
--header 'Authorization: Bearer $LITELLM_VIRTUAL_KEY' \
"content": "Think of 10 random colors."
"metadata": {"guardrails": {"hide_secrets": false}}
3. Get 403 Error ​
"error": "Your team does not have permission to modify guardrails."
"type": "auth_error",
"code": 403
Expect to NOT see +1 412-612-9992 in your server logs on your callback.
The pii_masking guardrail ran on this request because api key=sk-jNm1Zar7XfNdZXp49Z1kSQ has "permissions": {"pii_masking": true}
Specification ​
guardrails Configuration on YAML ​
- guardrail_name : string # Required: Name of the guardrail
litellm_params : # Required: Configuration parameters
guardrail : string # Required: One of "aporia", "bedrock", "guardrails_ai", "lakera", "presidio", "hide-secrets"
mode : Union [ string , List [ string ] , Mode ] # Required: One or more of "pre_call", "post_call", "during_call", "logging_only"
api_key : string # Required: API key for the guardrail service
api_base : string # Optional: Base URL for the guardrail service
default_on : boolean # Optional: Default False. When set to True, will run on every request, does not need client to specify guardrail in request
guardrail_info : # Optional[Dict]: Additional information about the guardrail
Mode Specification
Both default and tag values accept either a single string or a list of strings.
from litellm . types . guardrails import Mode
# Single default mode
mode = Mode (
tags = { "User-Agent: claude-cli" : "logging_only" } ,
default = "logging_only"
# Multiple default modes
default = [ "pre_call" , "post_call" ]
# Multiple modes on a tag value
tags = { "User-Agent: claude-cli" : [ "pre_call" , "post_call" ] } ,
guardrails Request Parameter ​
The guardrails parameter can be passed to any LiteLLM Proxy endpoint ( /chat/completions , /completions , /embeddings ).
Format Options ​
Simple List Format:
"aporia-pre-guard" ,
"aporia-post-guard"
Advanced Dictionary Format:
In this format the dictionary key is guardrail_name you want to run
"success_threshold" : 0.9 ,
"other_param" : "value"
Type Definition ​
guardrails : Union [
List [ str ] , # Simple list of guardrail names
Dict [ str , DynamicGuardrailParams ] # Advanced configuration
class DynamicGuardrailParams :
extra_body : Dict [ str , Any ] # Additional parameters for the guardrail
1. Define guardrails on your LiteLLM config.yaml
Supported values for mode (Event Hooks)
Skip system messages in guardrail evaluation
Load Balancing Guardrails
2. Start LiteLLM Gateway
3. Test request
Default On Guardrails
Guardrail Policies
Using Guardrails Client Side
Test yourself (OSS)
Expose to your users (Enterprise)
1. View Available Guardrails
2. Apply Guardrails
3. Test with Mock LLM completions
4. ✨ Pass Dynamic Parameters to Guardrail
Proxy Admin Controls
Monitoring Guardrails
✨ Control Guardrails per API Key
✨ Tag-based Guardrail Modes
✨ Model-level Guardrails
✨ Disable team from turning on/off guardrails
Specification
guardrails Configuration on YAML
guardrails Request Parameter
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
