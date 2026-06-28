---
source_url: "https://www.home-assistant.io/integrations/yandextts"
final_url: "https://www.home-assistant.io/integrations/yandextts"
canonical_url: "https://www.home-assistant.io/integrations/yandextts/"
source_handle: "web:www-home-assistant-io:87d3bfa0704f"
source_section: "integrations-yandextts"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "9768b53170f7d102081629e7092531d449a909600b30bc57dd1afb3eb3e08f99"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Yandex TTS - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/yandextts
- Final URL: https://www.home-assistant.io/integrations/yandextts
- Canonical URL: https://www.home-assistant.io/integrations/yandextts/
- Fetched at: 2026-06-28T03:30:12Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up Yandex SpeechKit TTS with Home Assistant.

## Extracted Text

On this page
Configuration
Full configuration example
Related topics
The Yandex TTS integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] uses Yandex SpeechKit text-to-speech engine to read a text with natural sounding voices.
Important
This integration is working only with old API keys. For the new API keys, this integration cannot be used.
To enable text-to-speech with Yandex SpeechKit, add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry tts : - platform : yandextts api_key : THE_API_KEY
Configuration Variables
Looking for your configuration file?
api_key string Required
The API Key for use this service.
language string ( Optional , default: en-US )
The language to use. Supported languages are en-US , ru-RU , uk-UK and tr-TR .
codec string ( Optional , default: mp3 )
The audio codec. Supported codecs are mp3 , wav and opus .
voice string ( Optional , default: zahar )
The speaker voice. Supported female voices are jane , oksana , alyss , omazh , silaerkan , nastya , sasha , tanya , tatyana_abramova , voicesearch , and zombie . Male voices are zahar , ermil , levitan , ermilov , kolya , kostya , nick , erkanyavas , zhenya , anton_samokhvalov , ermil_with_tuning , robot , dude , and smoky .
emotion string ( Optional , default: neutral )
The speaker emotional intonation. Supported emotions are good (friendly), evil (angry) and neutral
speed float ( Optional , default: 1 )
The speech speed. Highest speed is 3 and lowest 0,1
Please check the API documentation for details. It seems that the English version of documentation is outdated. You could request an API key by email or online .
The configuration sample below shows how an entry can look like:
# Example configuration.yaml entry tts : - platform : yandextts api_key : YOUR_API_KEY language : " ru-RU" codec : mp3 voice : oksana emotion : evil speed : 2
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Yandex TTS integration was introduced in Home Assistant 0.36, and it's used by
82 active installations.
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
