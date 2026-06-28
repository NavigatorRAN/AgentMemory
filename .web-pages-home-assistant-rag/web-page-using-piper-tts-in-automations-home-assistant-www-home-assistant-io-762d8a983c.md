---
source_url: "https://www.home-assistant.io/voice_control/using_tts_in_automation"
final_url: "https://www.home-assistant.io/voice_control/using_tts_in_automation"
canonical_url: "https://www.home-assistant.io/voice_control/using_tts_in_automation/"
source_handle: "web:www-home-assistant-io:762d8a983c2b"
source_section: "voice-control-using-tts-in-automation"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "28f9f90685a24dc43c3e1b1b2f99a737422c0243955991bbfecf5cde762fd897"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Using Piper TTS in automations - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/voice_control/using_tts_in_automation
- Final URL: https://www.home-assistant.io/voice_control/using_tts_in_automation
- Canonical URL: https://www.home-assistant.io/voice_control/using_tts_in_automation/
- Fetched at: 2026-06-28T03:32:33Z
- Content type: text/html; charset=UTF-8

## Description

Open source home automation that puts local control and privacy first. Powered by a worldwide community of tinkerers and DIY enthusiasts. Perfect to run on a Raspberry Pi or a local server.

## Extracted Text

This procedure shows you how to create a text-to-speech action Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] . For this, we use our local text-to-speech engine, Piper, and the media player service The term “service” in Home Assistant is used in the sense of an information
service . For example, the municipal waste management service that provides
entities for organic, paper, and packaging waste. In terms of functionality,
the information service is like a device. It is called service to avoid
confusion, as it does not come with a piece of hardware. . Home Assistant can then speak to you over your media player as part of an automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] .
Go to Settings > Automations & Scenes , and select Create automation .
Select Create new automation , then Add action .
From the drop-down menu, search for or select TTS: Speak .
To use fully local text-to-speech processing, select piper from the Choose entity control.
Select the media player you want the automation to use.
Enter the text you want to hear for this automation.
Your text-to-speech action is now ready to be used in your script or automation.
Save your action.
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
