---
source_url: "https://www.home-assistant.io/integrations/eheimdigital"
final_url: "https://www.home-assistant.io/integrations/eheimdigital"
canonical_url: "https://www.home-assistant.io/integrations/eheimdigital/"
source_handle: "web:www-home-assistant-io:3b7b5e50c071"
source_section: "integrations-eheimdigital"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "a0e3b9d68cd1e5ae51e2dce3aebacfeb0a69f875d9cb853222cc2e481b82f44b"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# EHEIM Digital - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/eheimdigital
- Final URL: https://www.home-assistant.io/integrations/eheimdigital
- Canonical URL: https://www.home-assistant.io/integrations/eheimdigital/
- Fetched at: 2026-06-28T02:39:26Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up EHEIM Digital with Home Assistant.

## Extracted Text

On this page
Configuration
Data updates
How you can use this integration
Supported devices and entities
EHEIM classicLEDcontrol+e
EHEIM thermocontrol+e
EHEIM classicVARIO+e
EHEIM professionel5e
EHEIM reeflexUV+e
All supported devices
Automations
Send a notification when the filter has an error
Known limitations
Removing the integration
To remove an integration instance from Home Assistant
The EHEIM Digital integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control your EHEIM Digital smart aquarium devices from Home Assistant.
To add the EHEIM Digital hub to your Home Assistant instance, use this My button:
EHEIM Digital can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select EHEIM Digital .
Follow the instructions on screen to complete the setup.
Host
The IP address or hostname of your EHEIM Digital main device. Defaults to eheimdigital.local , an IP address should only be necessary if the hostname doesn’t work.
The integration connects locally via WebSocket to the EHEIM Digital main device and requests data updates for all devices every 15 seconds by default.
You can use this integration to control and monitor your EHEIM Digital aquarium devices directly from Home Assistant. This includes adjusting settings such as temperature, light brightness, and filter speed, as well as monitoring the status of your devices.
Receive notifications : Get notified about important events, such as when the filter needs servicing or if there is an error with the device.
More flexible day/night cycles : Use Home Assistant’s automation and scripting capabilities to create more complex day/night cycles for your aquarium devices than the native EHEIM Digital interface allows.
Integrate with other devices : While EHEIM Digital devices can interact with each other in a limited sense (for example, the EHEIM autofeeder can pause the filter pump after feeding), this integration allows you to automate and control your EHEIM Digital devices in conjunction with other smart home devices.
Currently, the following devices and entities are supported:
Lights
Brightness : Controlling the brightness of both light channels
Daycycle mode effect : Automatically controls the brightness based on the daytime as configured on the device
Climate
Target temperature : Controlling the target temperature of the heater (which corresponds to the day temperature in Bio and Smart mode)
Presets / Operation mode : Switching between Manual, Bio and Smart mode
Number
Temperature offset : Setting an offset between the measured temperature and the real temperature
Night temperature offset : Setting the offset for the night temperature in Bio mode
Time
Day start time : Setting the start time for the day temperature in Bio mode
Night start time : Setting the start time for the night temperature in Bio mode
Manual speed : Setting the pump speed in Manual mode
Day speed : Setting the pump speed for the day in Bio mode
Night speed : Setting the pump speed for the night in Bio mode
Select
Filter mode : Setting the filter mode
Manual mode : The filter uses the manual speed .
Pulse mode : The filter uses a high and low pulse. The speeds are configured via high pulse speed and low pulse speed . The durations are configured via high pulse duration and low pulse duration .
Bio mode : The filter uses a day and night rhythm. The speeds are configured via day speed and night speed . The start times of day and night are configured via day start time and night start time .
Sensor
Current pump speed : Displays the current pump speed
Remaining hours until service : Displays the remaining time until the filter needs to be serviced
Error code : Displays the current error code of the device (No error, Rotor stuck, air in filter)
Switch
Pump : Turning on and off the filter pump
Day start time : Setting the start time for the day pump speed in Bio mode
Night start time : Setting the start time for the night pump speed in Bio mode
High pulse duration : Setting the duration of the high pulse in Pulse mode
Low pulse duration : Setting the duration of the low pulse in Pulse mode
Constant flow mode : The filter uses the constant flow speed .
Constant flow speed : Setting the pump speed in Constant flow mode
High pulse speed : Setting the pump speed for the high pulse in Pulse mode
Low pulse speed : Setting the pump speed for the low pulse in Pulse mode
Operating time : Displays the operating time
Remaining off time : Displays the remaining time before the pump turns on again after turning it off
Remaining off time after feeding : Displays the remaining time before the pump turns on again after receiving a signal from the autofeeder
Binary sensor
Light : Displays whether the UVC lamp is currently burning
UVC lamp connected : Displays whether a UVC lamp is connected
Daily burn duration : Setting the daily burn duration of the UV lamp
Booster duration : Setting the duration of the booster
Pause duration : Setting the pause duration
Operation mode : Setting the operation mode
Constant mode : The UVC lamp is burning constantly
Daycycle mode : The UVC lamp is burning on a day cycle
Remaining booster time : Displays the remaining booster duration
Remaining pause time : Displays the remaining pause duration
Time until next service : Displays the time until the lamp needs to be serviced
Activating and deactivating the device
Booster : Turning on the booster for the Booster duration , and turning it off
Pause : Pausing the lamp for the Pause duration , and unpausing the lamp
Expert mode : Turning on and off expert mode
Start time : Setting the start time of the lamp in daycycle mode
System LED brightness : Controlling the brightness of the system LED
You can set up an automation to notify you when the filter has an error. This example uses the notify.notify service to send a notification:
Example automation to notify about filter errors
alias : Notify about filter error description : " This automation sends a notification when the filter has an error." mode : single triggers : - trigger : state entity_id : - sensor.aquarienfilter_error_code to : - rotor_stuck - air_in_filter conditions : [] actions : - action : notify.notify metadata : {} data : title : The filter has a problem!
The integration does not support other EHEIM Digital devices than those listed above. More devices will be added in future updates. It is, however, supported to have an unsupported device as the main device and supported devices as sub-devices, even though the unsupported device will not have any entities shown in Home Assistant.
This integration follows standard integration removal, no extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The EHEIM Digital hub was introduced in Home Assistant 2025.1, and it's used by
251 active installations.
Its IoT class is Local Polling.
🏆 Platinum quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@autinerd
Categories
Light
Back to top
