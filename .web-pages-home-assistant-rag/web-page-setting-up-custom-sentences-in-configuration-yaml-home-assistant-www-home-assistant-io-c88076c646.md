---
source_url: "https://www.home-assistant.io/voice_control/custom_sentences_yaml"
final_url: "https://www.home-assistant.io/voice_control/custom_sentences_yaml"
canonical_url: "https://www.home-assistant.io/voice_control/custom_sentences_yaml/"
source_handle: "web:www-home-assistant-io:c88076c6466b"
source_section: "voice-control-custom-sentences-yaml"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "4c09557763846395a7cc8e72f4dc3be15218758d6b4e3f8dea95e4ba8c172ece"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Setting up custom sentences in configuration.yaml - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/voice_control/custom_sentences_yaml
- Final URL: https://www.home-assistant.io/voice_control/custom_sentences_yaml
- Canonical URL: https://www.home-assistant.io/voice_control/custom_sentences_yaml/
- Fetched at: 2026-06-28T03:32:08Z
- Content type: text/html; charset=UTF-8

## Description

Open source home automation that puts local control and privacy first. Powered by a worldwide community of tinkerers and DIY enthusiasts. Perfect to run on a Raspberry Pi or a local server.

## Extracted Text

On this page
Setting up sentences in the config directory
Customizing responses
Related devices and installation tutorials
Related topics
Related links
Intents and sentences may be added in the conversation config in your configuration.yaml file:
# Example configuration.yaml conversation : intents : HassTurnOn : - " activate [the] {name}"
This extends the default English sentences for the HassTurnOn intent, allowing you to say “activate the kitchen lights” as well as “turn on the kitchen lights”.
New intents can also be added, with their responses and actions defined using the intent_script integration:
# Example configuration.yaml conversation : intents : YearOfVoice : - " how is the year of voice going" intent_script : YearOfVoice : speech : text : " Great! We're at over 40 languages and counting."
Besides a text response, intent_script can trigger any action available in Home Assistant, such as calling a service or firing an event.
More customization can be done in Home Assistant’s config directory. YAML files in config/custom_sentences/en , for example, will be loaded when English sentences (language code en ) are requested.
The following example creates a new SetVolume intent that changes the volume on one of two media players:
# Example config/custom_sentences/en/media.yaml language : " en" intents : SetVolume : data : - sentences : - " (set|change) {media_player} volume to {volume} [percent]" - " (set|change) [the] volume for {media_player} to {volume} [percent]" lists : media_player : values : - in : " living room" out : " media_player.living_room" - in : " bedroom" out : " media_player.bedroom" volume : range : from : 0 to : 100
As mentioned above, you can then use the intent_script integration to implement an action and provide a response for SetVolume :
# Example configuration.yaml intent_script : SetVolume : action : service : " media_player.volume_set" data : entity_id : " {{ media_player }}" volume_level : " {{ volume / 100.0 }}" speech : text : " Volume changed to {{ volume }}"
Responses for existing intents can be customized as well in config/custom_sentences/<language> :
# Example config/custom_sentences/en/responses.yaml language : " en" responses : intents : HassTurnOn : default : " I have turned on the {{ slots.name }}"
Custom sentences main page
$13 voice assistant for Home Assistant
S3-BOX-3 voice assistant
Create aliases
Conversation response script action
Sentence triggers
Sentence wildcards
View existing intents
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View given feedback
Documentation
Overview
|
FAQ
Glossary
Automations
Dashboards
Voice assistants
Assist up and running
Getting started - Local
Getting started - Home Assistant Cloud
Best practices
Exposing entities to Assist
Assigning areas to floors and an area to a device
Aliases for entities, areas and floors
Talking to Assist - Sentences starter pack
Expanding Assist
Creating a personality with AI
Custom sentences
Assist for Android
Assist for Apple
Experiment with Assist setups
The Home Assistant Approach to Wake Words
Wake words for Assist
Tutorial: ESP32-S3-BOX voice assistant
Tutorial: Customize the S3-BOX
Tutorial: $13 voice assistant
Tutorial: World's most private voice assistant
Tutorial: Your daily summary by Assist
Starting Assist from your dashboard
Contribute to the Voice initiative
Troubleshooting
Troubleshooting Assist
Troubleshooting the ESP32-S3-BOX
Using Piper TTS in automations
Organization
Home energy management
Templating
Common tasks
Configuration
Authentication
Tools and helpers
iOS and Android apps
Official hardware
Home Assistant Green
Home Assistant Connect ZBT-1
Home Assistant Connect ZBT-2
Home Assistant Connect ZWA-2
Home Assistant Yellow
Home Assistant Voice Preview Edition
Back to top
