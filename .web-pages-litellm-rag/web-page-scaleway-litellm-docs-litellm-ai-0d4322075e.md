# Scaleway | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/scaleway
- Final URL: https://docs.litellm.ai/docs/providers/scaleway
- Canonical URL: https://docs.litellm.ai/docs/providers/scaleway
- Fetched at: 2026-06-23T14:28:59Z
- Content type: text/html; charset=utf-8

## Description

LiteLLM supports all models available on Scaleway Generative APIs ↗.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
LiteLLM supports all models available on Scaleway Generative APIs ↗ .
Usage with LiteLLM Python SDK ​
import os
from litellm import completion
os . environ [ "SCW_SECRET_KEY" ] = "your-scaleway-secret-key"
messages = [ { "role" : "user" , "content" : "Write a short poem" } ]
response = completion ( model = "scaleway/qwen3-235b-a22b-instruct-2507" , messages = messages )
print ( response )
Usage with LiteLLM Proxy ​
1. Set Scaleway models in config.yaml ​
model_list :
- model_name : scaleway - model
litellm_params :
model : scaleway/qwen3 - 235b - a22b - instruct - 2507
api_key : "os.environ/SCW_SECRET_KEY" # ensure you have `SCW_SECRET_KEY` in your .env
2. Start proxy ​
litellm --config config.yaml
3. Query proxy ​
Assuming the proxy is running on http://localhost:4000 :
curl http://localhost:4000/chat/completions \
-H "Content-Type: application/json" \
-H "Authorization: Bearer YOUR_LITELLM_MASTER_KEY" \
-d '{
"model": "scaleway-model",
"messages": [
{
"role": "system",
"content": "You are a helpful assistant."
},
"role": "user",
"content": "Write a short poem"
}
]
}'
-H "Authorization: Bearer YOUR_LITELLM_MASTER_KEY" is only required if you have set a LiteLLM master key
Supported features ​
Scaleway provider supports all features in Generative APIs reference documentation ↗ , such as streaming, structured outputs and tool calling.
Audio transcription ​
Scaleway's /audio/transcriptions endpoint is OpenAI-compatible and works with Whisper models.
Python SDK ​
from litellm import transcription
with open ( "speech.mp3" , "rb" ) as audio_file :
response = transcription (
model = "scaleway/whisper-large-v3" ,
file = audio_file ,
)
print ( response . text )
Proxy config ​
- model_name : scaleway - whisper
model : scaleway/whisper - large - v3
api_key : "os.environ/SCW_SECRET_KEY"
Proxy request ​
curl http://localhost:4000/v1/audio/transcriptions \
-F model="scaleway-whisper" \
-F file="@speech.mp3"
Supported optional params: language , prompt , response_format , temperature , timestamp_granularities .
Usage with LiteLLM Python SDK
Usage with LiteLLM Proxy
1. Set Scaleway models in config.yaml
2. Start proxy
3. Query proxy
Supported features
Audio transcription
Python SDK
Proxy config
Proxy request
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
