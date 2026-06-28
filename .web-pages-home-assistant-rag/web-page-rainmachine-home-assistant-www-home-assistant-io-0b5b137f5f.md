# RainMachine - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/rainmachine
- Final URL: https://www.home-assistant.io/integrations/rainmachine
- Canonical URL: https://www.home-assistant.io/integrations/rainmachine/
- Fetched at: 2026-06-28T03:11:15Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate RainMachine units within Home Assistant.

## Extracted Text

On this page
Configuration
Configuration Options
List of actions
Controlling Your Device
Entity Availability
Firmware Updates
The RainMachine integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] is the main integration to integrate all platforms related to RainMachine smart Wi-Fi sprinkler controllers .
There is currently support for the following device types within Home Assistant:
Binary sensor
Button
Sensor
Switch
Note that some entities are disabled by default. If you are missing a sensor or binary sensor, check the configured integration!
To add the RainMachine device to your Home Assistant instance, use this My button:
RainMachine can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select RainMachine .
Follow the instructions on screen to complete the setup.
The integration has two configuration options:
“Default Zone Run Time”: sets a default duration when turning on a zone switch (default: 600 seconds). This can be overridden with an action (see below).
“Use Run Times from App”: if enabled, will use the zone-specific run times from the last time the zone was turned on manually in the RainMachine App – this allows you to set per-zone default times using the RainMachine app instead of the same default time for all zones.
The RainMachine integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Pause all watering ( rainmachine.pause_watering )
Pauses all watering activities for a number of seconds.
Push flow meter data ( rainmachine.push_flow_meter_data )
Sends flow meter data from Home Assistant to the RainMachine device.
Push weather data ( rainmachine.push_weather_data )
Sends weather data from Home Assistant to the RainMachine device.
Restrict all watering ( rainmachine.restrict_watering )
Restricts all watering activities from starting for a time period.
Start program ( rainmachine.start_program )
Starts a RainMachine program.
Start zone ( rainmachine.start_zone )
Starts a RainMachine zone for a set time.
Stop all watering ( rainmachine.stop_all )
Stops all watering activities.
Stop program ( rainmachine.stop_program )
Stops a RainMachine program.
Stop zone ( rainmachine.stop_zone )
Stops a RainMachine zone.
Unpause all watering ( rainmachine.unpause_watering )
Resumes all paused watering activities.
Unrestrict all watering ( rainmachine.unrestrict_watering )
Removes all watering restrictions.
For an overview of every action across all integrations, see the actions reference .
After Home Assistant loads, new switches will be added for every enabled program and zone. These work as expected:
Program On/Off: starts/stops a program
Zone On/Off: starts/stops a zone (using the configuration options described above to determine how long to run for)
Programs and zones are linked. While a program is running, you will see both the program and zone switches turned on; turning either one off will turn the other one off (just like in the web app).
Many RainMachine entities are enabled by default. Others, like those related to flow sensors, are disabled by default if they only apply to some controllers. You can view all entities for a controller and enable/disable them as appropriate in the Device screen for your RainMachine controller.
The integration has an update entity that provides information on the latest available RainMachine firmware version. The firmware update can be triggered and installed onto your RainMachine controller
directly from Home Assistant.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The RainMachine device was introduced in Home Assistant 0.69, and it's used by
475 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@bachya
Categories
Irrigation
Update
Back to top
