# Bond - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/bond
- Final URL: https://www.home-assistant.io/integrations/bond
- Canonical URL: https://www.home-assistant.io/integrations/bond/
- Fetched at: 2026-06-28T02:32:01Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on setting up Bond Bridge within Home Assistant.

## Extracted Text

On this page
Tested Bond devices
Prerequisites
Configuration
Requirements
BPUP support (Push updates)
Action bond.set_fan_speed_tracked_state
Action bond.set_switch_power_tracked_state
Action bond.set_light_power_tracked_state
Action bond.set_light_brightness_tracked_state
The Bond integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control appliances through your Bond Bridge . Duplicates your RF remote control.
Supported devices (see Requirements section below):
Ceiling fans
Shades
Fireplaces
The following devices have been tested with Home Assistant and confirmed to be working:
Bond Bridge v1 (snowbird)
Bond Bridge v2 (zermatt)
Bond Bridge Pro (zermatt-pro)
Smart By Bond Fans (breck)
To use Bond controlled devices in your installation, add your Bond hub host and access token from the integrations page. Instructions for how to obtain an access token can be found on the Bond Local API documentation, which includes a section for how to obtain the IP address of the device which you will need to obtain the access token.
To add the Bond hub to your Home Assistant instance, use this My button:
Bond can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Bond .
Follow the instructions on screen to complete the setup.
This integration supports Bond bridges with firmware v2.10.x and up.
Bond bridges with firmware v2.9.x and lower will not work correctly. Please
upgrade your firmware from Bond app before adding this integration.
Firmware version 2.10.8 or newer is required for push updates. The integration
will fallback to polling for 2.10.x versions lower than .8
Sets the tracked fan speed for a bond fan.
Calling this action will change the tracked speed of the fan but not transmit any signal to make the device change speed.
Data attribute Optional Description entity_id no String or list of strings of entity_id s. speed no Speed as a percentage.
Sets the tracked power state of a bond switch.
Calling this action will change the tracked power state of any bond switch but not transmit any signal to make the device change its state.
Data attribute Optional Description entity_id no String or list of strings of entity_id s. power_state no Boolean power state.
Sets the tracked power state of a bond light.
Calling this action Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] will change the tracked power state of any bond light but not transmit any signal to make the device change its state.
Sets the tracked brightness state of a bond light
Calling this action Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] will change the tracked brightness state of any bond light but not transmit any signal to make the device change its state.
Data attribute Optional Description entity_id no String or list of strings of entity_id s. brightness no brightness as an integer between 0 and 255
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Bond hub was introduced in Home Assistant 0.113, and it's used by
4766 active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@bdraco
@prystupa
@joshs85
@marciogranzotto
Categories
Button
Cover
Fan
Hub
Light
Switch
Back to top
