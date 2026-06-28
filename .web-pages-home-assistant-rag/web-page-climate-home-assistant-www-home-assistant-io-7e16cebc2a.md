# Climate - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/climate
- Final URL: https://www.home-assistant.io/integrations/climate
- Canonical URL: https://www.home-assistant.io/integrations/climate/
- Fetched at: 2026-06-28T02:34:06Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up climate control devices within Home Assistant.

## Extracted Text

On this page
The state of an HVAC entity
List of actions
Attributes
List of triggers
List of conditions
The Climate integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control and monitor HVAC (heating, ventilating, and air conditioning) devices and thermostats.
Note
Building block integration
This climate is a building block integration that cannot be added to your Home Assistant directly but is used and provided by other integrations.
A building block integration differs from the typical integration that connects to a device or service. Instead, other integrations that do integrate a device or service into Home Assistant use this climate building block to provide entities, services, and other functionality that you can use in your automations or dashboards.
If one of your integrations features this building block, this page documents the functionality the climate building block offers.
An HVAC entity can have the following states, depending on the specific climate device and its capabilities.
Off : The device is turned off.
Heat : The device is set to heat to a target temperature.
Cool : The device is set to cool to a target temperature.
Heat/Cool : The device is set to heat/cool to a target temperature range.
Auto : The device is set to a schedule, learned behavior, AI.
Dry : The device is set to dry/humidity mode.
Fan only : The device only has the fan on. No heating or cooling is taking place.
Unavailable : The entity is currently unavailable.
Unknown : The state is not yet known.
The Climate integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Set thermostat fan mode ( climate.set_fan_mode )
Sets the fan mode of a climate device.
Set thermostat target humidity ( climate.set_humidity )
Sets the target humidity of a climate device.
Set thermostat HVAC mode ( climate.set_hvac_mode )
Sets the HVAC mode of a climate device.
Set thermostat preset mode ( climate.set_preset_mode )
Sets the preset mode of a climate device.
Set thermostat horizontal swing mode ( climate.set_swing_horizontal_mode )
Sets the horizontal swing mode of a climate device.
Set thermostat swing mode ( climate.set_swing_mode )
Sets the swing mode of a climate device.
Set thermostat target temperature ( climate.set_temperature )
Sets the target temperature of a climate device.
Toggle thermostat ( climate.toggle )
Toggles a climate device on or off.
Turn off thermostat ( climate.turn_off )
Turns off a climate device.
Turn on thermostat ( climate.turn_on )
Turns on a climate device.
For an overview of every action across all integrations, see the actions reference .
The climate entity has extra attributes to represent the state of the thermostat.
Name Description hvac_action Current state: heating / cooling / idle . fan_mode If the fan is currently on or off: on / off .
It depends on the thermostat you are using which states are available.
The Climate integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following triggers. Each link below opens a dedicated page with examples, fields, and a step-by-step UI walkthrough.
Thermostat mode changed ( climate.hvac_mode_changed )
Triggers when the mode of one or more thermostats changes.
Thermostat started cooling ( climate.started_cooling )
Triggers when one or more thermostats start cooling.
Thermostat started drying ( climate.started_drying )
Triggers when one or more thermostats start drying.
Thermostat started heating ( climate.started_heating )
Triggers when one or more thermostats start heating.
Thermostat target humidity changed ( climate.target_humidity_changed )
Triggers when the humidity setpoint of one or more thermostats changes.
Thermostat target humidity crossed threshold ( climate.target_humidity_crossed_threshold )
Triggers when the humidity setpoint of one or more thermostats crosses a threshold.
Thermostat target temperature changed ( climate.target_temperature_changed )
Triggers when the temperature setpoint of one or more thermostats changes.
Thermostat target temperature crossed threshold ( climate.target_temperature_crossed_threshold )
Triggers when the temperature setpoint of one or more thermostats crosses a threshold.
Thermostat turned off ( climate.turned_off )
Triggers when one or more thermostats turn off.
Thermostat turned on ( climate.turned_on )
Triggers when one or more thermostats turn on, regardless of the mode.
For an overview of every trigger across all integrations, see the triggers reference .
The Climate integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following conditions. Each link below opens a dedicated page with examples, fields, and a step-by-step UI walkthrough.
Thermostat is cooling ( climate.is_cooling )
Tests if one or more thermostats are cooling.
Thermostat is drying ( climate.is_drying )
Tests if one or more thermostats are drying.
Thermostat is heating ( climate.is_heating )
Tests if one or more thermostats are heating.
Thermostat is in HVAC mode ( climate.is_hvac_mode )
Tests if one or more thermostats are set to a specific HVAC mode.
Thermostat is off ( climate.is_off )
Tests if one or more thermostats are off.
Thermostat is on ( climate.is_on )
Tests if one or more thermostats are on.
Thermostat target humidity ( climate.target_humidity )
Tests the target humidity of one or more thermostats.
Thermostat target temperature ( climate.target_temperature )
Tests the target temperature of one or more thermostats.
For an overview of every condition across all integrations, see the conditions reference .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Climate entity was introduced in Home Assistant 0.19.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Categories
Climate
Back to top
