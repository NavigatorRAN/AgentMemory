# Casper Glow - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/casper_glow
- Final URL: https://www.home-assistant.io/integrations/casper_glow
- Canonical URL: https://www.home-assistant.io/integrations/casper_glow/
- Fetched at: 2026-06-28T02:33:22Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Casper Glow lights into Home Assistant.

## Extracted Text

On this page
Supported devices
Prerequisites
Configuration
Supported functionality
Entities
Examples
Bedtime routine
Pause on motion
Turn on and hold at nightlight level
Data updates
Known limitations
Troubleshooting
The device is not discovered
The light shows as unavailable
Resetting the light
Removing the integration
To remove an integration instance from Home Assistant
The Casper Glow integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control your Casper Glow light from Home Assistant over Bluetooth. The Casper Glow is a portable dimmable light designed as a sleep aid, featuring a gentle dimming sequence that gradually lowers brightness to help you fall asleep. You can incorporate it into your bedtime automations to control brightness levels.
The following devices are supported:
Casper Glow (identified as “Jar” over Bluetooth)
Before setting up the integration, make sure:
Your Home Assistant host has a Bluetooth adapter.
The Casper Glow is powered on and within Bluetooth range.
To add the Casper Glow device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Casper Glow .
Follow the instructions on screen to complete the setup.
Bluetooth address
The Bluetooth address of your Casper Glow light. Discovered devices are shown automatically.
The Casper Glow integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following entities.
Binary sensors
Dimming paused
Description : Indicates whether the Glow’s dimming sequence is currently paused.
Charging
Description : Indicates whether the Glow is currently charging.
Buttons
Pause dimming
Description : Pauses dimming, holding the current brightness level until resumed.
Resume dimming
Description : Resumes dimming from where it left off.
Lights
Casper Glow
Description : Controls the on/off state and brightness of the Glow light. Brightness is mapped to five levels.
Sensors
Battery
Description : Reports the current battery level of the Glow as a percentage.
Dimming end time (disabled by default)
Description : Shows the projected time when the current dimming sequence will end. This value is a timestamp that updates only when there is a significant change during a poll interval. Such as pausing or resuming dimming, or manually adjusting the physical light.
Selects
Dimming time
Description : Configures how long the dimming sequence lasts before the light turns off. You can choose between 15, 30, 45, 60, or 90 minutes. The new dimming time takes effect the next time the light is turned on.
Start a dimming sequence at a set time each night. This blueprint lets you pick your bedtime and how long the light takes to dim, so your Glow is ready when you are.
Example YAML
```yaml
triggers:
- trigger: time
at: "22:00:00"
actions:
- action: select.select_option
target:
entity_id: select.jar_dimming_time
data:
option: "30"
- action: light.turn_on
entity_id: light.jar
```
Keep the light from dimming while you’re still up. This blueprint pauses the dimming sequence whenever motion is detected, so the light holds its brightness until you settle in.
- trigger: state
entity_id: binary_sensor.bedroom_motion
to: "on"
conditions:
- condition: state
state: "on"
- action: button.press
entity_id: button.jar_pause_dimming
Turn on the Glow and let it dim down to a soft nightlight, then hold it there. This blueprint starts the dimming sequence and automatically pauses it when a set number of minutes remain, leaving a gentle glow in the room through the night.
Note
The sensor.jar_dimming_end_time sensor is disabled by default. You must enable it manually for this blueprint to work correctly.
- wait_for_trigger:
- trigger: template
value_template: >-
{% set end = states('sensor.jar_dimming_end_time') | as_datetime %}
{% if end is not none %}
{{ ((end - now()).total_seconds() / 60) | round(0) <= 10 }}
{% else %}
false
{% endif %}
timeout:
minutes: 30
continue_on_timeout: false
The Casper Glow integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] detects the device through passive Bluetooth advertisements. All state updates are retrieved by actively polling Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] the device every 30 seconds — for example, to detect changes made directly on the light or through the Casper app.
Brightness is limited to five discrete levels. The integration maps these to the Home Assistant 0-255 brightness scale, snapping to the nearest supported level.
The integration communicates over Bluetooth, so the light must remain within range of the Home Assistant Bluetooth adapter.
Only one Bluetooth connection to the Glow can be active at a time. If the Casper app is connected, Home Assistant may not be able to reach the device.
Make sure the Glow light is powered on and within Bluetooth range. If it still doesn’t appear, try toggling the light off and on by flipping it over. Ensure no other Bluetooth device (like the Casper app) is actively connected to it.
This typically means the Bluetooth connection was lost. Check that the light is powered on and within range. Moving the light closer to the Bluetooth adapter may help.
If the light remains unresponsive, a reboot or factory reset may help.
To reboot, hold both buttons on the Glow until it briefly turns on. This takes about 30 seconds.
To factory reset the Glow, press one of the buttons 6 times while holding the other button down.
This returns the device to default settings and removes it from any configured Glow light groups (configured outside Home Assistant in the Casper app).
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Casper Glow device was introduced in Home Assistant 2026.4, and it's used by
19 active installations.
Its IoT class is Local Polling.
🏆 Platinum quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@mikeodr
Categories
Binary Sensor
Button
Light
Select
Sensor
Back to top
