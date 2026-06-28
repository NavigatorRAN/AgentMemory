# NuHeat - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/nuheat
- Final URL: https://www.home-assistant.io/integrations/nuheat
- Canonical URL: https://www.home-assistant.io/integrations/nuheat/
- Fetched at: 2026-06-28T03:04:20Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate your NuHeat Signature thermostats within Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Concepts
Attributes
Attribute name
Attribute temperature_unit
Attribute current_temperature
Attribute target_temperature
Attribute preset_mode
Attribute hvac_action
Attribute preset_modes
Attribute min_temp
Attribute max_temp
Actions
Action: Set HVAC mode
Action: Set temperature
Action: Set preset mode
The NuHeat integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets control your connected NuHeat Signature floor heating thermostats from NuHeat .
There is currently support for the following device types within Home Assistant:
Climate
First, you will need to obtain your thermostat’s numeric serial number or ID by logging into MyNuHeat.com and selecting your thermostat(s).
To add the NuHeat device to your Home Assistant instance, use this My button:
NuHeat can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select NuHeat .
Follow the instructions on screen to complete the setup.
The NuHeat Thermostat supports the following key concepts.
The target temperature is the temperature that the device attempts to achieve. The target temperature is either determined by the schedule programmed into the thermostat ( auto mode ) or may be overridden. When the target temperature is set by Home Assistant, the thermostat will hold this temperature until the schedule is resumed.
The following attributes are provided by the NuHeat thermostat: name , temperature_unit , current_temperature , target_temperature , current_hold_mode , current_operation , operation_list , min_temp and max_temp .
Returns the name of the NuHeat Thermostat.
Attribute type Description String Name of the thermostat
Returns the unit of measurement used for temperature by the thermostat.
Attribute type Description String Name of the temperature unit
Returns the current temperature measured by the thermostat.
Attribute type Description Integer Currently measured temperature
Returns the target temperature of the thermostat, when the thermostat is
not in auto operation mode.
Attribute type Description Integer Target temperature
Returns the current temperature hold, if any.
Attribute type Description String such as ‘temperature’, ‘temporary_temperature’, or ‘auto’
Returns the current HVAC mode of the thermostat.
Attribute type Description String ‘heat’, ‘idle’
Returns the list of available preset modes.
Attribute type Description List of String Available preset modes
Returns the minimum supported temperature by the thermostat
Attribute type Description Integer Minimum supported temperature
Returns the maximum supported temperature by the thermostat
Attribute type Description Integer Maximum supported temperature
The following actions are provided by the NuHeat Thermostat: set_temperature , set_hvac_mode , set_preset_mode .
The climate.set_hvac_mode action ( Climate integration ) sets the HVAC mode for NuHeat Thermostats. NuHeat Thermostats do not have an off concept. Setting the temperature to min_temp and changing the mode to heat will cause the device to enter a Permanent Hold preset and will stop the thermostat from turning on unless you happen to live in a freezing climate.
The climate.set_temperature action ( Climate integration ) sets the temperature for NuHeat Thermostats. If the thermostat is in auto mode, it puts the thermostat into a temporary hold at the given temperature. If the thermostat is in heat mode, it puts the thermostat into a permanent hold at the given temperature.
The climate.set_preset_mode action ( Climate integration ) sets the preset mode for NuHeat Thermostats. The following presets are available: Run Schedule , Temporary Hold , Permanent Hold .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The NuHeat device was introduced in Home Assistant 0.61, and it's used by
317 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@tstabrawa
Categories
Back to top
