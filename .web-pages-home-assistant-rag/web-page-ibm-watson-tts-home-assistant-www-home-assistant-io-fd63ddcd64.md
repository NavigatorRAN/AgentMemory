# IBM Watson TTS - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/watson_tts
- Final URL: https://www.home-assistant.io/integrations/watson_tts
- Canonical URL: https://www.home-assistant.io/integrations/watson_tts/
- Fetched at: 2026-06-28T03:27:47Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up IBM Watson TTS with Home Assistant.

## Extracted Text

On this page
Setup
Configuration
Usage
Related topics
The IBM Watson TTS text-to-speech integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] that works with IBM Watson Cloud to create the spoken output.
Watson is a paid service via IBM Cloud but there is a decent free tier which offers 10000 free characters every month.
For supported formats and voices please go to IBM Cloud About section .
To get started please read the Getting started tutorial .
To configure Watson TTS, add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry tts : - platform : watson_tts watson_apikey : YOUR_GENERATED_APIKEY
You can get these tokens after you generated the credentials on the IBM Cloud console:
Configuration Variables
Looking for your configuration file?
watson_url string ( Optional )
The endpoint to which the service will connect.
Default:
https://api.us-south.text-to-speech.watson.cloud.ibm.com
watson_apikey string Required
Your secret apikey generated on the IBM Cloud admin console.
voice string ( Optional , default: en-US_AllisonV3Voice )
Voice name to be used.
output_format string ( Optional , default: audio/mp3 )
Override the default output format. Supported formats: audio/flac , audio/mp3 , audio/mpeg , audio/ogg , audio/ogg;codecs=opus , audio/ogg;codecs=vorbis , audio/wav
Say to all media_player device entities:
- action : tts.watson_tts_say data : message : " Hello from Watson"
or
- action : tts.watson_tts_say data : message : > <speak> Hello from Watson </speak>
Say to the media_player.living_room device entity:
- action : tts.watson_tts_say target : entity_id : media_player.living_room data : message : > <speak> Hello from Watson </speak>
Say with break:
- action : tts.watson_tts_say data : message : > <speak> Hello from <break time=".9s" /> Watson </speak>
Optionally, specify a voice for the message:
- action : tts.watson_tts_say data : message : " Hello from Watson" options : voice : en-US_EmilyV3Voice
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The IBM Watson TTS integration was introduced in Home Assistant 0.94, and it's used by
2 active installations.
Its IoT class is Cloud Push.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@rutkai
Categories
Text-to-speech
Back to top
