# /audio/transcriptions | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/audio_transcription
- Final URL: https://docs.litellm.ai/docs/audio_transcription
- Canonical URL: https://docs.litellm.ai/docs/audio_transcription
- Fetched at: 2026-06-23T14:22:51Z
- Content type: text/html; charset=utf-8

## Description

Overview

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Overview ​
Feature Supported Notes Cost Tracking ✅ Works with all supported models Logging ✅ Works across all integrations End-user Tracking ✅ Fallbacks ✅ Works between supported models Loadbalancing ✅ Works between supported models Guardrails ✅ Applies to output transcribed text (non-streaming only) Supported Providers openai , azure , vertex_ai , gemini , deepgram , groq , fireworks_ai , ovhcloud , mistral
Quick Start ​
LiteLLM Python SDK ​
Python SDK Example
from litellm import transcription
import os
# set api keys
os . environ [ "OPENAI_API_KEY" ] = ""
audio_file = open ( "/path/to/audio.mp3" , "rb" )
response = transcription ( model = "whisper" , file = audio_file )
print ( f"response: { response } " )
LiteLLM Proxy ​
Add model to config ​
OpenAI
OpenAI + Azure
OpenAI Configuration
model_list :
- model_name : whisper
litellm_params :
model : whisper - 1
api_key : os.environ/OPENAI_API_KEY
model_info :
mode : audio_transcription
general_settings :
master_key : sk - 1234
OpenAI + Azure Configuration
model : azure/azure - whisper
api_version : 2024 - 02 - 15 - preview
api_base : os.environ/AZURE_EUROPE_API_BASE
api_key : os.environ/AZURE_EUROPE_API_KEY
Start proxy ​
Start Proxy Server
litellm --config /path/to/config.yaml
# RUNNING on http://0.0.0.0:8000
Test ​
Curl
OpenAI Python SDK
Test with cURL
curl --location 'http://0.0.0.0:8000/v1/audio/transcriptions' \
--header 'Authorization: Bearer sk-1234' \
--form 'file=@"/Users/krrishdholakia/Downloads/gettysburg.wav"' \
--form 'model="whisper"'
Test with OpenAI Python SDK
from openai import OpenAI
client = openai . OpenAI (
api_key = "sk-1234" ,
base_url = "http://0.0.0.0:8000"
)
audio_file = open ( "speech.mp3" , "rb" )
transcript = client . audio . transcriptions . create (
model = "whisper" ,
file = audio_file
Supported Providers ​
Azure
Fireworks AI
Groq
Deepgram
Mistral (Voxtral)
OVHcloud AI Endpoints
Fallbacks ​
You can configure fallbacks for audio transcription to automatically retry with different models if the primary model fails.
Test with cURL and Fallbacks
curl --location 'http://0.0.0.0:4000/v1/audio/transcriptions' \
--form 'file=@"gettysburg.wav"' \
--form 'model="groq/whisper-large-v3"' \
--form 'fallbacks[]="openai/whisper-1"'
Test with OpenAI Python SDK and Fallbacks
client = OpenAI (
base_url = "http://0.0.0.0:4000"
audio_file = open ( "gettysburg.wav" , "rb" )
model = "groq/whisper-large-v3" ,
file = audio_file ,
extra_body = {
"fallbacks" : [ "openai/whisper-1" ]
}
Testing Fallbacks ​
You can test your fallback configuration using mock_testing_fallbacks=true to simulate failures:
Test Fallbacks with Mock Testing
--form 'fallbacks[]="openai/whisper-1"' \
--form 'mock_testing_fallbacks=true'
"fallbacks" : [ "openai/whisper-1" ] ,
"mock_testing_fallbacks" : True
Overview
Quick Start
LiteLLM Python SDK
LiteLLM Proxy
Add model to config
Start proxy
Test
Supported Providers
Fallbacks
Testing Fallbacks
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
