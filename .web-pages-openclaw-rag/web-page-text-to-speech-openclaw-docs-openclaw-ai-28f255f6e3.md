# Text-to-speech - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/tools/tts
- Final URL: https://docs.openclaw.ai/tools/tts
- Canonical URL: https://docs.openclaw.ai/tools/tts
- Fetched at: 2026-06-23T14:58:28Z
- Content type: text/html; charset=utf-8

## Description

Text-to-speech for outbound replies — providers, personas, slash commands, and per-channel output

## Extracted Text

Close
Capabilities Tools
OpenClaw can convert outbound replies into audio across 14 speech providers
and deliver native voice messages on Feishu, Matrix, Telegram, and WhatsApp,
audio attachments everywhere else, and PCM/Ulaw streams for telephony and Talk.
TTS is the speech-output half of Talk's stt-tts mode. Provider-native
realtime Talk sessions synthesize speech inside the realtime provider instead
of calling this TTS path, while transcription sessions do not synthesize an
assistant voice response.
Quick start
Pick a provider
OpenAI and ElevenLabs are the most reliable hosted options. Microsoft and
Local CLI work without an API key. See the provider matrix
for the full list.
Set the API key
Export the env var for your provider (for example OPENAI_API_KEY ,
ELEVENLABS_API_KEY ). Microsoft and Local CLI need no key.
Enable in config
Set messages.tts.auto: "always" and messages.tts.provider :
json5 Copy code { messages : { tts : { auto : "always" , provider : "elevenlabs" , }, }, }
Try it in chat
/tts status shows the current state. /tts audio Hello from OpenClaw
sends a one-off audio reply.
Note
Auto-TTS is off by default. When messages.tts.provider is unset,
OpenClaw picks the first configured provider in registry auto-select order.
The built-in tts agent tool is explicit-intent only: ordinary chat stays
text unless the user asks for audio, uses /tts , or enables Auto-TTS/directive
speech.
Supported providers
Provider Auth Notes Azure Speech AZURE_SPEECH_KEY + AZURE_SPEECH_REGION (also AZURE_SPEECH_API_KEY , SPEECH_KEY , SPEECH_REGION ) Native Ogg/Opus voice-note output and telephony. DeepInfra DEEPINFRA_API_KEY OpenAI-compatible TTS. Defaults to hexgrad/Kokoro-82M . ElevenLabs ELEVENLABS_API_KEY or XI_API_KEY Voice cloning, multilingual, deterministic via seed ; streamed for Discord voice playback. Google Gemini GEMINI_API_KEY or GOOGLE_API_KEY Gemini API batch TTS; persona-aware via promptTemplate: "audio-profile-v1" . Gradium GRADIUM_API_KEY Voice-note and telephony output. Inworld INWORLD_API_KEY Streaming TTS API. Native Opus voice-note and PCM telephony. Local CLI none Runs a configured local TTS command. Microsoft none Public Edge neural TTS via node-edge-tts . Best-effort, no SLA. MiniMax MINIMAX_API_KEY (or Token Plan: MINIMAX_OAUTH_TOKEN , MINIMAX_CODE_PLAN_KEY , MINIMAX_CODING_API_KEY ) T2A v2 API. Defaults to speech-2.8-hd . OpenAI OPENAI_API_KEY Also used for auto-summary; supports persona instructions . OpenRouter OPENROUTER_API_KEY (can reuse models.providers.openrouter.apiKey ) Default model hexgrad/kokoro-82m . Volcengine VOLCENGINE_TTS_API_KEY or BYTEPLUS_SEED_SPEECH_API_KEY (legacy AppID/token: VOLCENGINE_TTS_APPID / _TOKEN ) BytePlus Seed Speech HTTP API. Vydra VYDRA_API_KEY Shared image, video, and speech provider. xAI XAI_API_KEY xAI batch TTS. Native Opus voice-note is not supported. Xiaomi MiMo XIAOMI_API_KEY MiMo TTS through Xiaomi chat completions.
If multiple providers are configured, the selected one is used first and the
others are fallback options. Auto-summary uses summaryModel (or
agents.defaults.model.primary ), so that provider must also be authenticated
if you keep summaries enabled.
Warning
The bundled Microsoft provider uses Microsoft Edge's online neural TTS
service via node-edge-tts . It is a public web service without a published
SLA or quota — treat it as best-effort. The legacy provider id edge is
normalized to microsoft and openclaw doctor --fix rewrites persisted
config; new configs should always use microsoft .
Configuration
TTS config lives under messages.tts in ~/.openclaw/openclaw.json . Pick a
preset and adapt the provider block:
Azure Speech
json5 Copy code { messages : { tts : { auto : "always" , provider : "azure-speech" , providers : { "azure-speech" : { apiKey : "${AZURE_SPEECH_KEY}" , region : "eastus" , speakerVoice : "en-US-JennyNeural" , lang : "en-US" , outputFormat : "audio-24khz-48kbitrate-mono-mp3" , voiceNoteOutputFormat : "ogg-24khz-16bit-mono-opus" , }, }, }, }, }
ElevenLabs
json5 Copy code { messages : { tts : { auto : "always" , provider : "elevenlabs" , providers : { elevenlabs : { apiKey : "${ELEVENLABS_API_KEY}" , model : "eleven_multilingual_v2" , speakerVoiceId : "EXAVITQu4vr4xnSDxMaL" , }, }, }, }, }
Google Gemini
json5 Copy code { messages : { tts : { auto : "always" , provider : "google" , providers : { google : { apiKey : "${GEMINI_API_KEY}" , model : "gemini-3.1-flash-tts-preview" , speakerVoice : "Kore" , // Optional natural-language style prompts: // audioProfile: "Speak in a calm, podcast-host tone.", // speakerName: "Alex", }, }, }, }, }
Gradium
json5 Copy code { messages : { tts : { auto : "always" , provider : "gradium" , providers : { gradium : { apiKey : "${GRADIUM_API_KEY}" , speakerVoiceId : "YTpq7expH9539ERJ" , }, }, }, }, }
Inworld
json5 Copy code { messages : { tts : { auto : "always" , provider : "inworld" , providers : { inworld : { apiKey : "${INWORLD_API_KEY}" , modelId : "inworld-tts-1.5-max" , speakerVoiceId : "Sarah" , temperature : 0.7 , }, }, }, }, }
Local CLI
json5 Copy code { messages : { tts : { auto : "always" , provider : "tts-local-cli" , providers : { "tts-local-cli" : { command : "say" , args : [ "-o" , "{{OutputPath}}" , "{{Text}}" ], outputFormat : "wav" , timeoutMs : 120000 , }, }, }, }, }
Microsoft (no key)
json5 Copy code { messages : { tts : { auto : "always" , provider : "microsoft" , providers : { microsoft : { enabled : true , speakerVoice : "en-US-MichelleNeural" , lang : "en-US" , outputFormat : "audio-24khz-48kbitrate-mono-mp3" , rate : "+0%" , pitch : "+0%" , }, }, }, }, }
MiniMax
json5 Copy code { messages : { tts : { auto : "always" , provider : "minimax" , providers : { minimax : { apiKey : "${MINIMAX_API_KEY}" , model : "speech-2.8-hd" , speakerVoiceId : "English_expressive_narrator" , speed : 1.0 , vol : 1.0 , pitch : 0 , }, }, }, }, }
OpenAI + ElevenLabs
json5 Copy code { messages : { tts : { auto : "always" , provider : "openai" , summaryModel : "openai/gpt-4.1-mini" , modelOverrides : { enabled : true }, providers : { openai : { apiKey : "${OPENAI_API_KEY}" , model : "gpt-4o-mini-tts" , speakerVoice : "alloy" , }, elevenlabs : { apiKey : "${ELEVENLABS_API_KEY}" , model : "eleven_multilingual_v2" , speakerVoiceId : "EXAVITQu4vr4xnSDxMaL" , voiceSettings : { stability : 0.5 , similarityBoost : 0.75 , style : 0.0 , useSpeakerBoost : true , speed : 1.0 }, applyTextNormalization : "auto" , languageCode : "en" , }, }, }, }, }
OpenRouter
json5 Copy code { messages : { tts : { auto : "always" , provider : "openrouter" , providers : { openrouter : { apiKey : "${OPENROUTER_API_KEY}" , model : "hexgrad/kokoro-82m" , speakerVoice : "af_alloy" , responseFormat : "mp3" , }, }, }, }, }
Volcengine
json5 Copy code { messages : { tts : { auto : "always" , provider : "volcengine" , providers : { volcengine : { apiKey : "${VOLCENGINE_TTS_API_KEY}" , resourceId : "seed-tts-1.0" , speakerVoice : "en_female_anna_mars_bigtts" , }, }, }, }, }
xAI
json5 Copy code { messages : { tts : { auto : "always" , provider : "xai" , providers : { xai : { apiKey : "${XAI_API_KEY}" , speakerVoiceId : "eve" , language : "en" , responseFormat : "mp3" , }, }, }, }, }
Xiaomi MiMo
json5 Copy code { messages : { tts : { auto : "always" , provider : "xiaomi" , providers : { xiaomi : { apiKey : "${XIAOMI_API_KEY}" , model : "mimo-v2.5-tts" , speakerVoice : "mimo_default" , format : "mp3" , }, }, }, }, }
For Xiaomi mimo-v2.5-tts-voicedesign , omit speakerVoice and set style to
the voice-design prompt. OpenClaw sends that prompt as the TTS user message
and does not send audio.voice for the voicedesign model.
Per-agent voice overrides
Use agents.list[].tts when one agent should speak with a different provider,
voice, model, persona, or auto-TTS mode. The agent block deep-merges over
messages.tts , so provider credentials can stay in the global provider config:
json5 Copy code { messages : { tts : { auto : "always" , provider : "elevenlabs" , providers : { elevenlabs : { apiKey : "${ELEVENLABS_API_KEY}" , model : "eleven_multilingual_v2" }, }, }, }, agents : { list : [ { id : "reader" , tts : { providers : { elevenlabs : { speakerVoiceId : "EXAVITQu4vr4xnSDxMaL" }, }, }, }, ], }, }
To pin a per-agent persona, set agents.list[].tts.persona alongside provider
config — it overrides the global messages.tts.persona for that agent only.
Precedence order for automatic replies, /tts audio , /tts status , and the
tts agent tool:
messages.tts
active agents.list[].tts
channel override, when the channel supports channels.<channel>.tts
account override, when the channel passes channels.<channel>.accounts.<id>.tts
local /tts preferences for this host
inline [[tts:...]] directives when model overrides are enabled
Channel and account overrides use the same shape as messages.tts and
deep-merge over the earlier layers, so shared provider credentials can stay in
messages.tts while a channel or bot account changes only speaker voice, model, persona,
or auto mode:
json5 Copy code { messages : { tts : { provider : "openai" , providers : { openai : { apiKey : "${OPENAI_API_KEY}" , model : "gpt-4o-mini-tts" }, }, }, }, channels : { feishu : { accounts : { english : { tts : { providers : { openai : { speakerVoice : "shimmer" }, }, }, }, }, }, }, }
Personas
A persona is a stable spoken identity that can be applied deterministically
across providers. It can prefer one provider, define provider-neutral prompt
intent, and carry provider-specific bindings for voices, models, prompt
templates, seeds, and voice settings.
Minimal persona
json5 Copy code { messages : { tts : { auto : "always" , persona : "narrator" , personas : { narrator : { label : "Narrator" , provider : "elevenlabs" , providers : { elevenlabs : { speakerVoiceId : "EXAVITQu4vr4xnSDxMaL" , modelId : "eleven_multilingual_v2" , }, }, }, }, }, }, }
Full persona (provider-neutral prompt)
json5 Copy code { messages : { tts : { auto : "always" , persona : "alfred" , personas : { alfred : { label : "Alfred" , description : "Dry, warm British butler narrator." , provider : "google" , fallbackPolicy : "preserve-persona" , prompt : { profile : "A brilliant British butler. Dry, witty, warm, charming, emotionally expressive, never generic." , scene : "A quiet late-night study. Close-mic narration for a trusted operator." , sampleContext : "The speaker is answering a private technical request with concise confidence and dry warmth." , style : "Refined, understated, lightly amused." , accent : "British English." , pacing : "Measured, with short dramatic pauses." , constraints : [ "Do not read configuration values aloud." , "Do not explain the persona." ], }, providers : { google : { model : "gemini-3.1-flash-tts-preview" , speakerVoice : "Algieba" , promptTemplate : "audio-profile-v1" , }, openai : { model : "gpt-4o-mini-tts" , speakerVoice : "cedar" }, elevenlabs : { speakerVoiceId : "voice_id" , modelId : "eleven_multilingual_v2" , seed : 42 , voiceSettings : { stability : 0.65 , similarityBoost : 0.8 , style : 0.25 , useSpeakerBoost : true , speed : 0.95 , }, }, }, }, }, }, }, }
Persona resolution
The active persona is selected deterministically:
/tts persona <id> local preference, if set.
messages.tts.persona , if set.
No persona.
Provider selection runs explicit-first:
Direct overrides (CLI, gateway, Talk, allowed TTS directives).
/tts provider <id> local preference.
Active persona's provider .
messages.tts.provider .
Registry auto-select.
For each provider attempt, OpenClaw merges configs in this order:
messages.tts.providers.<id>
messages.tts.personas.<persona>.providers.<id>
Trusted request overrides
Allowed model-emitted TTS directive overrides
How providers use persona prompts
Persona prompt fields ( profile , scene , sampleContext , style , accent ,
pacing , constraints ) are provider-neutral . Each provider decides how
to use them:
Wraps persona prompt fields in a Gemini TTS prompt structure only when
the effective Google provider config sets promptTemplate: "audio-profile-v1"
or personaPrompt . The older audioProfile and speakerName fields are
still prepended as Google-specific prompt text. Inline audio tags such as
[whispers] or [laughs] inside a [[tts:text]] block are preserved
inside the Gemini transcript; OpenClaw does not generate these tags.
OpenAI
Maps persona prompt fields to the request instructions field only when
no explicit OpenAI instructions is configured. Explicit instructions
always wins.
Other providers
Use only the provider-specific persona bindings under
personas.<id>.providers.<provider> . Persona prompt fields are ignored
unless the provider implements its own persona-prompt mapping.
Fallback policy
fallbackPolicy controls behavior when a persona has no binding for the
attempted provider:
Policy Behavior preserve-persona Default. Provider-neutral prompt fields stay available; the provider may use them or ignore them. provider-defaults Persona is omitted from prompt preparation for that attempt; the provider uses its neutral defaults while fallback to other providers continues. fail Skip that provider attempt with reasonCode: "not_configured" and personaBinding: "missing" . Fallback providers are still tried.
The whole TTS request only fails when every attempted provider is skipped
or fails.
Talk session provider selection is session-scoped. A Talk client should choose
provider ids, model ids, voice ids, and locales from talk.catalog and pass
them through the Talk session or handoff request. Opening a voice session should
not mutate messages.tts or global Talk provider defaults.
Model-driven directives
By default, the assistant can emit [[tts:...]] directives to override
voice, model, or speed for a single reply, plus an optional
[[tts:text]]...[[/tts:text]] block for expressive cues that should appear in
audio only:
text Copy code Here you go. [[tts:speakerVoiceId=pMsXgVXv3BLzUgSXRplE model=eleven_v3 speed=1.1]] [[tts:text]](laughs) Read the song once more.[[/tts:text]]
When messages.tts.auto is "tagged" , directives are required to trigger
audio. Streaming block delivery strips directives from visible text before the
channel sees them, even when split across adjacent blocks.
provider=... is ignored unless modelOverrides.allowProvider: true . When a
reply declares provider=... , the other keys in that directive are parsed
only by that provider; unsupported keys are stripped and reported as TTS
directive warnings.
Available directive keys:
provider (registered provider id; requires allowProvider: true )
speakerVoice / speakerVoiceId (legacy aliases: voice , voiceName , voice_name , google_voice , voiceId )
model / google_model
stability , similarityBoost , style , speed , useSpeakerBoost
vol / volume (MiniMax volume, 0–10)
pitch (MiniMax integer pitch, −12 to 12; fractional values are truncated)
emotion (Volcengine emotion tag)
applyTextNormalization ( auto|on|off )
languageCode (ISO 639-1)
seed
Disable model overrides entirely:
json5 Copy code { messages : { tts : { modelOverrides : { enabled : false } } } }
Allow provider switching while keeping other knobs configurable:
json5 Copy code { messages : { tts : { modelOverrides : { enabled : true , allowProvider : true , allowSeed : false } } } }
Slash commands
Single command /tts . On Discord, OpenClaw also registers /voice because
/tts is a built-in Discord command — text /tts ... still works.
text Copy code /tts off | on | status /tts chat on | off | default /tts latest /tts provider <id> /tts persona <id> | off /tts limit <chars> /tts summary off /tts audio <text> Note
Commands require an authorized sender (allowlist/owner rules apply) and either
commands.text or native command registration must be enabled.
Behavior notes:
/tts on writes the local TTS preference to always ; /tts off writes it to off .
/tts chat on|off|default writes a session-scoped auto-TTS override for the current chat.
/tts persona <id> writes the local persona preference; /tts persona off clears it.
/tts latest reads the latest assistant reply from the current session transcript and sends it as audio once. It stores only a hash of that reply on the session entry to suppress duplicate voice sends.
/tts audio generates a one-off audio reply (does not toggle TTS on).
limit and summary are stored in local prefs , not the main config.
/tts status includes fallback diagnostics for the latest attempt — Fallback: <primary> -> <used> , Attempts: ... , and per-attempt detail ( provider:outcome(reasonCode) latency ).
/status shows the active TTS mode plus configured provider, model, voice, and sanitized custom endpoint metadata when TTS is enabled.
Per-user preferences
Slash commands write local overrides to prefsPath . The default is
~/.openclaw/settings/tts.json ; override with the OPENCLAW_TTS_PREFS env var
or messages.tts.prefsPath .
Stored field Effect auto Local auto-TTS override ( always , off , …) provider Local primary provider override persona Local persona override maxLength Summary threshold (default 1500 chars) summarize Summary toggle (default true )
These override the effective config from messages.tts plus the active
agents.list[].tts block for that host.
Output formats (fixed)
TTS voice delivery is channel-capability driven. Channel plugins advertise
whether voice-style TTS should ask providers for a native voice-note target or
keep normal audio-file synthesis and only mark compatible output for voice
delivery.
Voice-note capable channels : voice-note replies prefer Opus ( opus_48000_64 from ElevenLabs, opus from OpenAI).
48kHz / 64kbps is a good voice message tradeoff.
Feishu / WhatsApp : when a voice-note reply is produced as MP3/WebM/WAV/M4A
or another likely audio file, the channel plugin transcodes it to 48kHz
Ogg/Opus with ffmpeg before sending the native voice message. WhatsApp sends
the result through the Baileys audio payload with ptt: true and
audio/ogg; codecs=opus . If conversion fails, Feishu receives the original
file as an attachment; WhatsApp send fails rather than posting an incompatible
PTT payload.
Other channels : MP3 ( mp3_44100_128 from ElevenLabs, mp3 from OpenAI).
44.1kHz / 128kbps is the default balance for speech clarity.
MiniMax : MP3 ( speech-2.8-hd model, 32kHz sample rate) for normal audio attachments. For channel-advertised voice-note targets, OpenClaw transcodes the MiniMax MP3 to 48kHz Opus with ffmpeg before delivery when the channel advertises transcoding.
Xiaomi MiMo : MP3 by default, or WAV when configured. For channel-advertised voice-note targets, OpenClaw transcodes Xiaomi output to 48kHz Opus with ffmpeg before delivery when the channel advertises transcoding.
Local CLI : uses the configured outputFormat . Voice-note targets are
converted to Ogg/Opus and telephony output is converted to raw 16 kHz mono PCM
with ffmpeg .
Google Gemini : Gemini API TTS returns raw 24kHz PCM. OpenClaw wraps it as WAV for audio attachments, transcodes it to 48kHz Opus for voice-note targets, and returns PCM directly for Talk/telephony.
Gradium : WAV for audio attachments, Opus for voice-note targets, and ulaw_8000 at 8 kHz for telephony.
Inworld : MP3 for normal audio attachments, native OGG_OPUS for voice-note targets, and raw PCM at 22050 Hz for Talk/telephony.
xAI : MP3 by default; responseFormat may be mp3 , wav , pcm , mulaw , or alaw . OpenClaw uses xAI's batch REST TTS endpoint and returns a complete audio attachment; xAI's streaming TTS WebSocket is not used by this provider path. Native Opus voice-note format is not supported by this path.
Microsoft : uses microsoft.outputFormat (default audio-24khz-48kbitrate-mono-mp3 ).
The bundled transport accepts an outputFormat , but not all formats are available from the service.
Output format values follow Microsoft Speech output formats (including Ogg/WebM Opus).
Telegram sendVoice accepts OGG/MP3/M4A; use OpenAI/ElevenLabs if you need
guaranteed Opus voice messages.
If the configured Microsoft output format fails, OpenClaw retries with MP3.
OpenAI/ElevenLabs output formats are fixed per channel (see above).
Auto-TTS behavior
When messages.tts.auto is enabled, OpenClaw:
Skips TTS if the reply already contains structured media.
Skips very short replies (under 10 chars).
Summarizes long replies when summaries are enabled, using
summaryModel (or agents.defaults.model.primary ).
Attaches the generated audio to the reply.
In mode: "final" , still sends audio-only TTS for streamed final replies
after the text stream completes; the generated media goes through the same
channel media normalization as normal reply attachments.
If the reply exceeds maxLength and summary is off (or no API key for the
summary model), audio is skipped and the normal text reply is sent.
text Copy code Reply -> TTS enabled? no -> send text yes -> has media / short? yes -> send text no -> length > limit? no -> TTS -> attach audio yes -> summary enabled? no -> send text yes -> summarize -> TTS -> attach audio
Output formats by channel
Target Format Feishu / Matrix / Telegram / WhatsApp Voice-note replies prefer Opus ( opus_48000_64 from ElevenLabs, opus from OpenAI). 48 kHz / 64 kbps balances clarity and size. Other channels MP3 ( mp3_44100_128 from ElevenLabs, mp3 from OpenAI). 44.1 kHz / 128 kbps default for speech. Talk / telephony Provider-native PCM (Inworld 22050 Hz, Google 24 kHz), or ulaw_8000 from Gradium for telephony.
Per-provider notes:
Feishu / WhatsApp transcoding: When a voice-note reply lands as MP3/WebM/WAV/M4A, the channel plugin transcodes to 48 kHz Ogg/Opus with ffmpeg . WhatsApp sends through Baileys with ptt: true and audio/ogg; codecs=opus . If conversion fails: Feishu falls back to attaching the original file; WhatsApp send fails rather than posting an incompatible PTT payload.
MiniMax / Xiaomi MiMo: Default MP3 (32 kHz for MiniMax speech-2.8-hd ); transcoded to 48 kHz Opus for voice-note targets via ffmpeg .
Local CLI: Uses configured outputFormat . Voice-note targets are converted to Ogg/Opus and telephony output to raw 16 kHz mono PCM.
Google Gemini: Returns raw 24 kHz PCM. OpenClaw wraps as WAV for attachments, transcodes to 48 kHz Opus for voice-note targets, returns PCM directly for Talk/telephony.
Inworld: MP3 attachments, native OGG_OPUS voice-note, raw PCM 22050 Hz for Talk/telephony.
xAI: MP3 by default; responseFormat may be mp3|wav|pcm|mulaw|alaw . Uses xAI's batch REST endpoint — streaming WebSocket TTS is not used. Native Opus voice-note format is not supported.
Microsoft: Uses microsoft.outputFormat (default audio-24khz-48kbitrate-mono-mp3 ). Telegram sendVoice accepts OGG/MP3/M4A; use OpenAI/ElevenLabs if you need guaranteed Opus voice messages. If the configured Microsoft format fails, OpenClaw retries with MP3.
OpenAI and ElevenLabs output formats are fixed per channel as listed above.
Field reference
Top-level messages.tts.*
Auto-TTS mode. inbound only sends audio after an inbound voice message; tagged only sends audio when the reply includes [[tts:...]] directives or a [[tts:text]] block.
Legacy toggle. openclaw doctor --fix migrates this to auto .
"all" includes tool/block replies in addition to final replies.
Speech provider id. When unset, OpenClaw uses the first configured provider in registry auto-select order. Legacy provider: "edge" is rewritten to "microsoft" by openclaw doctor --fix .
Active persona id from personas . Normalized to lowercase.
OPENCLAW_DOCS_MARKER:paramOpen:IHBhdGg9InBlcnNvbmFzLjxpZA
" type="object">
Stable spoken identity. Fields: label , description , provider , fallbackPolicy , prompt , providers.<provider> . See Personas .
Cheap model for auto-summary; defaults to agents.defaults.model.primary . Accepts provider/model or a configured model alias.
Allow the model to emit TTS directives. enabled defaults to true ; allowProvider defaults to false .
OPENCLAW_DOCS_MARKER:paramOpen:IHBhdGg9InByb3ZpZGVycy48aWQ
Provider-owned settings keyed by speech provider id. Legacy direct blocks ( messages.tts.openai , .elevenlabs , .microsoft , .edge ) are rewritten by openclaw doctor --fix ; commit only messages.tts.providers.<id> .
Hard cap for TTS input characters. /tts audio fails if exceeded.
Request timeout in milliseconds.
Override the local prefs JSON path (provider/limit/summary). Default ~/.openclaw/settings/tts.json .
OPENCLAW_DOCS_MARKER:paramOpen:IHBhdGg9ImFwaUtleSIgdHlwZT0ic3RyaW5nIg
Env: AZURE_SPEECH_KEY , AZURE_SPEECH_API_KEY , or SPEECH_KEY .
OPENCLAW_DOCS_MARKER:paramClose:
OPENCLAW_DOCS_MARKER:paramOpen:IHBhdGg9InJlZ2lvbiIgdHlwZT0ic3RyaW5nIg
Azure Speech region (e.g. eastus ). Env: AZURE_SPEECH_REGION or SPEECH_REGION .
OPENCLAW_DOCS_MARKER:paramOpen:IHBhdGg9ImVuZHBvaW50IiB0eXBlPSJzdHJpbmci
Optional Azure Speech endpoint override (alias baseUrl ).
OPENCLAW_DOCS_MARKER:paramOpen:IHBhdGg9InNwZWFrZXJWb2ljZSIgdHlwZT0ic3RyaW5nIg
Azure voice ShortName. Default en-US-JennyNeural . Legacy alias: voice .
OPENCLAW_DOCS_MARKER:paramOpen:IHBhdGg9ImxhbmciIHR5cGU9InN0cmluZyI
SSML language code. Default en-US .
OPENCLAW_DOCS_MARKER:paramOpen:IHBhdGg9Im91dHB1dEZvcm1hdCIgdHlwZT0ic3RyaW5nIg
Azure X-Microsoft-OutputFormat for standard audio. Default audio-24khz-48kbitrate-mono-mp3 .
OPENCLAW_DOCS_MARKER:paramOpen:IHBhdGg9InZvaWNlTm90ZU91dHB1dEZvcm1hdCIgdHlwZT0ic3RyaW5nIg
Azure X-Microsoft-OutputFormat for voice-note output. Default ogg-24khz-16bit-mono-opus .
Falls back to ELEVENLABS_API_KEY or XI_API_KEY .
OPENCLAW_DOCS_MARKER:paramOpen:IHBhdGg9Im1vZGVsIiB0eXBlPSJzdHJpbmci
Model id (e.g. eleven_multilingual_v2 , eleven_v3 ).
OPENCLAW_DOCS_MARKER:paramOpen:IHBhdGg9InNwZWFrZXJWb2ljZUlkIiB0eXBlPSJzdHJpbmci
ElevenLabs voice id. Legacy alias: voiceId .
stability , similarityBoost , style (each 0..1 ), useSpeakerBoost ( true|false ), speed ( 0.5..2.0 , 1.0 = normal).
OPENCLAW_DOCS_MARKER:paramOpen:IHBhdGg9Imxhbmd1YWdlQ29kZSIgdHlwZT0ic3RyaW5nIg
2-letter ISO 639-1 (e.g. en , de ).
OPENCLAW_DOCS_MARKER:paramOpen:IHBhdGg9InNlZWQiIHR5cGU9Im51bWJlciI
Integer 0..4294967295 for best-effort determinism.
Falls back to GEMINI_API_KEY / GOOGLE_API_KEY . If omitted, TTS can reuse models.providers.google.apiKey before env fallback.
Gemini TTS model. Default gemini-3.1-flash-tts-preview .
Gemini prebuilt voice name. Default Kore . Legacy aliases: voiceName , voice .
OPENCLAW_DOCS_MARKER:paramOpen:IHBhdGg9InByb21wdFRlbXBsYXRlIiB0eXBlPSciYXVkaW8tcHJvZmlsZS12MSIn
Set to audio-profile-v1 to wrap active persona prompt fields in a deterministic Gemini TTS prompt structure.
OPENCLAW_DOCS_MARKER:paramOpen:IHBhdGg9ImJhc2VVcmwiIHR5cGU9InN0cmluZyI
Only https://generativelanguage.googleapis.com is accepted.
Env: GRADIUM_API_KEY .
Default https://api.gradium.ai .
Default Emma ( YTpq7expH9539ERJ ). Legacy alias: voiceId .
Inworld primary
Env: INWORLD_API_KEY .
Default https://api.inworld.ai .
OPENCLAW_DOCS_MARKER:paramOpen:IHBhdGg9Im1vZGVsSWQiIHR5cGU9InN0cmluZyI
Default inworld-tts-1.5-max . Also: inworld-tts-1.5-mini , inworld-tts-1-max , inworld-tts-1 .
Default Sarah . Legacy alias: voiceId .
OPENCLAW_DOCS_MARKER:paramOpen:IHBhdGg9InRlbXBlcmF0dXJlIiB0eXBlPSJudW1iZXIi
Sampling temperature 0..2 .
Local CLI (tts-local-cli)
OPENCLAW_DOCS_MARKER:paramOpen:IHBhdGg9ImFyZ3MiIHR5cGU9InN0cmluZ1tdIg
Command arguments. Supports {{Text}} , {{OutputPath}} , {{OutputDir}} , {{OutputBase}} placeholders.
OPENCLAW_DOCS_MARKER:paramOpen:IHBhdGg9Im91dHB1dEZvcm1hdCIgdHlwZT0nIm1wMyIgfCAib3B1cyIgfCAid2F2Iic
Expected CLI output format. Default mp3 for audio attachments.
OPENCLAW_DOCS_MARKER:paramOpen:IHBhdGg9InRpbWVvdXRNcyIgdHlwZT0ibnVtYmVyIg
Command timeout in milliseconds. Default 120000 .
Microsoft (no API key)
Microsoft neural voice name (e.g. en-US-MichelleNeural ). Legacy alias: voice .
Language code (e.g. en-US ).
Microsoft output format. Default audio-24khz-48kbitrate-mono-mp3 . Not all formats are supported by the bundled Edge-backed transport.
OPENCLAW_DOCS_MARKER:paramOpen:IHBhdGg9InJhdGUgLyBwaXRjaCAvIHZvbHVtZSIgdHlwZT0ic3RyaW5nIg
Percent strings (e.g. +10% , -5% ).
OPENCLAW_DOCS_MARKER:paramOpen:IHBhdGg9ImVkZ2UuKiIgdHlwZT0ib2JqZWN0IiBkZXByZWNhdGVk
Legacy alias. Run openclaw doctor --fix to rewrite persisted config to providers.microsoft .
Falls back to MINIMAX_API_KEY . Token Plan auth via MINIMAX_OAUTH_TOKEN , MINIMAX_CODE_PLAN_KEY , or MINIMAX_CODING_API_KEY .
Default https://api.minimax.io . Env: MINIMAX_API_HOST .
Default speech-2.8-hd . Env: MINIMAX_TTS_MODEL .
Default English_expressive_narrator . Env: MINIMAX_TTS_VOICE_ID . Legacy alias: voiceId .
OPENCLAW_DOCS_MARKER:paramOpen:IHBhdGg9InNwZWVkIiB0eXBlPSJudW1iZXIi
0.5..2.0 . Default 1.0 .
OPENCLAW_DOCS_MARKER:paramOpen:IHBhdGg9InZvbCIgdHlwZT0ibnVtYmVyIg
(0, 10] . Default 1.0 .
OPENCLAW_DOCS_MARKER:paramOpen:IHBhdGg9InBpdGNoIiB0eXBlPSJudW1iZXIi
Integer -12..12 . Default 0 . Fractional values are truncated before the request.
Falls back to OPENAI_API_KEY .
OpenAI TTS model id (e.g. gpt-4o-mini-tts ).
Voice name (e.g. alloy , cedar ). Legacy alias: voice .
OPENCLAW_DOCS_MARKER:paramOpen:IHBhdGg9Imluc3RydWN0aW9ucyIgdHlwZT0ic3RyaW5nIg
Explicit OpenAI instructions field. When set, persona prompt fields are not auto-mapped.
OPENCLAW_DOCS_MARKER:paramOpen:IHBhdGg9ImV4dHJhQm9keSAvIGV4dHJhX2JvZHkiIHR5cGU9IlJlY29yZDxzdHJpbmcsIHVua25vd24
">Extra JSON fields merged into /audio/speech request bodies after generated OpenAI TTS fields. Use this for OpenAI-compatible endpoints such as Kokoro that require provider-specific keys like lang ; unsafe prototype keys are ignored.
Override the OpenAI TTS endpoint. Resolution order: config → OPENAI_TTS_BASE_URL → https://api.openai.com/v1 . Non-default values are treated as OpenAI-compatible TTS endpoints, so custom model and voice names are accepted.
Env: OPENROUTER_API_KEY . Can reuse models.providers.openrouter.apiKey .
Default https://openrouter.ai/api/v1 . Legacy https://openrouter.ai/v1 is normalized.
Default hexgrad/kokoro-82m . Alias: modelId .
Default af_alloy . Legacy aliases: voice , voiceId .
OPENCLAW_DOCS_MARKER:paramOpen:IHBhdGg9InJlc3BvbnNlRm9ybWF0IiB0eXBlPScibXAzIiB8ICJwY20iJw
Default mp3 .
Volcengine (BytePlus Seed Speech)
Env: VOLCENGINE_TTS_API_KEY or BYTEPLUS_SEED_SPEECH_API_KEY .
OPENCLAW_DOCS_MARKER:paramOpen:IHBhdGg9InJlc291cmNlSWQiIHR5cGU9InN0cmluZyI
Default seed-tts-1.0 . Env: VOLCENGINE_TTS_RESOURCE_ID . Use seed-tts-2.0 when your project has TTS 2.0 entitlement.
OPENCLAW_DOCS_MARKER:paramOpen:IHBhdGg9ImFwcEtleSIgdHlwZT0ic3RyaW5nIg
App key header. Default aGjiRDfUWi . Env: VOLCENGINE_TTS_APP_KEY .
Override the Seed Speech TTS HTTP endpoint. Env: VOLCENGINE_TTS_BASE_URL .
Voice type. Default en_female_anna_mars_bigtts . Env: VOLCENGINE_TTS_VOICE . Legacy alias: voice .
OPENCLAW_DOCS_MARKER:paramOpen:IHBhdGg9ImFwcElkIC8gdG9rZW4gLyBjbHVzdGVyIiB0eXBlPSJzdHJpbmciIGRlcHJlY2F0ZWQ
Legacy Volcengine Speech Console fields. Env: VOLCENGINE_TTS_APPID , VOLCENGINE_TTS_TOKEN , VOLCENGINE_TTS_CLUSTER (default volcano_tts ).
Env: XAI_API_KEY .
Default https://api.x.ai/v1 . Env: XAI_BASE_URL .
Default eve . Live voices: ara , eve , leo , rex , sal , una . Legacy alias: voiceId .
OPENCLAW_DOCS_MARKER:paramOpen:IHBhdGg9Imxhbmd1YWdlIiB0eXBlPSJzdHJpbmci
BCP-47 language code or auto . Default en .
OPENCLAW_DOCS_MARKER:paramOpen:IHBhdGg9InJlc3BvbnNlRm9ybWF0IiB0eXBlPScibXAzIiB8ICJ3YXYiIHwgInBjbSIgfCAibXVsYXciIHwgImFsYXciJw
Env: XIAOMI_API_KEY .
Default https://api.xiaomimimo.com/v1 . Env: XIAOMI_BASE_URL .
Default mimo-v2.5-tts . Env: XIAOMI_TTS_MODEL . Also supports mimo-v2-tts and mimo-v2.5-tts-voicedesign .
Default mimo_default for preset-voice models. Env: XIAOMI_TTS_VOICE . Legacy alias: voice . Not sent for mimo-v2.5-tts-voicedesign .
OPENCLAW_DOCS_MARKER:paramOpen:IHBhdGg9ImZvcm1hdCIgdHlwZT0nIm1wMyIgfCAid2F2Iic
Default mp3 . Env: XIAOMI_TTS_FORMAT .
OPENCLAW_DOCS_MARKER:paramOpen:IHBhdGg9InN0eWxlIiB0eXBlPSJzdHJpbmci
Optional natural-language style instruction sent as the user message; not spoken. For mimo-v2.5-tts-voicedesign , this is the voice-design prompt; OpenClaw supplies a default when omitted.
Agent tool
The tts tool converts text to speech and returns an audio attachment for
reply delivery. On Feishu, Matrix, Telegram, and WhatsApp, the audio is
delivered as a voice message rather than a file attachment. Feishu and
WhatsApp can transcode non-Opus TTS output on this path when ffmpeg is
available.
WhatsApp sends audio through Baileys as a PTT voice note ( audio with
ptt: true ) and sends visible text separately from PTT audio because
clients do not consistently render captions on voice notes.
The tool accepts optional channel and timeoutMs fields; timeoutMs is a
per-call provider request timeout in milliseconds. Per-call values override
messages.tts.timeoutMs ; configured TTS timeouts override any plugin-authored
provider default.
Gateway RPC
Method Purpose tts.status Read current TTS state and last attempt. tts.enable Set local auto preference to always . tts.disable Set local auto preference to off . tts.convert One-off text → audio. tts.setProvider Set local provider preference. tts.setPersona Set local persona preference. tts.providers List configured providers and status.
Service links
OpenAI text-to-speech guide
OpenAI Audio API reference
Azure Speech REST text-to-speech
Azure Speech provider
ElevenLabs Text to Speech
ElevenLabs Authentication
Inworld TTS API
MiniMax T2A v2 API
Volcengine TTS HTTP API
Xiaomi MiMo speech synthesis
node-edge-tts
Microsoft Speech output formats
xAI text to speech
Related
Media overview
Music generation
Video generation
Voice call plugin
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
