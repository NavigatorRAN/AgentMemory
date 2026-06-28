# Microsoft Text-to-Speech (TTS) - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/microsoft
- Final URL: https://www.home-assistant.io/integrations/microsoft
- Canonical URL: https://www.home-assistant.io/integrations/microsoft/
- Fetched at: 2026-06-28T02:59:53Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up Microsoft text-to-speech with Home Assistant.

## Extracted Text

On this page
Configuration
Full configuration example
Related topics
The Microsoft text-to-speech integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] uses the TTS engine of the Microsoft Speech Service to read a text with natural sounding voices. This integration uses an API that is part of the Cognitive Services offering and is known as the Microsoft Speech API. For this integration to work, you need a free API key. You can use your Azure subscription to create an Azure Speech resource .
To enable text-to-speech with Microsoft, add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry tts : - platform : microsoft api_key : YOUR_API_KEY
Configuration Variables
Looking for your configuration file?
api_key string Required
Your API key.
language string ( Optional , default: en-us )
The language to use. Note that if you set the language to anything other than the default, you will need to specify a matching voice type as well. For the supported languages check the list of available languages .
gender string ( Optional , default: Female )
The gender you would like to use for the voice. Accepted values are Female and Male .
type string ( Optional )
The voice type you want to use. Accepted values are listed as the service name mapping in the documentation .
Default:
JennyNeural
rate integer ( Optional , default: 0 )
Change the rate of speaking in percentage. Example values: 25 , 50 .
volume integer ( Optional , default: 0 )
Change the volume of the output in percentage. Example values: -20 , 70 .
pitch string ( Optional , default: default )
Change the pitch of the output. Example values: high .
contour string ( Optional )
Change the contour of the output in percentages. This overrides the pitch setting. See the W3 SSML specification for what it does. Example value: (0%, -1st) (100%, +10st) .
region string ( Optional , default: eastus )
The region of your API endpoint. See documentation .
Important
If you set the language to anything other than the default en-us , you will need to specify a matching voice type as well.
A full configuration sample including optional variables:
# Example configuration.yaml entry tts : - platform : microsoft api_key : YOUR_API_KEY language : en-gb gender : Male type : RyanNeural rate : 20 volume : -50 pitch : high contour : (0%, -1st) (100%, +10st) region : eastus
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Microsoft Text-to-Speech (TTS) integration was introduced in Home Assistant 0.57, and it's used by
437 active installations.
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
