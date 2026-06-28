---
source_url: "https://www.home-assistant.io/integrations/picotts"
final_url: "https://www.home-assistant.io/integrations/picotts"
canonical_url: "https://www.home-assistant.io/integrations/picotts/"
source_handle: "web:www-home-assistant-io:204ad58656b3"
source_section: "integrations-picotts"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "daad5904da2c486bb1c1dfc53138621c8e4e2c6fb55580cf308d3fbc9459ca2a"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Pico TTS - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/picotts
- Final URL: https://www.home-assistant.io/integrations/picotts
- Canonical URL: https://www.home-assistant.io/integrations/picotts/
- Fetched at: 2026-06-28T03:08:07Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up Pico text-to-speech with Home Assistant.

## Extracted Text

On this page
Configuration
Full configuration example
Related topics
The Pico TTS integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] uses Pico TTS library to read out text with natural sounding voices.
Pico TTS is a powerful open-source engine that runs locally (cloudless) so it can work even without an internet connection.
To enable text-to-speech with Pico, add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry tts : - platform : picotts
Configuration Variables
Looking for your configuration file?
language string ( Optional , default: en-US )
The language to use. Supported languages are en-US , en-GB , de-DE , es-ES , fr-FR and it-IT .
The configuration sample below shows how an entry can look like:
# Example configuration.yaml entry tts : - platform : picotts language : " fr-FR"
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Pico TTS service was introduced in Home Assistant 0.36, and it's used by
1193 active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@rooggiieerr
Categories
Text-to-speech
Back to top
