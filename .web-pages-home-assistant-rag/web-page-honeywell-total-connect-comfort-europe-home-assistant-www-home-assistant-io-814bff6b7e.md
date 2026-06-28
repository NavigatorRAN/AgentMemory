---
source_url: "https://www.home-assistant.io/integrations/evohome"
final_url: "https://www.home-assistant.io/integrations/evohome"
canonical_url: "https://www.home-assistant.io/integrations/evohome/"
source_handle: "web:www-home-assistant-io:814bff6b7e0c"
source_section: "integrations-evohome"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "4c4fefeb3201e96c851f92565419e2bd5e1321745ae4f3daaf1697729e52ddcd"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Honeywell Total Connect Comfort (Europe) - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/evohome
- Final URL: https://www.home-assistant.io/integrations/evohome
- Canonical URL: https://www.home-assistant.io/integrations/evohome/
- Fetched at: 2026-06-28T02:41:45Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate a Honeywell Evohome/TCC system with Home Assistant.

## Extracted Text

On this page
Configuration
Locations and zones
Evohome
Round thermostat
Temperature precision
System modes, zone overrides and inheritance
List of actions
Useful Jinja templates
Related topics
The Evohome integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] links Home Assistant with all non-US Honeywell Total Connect Comfort (TCC) CH/DHW systems, such as:
the Honeywell Evohome CH/DHW system, and
the Honeywell Mobile Access Kit with a Round Thermostat
It does not support the home security functionality of TCC.
It uses the evohome-async client library.
For your system to be compatible with this integration, then you must be able to access it via https://international.mytotalconnectcomfort.com/ (note the ‘international’).
To set up this integration, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry evohome : username : " YOUR_USERNAME" password : " YOUR_PASSWORD"
Configuration Variables
Looking for your configuration file?
username string Required
The username (email address) that has access to the TCC website.
password string Required
The password corresponding to the above username.
location_idx integer ( Optional , default: 0 )
Used to select which location to use, if your login has access to more than one location. Multiple locations at one time are not officially supported.
scan_interval integer ( Optional , default: 300 )
How often updates are retrieved from the vendor’s web servers. The minimum interval is 60 seconds.
This is an IoT cloud-polling integration and the recommended minimum scan_interval is 180 seconds. Testing has indicated that this is a safe interval that - by itself - shouldn’t cause you to be rate-limited by the vendor. There is little value in shorter intervals, as this integration will automatically force a refresh shortly after any configuration changes.
TCC systems are implemented as a location , which consists of 1-12 zones and, optionally, a DHW controller:
The system location (for example, a house) is used for operating modes such as Auto , AutoWithEco , and Away .
Heating zones (for example, rooms) are used for the target temperature.
Each heating zone is represented as a Climate entity that exposes the zone’s operating mode, current temperature, and setpoint. Due to limitations with the vendor’s public API, there is no cooling functionality.
Each zone also provides a Button entity to clear any override and return the zone to Evohome’s FollowSchedule mode.
The Evohome controller is also represented as a Climate entity that exposes the system’s current operating mode. A controller has neither a current temperature nor a setpoint, but all Climate entities in Home Assistant are required to report a temperature, so this value is calculated as the average of all zones.
The controller also provides a Button entity to reset the system mode. This returns the system to AutoWithReset when supported, or Auto when AutoWithReset is unsupported, and resets all zones and DHW to FollowSchedule .
The DHW controller is represented as a WaterHeater entity which will report its current temperature and can be turned on or off. Due to limitations with the vendor’s RESTful API, the setpoint is not reported and cannot be changed.
If present, it also provides a Button entity to clear any DHW override and return the DHW controller to Evohome’s FollowSchedule mode.
Note that support for schedules is limited. They cannot be changed, and there is no way to back up or restore that data. For that functionality, refer to the evohome-async documentation .
These systems use an internet gateway rather than an Evohome controller. They usually have only one Round Thermostat, although they can have two. Systems with one such thermostat will still appear as two Climate entities, one for system mode (Away, AutoWithEco, and similar modes), and another for the zone setpoint.
Note that TCC devices may well measure temperatures with very high precision, but the vendor API will report temperatures rounded towards the setpoint (that is, either up or down) with a precision of 0.5 °C; this is a proxy for the deadband as used by other climate systems. Where possible, this integration will leverage an older vendor API to obtain current temperatures with a precision of 0.01 °C.
Therefore, depending upon the above, Home Assistant will display/record current temperatures with a precision of either 0.5 °C or 0.1 °C (its highest supported precision).
TCC systems can support up to six distinct operating modes: Auto , AutoWithEco , Away , DayOff , HeatingOff , and Custom . Not all systems support all modes.
Zones support three setpoint modes: FollowSchedule , TemporaryOverride , and PermanentOverride , but ‘inherit’ an operating mode from their system (the actual algorithm for this is a little more complicated than indicated below - please see the vendor’s documentation).
For FollowSchedule , a zone’s setpoint (target temperature) is a function of its scheduled target temperature and its inherited mode:
Auto setpoints are scheduled temperatures (the default)
AutoWithEco setpoints are scheduled temperatures, less 3 °C
If the zone’s target temperature is changed then it will either be a TemporaryOverride or a PermanentOverride , depending. A TemporaryOverride will revert to FollowSchedule after some specified time. A PermanentOverride is a persistent change until some subsequent intervention is made. Zones can be switched between the two override modes without changing the target temperature.
For some system modes all zones will have a setpoint enforced upon them, regardless of their own mode:
Away setpoints to 12 °C
HeatingOff setpoints to a minimum, usually 4 °C
For Away , the DHW controller will also be turned off.
Some locations have a hidden mode, AutoWithReset , that will behave as Auto , and will reset all zones to FollowSchedule .
In the Home Assistant schema, all this is done via a combination of HVAC_MODE and PRESET_MODE (but also see the state attributes system_mode_status and setpoint_status , below).
The Honeywell Total Connect Comfort (Europe) integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Set DHW override ( evohome.set_dhw_override )
Overrides the domestic hot water state, either indefinitely or for a set time.
Set system mode ( evohome.set_system_mode )
Sets the Evohome system mode, either indefinitely or for a set time, after which it reverts to Auto.
Set zone override ( evohome.set_zone_override )
Overrides a heating zone’s setpoint, either indefinitely or for a set time.
For an overview of every action across all integrations, see the actions reference .
The actual operating mode of Evohome entities can be tracked via their state attributes, which includes a JSON data structure for the current state called status .
For the system (controller), see system_mode_status :
{% if state_attr('climate.my_home', 'status').system_mode_status.mode == "Away" %}
The system is in Away mode
{% else %}
The system is not in Away mode
{% endif %}
For the Zones, it is setpoint_status :
{{ state_attr('climate.kitchen', 'status').setpoint_status.setpoint_mode }}
The Zones will expose the current/upcoming scheduled setpoints :
{{ state_attr('climate.kitchen', 'status').setpoints.next_sp_temp }}
All Evohome entities may have faults, and these can be turned into sensors, or:
{% if state_attr('climate.bedroom', 'status').active_faults %}
{% if state_attr('climate.bedroom', 'status').active_faults[0].faultType == 'TempZoneActuatorLowBattery' %}
There is a low battery
There is a Fault!
Yay, everything is OK :)
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Honeywell Total Connect Comfort (Europe) integration was introduced in Home Assistant 0.80, and it's used by
2000 active installations.
Its IoT class is Cloud Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@zxdavb
Categories
Climate
Hub
Water heater
Back to top
