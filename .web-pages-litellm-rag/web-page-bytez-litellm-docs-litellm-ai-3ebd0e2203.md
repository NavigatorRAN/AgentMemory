# Bytez | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/bytez
- Final URL: https://docs.litellm.ai/docs/providers/bytez
- Canonical URL: https://docs.litellm.ai/docs/providers/bytez
- Fetched at: 2026-06-23T14:27:23Z
- Content type: text/html; charset=utf-8

## Description

LiteLLM supports all chat models on Bytez!

## Extracted Text

Skip to main content
On this page
Copy as Markdown
LiteLLM supports all chat models on Bytez !
That also means multi-modal models are supported 🔥
Tasks supported: chat , image-text-to-text , audio-text-to-text , video-text-to-text
Usage ​
SDK
PROXY
API KEYS ​
import os
os . environ [ "BYTEZ_API_KEY" ] = "YOUR_BYTEZ_KEY_GOES_HERE"
Example Call ​
from litellm import completion
## set ENV variables
response = completion (
model = "bytez/google/gemma-3-4b-it" ,
messages = [ { "content" : "Hello, how are you?" , "role" : "user" } ]
)
Add models to your config.yaml
model_list :
- model_name : gemma - 3
litellm_params :
model : bytez/google/gemma - 3 - 4b - it
api_key : os.environ/BYTEZ_API_KEY
Start the proxy
$ BYTEZ_API_KEY=YOUR_BYTEZ_API_KEY_HERE litellm --config /path/to/config.yaml --debug
Send Request to LiteLLM Proxy Server
OpenAI Python v1.0.0+
curl
import openai
client = openai . OpenAI (
api_key = "sk-1234" , # pass litellm proxy key, if you're using virtual keys
base_url = "http://0.0.0.0:4000" # litellm-proxy-base url
response = client . chat . completions . create (
model = "gemma-3" ,
messages = [
{
"role" : "system" ,
"content" : "Be a good human!"
} ,
"role" : "user" ,
"content" : "What do you know about earth?"
}
]
print ( response )
curl --location 'http://0.0.0.0:4000/chat/completions' \
--header 'Authorization: Bearer sk-1234' \
--header 'Content-Type: application/json' \
--data '{
"model": "gemma-3",
"messages": [
"role": "system",
"content": "Be a good human!"
},
"role": "user",
"content": "What do you know about earth?"
],
}'
Automatic Prompt Template Handling ​
All prompt formatting is handled automatically by our API when you send a messages list to it!
If you wish to use custom formatting, please let us know via either help@bytez.com or on our Discord and we will work to provide it!
Passing additional params - max_tokens, temperature ​
See all litellm.completion supported params here
# !uv add litellm
os . environ [ "BYTEZ_API_KEY" ] = "YOUR_BYTEZ_KEY_HERE"
# bytez gemma-3 call
messages = [ { "content" : "Hello, how are you?" , "role" : "user" } ] ,
max_tokens = 20 ,
temperature = 0.5
proxy
max_tokens : 20
temperature : 0.5
Passing Bytez-specific params ​
Any kwarg supported by huggingface we also support! (Provided the model supports it.)
Example repetition_penalty
# bytez llama3 call with additional params
repetition_penalty = 1.2 ,
repetition_penalty : 1.2
Usage
API KEYS
Example Call
Automatic Prompt Template Handling
Passing additional params - max_tokens, temperature
Passing Bytez-specific params
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
