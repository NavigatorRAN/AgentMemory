# AWS Polly Text to Speech (tts) | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/aws_polly
- Final URL: https://docs.litellm.ai/docs/providers/aws_polly
- Canonical URL: https://docs.litellm.ai/docs/providers/aws_polly
- Fetched at: 2026-06-23T14:26:51Z
- Content type: text/html; charset=utf-8

## Description

Overview

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Overview ​
Property Details Description Convert text to natural-sounding speech using AWS Polly's neural and standard TTS engines Provider Route on LiteLLM aws_polly/ Supported Operations /audio/speech Link to Provider Doc AWS Polly SynthesizeSpeech ↗
Quick Start ​
LiteLLM SDK ​
SDK Usage
import litellm
from pathlib import Path
import os
# Set environment variables
os . environ [ "AWS_ACCESS_KEY_ID" ] = ""
os . environ [ "AWS_SECRET_ACCESS_KEY" ] = ""
os . environ [ "AWS_REGION_NAME" ] = "us-east-1"
# AWS Polly call
speech_file_path = Path ( __file__ ) . parent / "speech.mp3"
response = litellm . speech (
model = "aws_polly/neural" ,
voice = "Joanna" ,
input = "the quick brown fox jumped over the lazy dogs" ,
)
response . stream_to_file ( speech_file_path )
LiteLLM PROXY ​
proxy_config.yaml
model_list :
- model_name : polly - neural
litellm_params :
model : aws_polly/neural
aws_access_key_id : "os.environ/AWS_ACCESS_KEY_ID"
aws_secret_access_key : "os.environ/AWS_SECRET_ACCESS_KEY"
aws_region_name : "us-east-1"
Polly Engines ​
AWS Polly supports different speech synthesis engines. Specify the engine in the model name:
Model Engine Cost (per 1M chars) Description aws_polly/standard Standard $4.00 Original Polly voices, faster and lowest cost aws_polly/neural Neural $16.00 More natural, human-like speech (recommended) aws_polly/generative Generative $30.00 Most expressive, highest quality (limited voices) aws_polly/long-form Long-form $100.00 Optimized for long content like articles
Using Different Engines
# Neural engine (recommended)
input = "Hello world" ,
# Standard engine (lower cost)
model = "aws_polly/standard" ,
# Generative engine (highest quality)
model = "aws_polly/generative" ,
voice = "Matthew" ,
- model_name : polly - standard
model : aws_polly/standard
- model_name : polly - generative
model : aws_polly/generative
Available Voices ​
Native Polly Voices ​
AWS Polly has many voices across different languages. Here are popular US English voices:
Voice Gender Engine Support Joanna Female Neural, Standard Matthew Male Neural, Standard, Generative Ivy Female (child) Neural, Standard Kendra Female Neural, Standard Amy Female (British) Neural, Standard Brian Male (British) Neural, Standard
Using Native Polly Voices
# US English female
input = "Hello from Joanna" ,
# US English male
input = "Hello from Matthew" ,
# British English female
voice = "Amy" ,
input = "Hello from Amy" ,
- model_name : polly - joanna
voice : "Joanna"
- model_name : polly - matthew
voice : "Matthew"
OpenAI Voice Mappings ​
LiteLLM also supports OpenAI voice names, which are automatically mapped to Polly voices:
OpenAI Voice Maps to Polly Voice alloy Joanna echo Matthew fable Amy onyx Brian nova Ivy shimmer Kendra
Using OpenAI Voice Names
# These are equivalent
voice = "alloy" , # Maps to Joanna
voice = "Joanna" , # Native Polly voice
SSML Support ​
AWS Polly supports SSML (Speech Synthesis Markup Language) for advanced control over speech output. LiteLLM automatically detects SSML input.
SSML Example
ssml_input = """
<speak>
Hello, <break time="500ms"/>
this is a test with <emphasis level="strong">emphasis</emphasis>
and <prosody rate="slow">slower speech</prosody>.
</speak>
"""
input = ssml_input ,
cURL Request with SSML
curl -X POST http://localhost:4000/v1/audio/speech \
-H "Authorization: Bearer sk-1234" \
-H "Content-Type: application/json" \
-d '{
"model": "polly-neural",
"voice": "Joanna",
"input": "<speak>Hello <break time=\"500ms\"/> world</speak>"
}' \
--output speech.mp3
Supported Parameters ​
All Parameters
voice = "Joanna" , # Required: Voice selection
input = "text to convert" , # Required: Input text (or SSML)
response_format = "mp3" , # Optional: mp3, ogg_vorbis, pcm
# AWS-specific parameters
language_code = "en-US" , # Optional: Language code
sample_rate = "22050" , # Optional: Sample rate in Hz
Response Formats ​
Format Description mp3 MP3 audio (default) ogg_vorbis Ogg Vorbis audio pcm Raw PCM audio
Different Response Formats
# MP3 (default)
input = "Hello" ,
response_format = "mp3" ,
# Ogg Vorbis
response_format = "ogg_vorbis" ,
AWS Authentication ​
LiteLLM supports multiple AWS authentication methods.
Authentication Options
# Option 1: Environment variables (recommended)
os . environ [ "AWS_ACCESS_KEY_ID" ] = "your-access-key"
os . environ [ "AWS_SECRET_ACCESS_KEY" ] = "your-secret-key"
response = litellm . speech ( model = "aws_polly/neural" , voice = "Joanna" , input = "Hello" )
# Option 2: Pass credentials directly
aws_access_key_id = "your-access-key" ,
aws_secret_access_key = "your-secret-key" ,
aws_region_name = "us-east-1" ,
# Option 3: IAM Role (when running on AWS)
# Option 4: AWS Profile
aws_profile_name = "my-profile" ,
# Using environment variables
# Using IAM Role (when proxy runs on AWS)
- model_name : polly - neural - iam
# Using AWS Profile
- model_name : polly - neural - profile
aws_profile_name : "my-profile"
Async Support ​
Async Usage
import asyncio
async def main ( ) :
response = await litellm . aspeech (
input = "Hello from async AWS Polly" ,
with open ( "output.mp3" , "wb" ) as f :
f . write ( response . content )
asyncio . run ( main ( ) )
Overview
Quick Start
LiteLLM SDK
LiteLLM PROXY
Polly Engines
Available Voices
Native Polly Voices
OpenAI Voice Mappings
SSML Support
Supported Parameters
Response Formats
AWS Authentication
Async Support
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
