---
source_url: "https://www.home-assistant.io/voice_control/create_wake_word"
final_url: "https://www.home-assistant.io/voice_control/create_wake_word"
canonical_url: "https://www.home-assistant.io/voice_control/create_wake_word/"
source_handle: "web:www-home-assistant-io:f2bc3b30827e"
source_section: "voice-control-create-wake-word"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "da47a9068909db74ec28e602b12241bb180886d92367e2ecbd6d5b9b7ab94cd3"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Wake words for Assist - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/voice_control/create_wake_word
- Final URL: https://www.home-assistant.io/voice_control/create_wake_word
- Canonical URL: https://www.home-assistant.io/voice_control/create_wake_word/
- Fetched at: 2026-06-28T03:32:04Z
- Content type: text/html; charset=UTF-8

## Description

Open source home automation that puts local control and privacy first. Powered by a worldwide community of tinkerers and DIY enthusiasts. Perfect to run on a Raspberry Pi or a local server.

## Extracted Text

On this page
Enabling a wake word
Prerequisites
Installing the openWakeWord app
To enable wake word for your voice assistant
Try it!
Creating your own wake word
To create your own wake word
To add your personal wake word to Home Assistant
Troubleshooting
Troubleshooting wake word recognition
Troubleshooting performance issues of the training environment
Related topics
Related links
Wake words are special words or phrases that tell a voice assistant that a command is about to be spoken. The device then switches from passive to active listening. Examples are: Hey Google, Hey Siri, or Alexa. Home Assistant supports its own wake words, such as Okay Nabu.
If you want to know more about this topic check the Home Assistant approach to wake words .
This tutorial shows how you can enable a wake word in Home Assistant. It does not describe how to use it.
To use the wake word, you need some extra hardware. A low cost option is the M5Stack ATOM Echo Development Kit . To set that up, follow the $13 voice assistant for Home Assistant .
Enabling a wake word consists of 2 steps:
Installing the openWakeWord app.
Enabling the wake word for a specific voice assistant.
Home Assistant version 2023.10 or later, installed with the Home Assistant Operating System
Assist configured either with Home Assistant Cloud or a manually configured local Assist pipeline
All the Best Practices we recommend.
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
Result: on the bottom of the page, you now see a new section Streaming wake word engine .
Select openwakeword , then select ok nabu .
If you created a new assistant, select Create .
If you edited an existing assistant, select Update .
Result: You now have a voice assistant that listens to a wake word.
For the first run, it is recommended to use ok nabu , just to test the setup.
Once you have it all set up, you can create your own wake words.
Right now, there are two easy options to get started using wake words:
Follow the guide to the $13 voice assistant . This tutorial is using the tiny ATOM Echo, detecting wake words with openWakeWord.
Follow the guide to set up an ESP32-S3-BOX-3 voice assistant . This tutorial is using the bigger S3-BOX-3 device which features a display. It can detect wake words using openWakeWord. But it can also do on-device wake word detection using microWakeWord.
You can now create your own wake word to use with Home Assistant. The procedure below will guide you to train a model. The model is trained using voice clips generated by our local neural text-to-speech system Piper .
Want to know more about how this all works? Check out the openWakeWord project by David Scripka.
Depending on the word, training a model on your own wake word may take a few iterations and a bit of tweaking. This guide will take you through the process step by step.
Latest version of Home Assistant, installed with the Home Assistant Operating System
M5Stack ATOM Echo Development Kit
Successfully completed the $13 voice assistant for Home Assistant tutorial
Think of a wake word.
A word or short phrase (3-4 syllables) that is not commonly used so that it does not trigger Assist by mistake.
Currently, only wake words in English are supported.
Open the wake word training environment .
In section 1, enter your wake word in the target_word field.
In the code section next to the target_word , select the play button. The first time this can take up to 30 seconds.
If the play button does not appear, make sure your cursor is placed in the target_word field.
If it still does not show up, in the top right corner of the document, make sure it says Connected .
If it is not connected, select Connect to a hosted runtime .
Result: The pronunciation of your wake word is being created.
Once it is finished, at the bottom of the section, you see an audio file. Listen to it.
If the word does not sound correct to you:
Follow the instructions in the document to tweak the spelling of the word and press play again.
The word should sound the way you pronounce it.
Once you are satisfied with the result, in the menu on top of the screen, select Runtime > Run all .
This will take around an hour. Feel free to do something else but make sure to leave the browser tab open.
Result: Once this process is finished, you should have 2 files in your downloads folder:
.tflite and .onnx files (only .tflite is used)
Congratulations! You just applied machine learning to create your own wake word model!
The next step is to add it to Home Assistant.
Make sure you have the Samba app installed .
On your computer, access your Home Assistant server via Samba.
Open the share folder and create a new folder openwakeword so that you have /share/openwakeword .
Drop your shiny new wake word model file ( .tflite ) into that folder.
Go to Settings > Voice assistants .
Either create a new assistant and select Add assistant .
Or, edit an existing assistant.
Under Wake word , select openwakeword .
Then, select your own personal wake word.
If there is no Wake word option, make sure you have the app installed and successfully completed the $13 voice assistant for Home Assistant tutorial.
Enable this new assistant on your ATOM Echo device.
Go to Settings > Devices & services and select the ESPHome integration.
Under M5Stack ATOM Echo , select 1 device .
Under Configuration , make sure Use wake word is enabled.
Select the assistant with your wake word.
Test your new wake word.
Speak your wake word followed by a command, such as “Turn on the lights in the kitchen”.
When the ATOM Echo picks up the wake word, it starts blinking blue.
If the ATOM Echo does not start blinking blue when you say the wake word, there are a few things you can try.
Under Controls , make sure Use wake word is enabled.
If this was not the issue, you may need to tweak the wake word model.
Go back to the wake word training environment .
In section 3 of the document, follow the instructions on tweaking the settings and create a new model.
The environment on the Colab space runs on resources offered by Google. They are intended for small-scale, non-commercial personal use. There is no guarantee that resources are available.
If many people use this environment at the same time or if the request itself uses a lot of resources, the execution might be very slow or won’t run at all.
It may take 30-60 minutes for the run to complete. This is expected behavior.
Things you can try if the execution is very slow:
Free of charge solution: This environment has worked for all the wake word models that were trained to create and test this procedure. There is a good chance that it will work for you. If it does not, try training your model another time. Maybe many people are using it right now.
You can pay for more computing resources: In the top right corner, select the RAM | Disk icon.
Select the link to Upgrade to Colab Pro .
Select your price plan and follow the instructions on screen.
$13 voice assistant for home assistant
Custom sentences
Installing the samba app
About wake words
Wake word training environment
openWakeWord
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
