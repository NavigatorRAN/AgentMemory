---
source_url: "https://www.home-assistant.io/integrations/min_max"
final_url: "https://www.home-assistant.io/integrations/min_max"
canonical_url: "https://www.home-assistant.io/integrations/min_max/"
source_handle: "web:www-home-assistant-io:bac0dcb602bb"
source_section: "integrations-min-max"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "601fa384df31ff4b6718eb6fa5b34e859e89355663f459807b9f2fe7760ffb54"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Min/Max - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/min_max
- Final URL: https://www.home-assistant.io/integrations/min_max
- Canonical URL: https://www.home-assistant.io/integrations/min_max/
- Fetched at: 2026-06-28T03:00:15Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate min/max sensors into Home Assistant.

## Extracted Text

On this page
Configuration
YAML configuration
The Min/Max integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] consumes the state from other sensors to determine the minimum, maximum, latest (last), mean, median, range and sum of the collected states.
The sensor provided by this integration will always show you the lowest/highest/latest value which was received from all monitored sensors. If you have spikes in your values, it’s recommended to filter/equalize your values with a statistics sensor first.
If the source sensor provides an unknown state, it will be ignored in the calculation except for sum where it will set the state to unknown. If the unit of measurement of the sensors differs, the Min/Max sensor will go to an error state where the value is UNKNOWN and unit of measurement is ERR .
To add the Min/Max helper to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
At the top of the screen, select the tab: Helpers .
In the bottom right corner, select the
Create helper button.
From the list, select Min/Max .
Follow the instructions on screen to complete the setup.
Name
The name the sensor should have. You can change it again later.
Input entities
At least two entities to monitor. All entities must use the same unit of measurement.
Type
The type of the sensor, this can be either “min”, “max”, “last”, “mean”, “median”, “range” or “sum”.
Precision
Round the calculated mean, median or sum value to at most N decimal places.
Alternatively, this integration can be configured and set up manually via YAML
instead. To enable the Integration sensor in your installation, add the
following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry sensor : - platform : min_max entity_ids : - sensor.kitchen_temperature - sensor.living_room_temperature - sensor.office_temperature
Configuration Variables
Looking for your configuration file?
entity_ids list | string Required
At least two entities to monitor. The unit of measurement of the first entry will be the one that’s used. All entities must use the same unit of measurement.
type string ( Optional , default: max )
The type of sensor: min , max , last , mean , median , range or sum .
name string ( Optional )
Name of the sensor to use in the frontend.
round_digits integer ( Optional , default: 2 )
Round mean or median value to specified number of digits.
unique_id string ( Optional )
Unique id to be able to configure the entity in the UI.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Min/Max helper was introduced in Home Assistant 0.31, and it's used by
8.5% of the active installations.
Its IoT class is Calculated.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@gjohansson-ST
Categories
Helper
Sensor
Utility
Back to top
