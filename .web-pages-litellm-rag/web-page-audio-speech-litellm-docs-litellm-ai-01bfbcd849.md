# /audio/speech | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/text_to_speech
- Final URL: https://docs.litellm.ai/docs/text_to_speech
- Canonical URL: https://docs.litellm.ai/docs/text_to_speech
- Fetched at: 2026-06-23T14:33:28Z
- Content type: text/html; charset=utf-8

## Description

Overview

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Overview ​
Feature Supported Notes Cost Tracking ✅ Works with all supported models Logging ✅ Works across all integrations End-user Tracking ✅ Fallbacks ✅ Works between supported models Loadbalancing ✅ Works between supported models Guardrails ✅ Applies to input text (non-streaming only) Supported Providers OpenAI, Azure OpenAI, Vertex AI, AWS Polly, ElevenLabs , MiniMax
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
Supported Providers ​
Provider Link to Usage OpenAI Usage Azure OpenAI Usage Azure AI Speech Service (AVA) Usage AWS Polly Usage Vertex AI Usage Gemini Usage ElevenLabs Usage MiniMax Usage
/audio/speech to /chat/completions Bridge ​
LiteLLM allows you to use /chat/completions models to generate speech through the /audio/speech endpoint. This is useful for models like Gemini's TTS-enabled models that are only accessible via /chat/completions .
Gemini Text-to-Speech ​
Python SDK Usage ​
Gemini Text-to-Speech SDK Usage
import litellm
# Set your Gemini API key
os . environ [ "GEMINI_API_KEY" ] = "your-gemini-api-key"
def test_audio_speech_gemini ( ) :
result = litellm . speech (
model = "gemini/gemini-2.5-flash-preview-tts" ,
api_key = os . getenv ( "GEMINI_API_KEY" ) ,
# Save to file
speech_file_path = Path ( __file__ ) . parent / "gemini_speech.mp3"
result . stream_to_file ( speech_file_path )
print ( f"Audio saved to { speech_file_path } " )
test_audio_speech_gemini ( )
Gemini Text-to-Speech Async Usage
import asyncio
async def test_async_gemini_speech ( ) :
response = await litellm . aspeech (
asyncio . run ( test_async_gemini_speech ( ) )
Setup Config:
Gemini Proxy Configuration
model_list :
- model_name : gemini - tts
litellm_params :
model : gemini/gemini - 2.5 - flash - preview - tts
api_key : os.environ/GEMINI_API_KEY
Start Proxy:
Start LiteLLM Proxy
Make Request:
Gemini TTS Request
"model": "gemini-tts",
--output gemini_speech.mp3
Vertex AI Text-to-Speech ​
Vertex AI Text-to-Speech SDK Usage
# Set your Google credentials
os . environ [ "GOOGLE_APPLICATION_CREDENTIALS" ] = "path/to/service-account.json"
def test_audio_speech_vertex ( ) :
model = "vertex_ai/gemini-2.5-flash-preview-tts" ,
speech_file_path = Path ( __file__ ) . parent / "vertex_speech.mp3"
test_audio_speech_vertex ( )
Vertex AI Proxy Configuration
- model_name : vertex - tts
model : vertex_ai/gemini - 2.5 - flash - preview - tts
vertex_project : your - project - id
vertex_location : us - central1
Vertex AI TTS Request
"model": "vertex-tts",
"voice": "en-US-Wavenet-D"
--output vertex_speech.mp3
AWS Polly Text-to-Speech ​
AWS Polly provides neural and standard text-to-speech engines with support for multiple voices and languages.
See the AWS Polly provider documentation for detailed usage examples.
✨ Enterprise LiteLLM Proxy - Set Max Request File Size ​
Use this when you want to limit the file size for requests sent to audio/transcriptions
- model_name : whisper
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
Supported Providers
/audio/speech to /chat/completions Bridge
Gemini Text-to-Speech
Vertex AI Text-to-Speech
AWS Polly Text-to-Speech
✨ Enterprise LiteLLM Proxy - Set Max Request File Size
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
