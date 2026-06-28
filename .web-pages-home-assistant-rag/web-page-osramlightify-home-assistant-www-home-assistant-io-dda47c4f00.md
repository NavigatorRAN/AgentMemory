---
source_url: "https://www.home-assistant.io/integrations/osramlightify"
final_url: "https://www.home-assistant.io/integrations/osramlightify"
canonical_url: "https://www.home-assistant.io/integrations/osramlightify/"
source_handle: "web:www-home-assistant-io:dda47c4f00ca"
source_section: "integrations-osramlightify"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "4cf300c7bc716e020ef9794afdd99c3aa3d9c5aec14b3ec36e689c240aaa685a"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Osramlightify - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/osramlightify
- Final URL: https://www.home-assistant.io/integrations/osramlightify
- Canonical URL: https://www.home-assistant.io/integrations/osramlightify/
- Fetched at: 2026-06-28T03:06:45Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Osram Lightify into Home Assistant.

## Extracted Text

On this page
Related topics
The Osramlightify integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to integrate your Osram Lightify into Home Assistant.
To enable the integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] , add it to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry light : - platform : osramlightify host : IP_ADDRESS
Configuration Variables
Looking for your configuration file?
host string Required
IP address of the Osram Lightify bridge, e.g., 192.168.1.50 .
allow_lightify_nodes boolean ( Optional , default: true )
(true/false) If true then import individual lights, if false then skip them.
allow_lightify_sensors boolean ( Optional , default: true )
(true/false) If true then import contact and motion sensors, if false then skip them. Takes effect only if allow_lightify_nodes is true .
allow_lightify_switches boolean ( Optional , default: true )
(true/false) If true then import switches, if false then skip them. Takes effect only if allow_lightify_nodes is true .
allow_lightify_groups boolean ( Optional , default: true )
(true/false) If true then import groups, if false then skip them.
interval_lightify_status integer ( Optional , default: 5 )
Minimum interval in seconds between querying light status (for both individual lights and groups).
interval_lightify_conf integer ( Optional , default: 3600 )
Minimum interval in seconds between querying groups and scenes configuration.
At the moment there is not much functionality for Osram Lightify switches and sensors.
The only thing that you can do out of the box is to track whether they are available or not.
Also for sensors a list of raw values is exposed as sensor_values attribute, and you can use them
in automations, if you know what particular values mean for your sensor.
It is suggested to make scan_interval
(30 seconds by default) less or equal to interval_lightify_status , otherwise the latter won’t work
as expected. Shorter scan_interval may improve synchronization speed between individual lights and
groups. For example, if you turn on a group, all its lights may be updated to on immediately,
without querying the bridge.
To update all light statuses, only one query to the bridge is actually needed.
If a group has associated scenes, they will be imported as light effects and visible in Effect
dropdown on UI. You can apply a scene by clicking an item from the dropdown or by calling
light.turn_on action:
- action : light.turn_on target : entity_id : light.bedroom data : effect : Romance
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Osramlightify integration was introduced in Home Assistant 0.21, and it's used by
83 active installations.
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
