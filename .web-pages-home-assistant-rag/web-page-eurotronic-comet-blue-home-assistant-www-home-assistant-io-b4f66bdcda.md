# Eurotronic Comet Blue - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/eurotronic_cometblue
- Final URL: https://www.home-assistant.io/integrations/eurotronic_cometblue
- Canonical URL: https://www.home-assistant.io/integrations/eurotronic_cometblue/
- Fetched at: 2026-06-28T02:41:25Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Eurotronic Comet Blue Thermostats into Home Assistant.

## Extracted Text

On this page
Supported devices
Prerequisites
Configuration
Supported functionality
Climate
Button
Number
Sensor
Data updates
Known limitations
Troubleshooting
Removing the integration
To remove an integration instance from Home Assistant
The Eurotronic Comet Blue integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to integrate Eurotronic Comet Blue (and similar) thermostats.
You can use this integration to read thermostat status and adjust temperatures in Home Assistant.
Eurotronic Comet Blue
Sygonix HT100 BT
Xavax Hama
Lidl Silvercrest RT2000BT
Before you set up this integration, make sure the following requirements are met:
The Bluetooth integration is enabled and working.
Bluetooth active scanning is enabled.
The Eurotronic Comet Blue integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] will automatically discover devices once the Bluetooth integration is enabled and functional.
To add the Eurotronic Comet Blue device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Eurotronic Comet Blue .
Follow the instructions on screen to complete the setup.
Device PIN
Device PIN with 6 digits, defaults to 000000 .
This integration provides climate control and thermostat configuration entities.
Comet Blue devices run on an internal schedule and can be manually controlled temporarily. When the schedule is active, the thermostat switches between low and high target temperatures based on that schedule.
If you manually change the target temperature or use presets, the thermostat returns to its programmed schedule on the next schedule change.
The climate entity lets you control the thermostat by setting a target temperature which the device will try to reach on its own.
As shortcuts, the climate platform supports the following presets:
Eco : Temperature is set to the low schedule temperature.
Comfort : Temperature is set to the high schedule temperature.
Boost : Valve is fully open.
Away : Holiday mode is currently active. Display only.
None : Temperature is other than the above. Display only.
Additionally, the following modes are available:
Off : Valve is fully closed.
Heat : Valve is fully open.
Auto : The thermostat controls the temperature automatically, based on the target temperature.
The integration provides a Sync time button for each device. Pressing this button synchronizes the thermostat’s internal clock with Home Assistant’s current time.
Number entities provide specific settings that affect automatic thermostat behavior.
Comfort setpoint : Temperature used for the Comfort preset and if schedule is on.
Eco setpoint : Temperature used for the Eco preset and if schedule is off.
Setpoint offset : Temperature calibration for the internal thermostat control.
The device reports its current battery level, but the reading may not be very accurate.
The integration polls Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] data from the thermostat every 5 minutes by default.
Holiday mode/away preset can only be set on the device itself.
The devices only support temperature steps of 0.5°C and time steps of 15 minutes.
If you manually change the target temperature or use presets, the thermostat returns to its programmed schedule at the next schedule change.
If the thermostat is in holiday mode, you cannot reset it from Home Assistant. To reset it, press the MENU button on the thermostat until it resets.
As the data is refreshed using an active Bluetooth connection, polling Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] can fail due to connection issues.
If you see repeated connection issues, try the following:
Move your Home Assistant host closer to the thermostat.
Add ESPHome Bluetooth proxies closer to the thermostat.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Eurotronic Comet Blue device was introduced in Home Assistant 2026.5, and it's used by
16 active installations.
Its IoT class is Local Polling.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@rikroe
Categories
Back to top
