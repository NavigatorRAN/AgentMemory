# Vertex AI Text to Speech | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/vertex_speech
- Final URL: https://docs.litellm.ai/docs/providers/vertex_speech
- Canonical URL: https://docs.litellm.ai/docs/providers/vertex_speech
- Fetched at: 2026-06-23T14:29:20Z
- Content type: text/html; charset=utf-8

## Description

| Property | Details |

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Property Details Description Google Cloud Text-to-Speech with Chirp3 HD voices and Gemini TTS Provider Route on LiteLLM vertex_ai/chirp (Chirp), vertex_ai/gemini-*-tts (Gemini)
Chirp3 HD Voices ​
Google Cloud Text-to-Speech API with high-quality Chirp3 HD voices.
Quick Start ​
LiteLLM Python SDK ​
Chirp3 Quick Start
from litellm import speech
from pathlib import Path
speech_file_path = Path ( __file__ ) . parent / "speech.mp3"
response = speech (
model = "vertex_ai/chirp" ,
voice = "alloy" , # OpenAI voice name - automatically mapped
input = "Hello, this is Vertex AI Text to Speech" ,
vertex_project = "your-project-id" ,
vertex_location = "us-central1" ,
)
response . stream_to_file ( speech_file_path )
LiteLLM AI Gateway ​
1. Setup config.yaml
config.yaml
model_list :
- model_name : vertex - tts
litellm_params :
model : vertex_ai/chirp
vertex_project : "your-project-id"
vertex_location : "us-central1"
vertex_credentials : "/path/to/service_account.json"
2. Start the proxy
Start LiteLLM Proxy
litellm --config /path/to/config.yaml
3. Make requests
curl
OpenAI Python SDK
curl http://0.0.0.0:4000/v1/audio/speech \
-H "Authorization: Bearer sk-1234" \
-H "Content-Type: application/json" \
-d '{
"model": "vertex-tts",
"voice": "alloy",
"input": "Hello, this is Vertex AI Text to Speech"
}' \
--output speech.mp3
import openai
client = openai . OpenAI ( api_key = "sk-1234" , base_url = "http://0.0.0.0:4000" )
response = client . audio . speech . create (
model = "vertex-tts" ,
voice = "alloy" ,
response . stream_to_file ( "speech.mp3" )
Voice Mapping ​
LiteLLM maps OpenAI voice names to Google Cloud voices. You can use either OpenAI voices or Google Cloud voices directly.
OpenAI Voice Google Cloud Voice alloy en-US-Studio-O echo en-US-Studio-M fable en-GB-Studio-B onyx en-US-Wavenet-D nova en-US-Studio-O shimmer en-US-Wavenet-F
Using Google Cloud Voices Directly ​
Chirp3 HD Voice
# Pass Chirp3 HD voice name directly
voice = "en-US-Chirp3-HD-Charon" ,
input = "Hello with a Chirp3 HD voice" ,
Voice as Dict (Multilingual)
# Pass as dict for full control over language and voice
voice = {
"languageCode" : "de-DE" ,
"name" : "de-DE-Chirp3-HD-Charon" ,
} ,
input = "Hallo, dies ist ein Test" ,
"voice": "en-US-Chirp3-HD-Charon",
"input": "Hello with a Chirp3 HD voice"
"voice": {"languageCode": "de-DE", "name": "de-DE-Chirp3-HD-Charon"},
"input": "Hallo, dies ist ein Test"
voice = { "languageCode" : "de-DE" , "name" : "de-DE-Chirp3-HD-Charon" } ,
Browse available voices: Google Cloud Text-to-Speech Console
Passing Raw SSML ​
LiteLLM auto-detects SSML when your input contains <speak> tags and passes it through unchanged.
SSML Input
ssml = """
<speak>
<p>Hello, world!</p>
<p>This is a test of the <break strength="medium" /> text-to-speech API.</p>
</speak>
"""
voice = "en-US-Studio-O" ,
input = ssml , # Auto-detected as SSML
Force SSML Mode
# Force SSML mode with use_ssml=True
input = "<speak><prosody rate='slow'>Speaking slowly</prosody></speak>" ,
use_ssml = True ,
"voice": "en-US-Studio-O",
"input": "<speak><p>Hello!</p><break time=\"500ms\"/><p>How are you?</p></speak>"
ssml = """<speak><p>Hello!</p><break time="500ms"/><p>How are you?</p></speak>"""
input = ssml ,
Supported Parameters ​
Parameter Description Values voice Voice selection OpenAI voice, Google Cloud voice name, or dict input Text to convert Plain text or SSML speed Speaking rate 0.25 to 4.0 (default: 1.0) response_format Audio format mp3 , opus , wav , pcm , flac use_ssml Force SSML mode True / False
Async Usage ​
Async Speech Generation
import asyncio
from litellm import aspeech
async def main ( ) :
response = await aspeech (
input = "Hello from async" ,
asyncio . run ( main ( ) )
Gemini TTS ​
Gemini models with audio output capabilities using the chat completions API.
warning
Limitations:
Only supports pcm16 audio format
Streaming not yet supported
Must set modalities: ["audio"]
When using via LiteLLM Proxy, must include "allowed_openai_params": ["audio", "modalities"] in the request body to enable audio parameters
Gemini TTS Quick Start
from litellm import completion
import json
# Load credentials
with open ( 'path/to/service_account.json' , 'r' ) as file :
vertex_credentials = json . dumps ( json . load ( file ) )
response = completion (
model = "vertex_ai/gemini-2.5-flash-preview-tts" ,
messages = [ { "role" : "user" , "content" : "Say hello in a friendly voice" } ] ,
modalities = [ "audio" ] ,
audio = {
"voice" : "Kore" ,
"format" : "pcm16"
vertex_credentials = vertex_credentials
print ( response )
- model_name : gemini - tts
model : vertex_ai/gemini - 2.5 - flash - preview - tts
Gemini TTS Request
curl http://0.0.0.0:4000/v1/chat/completions \
"model": "gemini-tts",
"messages": [{"role": "user", "content": "Say hello in a friendly voice"}],
"modalities": ["audio"],
"audio": {"voice": "Kore", "format": "pcm16"},
"allowed_openai_params": ["audio", "modalities"]
}'
response = client . chat . completions . create (
model = "gemini-tts" ,
audio = { "voice" : "Kore" , "format" : "pcm16" } ,
extra_body = { "allowed_openai_params" : [ "audio" , "modalities" ] }
Supported Models ​
vertex_ai/gemini-2.5-flash-preview-tts
vertex_ai/gemini-2.5-pro-preview-tts
See Gemini TTS documentation for available voices.
Advanced Usage ​
Gemini TTS with System Prompt
model = "vertex_ai/gemini-2.5-pro-preview-tts" ,
messages = [
{ "role" : "system" , "content" : "You are a helpful assistant that speaks clearly." } ,
{ "role" : "user" , "content" : "Explain quantum computing in simple terms" }
] ,
audio = { "voice" : "Charon" , "format" : "pcm16" } ,
temperature = 0.7 ,
max_tokens = 150 ,
Chirp3 HD Voices
Quick Start
Voice Mapping
Using Google Cloud Voices Directly
Passing Raw SSML
Supported Parameters
Async Usage
Gemini TTS
Supported Models
Advanced Usage
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
