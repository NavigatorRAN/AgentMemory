---
source_url: "https://www.home-assistant.io/integrations/elevenlabs"
final_url: "https://www.home-assistant.io/integrations/elevenlabs"
canonical_url: "https://www.home-assistant.io/integrations/elevenlabs/"
source_handle: "web:www-home-assistant-io:18a7a46c7f8f"
source_section: "integrations-elevenlabs"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "67445f0d51807f9a9a0ce8cdc1c304b5e8fe3daffe5dea5ba5acd0b492553f41"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# ElevenLabs - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/elevenlabs
- Final URL: https://www.home-assistant.io/integrations/elevenlabs
- Canonical URL: https://www.home-assistant.io/integrations/elevenlabs/
- Fetched at: 2026-06-28T02:39:37Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up ElevenLabs text-to-speech with Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Text-to-speech
Speech-to-text
Action speak
Removing the integration
To remove an integration instance from Home Assistant
The ElevenLabs integrations Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] adds support for ElevenLabs as text-to-speech to read a text with natural sounding voices and speech-to-text to convert speech into text.
You need an ElevenLabs account to use this integration. A free account suffices for basic usage.
For custom voices or more quota you need a subscription.
You need your API key from the ElevenLabs website.
Your API key requires the following permissions:
Text to Speech
Speech to Text
Voices (Read only)
Models (Read only)
To add the ElevenLabs service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select ElevenLabs .
Follow the instructions on screen to complete the setup.
For an overview of which languages can be used, check the complete list of supported languages .
For a description of which voices are available for use, check your VoiceLab voices.
To see the available models and their benefits, check the models documentation .
An overview of supported languages is available at complete list of supported languages .
List of models and their capabilities can be determined at models documentation .
The tts.speak action is the modern way to use TTS. Add the speak action, select the entity for your ElevenLabs TTS (it’s named ElevenLabs by default), select the media player entity or group to send the TTS audio to, and enter the message to speak.
For more options about speak , see the Speak section on the main TTS building block page.
In YAML, your action will look like this:
action : tts.speak target : entity_id : tts.elevenlabs data : media_player_entity_id : media_player.giant_tv message : Hello, can you hear me now? options : voice : <voice-id> model : <model-id>
Below settings can be configured in the options of the integration and in the options parameter of the tts.speak service.
Configuration Variables
Looking for your configuration file?
voice string ( Optional )
Voice ID for the ElevenLabs voice to use. Will override the default voice of the entity!
model string ( Optional )
Model ID for the text-to-speech model to use. Will override the default model of the entity!
Speech-to-text model string ( Optional )
Model ID for the speech-to-text model to use. Will override the default model of the entity!
Auto-detect language boolean ( Optional , default: false )
Should speech-to-text auto-detect the language spoken, overrides the language selected in voice assistant!
For more information about using text-to-speech with Home Assistant and more details on all the options it provides, see the TTS documentation .
For more information about using speech-to-text with Home Assistant and more details on all the options it provides, see the STT documentation .
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The ElevenLabs service was introduced in Home Assistant 2024.8, and it's used by
2430 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@sorgfresser
Categories
Back to top
