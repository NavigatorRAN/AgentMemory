# Vallox - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/vallox
- Final URL: https://www.home-assistant.io/integrations/vallox
- Canonical URL: https://www.home-assistant.io/integrations/vallox/
- Fetched at: 2026-06-28T03:25:58Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Vallox ventilation units into Home Assistant.

## Extracted Text

On this page
Configuration
Platforms
Fan
Sensor
Binary sensor
Switch
Number
Date
Profile switching
Fan actions
Action: Set profile fan speed home
Action: Set profile fan speed away
Action: Set profile fan speed boost
Action: Set profile
The Vallox integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you control any Vallox ventilation unit that is supported by the vallox_websocket_api (follow the link for a list of supported units).
To add the Vallox device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Vallox .
Follow the instructions on screen to complete the setup.
The fan platform of this integration allows you to control the entire unit. You can turn the unit on/off using the toggle switch, adjust the fan speed, and select a ventilation profile.
The sensor platform allows you to monitor various metrics such as fan speeds, air temperatures, humidity, remaining filter life, cell state, and more.
The binary sensor platform allows you to monitor the status of the post heater.
The switch platform allows you to lock the heat recovery bypass.
The number platform gives you control over the supply air temperatures.
The date platform allows you to set the filter change date.
For convenient switching of ventilation profiles in the GUI, just click on the Vallox fan entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] to get a drop-down menu to select from. Alternatively, the action fan/set_preset_mode can be used.
The four standard Vallox profiles are supported:
Home
Away
Boost
Fireplace
The vallox.set_profile_fan_speed_home action sets the fan speed of the Home profile.
Data attribute Optional Description fan_speed no Fan speed in %. Integer , between 0 and 100.
The vallox.set_profile_fan_speed_away action sets the fan speed of the Away profile.
The vallox.set_profile_fan_speed_boost action sets the fan speed of the Boost profile.
The vallox.set_profile action sets the profile, and optionally a duration for the profile to be active.
Data attribute Optional Description profile no Profile to set, one of home , away , boost , fireplace , or extra . duration yes Duration to activate the profile for; in minutes. Integer between 1 and 65535. Only applies to boost , fireplace or extra profiles. 65535 sets the profile without a timeout.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Vallox device was introduced in Home Assistant 0.96, and it's used by
450 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@andre-richter
@slovdahl
@viiru-
@yozik04
Categories
Back to top
