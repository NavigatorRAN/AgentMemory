---
source_url: "https://www.home-assistant.io/integrations/everlights"
final_url: "https://www.home-assistant.io/integrations/everlights"
canonical_url: "https://www.home-assistant.io/integrations/everlights/"
source_handle: "web:www-home-assistant-io:1426131b6afc"
source_section: "integrations-everlights"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "808e8823435ca6a66dda053c99ee388a9c5c39401524b68bff53c31dfcd1070c"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# EverLights - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/everlights
- Final URL: https://www.home-assistant.io/integrations/everlights
- Canonical URL: https://www.home-assistant.io/integrations/everlights/
- Fetched at: 2026-06-28T02:41:39Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up EverLights within Home Assistant.

## Extracted Text

On this page
Configuration details
Effects
Limitations
Related topics
EverLights are permanent Christmas lights installed on a home’s gutters or flashing. This integration can change all LEDs in a zone to a single color or activate a pattern that was previously saved to the control box.
To enable EverLights, add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry light : - platform : everlights hosts : - 192.168.1.123 - 192.168.1.124
Configuration Variables
Looking for your configuration file?
hosts list Required
EverLights control box IP addresses.
EverLights patterns saved to the control box can be activated using the effect parameter to the light.turn_on action. If an effect is specified, then the color and brightness are ignored.
The EverLights control box status indicates if a zone is active but does not indicate the current color or pattern. The color and effect in the state attributes are based on the last execution of light.turn_on . If the control box scheduler or another app makes a change, then the state attributes are not updated.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The EverLights integration was introduced in Home Assistant 0.87, and it's used by
0 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Light
Back to top
