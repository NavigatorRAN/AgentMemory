---
source_url: "https://www.home-assistant.io/integrations/melcloud"
final_url: "https://www.home-assistant.io/integrations/melcloud"
canonical_url: "https://www.home-assistant.io/integrations/melcloud/"
source_handle: "web:www-home-assistant-io:db9cb23b2fce"
source_section: "integrations-melcloud"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "2cfac90678db1d37792b1ed6682bf21f93b75f8b326d72d9f15a6fd05858d46a"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# MELCloud - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/melcloud
- Final URL: https://www.home-assistant.io/integrations/melcloud
- Canonical URL: https://www.home-assistant.io/integrations/melcloud/
- Fetched at: 2026-06-28T02:59:18Z
- Content type: text/html; charset=UTF-8

## Description

MELCloud integration

## Extracted Text

On this page
Device support
Configuration
Air-to-Air device
Climate
Sensor
Air-to-Water device
Binary sensor
Water heater
The MELCloud integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] integrates Mitsubishi Electric’s MELCloud enabled devices into Home Assistant.
Air-to-Air heat pumps, e.g., AC units - Supported
Air-to-Water heat pumps - Supported
Energy recovery ventilators - Not supported
Other - Not supported
To add the MELCloud device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select MELCloud .
Follow the instructions on screen to complete the setup.
An Air-to-Air heat pump provides climate and sensor platforms. Device capabilities can limit the available parameters and sensors.
The following parameters can be controlled for the climate platform entities:
Power (using HVAC mode)
Target temperature
Operation mode (HVAC mode)
Fan speed
Horizontal and vertical vane positions
State attributes Attribute Description Example vane_horizontal Current horizontal vane position or mode auto vane_horizontal_positions Available horizontal vane positions and modes auto, split, swing vane_vertical Current vertical vane position or mode auto vane_vertical_positions Available vertical vane positions and modes auto, split, swing Controlling vanes
The horizontal and vertical vane positions can be controlled using the corresponding melcloud.set_vane_horizontal and melcloud.set_vane_vertical actions.
Swing mode can also be used to control vertical vane position.
The following attributes are available for sensor platform entities:
Room temperature
Outside temperature
Energy - The total consumed energy in kWh. Not supported by all models.
Daily energy - Energy consumption within a 24h window in kWh. This reading resets at midnight on the timezone of the MELCloud service. The exact time needs to be determined by following the sensor value until a reset is detected.
An Air-to-Water device provides water_heater , climate , sensor , and binary_sensor platforms.
A climate platform entity is provided for each radiator zone in the air-to-water system. The following parameters can be controlled:
Target room temperature
The radiators need to be configured to run in room temperature control mode either through the local HMI or MELCloud. Flow temperature and curve modes are not supported.
Some air-to-water devices allow cooling using the radiator zones. This feature has not been implemented due to the lack of sample devices.
The system cannot be turned on/off through the climate entities.
State attributes Attribute Description Example status Current operation status idle
Zone sensors (per radiator zone):
Zone flow temperature, polled every 1-2 hours
Zone return temperature, polled every 1-2 hours
Device sensors:
Tank water temperature
Outside temperature – 1°C precision, polled every 1-2 hours
System flow temperature
System return temperature
Boiler flow temperature
Boiler return temperature
Mixing tank temperature
Condensing temperature
Heat pump frequency (compressor frequency in Hz)
Demand percentage
Daily heating energy:
Consumed
Produced
Daily cooling energy:
Daily hot water energy:
The daily energy sensors use the state class total_increasing and are compatible with the Energy Dashboard. Values reset at midnight in the MELCloud service timezone.
The following binary sensors indicate component operating status and are categorized as diagnostic entities:
Boiler
Booster heater 1
Booster heater 2 (disabled by default)
Booster heater 2+ (disabled by default)
Immersion heater
Water pump 1
Water pump 2
Water pump 3 (disabled by default)
Water pump 4 (disabled by default)
3-way valve
2-way valve (disabled by default)
Binary sensors are only created when the device reports the corresponding component status. Entities marked as disabled by default can be enabled in the entity settings.
The following parameters can be controlled for the water_heater platform entities:
Power - Controls the entire system.
Target tank temperature
Operation mode
State attributes Attribute Description Example status Current operation status heat
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The MELCloud device was introduced in Home Assistant 0.106, and it's used by
1.3% of the active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@erwindouna
Categories
Back to top
