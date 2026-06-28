---
source_url: "https://www.home-assistant.io/integrations/device_sun_light_trigger"
final_url: "https://www.home-assistant.io/integrations/device_sun_light_trigger"
canonical_url: "https://www.home-assistant.io/integrations/device_sun_light_trigger/"
source_handle: "web:www-home-assistant-io:46889a7fe802"
source_section: "integrations-device-sun-light-trigger"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "ba65274ac54cd87cc833893ae82936ee8408d834505fc6bd7debfd9ec941e772"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Presence-based lights - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/device_sun_light_trigger
- Final URL: https://www.home-assistant.io/integrations/device_sun_light_trigger
- Canonical URL: https://www.home-assistant.io/integrations/device_sun_light_trigger/
- Fetched at: 2026-06-28T02:36:51Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to automate your lights with Home Assistant.

## Extracted Text

On this page
Related topics
Home Assistant has a built-in integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] called device_sun_light_trigger to help you automate your lights. The integration will:
Fade in the lights when the sun is setting and there are people home
Turn on the lights when people get home after the sun has set
Turn off the lights when all people leave the house
This integration requires the integrations sun , device_tracker , person and light to be enabled.
To enable this integration, add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes.
# Example configuration.yaml entry device_sun_light_trigger :
Configuration Variables
Looking for your configuration file?
light_group string ( Optional )
Specify a specific light/group of lights that has to be turned on.
light_profile string ( Optional , default: relax )
Specify which light profile to use when turning lights on.
device_group string ( Optional )
Specify which group to track. The group can contain device_trackers or persons.
disable_turn_off boolean ( Optional , default: false )
Disable lights being turned off when everybody leaves the house.
A full configuration example could look like this:
# Example configuration.yaml entry device_sun_light_trigger : light_group : group.living_room light_profile : relax device_group : group.my_devices disable_turn_off : true
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Presence-based lights integration was introduced in Home Assistant pre 0.7, and it's used by
56 active installations.
Its IoT class is Calculated.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Automation
Light
Presence detection
Back to top
