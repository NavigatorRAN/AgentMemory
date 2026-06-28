---
source_url: "https://www.home-assistant.io/voice_control/voice_remote_local_assistant"
final_url: "https://www.home-assistant.io/voice_control/voice_remote_local_assistant"
canonical_url: "https://www.home-assistant.io/voice_control/voice_remote_local_assistant/"
source_handle: "web:www-home-assistant-io:50e79718b431"
source_section: "voice-control-voice-remote-local-assistant"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "ff4dee6632995bd969a456c0adfbddaf5c1e0b4fe92a5e9ff55c1578cea75d5c"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Set up a fully local voice assistant - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/voice_control/voice_remote_local_assistant
- Final URL: https://www.home-assistant.io/voice_control/voice_remote_local_assistant
- Canonical URL: https://www.home-assistant.io/voice_control/voice_remote_local_assistant/
- Fetched at: 2026-06-28T03:32:42Z
- Content type: text/html; charset=UTF-8

## Description

Run Assist completely on your own hardware: do speech recognition, intent processing, and text-to-speech locally, with no cloud involved.

## Extracted Text

On this page
Prerequisites
Some options for speech-to-text and text-to-speech
Speech-to-text engines
Text-to-speech engine
Installing a local Assist pipeline
Fine-tuning Whisper and Piper for your setup
Learning more about Speech-to-Phrase
Next steps
Related topics
Related links
Assist can run entirely on your own hardware. Your spoken commands never leave your home: a microphone hears you, a local speech-to-text engine turns your voice into text, Home Assistant figures out what you want, and a local text-to-speech engine speaks the answer back. This guide walks you through setting that up.
If you would rather not run all of that yourself, the simplest path is to use the speech-to-text and text-to-speech voices included with Home Assistant Cloud . Both options work well, and you can switch between them later.
For Assist to be able to talk to your Home Assistant setup your setup needs to be able to listen, understand and then talk back.
In Home Assistant, the Assist pipelines are made up of various components that together form a voice assistant. For each component, you can choose from different options.
For listening and talking back, it needs your phone with the Home Assistant app, or a voice activated device.
For understanding, it needs to have a speech-to-text and text-to-speech software integrated.
For running all together, it needs to have the Home Assistant Operating System running.
There are speech-to-text and text-to-speech options that run entirely local. No data is sent to external servers for processing.
There are currently two options to run speech-to-text locally: Speech-to-Phrase and Whisper .
Speech-to-Phrase
Speech-to-Phrase is a close-ended speech model.
It transcribes what it knows.
Extremely fast transcription even on a Home Assistant Green or Raspberry Pi 4 (under one second).
Only supports a subset of Assist’s voice commands.
More open-ended items such as shopping lists, naming a timer, and broadcasts are not usable out of the box.
Speech-to-Phrase supports various languages .
These qualities make it a great option for Home control!
Whisper
Whisper is an open-ended speech model.
It will try to transcribe everything.
The cost is slower processing speed:
On a Raspberry Pi 4, it takes around 8 seconds to process incoming voice commands.
On an Intel NUC, it is done in under a second.
Supports various languages .
Whisper is only a great option in the following case:
You have powerful hardware at home.
You plan to extend your voice set-up beyond simple home control. For example, by pairing your assistant with an LLM-based agent.
For text-to-speech, we have developed Piper . Piper is a fast, local neural text-to-speech system that sounds great and is optimized for the Raspberry Pi 4. It supports many languages . On a Raspberry Pi, using medium quality models, it can generate 1.6s of voice in a second.
Please be sure to check how either option will work in your language, since quality can change quite a bit.
For the quickest way to get your local Assist pipeline started, follow these steps:
Install the apps to convert text into speech and vice versa.
Install the speech-to-text app of your choice, either Speech-to-Phrase or Whisper .
Install Piper for text-to-speech.
Start the apps.
Once the apps are started, head over to the integrations under Settings > Devices & services .
You should now see both services being discovered by the Wyoming integration .
For each integration, select Add .
You now have integrated a local speech-to-text engine of your choice (either Speech-to-Phrase or Whisper ) and a text-to-speech engine ( Piper ).
Setup your assistant.
Go to Settings > Voice assistants and select Add assistant .
Troubleshooting: If you do not see any assistants here, you are not using the default configuration. In this case, you need to add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry assist_pipeline :
Enter a name. You can pick any name that is meaningful to you.
Select the language that you want to speak.
Under Conversation agent , select Home Assistant .
Under Speech-to-text , select the speech-to-text engine you choose in the previous step (either Whisper or Speech-to-Phrase ). Select the language.
Under Text-to-speech , select Piper . Select the language.
Depending on your language, you may be able to select different language variants.
That’s it. You ensured your voice commands can be processed locally on your device.
If you haven’t done so yet, expose your devices to Assist .
Otherwise you won’t be able to control them by voice.
You would like to tweak the configuration for better performance or accuracy?
View some of the options in the video below. Explained by Mike Hansen, creator of Rhasspy, Piper, and Wyoming.
The options are also documented in the app itself. Go to the Whisper or the Piper app and open the Documentation page.
Also be sure to check the specific tutorial for using Piper in Automations
You can check out Voice Chapter 9 to learn more about why we introduced Speech-to-Phrase, and why it’s a great option for home control.
To get the best out of the voice interaction, check the best practices .
Once Assist is configured, you can start using it.
Talk to Assist via a connected device, such as Android , iOS , or Voice Preview edition ).
Best practices with assist
Expanding assist
Exposing devices to assist
Voice Preview Edition - Documentation
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
