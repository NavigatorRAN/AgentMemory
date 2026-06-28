---
source_url: "https://www.home-assistant.io/integrations/blackbird"
final_url: "https://www.home-assistant.io/integrations/blackbird"
canonical_url: "https://www.home-assistant.io/integrations/blackbird/"
source_handle: "web:www-home-assistant-io:67e296596e85"
source_section: "integrations-blackbird"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "a7082203a90c4034bfc62944cbe0153e95be05011349f9a2cd8eb2bd581210ae"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Monoprice Blackbird Matrix Switch - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/blackbird
- Final URL: https://www.home-assistant.io/integrations/blackbird
- Canonical URL: https://www.home-assistant.io/integrations/blackbird/
- Fetched at: 2026-06-28T02:31:27Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Monoprice Blackbird 4k 8x8 HDBaseT Matrix Switch into Home Assistant.

## Extracted Text

On this page
List of actions
Related topics
The Monoprice Blackbird Matrix Switch integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control Monoprice Blackbird Matrix Switch (8x8) using a serial or IP connection, this integration does not support the 4x4 matrix switch.
To add a Blackbird 8x8 device to your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry media_player : - platform : blackbird port : /dev/ttyUSB0 zones : 1 : name : Living Room sources : 3 : name : BluRay
Configuration Variables
Looking for your configuration file?
port string ( Exclusive )
The serial port to which Blackbird matrix switch is connected. port and host cannot be specified concurrently.
host string ( Exclusive )
The IP address of the Blackbird matrix switch. port and host cannot be specified concurrently.
zones map Required
This is the list of zones available. Valid zones are 1, 2, 3, 4, 5, 6, 7, 8. Each zone must have a name assigned to it.
ZONE_NUMBER string
The name of the zone.
sources map Required
The list of sources available. Valid source numbers are 1, 2, 3, 4, 5, 6, 7, 8. Each source number corresponds to the input number on the Blackbird matrix switch. Similar to zones, each source must have a name assigned to it.
The name of the source.
The Monoprice Blackbird Matrix Switch integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Set all zones ( blackbird.set_all_zones )
Sets every zone on the Blackbird matrix switch to the same input source at once.
For an overview of every action across all integrations, see the actions reference .
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Monoprice Blackbird Matrix Switch integration was introduced in Home Assistant 0.68, and it's used by
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
Media player
Back to top
