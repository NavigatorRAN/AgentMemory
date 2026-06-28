---
source_url: "https://www.home-assistant.io/integrations/flexit"
final_url: "https://www.home-assistant.io/integrations/flexit"
canonical_url: "https://www.home-assistant.io/integrations/flexit/"
source_handle: "web:www-home-assistant-io:6e31c4dac5b0"
source_section: "integrations-flexit"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "e217463f435582a8ecd4fa9ec285eef6c23701021d17ef12173b610aae52975d"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Flexit - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/flexit
- Final URL: https://www.home-assistant.io/integrations/flexit
- Canonical URL: https://www.home-assistant.io/integrations/flexit/
- Fetched at: 2026-06-28T02:43:10Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Flexit A/C unit into Home Assistant.

## Extracted Text

On this page
Related topics
Integrates Flexit Air Conditioning unit into Home Assistant.
Requires an CI66 Modbus Adapter CI66
To enable this integration, add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry climate : - platform : flexit slave : 21
Configuration Variables
Looking for your configuration file?
slave integer Required
The slave ID of the modbus adapter, set using DIP-switches.
name string ( Optional )
Displayed name of the A/C unit.
hub string ( Optional , default: default )
The name of the hub where this slave is located.
Important
This integration requires the Modbus integration to be set up to work.
Full configuration example including modbus setup shown below:
DIP-switch settings on the CI66:
1=ON, 2=ON, 3=OFF, 4=ON, 5=OFF, 6=ON, 7=ON, 8=ON
# Full example configuration.yaml entry modbus : type : serial method : rtu port : /dev/ttyUSB0 baudrate : 56000 stopbits : 1 bytesize : 8 parity : E climate : - platform : flexit name : Main A/C slave : 21
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Flexit integration was introduced in Home Assistant 0.47, and it's used by
6 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Climate
Back to top
