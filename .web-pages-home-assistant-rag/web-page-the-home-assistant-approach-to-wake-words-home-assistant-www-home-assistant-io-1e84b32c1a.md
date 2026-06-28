# The Home Assistant approach to wake words - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/voice_control/about_wake_word
- Final URL: https://www.home-assistant.io/voice_control/about_wake_word
- Canonical URL: https://www.home-assistant.io/voice_control/about_wake_word/
- Fetched at: 2026-06-28T03:31:36Z
- Content type: text/html; charset=UTF-8

## Description

Open source home automation that puts local control and privacy first. Powered by a worldwide community of tinkerers and DIY enthusiasts. Perfect to run on a Raspberry Pi or a local server.

## Extracted Text

On this page
The challenge
The approach
Drawbacks of this approach
About the openWakeWord app
Training the model
Supported languages
openWakeWord in Docker
Other wake word engines
About on-device wake word processing (microWakeWord)
Try it!
Related topics
The wake words have to be processed extremely fast: You can’t have a voice assistant start listening 5 seconds after a wake word is spoken.
There is little room for false positives.
Wake word processing is based on compute-intensive AI models.
Voice satellite hardware generally does not have a lot of computing power, so wake word engines need hardware experts to optimize the models to run smoothly.
To avoid being limited to specific hardware, the wake word detection is done inside Home Assistant. Voice satellite devices constantly sample current audio in your room for voice. When it detects voice, the satellite sends audio to Home Assistant where it checks if the wake word was said and handle the command that followed it.
This means any device that streams audio can be turned into a voice satellite, even if it isn’t powerful enough to run wake word detection locally. It also allows our developer community to experiment with wake word models without having to shrink the model to run on a low-powered voice satellite device.
Note
Exception for mobile devices : Mobile devices like Android phones use microWakeWord for on-device wake word detection through the Home Assistant Companion App . This preserves battery life and ensures wake word detection works even when network connectivity is unreliable or unavailable. Only after the wake word is detected does the device send audio to Home Assistant. Learn more about Assist on Android .
Overview of the wake word architecture
The quality of the captured audio differs between devices. A speakerphone with multiple microphones and audio processing chips captures voice very cleanly. A device with a single microphone and no post-processing? Not so much. We compensate for poor audio quality with audio post-processing inside Home Assistant and users can use better speech-to-text models to improve accuracy like the one included with Home Assistant Cloud.
Each satellite requires ongoing resources inside Home Assistant while it’s streaming audio. Currently, users can have 5 voice satellites streaming audio at the same time without overwhelming a Raspberry Pi 4. To scale up, we’ve updated the Wyoming protocol to allow users to run wake word detection on an external server.
Home Assistant’s wake words are leveraging a new project called openWakeWord by David Scripka. This project has real-world accuracy, runs on commodity hardware and anyone can train a basic model of their own wake word .
Users can pick per configured voice assistant what wake word to listen for
openWakeWord is created with 4 goals in mind:
Be fast enough for real-world usage.
Be accurate enough for real-world usage.
Have a simple model architecture and inference process.
Require little to no manual data collection to train new models.
openWakeWord is built around an open source audio embedding model trained by Google and fine-tuned using the text-to-speech system Piper . Piper generates many thousands of audio clips for each wake word, creating variations of different speakers. These audio clips are then augmented to sound as if they were spoken in multiple kinds of rooms, at specific distances from a microphone, and with varying speeds. Finally, the clips are mixed with background noise like music, environmental sounds, and conversation before being fed into the training process to generate the wake word model.
Overview of the openWakeWord training pipeline.
OpenWakeWord currently only works for English wake words. This is because there is still a lack of models in other languages with many different speakers. Similar models for other languages can be trained as more multi-speaker models per language become available.
If you’re not running Home Assistant OS, openWakeWord is also available as a Docker container . Once the container is running, you will need to add the Wyoming integration and point it at its IP address and port (typically 10400).
Home Assistant ships with defaults but allows users to configure each part of their voice assistants. This also applies to wake words.
You can add other wake word engines as an integration or run them as a standalone program that communicates with Home Assistant via the Wyoming protocol .
How wake words integrate into Home Assistant
As an example, we’re also making the Porcupine (v1) wake word engine available. It supports 29 wake words across English, French, Spanish, and German. The wake words include Computer , Framboise , Manzana , and Stachelschwein .
The microWakeWord created by Kevin Ahrendt enables on-device wake word detection on devices like the ESP32-S3-BOX-3 and Android phones.
Because openWakeWord is too large to run on low-power devices like the S3-BOX-3, openWakeWord runs wake word detection on the Home Assistant server.
Doing wake word detection on Home Assistant allows low-power devices like the M5 ATOM Echo Development Kit to simply stream audio and let all of the processing happen elsewhere.
The downside is that adding more voice assistants requires more CPU usage in Home Assistant as well as more network traffic.
Enter microWakeWord ; a more light-weight model based on Google’s Inception neural network . Because this new model is not as large, it can be run on low-power devices with an ESP32 chip, such as the ESP32-S3 chip inside the S3-BOX-3, as well as on Android phones. (For ESPHome devices, it also works on the now discontinued S3-BOX and S3-BOX-Lite) .
Currently, there are three models trained for microWakeWord:
okay nabu
hey jarvis
alexa
There are several easy options to get started with wake words:
Follow the guide to the $13 voice assistant . This tutorial is using the tiny ATOM Echo, detecting wake words with openWakeWord.
Follow the guide to set up an ESP32-S3-BOX-3 voice assistant . This tutorial is using the bigger S3-BOX-3 device which features a display. It can detect wake words using openWakeWord. But it can also do on-device wake word detection using microWakeWord.
The Home Assistant Companion App for Android supports on-device wake word detection using microWakeWord. Wake words like “Hey Nabu”, “Hey Jarvis”, and “Hey Mycroft” work even when your phone is locked or the app is in the background.
Create a $13 voice assistant
Create your own wake words
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
