---
source_url: "https://www.home-assistant.io/integrations/nexia"
final_url: "https://www.home-assistant.io/integrations/nexia"
canonical_url: "https://www.home-assistant.io/integrations/nexia/"
source_handle: "web:www-home-assistant-io:43cf51aa7b85"
source_section: "integrations-nexia"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "e446d62128ae0fc39a42f33dbc4a7ba8237f29a9e93859c573f2f1990124f531"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Nexia/American Standard/Trane - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/nexia
- Final URL: https://www.home-assistant.io/integrations/nexia
- Canonical URL: https://www.home-assistant.io/integrations/nexia/
- Fetched at: 2026-06-28T03:02:56Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Trane and American Standard thermostats into Home Assistant.

## Extracted Text

On this page
Configuration
Binary sensor
Sensor
Climate
Number
Scene
Switch
List of actions
The Nexia/American Standard/Trane integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to integrate your Nexia (Trane) thermostats or American Standard thermostats into Home Assistant.
There is currently support for the following device types within Home Assistant:
To add the Nexia/American Standard/Trane hub to your Home Assistant instance, use this My button:
Nexia/American Standard/Trane can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Nexia/American Standard/Trane .
Follow the instructions on screen to complete the setup.
The following binary sensors are added for each thermostat:
Blower Active
The following sensors are added for each thermostat:
Air Cleaner Mode
Current Compressor Speed
Requested Compressor Speed
Outdoor Temperature
Relative Humidity
System Status
The following sensors are added for each thermostat zone:
Zone Temperature
Zone Setpoint Status
Zone Status
The climate platform lets you control a thermostat.
The following Trane thermostats are supported: XL1050 , XL850 , XL824
The following American Standard thermostats have been reported to work: AZONE1050 , AZONE850 , ACONT824
The following thermostats are not supported: XL624 , XL950 , AZONE950 , AZEMT500 , AZEMT400B
Other thermostats may work, but they have not been tested.
The number platform lets you adjust the fan speed on systems with variable-speed fan support.
The scene platform lets you activate a nexia automation.
The following enable/disable switches are added for each thermostat:
Emergency heat (if the device supports it)
The following enable/disable switches are added for each thermostat zone:
Hold mode
The following include/exclude switch Switches are things that have two states you can select between, such as turning on or off a socket. [Learn more] is added for each RoomIQ sensor (if the device supports
RoomIQ ).
Include YOUR_SENSOR_NAME (with your sensor name)
These switches allow you to select which RoomIQ sensors to include in a zone’s average temperature.
To change your selected sensors, set each switch to represent your choice.
Several seconds after the last such change, the selection is sent to the manufacturer’s web service.
It usually takes 10–15 seconds to complete, depending on the web service.
At least one sensor must be selected.
If you exclude all sensors, the switches will revert to show the zone’s settings.
The Nexia/American Standard/Trane integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Set air cleaner mode ( nexia.set_aircleaner_mode )
Sets the air cleaner mode on a Nexia thermostat.
Set dehumidify setpoint ( nexia.set_dehumidify_setpoint )
Sets the dehumidify setpoint on a Nexia thermostat.
Set humidify setpoint ( nexia.set_humidify_setpoint )
Sets the humidify setpoint on a Nexia thermostat.
Set HVAC run mode ( nexia.set_hvac_run_mode )
Sets the run mode and HVAC mode on a Nexia thermostat.
For an overview of every action across all integrations, see the actions reference .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Nexia/American Standard/Trane hub was introduced in Home Assistant 0.108, and it's used by
1124 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@bdraco
Categories
Back to top
