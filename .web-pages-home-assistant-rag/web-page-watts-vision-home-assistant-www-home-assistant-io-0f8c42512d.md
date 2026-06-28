---
source_url: "https://www.home-assistant.io/integrations/watts"
final_url: "https://www.home-assistant.io/integrations/watts"
canonical_url: "https://www.home-assistant.io/integrations/watts/"
source_handle: "web:www-home-assistant-io:0f8c42512d30"
source_section: "integrations-watts"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "58e8f3f2f6149a29c3b0d94b63d59d02eb6f503d733e5d83ac762d456fabe305"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Watts Vision + - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/watts
- Final URL: https://www.home-assistant.io/integrations/watts
- Canonical URL: https://www.home-assistant.io/integrations/watts/
- Fetched at: 2026-06-28T03:27:49Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up Watts Vision + smart heating system in Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Supported devices
Gateway
Sub-devices
Supported functionality
Climate entities
Switch entities
Shared functionality
Data updates
Use cases
Example automations
List of actions
Known limitations
Troubleshooting
Devices appear as unavailable
Newly added or removed devices not reflecting in Home Assistant
Removing the integration
To remove an integration instance from Home Assistant
The Watts Vision + integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] enables seamless control of your heating zones directly from Home Assistant.
Watts Vision + is a smart heating management system that allows remote control of individual home heating zones. It offers precise room temperature regulation, programmable schedules, and energy consumption monitoring through connected thermostats and actuators.
This integration uses the official Watts Vision + API to provide control over your heating zones. You can adjust temperatures, switch between heating modes, and monitor the current status of each thermostat in your home.
Before setting up the integration, make sure you have:
A Watts Vision + account created via the Vision + mobile app.
At least one Watts Vision + gateway connected to the internet and linked to your account.
At least one sub-device paired with your gateway.
Note
The integration uses OAuth2 authentication. You will be redirected to the Watts Vision + login page to authenticate with your account credentials. Make sure you have set up a Watts Vision + account through their mobile app before configuring this integration.
To add the Watts Vision + hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Watts Vision + .
Follow the instructions on screen to complete the setup.
The integration supports the following Watts Vision + devices:
BT-CT03-RF
BT-ST03-RF
BT-DP02-RF
BT-D03-RF
BT-A02-RF
BT-A03-RF
BT-TH02-RF
PR03-RF
PR03-RF16
BT-WR03-RF
BT-WR02-RF
The integration provides the following Home Assistant entities:
The integration creates a climate entity for each thermostat device in your Watts Vision + system. Each climate entity provides:
Current temperature : Current ambient room temperature
Target temperature : Set the desired temperature for the room
HVAC modes :
Heat : Manual comfort or eco mode
Off : Turn off heating for the zone
Auto : Follow programmed schedule
HVAC action : Reports the current activity of the thermostat (heating, cooling, idle, or off)
Preset modes : Switch between the native Watts Vision + thermostat modes:
Comfort : Standard comfort temperature
Eco : Reduced setpoint to save energy
Defrost : Frost protection
Timer : Temporary boost mode
Temperature range : The min/max temperature limits configured for the device
Climate entity attributes
Each climate entity exposes additional attributes:
Thermostat mode : Current operating mode of the thermostat
Device type : Type of thermostat device
Room name : Name of the room as configured in the Watts Vision + app
Temperature unit : Temperature unit (°C or °F)
Available thermostat modes : List of supported modes for the device
The integration creates a switch entity for each compatible switch device in your Watts Vision + system. Each switch entity provides:
On and off control: Toggle the device on or off
State reporting: View the current state of the device
All Watts Vision + devices share common functionality:
Device information : Manufacturer (Watts), model information, and device identification
Availability : Entities show as unavailable when devices are offline or communication fails
The Watts Vision + integration polls Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] data from the cloud API every 30 seconds. After sending commands (temperature changes, mode changes, or switch operations), the integration waits 7 seconds before refreshing to allow the device to process the change.
Watts Vision+ supports a wide range of heating systems, including underfloor heating and cooling. By integrating with Home Assistant, the Watts Vision ecosystem becomes fully interoperable with other IoT devices from any brand in your connected home, unlocking powerful automation possibilities.
This integration enables you to:
Create weather-responsive heating schedules : Build advanced automations that adjust heating based on outdoor temperature, weather forecasts, cloud coverage, and other meteorological data for optimal comfort and energy efficiency.
Integrate with your entire smart home ecosystem : Coordinate your Watts heating system with lighting, blinds, air quality sensors, and other smart devices
Optimize energy consumption intelligently : Automatically adjust heating based on real-time electricity rates, solar panel production, or time-of-use tariffs to minimize costs while maintaining comfort.
Implement presence-based heating control : Combine with occupancy sensors, door/window contacts, or presence detection to heat only occupied rooms and automatically reduce temperatures when rooms are empty or windows are open.
Design sophisticated heating programs : Go beyond basic schedules by creating personalized heating programs that adapt to your lifestyle, seasonal changes, and specific room requirements.
Monitor and analyze heating patterns : Track energy consumption, temperature trends, and system performance over time to identify optimization opportunities.
Lower temperature when nobody is home
alias : " Eco mode when away" description : " Set all thermostats to eco mode when house is empty" triggers : - platform : state entity_id : group.family from : " home" to : " not_home" for : minutes : 10 actions : - action : climate.set_hvac_mode target : entity_id : - climate.living_room - climate.bedroom - climate.office data : hvac_mode : " heat" - action : climate.set_temperature target : entity_id : - climate.living_room - climate.bedroom - climate.office data : temperature : 18
The Watts Vision + integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Activate timer mode ( watts.activate_timer_mode )
Set a thermostat to timer mode with a target temperature and duration.
For an overview of every action across all integrations, see the actions reference .
BRT-WR02-RF devices paired as heaters are not exposed as separate switch entities in Home Assistant.
When a BRT-WR02-RF is paired as a heater on the gateway, the firmware merges it with the thermostat into a single heater entity. Only BRT-WR02-RF devices paired as standalone switches on the gateway appear as switch entities.
Control these devices indirectly by adjusting the thermostat setpoint or mode through automations, for example, based on solar panel production or an external thermostat. The thermostat then manages the on / off state of the BRT-WR02-RF. This allows the built-in regulation algorithm to manage the temperature effectively.
Symptom: Climate entities show as “Unavailable”
When viewing your Watts Vision + climate entities, they show as “Unavailable” in Home Assistant.
Description
This indicates that Home Assistant cannot communicate with your devices through the Watts Vision + cloud API. This is typically caused by connectivity issues between your gateway and the Watts cloud service.
Resolution
To resolve this issue, try the following steps:
Check the gateway status in the Watts Vision + app:
Open the Watts Vision + mobile app.
Verify that the gateway does not appear as offline.
If the gateway shows as offline, this confirms the connectivity issue.
Check the WiFi connection and pairing status of your Watts Vision + gateway:
In the Watts Vision + app, go to the gateway settings.
Navigate to the WiFi settings.
Verify that the status shows 2/2 and is displayed in green .
If the status is not 2/2 or not green, the gateway is not properly connected and paired to the cloud.
Restart the gateway:
Unplug the gateway from power.
Wait 10 seconds.
Plug it back in and wait for it to reconnect.
Reload the integration in Home Assistant:
Find the Watts Vision + integration.
Select the three-dot menu and choose Reload .
Symptom: Added or removed devices don’t appear immediately
After adding a new device through the Watts Vision + app or removing an existing device, the change is not immediately visible in Home Assistant.
The Home Assistant integration polls Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] new devices every 15 minutes, so it can take up to 15 minutes to see the new devices.
Device additions or removals can take up to 15 minutes to be reflected in Home Assistant. To ensure the change is processed:
Wait for up to 15 minutes after making the change in the Watts Vision + app.
If the device still doesn’t appear or disappear after 15 minutes, try reloading the integration:
This integration follows standard integration removal.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Watts Vision + hub was introduced in Home Assistant 2026.1, and it's used by
10 active installations.
Its IoT class is Cloud Polling.
🏆 Platinum quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@theobld-ww
@devender-verma-ww
@ssi-spyro
Categories
Climate
Switch
Back to top
