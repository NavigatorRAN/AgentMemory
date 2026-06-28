# Enabling a wake word - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/voice_control/install_wake_word_add_on
- Final URL: https://www.home-assistant.io/voice_control/install_wake_word_add_on
- Canonical URL: https://www.home-assistant.io/voice_control/install_wake_word_add_on/
- Fetched at: 2026-06-28T03:32:13Z
- Content type: text/html; charset=UTF-8

## Description

Open source home automation that puts local control and privacy first. Powered by a worldwide community of tinkerers and DIY enthusiasts. Perfect to run on a Raspberry Pi or a local server.

## Extracted Text

On this page
To enable a wake word
Prerequisites
Installing the openWakeWord app
Enabling wake word for your voice assistant
Related topics
About wake words and assistants
Extra hardware to use wake word
This tutorial shows how you can enable a wake word in Home Assistant. It does not describe how to use it.
To use the wake word, you need some extra hardware. A low cost option is the M5Stack ATOM Echo Development Kit . To set that up, follow the $13 voice assistant for Home Assistant . Note that the Home Assistant Voice Preview does not currently support custom wake words.
Enabling a wake word consists of 2 steps:
Installing the openWakeWord app (formerly known as an add-on).
Enabling the wake word for a specific voice assistant.
Home Assistant version 2023.10 or later, installed with the Home Assistant Operating System
Home Assistant Cloud or a manually configured local Assist pipeline
Go to Settings > Apps > openWakeWord and select Install .
Start the app.
Go to Settings > Devices & services .
Under Discovered , you should now see the openWakeWord component of the Wyoming integration.
Select Configure and Submit .
Result: You have successfully installed the openWakeWord app and Wyoming integration.
Go to Settings > Voice assistants
Choose the Assistant:
To enable wake word for an existing assistant, select the Assistant and continue with step 6.
To create a new Assistant: select Add assistant .
Give your assistant a name, for example the wake word you are going to use.
Select the language you are going to use to speak to Home Assistant.
If the Text-to-speech and Speech-to-text sections do not provide language selectors, this means you do not have an Assist pipeline set up.
Set up Home Assistant Cloud or a manually configured Assist pipeline .
Under Text-to-speech , select the language and voice you want Home Assistant to use when speaking to you.
To define the wake word engine, in the top-right corner of the dialog, select the three dots menu and select Add streaming wake word .
Troubleshooting: If you don’t see the three dots menu, go to Settings > Devices & services and make sure the openWakeWord component of the Wyoming integration is added.
Result: On the bottom of the page, you now see a new section Streaming wake word engine .
Select openwakeword , then select ok nabu .
If you created a new assistant, select Create .
If you edited an existing assistant, select Update .
Result: You now have a voice assistant that listens to a wake word.
For the first run, it is recommended to use ok nabu , just to test the setup.
Once you have it all set up, you can create your own wake words .
Create your own wake words
About wake words
Create a cloud assistant
Create a local assistant
M5Stack ATOM Echo Development Kit
Tutorial: $13 voice assistant for Home Assistant
ESP32-S3-BOX-3
Tutorial: ESP32-S3-BOX-3 voice assistant
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
