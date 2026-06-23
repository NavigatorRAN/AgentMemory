# Vydra - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/providers/vydra
- Final URL: https://docs.openclaw.ai/providers/vydra
- Canonical URL: https://docs.openclaw.ai/providers/vydra
- Fetched at: 2026-06-23T14:56:07Z
- Content type: text/html; charset=utf-8

## Description

Use Vydra image, video, and speech in OpenClaw

## Extracted Text

Close
Models Providers
The bundled Vydra plugin adds:
Image generation via vydra/grok-imagine
Video generation via vydra/veo3 and vydra/kling
Speech synthesis via Vydra's ElevenLabs-backed TTS route
OpenClaw uses the same VYDRA_API_KEY for all three capabilities.
Property Value Provider id vydra Plugin bundled, enabledByDefault: true Auth env var VYDRA_API_KEY Onboarding flag --auth-choice vydra-api-key Direct CLI flag --vydra-api-key <key> Contracts imageGenerationProviders , videoGenerationProviders , speechProviders Base URL https://www.vydra.ai/api/v1 (use the www host)
Warning
Use https://www.vydra.ai/api/v1 as the base URL. Vydra's apex host ( https://vydra.ai/api/v1 ) currently redirects to www . Some HTTP clients drop Authorization on that cross-host redirect, which turns a valid API key into a misleading auth failure. The bundled plugin uses the www base URL directly to avoid that.
Setup
Run interactive onboarding
bash Copy code openclaw onboard --auth-choice vydra-api-key
Or set the env var directly:
bash Copy code export VYDRA_API_KEY= "vydra_live_..."
Choose a default capability
Pick one or more of the capabilities below (image, video, or speech) and apply the matching configuration.
Capabilities
Image generation
Default image model:
vydra/grok-imagine
Set it as the default image provider:
json5 Copy code { agents : { defaults : { imageGenerationModel : { primary : "vydra/grok-imagine" , }, }, }, }
Current bundled support is text-to-image only. Vydra's hosted edit routes expect remote image URLs, and OpenClaw does not add a Vydra-specific upload bridge in the bundled plugin yet.
Note
See Image Generation for shared tool parameters, provider selection, and failover behavior.
Video generation
Registered video models:
vydra/veo3 for text-to-video
vydra/kling for image-to-video
Set Vydra as the default video provider:
json5 Copy code { agents : { defaults : { videoGenerationModel : { primary : "vydra/veo3" , }, }, }, }
Notes:
vydra/veo3 is bundled as text-to-video only.
vydra/kling currently requires a remote image URL reference. Local file uploads are rejected up front.
Vydra's current kling HTTP route has been inconsistent about whether it requires image_url or video_url ; the bundled provider maps the same remote image URL into both fields.
The bundled plugin stays conservative and does not forward undocumented style knobs such as aspect ratio, resolution, watermark, or generated audio.
See Video Generation for shared tool parameters, provider selection, and failover behavior.
Video live tests
Provider-specific live coverage:
bash Copy code OPENCLAW_LIVE_TEST=1 \ OPENCLAW_LIVE_VYDRA_VIDEO=1 \ pnpm test :live -- extensions/vydra/vydra.live.test.ts
The bundled Vydra live file now covers:
vydra/veo3 text-to-video
vydra/kling image-to-video using a remote image URL
Override the remote image fixture when needed:
bash Copy code export OPENCLAW_LIVE_VYDRA_KLING_IMAGE_URL= "https://example.com/reference.png" Speech synthesis
Set Vydra as the speech provider:
json5 Copy code { messages : { tts : { provider : "vydra" , providers : { vydra : { apiKey : "${VYDRA_API_KEY}" , speakerVoiceId : "21m00Tcm4TlvDq8ikWAM" , }, }, }, }, }
Defaults:
Model: elevenlabs/tts
Voice id: 21m00Tcm4TlvDq8ikWAM
The bundled plugin currently exposes one known-good default voice and returns MP3 audio files.
Related
Provider directory
Browse all available providers.
Shared image tool parameters and provider selection.
Shared video tool parameters and provider selection.
Configuration reference
Agent defaults and model configuration.
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
