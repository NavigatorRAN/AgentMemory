# Set up a voice assistant with Home Assistant Cloud - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/voice_control/voice_remote_cloud_assistant
- Final URL: https://www.home-assistant.io/voice_control/voice_remote_cloud_assistant
- Canonical URL: https://www.home-assistant.io/voice_control/voice_remote_cloud_assistant/
- Fetched at: 2026-06-28T03:32:36Z
- Content type: text/html; charset=UTF-8

## Description

The fastest way to get Assist running well: use the high-quality speech-to-text and text-to-speech voices included with a Home Assistant Cloud subscription.

## Extracted Text

On this page
Setting up a cloud Assist pipeline
Next steps
Related topics
Related links
The fastest way to get a great-sounding voice assistant up and running is to use the speech-to-text and text-to-speech voices included with a Home Assistant Cloud subscription. They handle the heavy parts (turning your speech into text and turning Home Assistant’s reply into a natural-sounding voice) on Nabu Casa’s servers, so you can use Assist without needing extra hardware.
Only the audio is sent to the cloud for processing. Everything Assist actually does in your home, opening lights, locking doors, running automations, still happens on your own Home Assistant.
If you would prefer to keep absolutely everything local, see the fully local voice assistant guide instead.
To have the fastest processing voice assistant experience, follow these steps:
If you haven’t done this already, enable Home Assistant Cloud .
As soon as you’re connected to Home Assistant Cloud, a voice assistant has been created for you.
This voice assistant is using text-to-speech and speech-to-text engines based on the region settings of your Home Assistant user.
To view the settings, go to Settings > Voice assistants and under Assist , select Home Assistant Cloud .
Troubleshooting: If you do not see any assistants here, you are not using the default configuration . In this case, you need to add the following to your configuration.yaml file:
# Example configuration.yaml entry assist_pipeline :
If the predefined language settings work for you, skip the next step.
If you want to make some changes:
If you like, change the name. You can pick any name that is meaningful to you.
If you do not agree with the predefined language, select the language that you want to speak.
Under Conversation agent , select Home Assistant .
Under Speech-to-text , select the language you want to speak.
Under Text-to-speech , select the language you want Assist to use when speaking to you.
Depending on your language, you may be able to select different language variants.
That’s it. You can now speak to your device, and the device can answer in the language you defined.
Once Assist is configured, you can start using it. You can now talk through your device ( Android , iOS or Voice Preview edition .
To get the best out of the voice interaction, don’t forget to check the best practices .
Best practices with assist
Expanding assist
Creating a local assistant
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
