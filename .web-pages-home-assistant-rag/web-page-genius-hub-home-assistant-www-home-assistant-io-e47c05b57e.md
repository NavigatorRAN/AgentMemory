# Genius Hub - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/geniushub
- Final URL: https://www.home-assistant.io/integrations/geniushub
- Canonical URL: https://www.home-assistant.io/integrations/geniushub/
- Fetched at: 2026-06-28T02:45:32Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate a Genius Hub with Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Zones
Climate and water heater entities
Switch entities
Devices
Issues
List of actions
State attributes
The Genius Hub integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] links Home Assistant with your Genius Hub CH/DHW system, including its zones, devices, and issues.
It uses the geniushub client library, which provides data compatible with the v1 API that may not exactly match that of the official Web App.
You can configure the integration either via the cloud API or the local API.
Cloud API : requires a hub token obtained from my.geniushub.co.uk .
Local API : requires your username and password as used with geniushub.co.uk/app .
The local API is unofficial, but is faster and has more features, while the cloud API is slower.
To add the Genius Hub integration to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Genius Hub .
Follow the instructions on screen to complete the setup.
Each zone controlled by your Genius Hub will be exposed as either a:
Climate entity, for Radiator and Wet Underfloor zones, and
Water heater entity, for Hot Water Temperature zones and
Switch entity, for On/Off zones
Group zones are not supported.
Currently, there is no support for altering zone schedules, although entities can be switched to/from geniushub modes that use schedules.
There are limitations due to the differences between the Genius Hub and Home Assistant schemas (for example, Home Assistant has no Footprint mode) - use the actions below, for this functionality.
Not all Genius Hub functionality is available through the standard Home Assistant controls, so some of it is exposed through integration-specific actions. These let you change a zone’s mode (including Footprint mode), override a zone’s setpoint for a set duration, and override a switch for a set duration. For details, see the list of actions below.
Climate and water heater entities will report their current temperature, setpoint and mode; other properties (e.g., occupied state) are available via their state attributes (see examples below). The Genius Hub mode will be reported as/set to:
GH mode HA Operation HA Preset Off Off N/A Timer Heat None Override Heat Boost Footprint Heat Activity
Footprint mode is only available to Radiator zones that have room sensors.
Switch entities will report back their state; other properties are available via their state attributes. Currently, HA switches do not have modes/presets, so the Home Assistant state will be reported as:
On for Override \ On , and
Off otherwise (NB: the zone could still be ‘on’, e.g., with Timer mode)
Note: if you turn a Switch entity Off via Home Assistant’s web UI, it will revert to Timer mode - this may not be the behavior you are expecting.
Individual smart plugs are not yet exposed as switches - you can create one zone per smart plug as a work-around.
Each device controlled by your Genius Hub will be exposed as either a:
Sensor entity with a % battery, for any Device with a battery (e.g., a Genius Valve), or
Binary sensor entity with on/off state for any Device that is a switch (e.g., Smart Plugs, DCRs)
Such entities will report back their primary state and assigned_zone . If the Hub is directly polled using Option 1 (see below), then some additional state attributes such as last_comms (last communications time) are also available.
There are three Sensor entities that will indicate the number of Errors , Warnings and Information issues.
Each such entity has a state attribute that will contain a list of any such issues which can be used in automations and so on. For example:
- alias : " GeniusHub Error Alerts" triggers : - trigger : numeric_state entity_id : sensor.geniushub_errors above : 0 actions : - action : notify.pushbullet_notifier data : title : " Genius Hub has errors" message : >- Genius Hub has the following {{ states('sensor.geniushub_errors') }} errors: {{ state_attr('sensor.geniushub_errors', 'error_list') }}
This alert may be useful to see if the CH is being turned on while you’re on a holiday!
- alias : " GeniusHub CH State Change Alert" triggers : - trigger : state entity_id : binary_sensor.dual_channel_receiver_2_1 actions : - action : notify.pushbullet_notifier data : title : " Warning: CH State Change!" message : >- {{ trigger.to_state.attributes.friendly_name }} has changed from {{ trigger.from_state.state }} to {{ trigger.to_state.state }}.
The Genius Hub integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Set switch override ( geniushub.set_switch_override )
Turns on a Genius Hub switch for a set duration.
Set zone mode ( geniushub.set_zone_mode )
Changes the mode of a Genius Hub zone.
Set zone override ( geniushub.set_zone_override )
Overrides the setpoint of a Genius Hub zone for a set duration.
For an overview of every action across all integrations, see the actions reference .
Many zone/device properties are available via the corresponding entity’s state attributes. For example, in the case of Radiator -derived Climate entities (note ‘status’):
{ "status" : { "type" : "radiator" , "mode" : "off" , "temperature" : 19 , "occupied" : False , "override" : { "duration" : 0 , "setpoint" : 16 } } }
… and for Genius Valve -derived Sensor entities (note ‘state’):
{ "state" : { "set_temperature" : 4.0 , "measured_temperature" : 20.030000686645508 , "setback" : 3.5 , "wakeup_interval" : 450 } }
This data can be accessed in automations and so on via a value template. For example:
value_template : " {{ state_attr('water_heater.genius_zone_2', 'status').override.setpoint }}"
In the specific case of Radiator zones with room sensors:
value_template : " {{ state_attr('climate.genius_zone_12', 'status').occupied }}"
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Genius Hub integration was introduced in Home Assistant 0.92, and it's used by
45 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@manzanotti
Categories
Binary sensor
Climate
Sensor
Switch
Water heater
Back to top
