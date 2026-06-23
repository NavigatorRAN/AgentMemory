# SenseAudio - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/providers/senseaudio
- Final URL: https://docs.openclaw.ai/providers/senseaudio
- Canonical URL: https://docs.openclaw.ai/providers/senseaudio
- Fetched at: 2026-06-23T14:55:54Z
- Content type: text/html; charset=utf-8

## Description

SenseAudio batch speech-to-text for inbound voice notes

## Extracted Text

Close
Models Providers
SenseAudio can transcribe inbound audio and voice-note attachments through OpenClaw's shared tools.media.audio pipeline. OpenClaw posts multipart audio to the OpenAI-compatible transcription endpoint and injects the returned text as {{Transcript}} plus an [Audio] block.
Property Value Provider id senseaudio Plugin bundled, enabledByDefault: true Contract mediaUnderstandingProviders (audio) Auth env var SENSEAUDIO_API_KEY Default model senseaudio-asr-pro-1.5-260319 Default URL https://api.senseaudio.cn/v1 Website senseaudio.cn Docs senseaudio.cn/docs
Getting started
Set your API key
bash Copy code export SENSEAUDIO_API_KEY= "..."
Enable the audio provider
json5 Copy code { tools : { media : { audio : { enabled : true , models : [{ provider : "senseaudio" , model : "senseaudio-asr-pro-1.5-260319" }], }, }, }, }
Send a voice note
Send an audio message through any connected channel. OpenClaw uploads the
audio to SenseAudio and uses the transcript in the reply pipeline.
Options
Option Path Description model tools.media.audio.models[].model SenseAudio ASR model id language tools.media.audio.models[].language Optional language hint prompt tools.media.audio.prompt Optional transcription prompt baseUrl tools.media.audio.baseUrl or model Override the OpenAI-compatible base headers tools.media.audio.request.headers Extra request headers
Note
SenseAudio is batch STT only in OpenClaw. Voice Call realtime transcription
continues to use providers with streaming STT support.
Related
Media understanding (audio)
Model providers
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
