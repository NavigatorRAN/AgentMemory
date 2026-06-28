# Advantage Air - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/advantage_air
- Final URL: https://www.home-assistant.io/integrations/advantage_air
- Canonical URL: https://www.home-assistant.io/integrations/advantage_air/
- Fetched at: 2026-06-28T02:26:07Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Advantage Air A/C controller into Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Entities
Climate
Cover
Sensor
Binary sensor
Switch
Select
Update
Light
Actions
Action: Set time to
The Advantage Air integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control Advantage Air Air Conditioning controllers into Home Assistant.
The wall-mounted Android tablet running the MyPlace , e-zone , or zone10e must have a static IP, which you will enter on the integrations page in Home Assistant.
To add the Advantage Air hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Advantage Air .
Follow the instructions on screen to complete the setup.
The integration will create a climate entity for each air conditioning system found and for each zone that is temperature-controlled. The main climate entity will have a preset for each MyComfort temperature mode it supports.
MyZone (default) - Use the MyZone select platform to pick which zone will be used for temperature control. Setting this to “Inactive” will use the return air vent temperature. e-zone systems do not support any MyComfort temperature modes, so will always be in the MyZone preset with MyZone set as “Inactive”.
MyTemp - Use the main climate entity to change between cool, heat, and off. Use the zone climate entities to set the desired temperature in each zone.
MyAuto - Uses the average temperature of all zones for temperature control. When set to the Heat/Cool mode, you can adjust the heating and cooling target temperatures separately, and the MyAir system will automatically switch between heating and cooling as required.
The integration will create a cover entity for each air conditioning zone that is not temperature controlled, allowing you to adjust the opening level manually from 0% to 100% in 5% increments.
With MyPlace, any blinds and/or garage doors will be created as cover entities.
The integration will create sensor entities for a variety of aspects:
The air filter sensor shows if it needs to be replaced.
Two sensor entities will be created for the ‘time to on’ and ‘time to off’ features. Use the advantage_air.set_time_to action to change these.
Each zone that is temperature-controlled will have a sensor to show the temperature (disabled by default), and how open the damper is.
Each zone with a wireless temperature or motion sensor will have a sensor that reports its wireless RSSI.
The integration will create a binary sensor for each zone that has a motion sensor.
The integration will create switch entities to toggle the MyFan/ezFan setting, to toggle air conditioning fresh air mode, and to toggle MySleep$aver, if they are supported by your hardware.
With MyPlace, any relays will be created as switch entities.
The MyZone select entity that allows you to change the zone used for the “MyZone” feature. Set this to “Inactive” to use the return air vent temperature.
The update platform shows if the controller app requires an update.
With MyLights or MyPlace, light entities will be created for each light.
The advantage_air.set_time_to action is used to set the On/Off Timer using the relevant sensor entity.
Data attribute Optional Description entity_id yes sensor.[name]_time_to_on or sensor.[name]_time_to_off minutes no Number of minutes between 0 and 720 .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Advantage Air hub was introduced in Home Assistant 0.117, and it's used by
647 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@Bre77
Categories
Back to top
