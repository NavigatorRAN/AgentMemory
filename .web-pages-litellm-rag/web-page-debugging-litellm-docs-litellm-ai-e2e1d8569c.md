# Debugging | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/proxy/debugging
- Final URL: https://docs.litellm.ai/docs/proxy/debugging
- Canonical URL: https://docs.litellm.ai/docs/proxy/debugging
- Fetched at: 2026-06-23T14:30:06Z
- Content type: text/html; charset=utf-8

## Description

2 levels of debugging supported.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
2 levels of debugging supported.
debug (prints info logs)
detailed debug (prints debug logs)
The proxy also supports json logs. See here
debug ​
via cli
$ litellm --debug
via env
os . environ [ "LITELLM_LOG" ] = "INFO"
detailed debug ​
$ litellm --detailed_debug
os . environ [ "LITELLM_LOG" ] = "DEBUG"
Debug Logs ​
Run the proxy with --detailed_debug to view detailed debug logs
litellm --config /path/to/config.yaml --detailed_debug
When making requests you should see the POST request sent by LiteLLM to the LLM on the Terminal output
POST Request Sent from LiteLLM:
curl -X POST \
https://api.openai.com/v1/chat/completions \
-H 'content-type: application/json' -H 'Authorization: Bearer sk-qnWGUIW9****************************************' \
-d '{"model": "gpt-3.5-turbo", "messages": [{"role": "user", "content": "this is a test request, write a short poem"}]}'
Debug single request ​
Pass in litellm_request_debug=True in the request body
curl -L -X POST 'http://0.0.0.0:4000/chat/completions' \
-H 'Content-Type: application/json' \
-H 'Authorization: Bearer sk-1234' \
-d '{
"model":"fake-openai-endpoint",
"messages": [{"role": "user","content": "How many r in the word strawberry?"}],
"litellm_request_debug": true
}'
This will emit the raw request sent by LiteLLM to the API Provider and raw response received from the API Provider for just this request in the logs.
INFO: Uvicorn running on http://0.0.0.0:4000 (Press CTRL+C to quit)
20:14:06 - LiteLLM:WARNING: litellm_logging.py:938 -
https://exampleopenaiendpoint-production.up.railway.app/chat/completions \
-H 'Authorization: Be****ey' -H 'Content-Type: application/json' \
-d '{'model': 'fake', 'messages': [{'role': 'user', 'content': 'How many r in the word strawberry?'}], 'stream': False}'
20:14:06 - LiteLLM:WARNING: litellm_logging.py:1015 - RAW RESPONSE:
{"id":"chatcmpl-817fc08f0d6c451485d571dab39b26a1","object":"chat.completion","created":1677652288,"model":"gpt-3.5-turbo-0301","system_fingerprint":"fp_44709d6fcb","choices":[{"index":0,"message":{"role":"assistant","content":"\n\nHello there, how may I assist you today?"},"logprobs":null,"finish_reason":"stop"}],"usage":{"prompt_tokens":9,"completion_tokens":12,"total_tokens":21}}
INFO: 127.0.0.1:56155 - "POST /chat/completions HTTP/1.1" 200 OK
JSON LOGS ​
Set JSON_LOGS="True" in your env:
export JSON_LOGS="True"
OR
Set json_logs: true in your yaml:
litellm_settings :
json_logs : true
Start proxy
$ litellm
The proxy will now all logs in json format.
Control Log Output ​
Turn off fastapi's default 'INFO' logs
Turn on 'json logs'
Set LITELLM_LOG to 'ERROR'
Only get logs if an error occurs.
LITELLM_LOG="ERROR"
Expected Output:
# no info statements
Common Errors ​
"No available deployments..."
No deployments available for selected model, Try again in 60 seconds. Passed model=claude-3-5-sonnet. pre-call-checks=False, allowed_model_region=n/a.
This can be caused due to all your models hitting rate limit errors, causing the cooldown to kick in.
How to control this?
Adjust the cooldown time
router_settings :
cooldown_time : 0 # 👈 KEY CHANGE
Disable Cooldowns [NOT RECOMMENDED]
disable_cooldowns : True
This is not recommended, as it will lead to requests being routed to deployments over their tpm/rpm limit.
debug
detailed debug
Debug Logs
Debug single request
JSON LOGS
Control Log Output
Common Errors
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
