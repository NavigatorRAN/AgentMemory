# MaryTTS - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/marytts
- Final URL: https://www.home-assistant.io/integrations/marytts
- Canonical URL: https://www.home-assistant.io/integrations/marytts/
- Fetched at: 2026-06-28T02:58:40Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up MaryTTS with Home Assistant.

## Extracted Text

On this page
Configuration
Speech effects
Full configuration example
Related topics
The MaryTTS integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] uses MaryTTS text-to-speech engine to read a text with natural sounding voices.
To enable text-to-speech with MaryTTS, add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry tts : - platform : marytts
Configuration Variables
Looking for your configuration file?
host string ( Optional , default: localhost )
The MaryTTS server hostname or IP address.
port integer ( Optional , default: 59125 )
The MaryTTS server port.
codec string ( Optional , default: WAVE_FILE )
The audio codec. Supported codecs are AIFF_FILE , AU_FILE and WAVE_FILE .
voice string ( Optional )
The speaker voice.
Default:
cmu-slt-hsmm
language string ( Optional , default: en_US )
The language to use. Supported languages are de , en_GB , en_US , fr , it , lb , ru , sv , te and tr .
effect map ( Optional )
A dictionary of effects which should be applied to the speech output.
See documentation for details.
For more information about the different effects take a look at the demo page of your MaryTTS installation ( http://localhost:59125/ ).
There you can read about each effect and also test them on the fly.
A full configuration sample including optional variables:
# Example configuration.yaml entry tts : - platform : marytts host : " localhost" port : 59125 codec : " WAVE_FILE" voice : " cmu-slt-hsmm" language : " en_US" effect : Volume : " amount:2.0;" TractScaler : " amount:1.5;" F0Scale : " f0Scale:2.0;" F0Add : " f0Add:50.0;" Rate : " durScale:1.5;" Robot : " amount:100.0;" Whisper : " amount:100.0;" Stadium : " amount:100.0" Chorus : " delay1:466;amp1:0.54;delay2:600;amp2:-0.10;delay3:250;amp3:0.30" FIRFilter : " type:3;fc1:500.0;fc2:2000.0" JetPilot : " "
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The MaryTTS integration was introduced in Home Assistant 0.43, and it's used by
182 active installations.
Its IoT class is Local Push.
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
