---
source_url: "https://www.home-assistant.io/voice_control/custom_sentences"
final_url: "https://www.home-assistant.io/voice_control/custom_sentences"
canonical_url: "https://www.home-assistant.io/voice_control/custom_sentences/"
source_handle: "web:www-home-assistant-io:b6a7fb938639"
source_section: "voice-control-custom-sentences"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "76f8e8b44b8faf49c22aff87990e714b3c8864fbddaaa43d05f693cb801b294b"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Adding a custom sentence to trigger an automation - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/voice_control/custom_sentences
- Final URL: https://www.home-assistant.io/voice_control/custom_sentences
- Canonical URL: https://www.home-assistant.io/voice_control/custom_sentences/
- Fetched at: 2026-06-28T03:32:06Z
- Content type: text/html; charset=UTF-8

## Description

Open source home automation that puts local control and privacy first. Powered by a worldwide community of tinkerers and DIY enthusiasts. Perfect to run on a Raspberry Pi or a local server.

## Extracted Text

On this page
Prerequisites
To add a custom sentence to trigger an automation
Setting up custom sentences in configuration.yaml
Related devices and installation tutorials
Related topics
Related links
You may add your own sentences to the intent recognizer by either extending an existing intent or creating a new one. You may also customize responses for existing intents.
You need a working Assist configuration. If you haven’t done so yet, check Assist’s starting page to get you ready with your setup.
This is the easiest method to get started with custom sentences for automations.
Under Settings > Automations & Scenes , in the bottom right corner, select Create automation .
In the Trigger drop-down menu, select Sentence .
Enter one or more sentences that you would like to trigger an automation.
Do not use punctuation.
You can add multiple sentences. They will then all trigger that automation.
To add a custom response, select Add action . Scroll all the way down and select Other actions .
Then, select Set conversation response .
In the text field, enter the response you want to hear from Assist and select Save .
You can also use wildcards . For example, the trigger:
play {album} by {artist}
could have the response:
Playing {{ trigger.slots.album }} by {{ trigger.slots.artist }}
For more details, refer to conversation response script action .
To test the automation, go to Overview and in the top right corner, open Assist.
Enter one of the sentences.
If it did not work out, checkout the troubleshooting section.
One of the causes could be that the device you’re targeting has not been exposed to Assist.
Pick up your voice control device and speak the custom sentence.
Your automation should now be triggered.
To set up custom sentences in your configuration file follow this tutorial .
$13 voice assistant for Home Assistant
S3-BOX-3 voice assistant
Assist for Apple
Assist for Android
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
