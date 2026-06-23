# Cato Networks | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/proxy/guardrails/cato_networks
- Final URL: https://docs.litellm.ai/docs/proxy/guardrails/cato_networks
- Canonical URL: https://docs.litellm.ai/docs/proxy/guardrails/cato_networks
- Fetched at: 2026-06-23T14:30:22Z
- Content type: text/html; charset=utf-8

## Description

Quick Start

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Quick Start ​
1. Create a new Cato Networks AI Security Guard ​
Go to Cato Networks CMA and create a new AI Security guard.
Name your guard and select the AI Gateway option.
info
When using LiteLLM with virtual keys, use the virtual key alias as the name of the guard to be able to set key-specific policies.
Only the aliases of your virtual keys (and not the actual key secrets) will be sent to Cato Networks.
2. Configure your Cato Networks AI Security Guard policies ​
Create an Engine Profile, selecting which detections to enable.
Create a Guard Policy rule that references this Engine Profile and your Guard, then configure the action to apply.
3. Add Cato Networks Guardrail on your LiteLLM config.yaml ​
Define your guardrails under the guardrails section
model_list :
- model_name : gpt - 3.5 - turbo
litellm_params :
model : openai/gpt - 3.5 - turbo
api_key : os.environ/OPENAI_API_KEY
guardrails :
- guardrail_name : cato - protected - app
guardrail : cato_networks
mode : [ pre_call , post_call ] # "During_call" is also available
api_key : os.environ/CATO_API_KEY
api_base : os.environ/CATO_API_BASE
ssl_verify : False # Optional, set to False to disable SSL verification or a string path to a custom CA bundle
Under the api_key , insert the API key you were issued. The key can be found in the guard's page.
You can also set CATO_API_KEY as an environment variable.
By default, the api_base is set to https://api.aisec.catonetworks.com . Set the correct url for your region.
If you are using a self-hosted Outpost, you can set the api_base to your Outpost's URL.
4. Start LiteLLM Gateway ​
litellm --config config.yaml
5. Make your first request ​
note
The following example depends on enabling PII detection in your policy.
You can adjust the request content to match different guard's policies.
Successfully blocked request
Successfully permitted request
When using LiteLLM with virtual keys, an Authorization header with the virtual key is required.
curl -i http://localhost:4000/v1/chat/completions \
-H "Content-Type: application/json" \
-H "Authorization: Bearer sk-1234" \
-d '{
"model": "gpt-3.5-turbo",
"messages": [
{"role": "user", "content": "hi my email is ishaan@berri.ai"}
],
"guardrails": ["cato-protected-app"]
}'
If configured correctly, since ishaan@berri.ai would be detected by the Cato Networks AI Security Guard as PII, you'll receive a response similar to the following with a 400 Bad Request status code:
{
"error" : {
"message" : "\"ishaan@berri.ai\" detected as email" ,
"type" : "None" ,
"param" : "None" ,
"code" : "400"
}
{"role": "user", "content": "hi what is the weather"}
The above request should not be blocked, and you should receive a regular LLM response (simplified for brevity):
"model" : "gpt-3.5-turbo-0125" ,
"choices" : [
"finish_reason" : "stop" ,
"index" : 0 ,
"message" : {
"content" : "I can’t provide live weather updates without the internet. Let me know if you’d like general weather trends for a location and season instead!" ,
"role" : "assistant"
]
Quick Start
1. Create a new Cato Networks AI Security Guard
2. Configure your Cato Networks AI Security Guard policies
3. Add Cato Networks Guardrail on your LiteLLM config.yaml
4. Start LiteLLM Gateway
5. Make your first request
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
