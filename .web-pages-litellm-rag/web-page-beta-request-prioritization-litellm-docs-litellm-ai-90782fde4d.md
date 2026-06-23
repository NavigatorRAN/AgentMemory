# [BETA] Request Prioritization | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/scheduler
- Final URL: https://docs.litellm.ai/docs/scheduler
- Canonical URL: https://docs.litellm.ai/docs/scheduler
- Fetched at: 2026-06-23T14:32:53Z
- Content type: text/html; charset=utf-8

## Description

Beta feature. Use for testing only.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
info
Beta feature. Use for testing only.
Help us improve this
Prioritize LLM API requests in high-traffic.
Add request to priority queue
Poll queue, to check if request can be made. Returns 'True':
if there's healthy deployments
OR if request is at top of queue
Priority - The lower the number, the higher the priority:
e.g. priority=0 > priority=2000
Supported Router endpoints:
acompletion ( /v1/chat/completions on Proxy)
atext_completion ( /v1/completions on Proxy)
Quick Start ​
from litellm import Router
router = Router (
model_list = [
{
"model_name" : "gpt-3.5-turbo" ,
"litellm_params" : {
"model" : "gpt-3.5-turbo" ,
"mock_response" : "Hello world this is Macintosh!" , # fakes the LLM API call
"rpm" : 1 ,
} ,
] ,
timeout = 2 , # timeout request if takes > 2s
routing_strategy = "simple-shuffle" , # recommended for best performance
polling_interval = 0.03 # poll queue every 3ms if no healthy deployments
)
try :
_response = await router . acompletion ( # 👈 ADDS TO QUEUE + POLLS + MAKES CALL
model = "gpt-3.5-turbo" ,
messages = [ { "role" : "user" , "content" : "Hey!" } ] ,
priority = 0 , # 👈 LOWER IS BETTER
except Exception as e :
print ( "didn't make request" )
LiteLLM Proxy ​
To prioritize requests on LiteLLM Proxy add priority to the request.
curl
OpenAI SDK
curl -X POST 'http://localhost:4000/chat/completions' \
-H 'Content-Type: application/json' \
-H 'Authorization: Bearer sk-1234' \
-D '{
"model": "gpt-3.5-turbo-fake-model",
"messages": [
"role": "user",
"content": "what is the meaning of the universe? 1234"
}],
"priority": 0 👈 SET VALUE HERE
}'
import openai
client = openai . OpenAI (
api_key = "anything" ,
base_url = "http://0.0.0.0:4000"
# request sent to model set on litellm proxy, `litellm --model`
response = client . chat . completions . create (
messages = [
"role" : "user" ,
"content" : "this is a test request, write a short poem"
}
extra_body = {
"priority" : 0 👈 SET VALUE HERE
print ( response )
Advanced - Redis Caching ​
Use redis caching to do request prioritization across multiple instances of LiteLLM.
SDK ​
### REDIS PARAMS ###
redis_host = os . environ [ "REDIS_HOST" ] ,
redis_password = os . environ [ "REDIS_PASSWORD" ] ,
redis_port = os . environ [ "REDIS_PORT" ] ,
PROXY ​
model_list :
- model_name : gpt - 3.5 - turbo - fake - model
litellm_params :
model : gpt - 3.5 - turbo
mock_response : "hello world!"
api_key : my - good - key
litellm_settings :
request_timeout : 600 # 👈 Will keep retrying until timeout occurs
router_settings :
redis_host; os.environ/REDIS_HOST
redis_password : os.environ/REDIS_PASSWORD
redis_port : os.environ/REDIS_PORT
$ litellm --config /path/to/config.yaml
# RUNNING on http://0.0.0.0:4000s
curl -X POST 'http://localhost:4000/queue/chat/completions' \
Quick Start
LiteLLM Proxy
Advanced - Redis Caching
SDK
PROXY
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
