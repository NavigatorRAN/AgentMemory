# OpenAI - Text-to-speech | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/openai/text_to_speech
- Final URL: https://docs.litellm.ai/docs/providers/openai/text_to_speech
- Canonical URL: https://docs.litellm.ai/docs/providers/openai/text_to_speech
- Fetched at: 2026-06-23T14:28:36Z
- Content type: text/html; charset=utf-8

## Description

Overview

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Overview ​
Feature Supported Notes Cost Tracking ✅ Works with all supported models Logging ✅ Works across all integrations End-user Tracking ✅ Fallbacks ✅ Works between supported models Loadbalancing ✅ Works between supported models Guardrails ✅ Applies to input text Supported Models tts-1, tts-1-hd, gpt-4o-mini-tts
LiteLLM Python SDK Usage ​
Quick Start ​
from pathlib import Path
from litellm import speech
import os
os . environ [ "OPENAI_API_KEY" ] = "sk-.."
speech_file_path = Path ( __file__ ) . parent / "speech.mp3"
response = speech (
model = "openai/tts-1" ,
voice = "alloy" ,
input = "the quick brown fox jumped over the lazy dogs" ,
)
response . stream_to_file ( speech_file_path )
Async Usage ​
from litellm import aspeech
import os , asyncio
async def test_async_speech ( ) :
response = await aspeech (
api_base = None ,
api_key = None ,
organization = None ,
project = None ,
max_retries = 1 ,
timeout = 600 ,
client = None ,
optional_params = { } ,
asyncio . run ( test_async_speech ( ) )
LiteLLM Proxy Usage ​
LiteLLM provides an openai-compatible /audio/speech endpoint for Text-to-speech calls.
curl http://0.0.0.0:4000/v1/audio/speech \
-H "Authorization: Bearer sk-1234" \
-H "Content-Type: application/json" \
-d '{
"model": "tts-1",
"input": "The quick brown fox jumped over the lazy dog.",
"voice": "alloy"
}' \
--output speech.mp3
Setup
- model_name: tts
litellm_params:
model: openai/tts-1
api_key: os.environ/OPENAI_API_KEY
litellm --config /path/to/config.yaml
# RUNNING on http://0.0.0.0:4000
Supported Models ​
Model Example tts-1 speech(model="tts-1", voice="alloy", input="Hello, world!") tts-1-hd speech(model="tts-1-hd", voice="alloy", input="Hello, world!") gpt-4o-mini-tts speech(model="gpt-4o-mini-tts", voice="alloy", input="Hello, world!")
✨ Enterprise LiteLLM Proxy - Set Max Request File Size ​
Use this when you want to limit the file size for requests sent to audio/transcriptions
- model_name : whisper
litellm_params :
model : whisper - 1
api_key : sk - *******
max_file_size_mb : 0.00001 # 👈 max file size in MB (Set this intentionally very small for testing)
model_info :
mode : audio_transcription
Make a test Request with a valid file
curl --location 'http://localhost:4000/v1/audio/transcriptions' \
--header 'Authorization: Bearer sk-1234' \
--form 'file=@"/Users/ishaanjaffer/Github/litellm/tests/gettysburg.wav"' \
--form 'model="whisper"'
Expect to see the follow response
{"error":{"message":"File size is too large. Please check your file size. Passed file size: 0.7392807006835938 MB. Max file size: 0.0001 MB","type":"bad_request","param":"file","code":500}}%
Overview
LiteLLM Python SDK Usage
Quick Start
Async Usage
LiteLLM Proxy Usage
Supported Models
✨ Enterprise LiteLLM Proxy - Set Max Request File Size
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
