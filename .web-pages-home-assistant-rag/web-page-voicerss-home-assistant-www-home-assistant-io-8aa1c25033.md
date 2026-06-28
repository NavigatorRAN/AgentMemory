# VoiceRSS - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/voicerss
- Final URL: https://www.home-assistant.io/integrations/voicerss
- Canonical URL: https://www.home-assistant.io/integrations/voicerss/
- Fetched at: 2026-06-28T03:27:08Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up VoiceRSS TTS with Home Assistant.

## Extracted Text

On this page
Configuration
Full configuration example
Related topics
The VoiceRSS integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] uses VoiceRSS text-to-speech engine to read a text with natural sounding voices.
To enable text-to-speech with VoiceRSS, add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry tts : - platform : voicerss api_key : YOUR_API_KEY
Configuration Variables
Looking for your configuration file?
api_key string Required
The API Key for VoiceRSS.
language string ( Optional , default: en-us )
The language to use.
codec string ( Optional , default: mp3 )
The audio codec.
format string ( Optional , default: 8khz_8bit_mono )
The audio sample format.
Check the VoiceRSS API documentation for allowed values.
The configuration sample below shows how an entry can look like:
# Example configuration.yaml entry tts : - platform : voicerss api_key : YOUR_API_KEY language : " de-de" codec : mp3 format : " 8khz_8bit_mono"
Some media_players require a certain format. For example the Sonos requires a format of ‘44khz_16bit_stereo’
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The VoiceRSS integration was introduced in Home Assistant 0.35, and it's used by
99 active installations.
Its IoT class is Cloud Push.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Text-to-speech
Back to top
