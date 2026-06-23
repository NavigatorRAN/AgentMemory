# Media overview - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/tools/media-overview
- Final URL: https://docs.openclaw.ai/tools/media-overview
- Canonical URL: https://docs.openclaw.ai/tools/media-overview
- Fetched at: 2026-06-23T14:57:59Z
- Content type: text/html; charset=utf-8

## Description

Image, video, music, speech, and media-understanding capabilities at a glance

## Extracted Text

Close
Capabilities Tools
OpenClaw generates images, videos, and music, understands inbound media
(images, audio, video), and speaks replies aloud with text-to-speech. All
media capabilities are tool-driven: the agent decides when to use them based
on the conversation, and each tool only appears when at least one backing
provider is configured.
Live speech uses the Talk session contract instead of the one-shot media tool
path. Talk has three modes: provider-native realtime , local or streaming
stt-tts , and transcription for observe-only speech capture. Those modes
share provider catalogs, event envelopes, and cancellation semantics with
telephony, meetings, browser realtime, and native push-to-talk clients.
Capabilities
Image generation
Create and edit images from text prompts or reference images via
image_generate . Async in chat sessions — runs in the background and
posts the result when ready.
Video generation
Text-to-video, image-to-video, and video-to-video via video_generate .
Async — runs in the background and posts the result when ready.
Music generation
Generate music or audio tracks via music_generate . Async in chat
sessions on the shared media-generation task lifecycle.
Text-to-speech
Convert outbound replies to spoken audio via the tts tool plus
messages.tts config. Synchronous.
Media understanding
Summarize inbound images, audio, and video using vision-capable model
providers and dedicated media-understanding plugins.
Speech-to-text
Transcribe inbound voice messages through batch STT or Voice Call
streaming STT providers.
Provider capability matrix
Provider Image Video Music TTS STT Realtime voice Media understanding Alibaba ✓ BytePlus ✓ ComfyUI ✓ ✓ ✓ DeepInfra ✓ ✓ ✓ ✓ ✓ Deepgram ✓ ✓ ElevenLabs ✓ ✓ fal ✓ ✓ ✓ Google ✓ ✓ ✓ ✓ ✓ ✓ Gradium ✓ Local CLI ✓ Microsoft ✓ Microsoft Foundry ✓ MiniMax ✓ ✓ ✓ ✓ Mistral ✓ OpenAI ✓ ✓ ✓ ✓ ✓ ✓ OpenRouter ✓ ✓ ✓ ✓ ✓ ✓ Qwen ✓ Runway ✓ SenseAudio ✓ Together ✓ Vydra ✓ ✓ ✓ xAI ✓ ✓ ✓ ✓ ✓ Xiaomi MiMo ✓ ✓ ✓
Note
Media understanding uses any vision-capable or audio-capable model registered
in your provider config. The matrix above lists providers with dedicated
media-understanding support; most multimodal LLM providers (Anthropic, Google,
OpenAI, etc.) can also understand inbound media when configured as the active
reply model.
Async vs synchronous
Capability Mode Why Image Asynchronous Provider processing can outlive a chat turn; generated attachments use the shared completion path. Text-to-speech Synchronous Provider responses return in seconds; attached to the reply audio. Video Asynchronous Provider processing takes 30 s to several minutes; slow queues can run up to the configured timeout. Music Asynchronous Same provider-processing characteristic as video.
For async tools, OpenClaw submits the request to the provider, returns a task
id immediately, and tracks the job in the task ledger. The agent continues
responding to other messages while the job runs. When the provider finishes,
OpenClaw wakes the agent with the generated media paths so it can tell the
user through the session's normal visible-reply mode: automatic final reply
delivery when configured, or message(action="send") when the session requires
the message tool. If the requester session is inactive or its active wake
fails, and some generated media is still missing from the completion reply,
OpenClaw sends an idempotent direct fallback with only the missing media. Media
already delivered by the completion reply is not posted again.
Speech-to-text and Voice Call
Deepgram, DeepInfra, ElevenLabs, Mistral, OpenAI, OpenRouter, SenseAudio, and xAI can all transcribe
inbound audio through the batch tools.media.audio path when configured.
Channel plugins that preflight a voice note for mention gating or command
parsing mark the transcribed attachment on the inbound context, so the shared
media-understanding pass reuses that transcript instead of making a second
STT call for the same audio.
Deepgram, ElevenLabs, Mistral, OpenAI, and xAI also register Voice Call
streaming STT providers, so live phone audio can be forwarded to the selected
vendor without waiting for a completed recording.
For live user conversations, prefer Talk mode . Batch audio
attachments stay on the media path; browser realtime, native push-to-talk,
telephony, and meeting audio should use Talk events and the session-scoped
catalogs returned by the Gateway.
Provider mappings (how vendors split across surfaces)
Google
Image, video, music, batch TTS, backend realtime voice, and
media-understanding surfaces.
OpenAI
Image, video, batch TTS, batch STT, Voice Call streaming STT, backend
realtime voice, and memory-embedding surfaces.
DeepInfra
Chat/model routing, image generation/editing, text-to-video, batch TTS,
batch STT, image media understanding, and memory-embedding surfaces.
DeepInfra-native rerank/classification/object-detection models are not
registered until OpenClaw has dedicated provider contracts for those
categories.
xAI
Image, video, search, code-execution, batch TTS, batch STT, and Voice
Call streaming STT. xAI Realtime voice is an upstream capability but is
not registered in OpenClaw until the shared realtime-voice contract can
represent it.
Related
Audio nodes
Talk mode
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
