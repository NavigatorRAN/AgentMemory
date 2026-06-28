---
source_url: "https://www.home-assistant.io/integrations/airobot"
final_url: "https://www.home-assistant.io/integrations/airobot"
canonical_url: "https://www.home-assistant.io/integrations/airobot/"
source_handle: "web:www-home-assistant-io:553d2a11b6fc"
source_section: "integrations-airobot"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "cb69a32e7af341496342005281ed03251fb2b95ef54e23910d58d1a5ac0176c5"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Airobot - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/airobot
- Final URL: https://www.home-assistant.io/integrations/airobot
- Canonical URL: https://www.home-assistant.io/integrations/airobot/
- Fetched at: 2026-06-28T02:26:34Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Airobot smart thermostats for intelligent floor heating control into Home Assistant.

## Extracted Text

On this page
Supported devices
Prerequisites
Configuration
Reconfiguration
Supported functionality
Climate
Sensors
Number
Button
Switch
Examples
Air quality alert
Data updates
Known limitations
Troubleshooting
Removing the integration
To remove an integration instance from Home Assistant
Related links
The Airobot integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control and monitor Airobot smart thermostats for intelligent floor heating control via the local REST API. The thermostat uses adaptive learning with a TPI algorithm to maintain stable temperatures and optimize energy efficiency. Optional built-in carbon dioxide and humidity sensors monitor indoor air quality for a healthier living environment.
Use case: Create presence-based heating automations, use BOOST to quickly warm rooms before arrival, monitor air quality to trigger ventilation alerts, and track heating runtime patterns for energy optimization.
The following devices are supported by the integration:
Airobot Smart Thermostat TE1 with firmware version 1.8 or later
Before setting up the integration, ensure your Airobot thermostat is properly configured:
Verify your thermostat has firmware version 1.8 or later. You can check the firmware version in the thermostat settings menu.
Connect the thermostat to your local Wi-Fi or Ethernet network.
Connect to the internet at least once to register with the Airobot server. During this initial connection, the thermostat receives its Device ID (username) and password.
In the thermostat settings menu, navigate to Connectivity > Local API > Enable to enable the local REST API (disabled by default).
Note your Device ID and password from the thermostat menu under Connectivity > Mobile app screen. You will need these during setup. These are the same credentials used to pair the mobile app.
After initial setup, the thermostat does not require internet connectivity to function with Home Assistant.
To add the Airobot device to your Home Assistant instance, use this My button:
Airobot can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Airobot .
Follow the instructions on screen to complete the setup.
The integration can be automatically discovered via DHCP when the thermostat is on the same network. If automatic discovery does not work, you can manually add the integration.
Host
The hostname or IP address of your Airobot thermostat. You can find it in your router settings, or use the hostname format airobot-thermostat-t01xxxxxx (replace t01xxxxxx with your Device ID in lowercase).
Device ID
The thermostat Device ID (e.g., T01XXXXXX). You can find this in the thermostat menu under Connectivity > Mobile app screen. This is the same credential used to pair the mobile app.
Password
The thermostat password. You can find this in the thermostat menu under Connectivity > Mobile app screen. This is the same credential used to pair the mobile app.
If you need to update the connection settings for your thermostat (such as changing the IP address, Device ID, or password), you can reconfigure the integration without removing and re-adding it:
On the Airobot integration, select the three-dot menu and choose Reconfigure .
Update the connection settings as needed.
Select Submit to save the new settings.
This is useful when:
Your thermostat’s IP address has changed (for example, after a router restart or a DHCP lease renewal).
You need to update the Device ID or password.
You want to switch between IP address and hostname.
The Airobot integration provides the following entities.
The thermostat is represented as a climate entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] with the following capabilities.
Current temperature
Description : Displays the measured temperature in the room.
Remarks : If a floor temperature sensor is connected, displays the floor temperature (for floor heating control). Otherwise, displays the air temperature.
Current humidity
Description : Displays the measured relative humidity in the room.
Target temperature
Description : Shows and allows you to set the desired temperature (5°C to 35°C range).
Remarks : In HOME mode, controls the HOME temperature setpoint. In AWAY mode, controls the AWAY temperature setpoint.
HVAC mode
Description : Always set to Heat for this heating-only thermostat.
HVAC action
Description : Shows whether the thermostat is actively heating or idle.
Preset modes
Description : Select the operating mode for the thermostat.
Options : Home (use the HOME temperature setpoint), Away (use the AWAY temperature setpoint, typically lower for energy savings), Boost (temporarily boost heating for 1 hour, then return to the previous mode).
The integration provides the following sensor entities to monitor your thermostat and environment.
Environmental sensors
Air temperature
Description : The measured air temperature in the room.
Unit : °C
Floor temperature
Description : The measured floor temperature.
Remarks : Only available if a floor temperature sensor is connected to the thermostat.
Humidity
Description : The measured relative humidity in the room.
Unit : %
Carbon dioxide
Description : The measured carbon dioxide concentration in the room.
Unit : ppm
Remarks : Only available if the thermostat has the optional carbon dioxide sensor.
Air quality index
Description : The calculated air quality index based on carbon dioxide levels.
Diagnostic sensors
The following diagnostic sensors are disabled by default. You can enable them in the entity settings if needed.
Device uptime
Description : The timestamp when the thermostat was last restarted.
Heating uptime
Description : The cumulative time the heating has been active since the thermostat was last restarted.
Unit : hours
System sensors
Errors
Description : The current error count on the thermostat. A value of 0 indicates normal operation.
The integration provides a configuration entity to adjust advanced thermostat settings:
Hysteresis band : Configure the temperature hysteresis (dead band) for heating control (0.0-0.5°C range). This setting determines how much the temperature must drop below the setpoint before heating activates. A smaller value provides tighter temperature control but may cause more frequent heating cycles. A larger value reduces heating cycles but allows more temperature variation.
The integration provides button entities for device management:
Restart : Restart the thermostat device. This performs a soft restart of the thermostat, which can be useful for troubleshooting connectivity issues or applying configuration changes. The thermostat will be temporarily unavailable during the restart process (typically 5-10 seconds).
Recalibrate CO₂ : Initiates manual carbon dioxide sensor calibration by setting the current air as the new 400 ppm reference value. Only available if the thermostat has the optional carbon dioxide sensor. Not recommended for typical use as the carbon dioxide sensor has an auto-calibration algorithm enabled by default. Only activate this if the air is clean (fresh outdoor air) and auto-calibration needs to be manually overridden.
The integration provides switch entities for controlling thermostat features:
Child lock : Enable or disable the child lock feature on the thermostat. When enabled, the physical buttons on the thermostat are locked to prevent accidental or unauthorized changes to settings.
Actuator exercise disabled : Enable or disable the actuator exercise function. To prevent valve sticking, the actuator exercise periodically switches off the valve for 8 minutes at least every 96 hours. This entity is disabled by default.
Examples of automations you can create using the Airobot integration.
Send a notification when the air quality exceeds a specified threshold.
Example YAML configuration
alias : " Airobot Air Quality Alert" description : >- Sends a notification when the Airobot air quality sensor exceeds a threshold. triggers : - trigger : numeric_state entity_id : sensor.airobot_air_quality above : 1000 conditions : - >- {{ trigger.from_state.state | float(0) < trigger.to_state.state | float(0) }} actions : - action : notify.send_message target : entity_id : notify.my_device data : title : " Poor Air Quality" message : >- Air quality in {{ area_name(trigger.entity_id) }} is {{ trigger.to_state.state }} (threshold: {{ trigger.above | int }})
The Airobot integration polls Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] data from the thermostat every 30 seconds. This interval matches the thermostat’s internal measurement cycle, ensuring efficient data synchronization without overwhelming the device.
Local API only : The integration only supports the local REST API. Cloud-based control through the Airobot cloud service is not supported.
Manual API enablement : The local REST API must be manually enabled on the thermostat before the integration can connect. It is disabled by default for security reasons.
Firmware requirements : Only firmware version 1.8 or later is supported. Older firmware versions do not provide the local REST API.
Heating only : The thermostat is designed for floor heating control only and does not support cooling modes.
Optional sensors : Carbon dioxide and floor temperature sensors are only available if the corresponding hardware is installed in your thermostat model.
Cannot connect to thermostat
Symptom: Cannot connect to your Airobot thermostat
When trying to set up the integration, the configuration flow shows the error “Cannot connect to your Airobot thermostat”.
This error indicates that Home Assistant cannot establish a connection to the thermostat’s local REST API. This can be caused by incorrect network settings, local API being disabled, or network connectivity issues.
To resolve this issue, try the following steps:
Verify the IP address or hostname :
Make sure you entered the correct IP address or hostname.
You can find the IP address in your router settings.
The hostname format is airobot-thermostat-t01xxxxxx (replace t01xxxxxx with your Device ID in lowercase).
Check network connectivity :
Ensure the thermostat is powered on and connected to your network.
Verify that Home Assistant and the thermostat are on the same network or can communicate with each other.
Try pinging the thermostat from the Home Assistant host: ping <thermostat-ip> .
Enable local API :
On the thermostat, navigate to Connectivity > Local API > Enable .
Wait a few seconds for the API to become active.
Restart the thermostat (if needed):
If the local API was just enabled, try restarting the thermostat to ensure the API service starts properly.
Authentication failed
Symptom: “Invalid authentication”
The configuration flow shows “Invalid authentication” error when entering credentials.
The Device ID (username) or password provided is incorrect or does not match the thermostat’s credentials.
Verify credentials :
On the thermostat, navigate to the Connectivity > Mobile app screen in the settings menu.
Check that the Device ID (e.g., T01XXXXXX) matches exactly what you entered (case-sensitive).
Check that the password matches exactly what you entered (case-sensitive).
Re-enter credentials :
Double-check for typing errors.
The Device ID should start with “T” followed by numbers.
Ensure initial registration :
The thermostat must have connected to the internet at least once to register and obtain credentials.
If you have never connected the thermostat to the internet, do so first, then check the credentials again.
Thermostat goes unavailable
Symptom: The thermostat entity becomes unavailable after some time
The integration loses connection to the thermostat, causing the entity to become unavailable. This can happen due to network issues, thermostat power loss, or the device entering sleep mode.
Check power and network :
Ensure the thermostat is powered on and connected to the network.
Check if you can access the thermostat’s web interface directly in a browser.
Verify network stability :
Check for Wi-Fi signal strength issues if using wireless connection.
Consider using a wired Ethernet connection for more reliable connectivity.
Check local API status :
Ensure the local API is still enabled on the thermostat.
Navigate to Connectivity > Local API and verify it is enabled.
Reset Wi-Fi setting :
On the thermostat, navigate to Connectivity > WiFi .
Reset the Wi-Fi settings and reconnect to your local network.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
You can optionally disable the local API on the thermostat after removing the integration by navigating to Connectivity > Local API > Disable .
Airobot
Airobot Heat Control Products
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Airobot device was introduced in Home Assistant 2025.12, and it's used by
6 active installations.
Its IoT class is Local Polling.
🏆 Platinum quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@mettolen
Categories
Back to top
