# Deepgram | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/deepgram
- Final URL: https://docs.litellm.ai/docs/providers/deepgram
- Canonical URL: https://docs.litellm.ai/docs/providers/deepgram
- Fetched at: 2026-06-23T14:27:37Z
- Content type: text/html; charset=utf-8

## Description

LiteLLM supports Deepgram's /listen endpoint.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
LiteLLM supports Deepgram's /listen endpoint.
Property Details Description Deepgram's voice AI platform provides APIs for speech-to-text, text-to-speech, and language understanding. Provider Route on LiteLLM deepgram/ Provider Doc Deepgram ↗ Supported OpenAI Endpoints /audio/transcriptions
Quick Start ​
from litellm import transcription
import os
# set api keys
os . environ [ "DEEPGRAM_API_KEY" ] = ""
audio_file = open ( "/path/to/audio.mp3" , "rb" )
response = transcription ( model = "deepgram/nova-2" , file = audio_file )
print ( f"response: { response } " )
LiteLLM Proxy Usage ​
Add model to config ​
Add model to config.yaml
model_list :
- model_name : nova - 2
litellm_params :
model : deepgram/nova - 2
api_key : os.environ/DEEPGRAM_API_KEY
model_info :
mode : audio_transcription
general_settings :
master_key : sk - 1234
Start proxy ​
litellm --config /path/to/config.yaml
# RUNNING on http://0.0.0.0:4000
Test ​
Curl
OpenAI
curl --location 'http://0.0.0.0:4000/v1/audio/transcriptions' \
--header 'Authorization: Bearer sk-1234' \
--form 'file=@"/Users/krrishdholakia/Downloads/gettysburg.wav"' \
--form 'model="nova-2"'
from openai import OpenAI
client = openai . OpenAI (
api_key = "sk-1234" ,
base_url = "http://0.0.0.0:4000"
)
audio_file = open ( "speech.mp3" , "rb" )
transcript = client . audio . transcriptions . create (
model = "nova-2" ,
file = audio_file
Quick Start
LiteLLM Proxy Usage
Add model to config
Start proxy
Test
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
