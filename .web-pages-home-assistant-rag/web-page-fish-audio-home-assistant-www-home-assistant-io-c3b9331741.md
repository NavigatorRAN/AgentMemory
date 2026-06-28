---
source_url: "https://www.home-assistant.io/integrations/fish_audio"
final_url: "https://www.home-assistant.io/integrations/fish_audio"
canonical_url: "https://www.home-assistant.io/integrations/fish_audio/"
source_handle: "web:www-home-assistant-io:c3b9331741c8"
source_section: "integrations-fish-audio"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "98ab873a35eca2275c07a791ff1c7eba57fe9b73ed52cdb1cf89063ef0237c2a"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Fish Audio - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/fish_audio
- Final URL: https://www.home-assistant.io/integrations/fish_audio
- Canonical URL: https://www.home-assistant.io/integrations/fish_audio/
- Fetched at: 2026-06-28T02:42:54Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up Fish Audio integration with Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Initial setup
Adding a voice
Language and accents
Text-to-speech (TTS)
Using in Assist pipelines
Using with Large Language Models (LLMs)
Troubleshooting
No private voices appear
TTS entity shows up as double named
Removing the integration
To remove an integration instance from Home Assistant
The Fish Audio integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] brings high-quality voice cloning and a wide variety of public voices to Home Assistant. It provides a text-to-speech ( TTS ) service, allowing you to create expressive, human-like speech.
Fish Audio is positioned as a leading voice cloning service. It features the advanced s2-pro model, which supports emotional and tone markers for more natural-sounding speech.
A Fish Audio account is required.
You will need an API key, which you can create from your Fish Audio API keys dashboard .
Your Home Assistant instance must have internet access to reach the Fish Audio API.
To add the Fish Audio service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Fish Audio .
Follow the instructions on screen to complete the setup.
The setup is a two-step process. First, you configure the integration with your API key, and then you can add one or more voices.
You will be asked for your Fish Audio API key. After you provide it, the integration will be added.
To add a text-to-speech (TTS) voice, select the Add TTS voice button on the integration card. You can repeat this process to add multiple voices.
The process for adding a voice involves two steps:
Voice filtering:
First, you’ll choose whether to see only your private, cloned voices or also the recommended public voices from Fish Audio.
Voice configuration:
Based on your filter selection, you will then be presented with the following options on the next screen:
Voice : Select a voice from the dropdown list of available voices. You can also enter a custom voice ID from the Fish Audio website.
AI voice model : Choose a default backend model. s2-pro is the latest and most advanced model. Both s2-pro and s1 models support emotional markers .
Latency mode : Choose between normal (better quality) or balanced (faster speed).
Name : Set the name for the TTS entity that will be created.
Each voice you add creates a new TTS entity.
Fish Audio determines the spoken language based on the input text, not a fixed language setting for the voice. This means you can give English text to a Spanish voice, and it will speak English with a Spanish accent. Similarly, providing Spanish text to an English voice will result in Spanish spoken with an English accent.
Currently supported languages include:
Arabic
Chinese
English
French
German
Japanese
Korean
Spanish
Any: Selecting Any allows Fish Audio to automatically determine the spoken language based on the input text, enabling the cross-language accent behavior described above.
The tts.speak service allows you to use Fish Audio voices in your automations and scripts. Select the tts.fish_audio entity, choose a media player, and enter your message.
Example of a tts.speak action in YAML:
actions : - action : tts.speak target : entity_id : tts.fish_audio data : media_player_entity_id : media_player.living_room_speaker message : " Hello, this is a test of my new voice!" options : voice_id : " 802e3bc2b27e49c2995d23ef70e6ac89" backend : " s2-pro" latency : " normal"
The TTS entities you create can be set as the voice for your Assist pipelines. This allows your voice assistant to respond using the high-quality Fish Audio voices.
To configure this:
Go to Settings > Voice assistants .
Select the assistant you want to configure.
In the Text-to-speech section, choose one of your created voices from the dropdown menu.
Your assistant will now use the default voice and model you configured for the Fish Audio integration for its spoken responses.
The s2-pro , s1 , and v1.6 models are capable of highly expressive speech by using special markers for emotion and tone. To leverage this with a Large Language Model (LLM), you can add instructions to your prompt that guide the LLM to generate these markers in its response. For a complete list of available markers and more advanced examples, you can refer to the emotion control documentation to help you craft the perfect prompt for your needs.
For example, you could combine your main request with a set of instructions for the LLM like this:
Prompt:
Announce that the house is now in movie mode. The lights are dimmed and the blinds are closed.
Instructions for the LLM:
Apply emotion control by inserting markers before text.
- Use emotion markers: (angry), (sad), (excited), (surprised), (sarcastic), (joyful), (empathetic)
- Use tone markers: (in a hurry tone), (shouting), (screaming), (whispering), (soft tone)
- Use special markers: (laughing), (chuckling), (sobbing), (sighing), (panting), (crowd laughing)
- Optionally add onomatopoeia with markers, for example: "Ha,ha,ha" for laughter.
- Place markers immediately before the dialogue they modify.
- Default to neutral if no marker is specified.
The LLM might then generate a response like this:
(soft tone) Movie mode has been activated. The lights are dimmed, and the blinds are closed. (empathetic) Enjoy the show.
Symptom: “No private voices available”
When trying to add a voice with the “Private models only” option enabled, your cloned voices do not appear in the voice selection list.
Description
This means the private voices you created in your Fish Audio account are not yet available via the API, or they haven’t been created yet.
Resolution
To resolve this issue, try the following steps:
Make sure you have created cloned voices in your Fish Audio account .
Make sure the voices are fully processed and ready to use.
Wait a few minutes for new voices to become available via the API after creation.
If a TTS entity is named “Adam”, it might show up as “Adam Adam” in the interface. This is currently a known issue.
This integration follows standard integration removal.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Fish Audio service was introduced in Home Assistant 2026.1, and it's used by
95 active installations.
Its IoT class is Cloud Polling.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@noambav
Categories
Text-to-speech
Back to top
