---
source_url: "https://www.home-assistant.io/integrations/baidu"
final_url: "https://www.home-assistant.io/integrations/baidu"
canonical_url: "https://www.home-assistant.io/integrations/baidu/"
source_handle: "web:www-home-assistant-io:6bab559100d8"
source_section: "integrations-baidu"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "3ea0c62569afe4d2b45549d03560a417926b491beb99ca34c94a5937276e7e23"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Baidu - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/baidu
- Final URL: https://www.home-assistant.io/integrations/baidu
- Canonical URL: https://www.home-assistant.io/integrations/baidu/
- Fetched at: 2026-06-28T02:30:45Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up Baidu TTS with Home Assistant.

## Extracted Text

On this page
Configuration
Related topics
The Baidu integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] uses Baidu TTS engine to read a text with natural sounding voices.
To get started, add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
#Example configuration.yaml entry tts : - platform : baidu app_id : YOUR_APPID api_key : YOUR_APIKEY secret_key : YOUR_SECRETKEY
Configuration Variables
Looking for your configuration file?
app_id string Required
The App ID for the use this service, must be already registered on Baidu.
api_key string Required
The API key from Baidu.
secret_key string Required
The secret key from Baidu.
speed integer ( Optional , default: 5 )
Audio speed from 0 to 9.
pitch integer ( Optional , default: 5 )
Audio pitch from 0 to 9.
volume integer ( Optional , default: 5 )
Audio volume from 0 to 15.
person integer ( Optional , default: 0 )
The voice type. You choose one from 0, 1, 3, 4, 5, 103, 106, 110 or 111.
At the moment, zh is the only supported language and therefore the default value.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Baidu integration was introduced in Home Assistant 0.59, and it's used by
57 active installations.
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
