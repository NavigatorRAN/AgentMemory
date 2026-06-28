---
source_url: "https://www.home-assistant.io/integrations/victron_gx"
final_url: "https://www.home-assistant.io/integrations/victron_gx"
canonical_url: "https://www.home-assistant.io/integrations/victron_gx/"
source_handle: "web:www-home-assistant-io:120952bc7383"
source_section: "integrations-victron-gx"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "f136886b5a49f7a42038fcee72f0f0719653c9db51f9af463d7c60c245df6afb"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Victron GX - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/victron_gx
- Final URL: https://www.home-assistant.io/integrations/victron_gx
- Canonical URL: https://www.home-assistant.io/integrations/victron_gx/
- Fetched at: 2026-06-28T03:26:44Z
- Content type: text/html; charset=UTF-8

## Description

Instructions for connecting Victron Energy GX devices to Home Assistant using MQTT

## Extracted Text

On this page
Supported devices
Prerequisites
Configuration
Reauthentication
Data updates
Supported functionality
Entities
Known limitations
Examples
Send a notification when the battery is low
Troubleshooting
Cannot connect
Authentication failed
No sensors appear
Removing the integration
To remove an integration instance from Home Assistant
Related links
The Victron GX Integration integration connects to Victron Energy GX devices using MQTT, providing real-time monitoring and control of your Victron system, including inverters, solar chargers, battery systems, grid meters, and EV chargers.
This integration supports Victron Energy devices that run Venus OS and have MQTT enabled, including:
Cerbo GX
Venus GX
Color Control GX
MultiPlus inverters
Quattro inverters
Solar charge controllers
Battery monitors
EV charging stations
A Victron Energy GX device running Venus OS with MQTT enabled.
Network connectivity between your Home Assistant instance and the Victron device.
For secured installations: The MQTT password configured on your Victron device.
To add the Victron GX hub to your Home Assistant instance, use this My button:
Victron GX can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Victron GX .
Follow the instructions on screen to complete the setup.
When setting up the integration manually, you need to provide connection details based on your Victron device’s security profile.
On the Victron device, go to Settings > General and check the Local Network Security Profile setting. This can be Unsecured , Weak , or Secured . If set to Weak or Secured , you must have specified a password when configuring this option.
Host
The hostname or IP address of your Victron device. The default is venus.local .
Port
The MQTT port number. Use 1883 for unsecured connections or 8883 for secured connections.
Username
Leave blank for unsecured and weak/secured profiles. Only use root if Venus OS is rooted with SSH access enabled.
Password
Leave blank for unsecured profile. Enter the password you defined when setting the security profile to Weak or Secured .
SSL
Enable for secured connections (port 8883). Disable for unsecured connections (port 1883).
If your MQTT password changes or the security profile on your Victron device is updated, Home Assistant prompts you to re-authenticate:
Go to Settings > Devices & services and find the Victron GX integration. It will show a Re-authenticate message.
Select the Reconfigure button or the Re-authenticate prompt.
Enter your updated Password .
Select Submit .
On success, the integration reloads automatically.
Entities are updated only when new values are received from the device, but no more frequently than every 30 seconds.
The integration automatically discovers and creates entities for all supported Victron devices on your system. The exact entities available depend on your specific Victron hardware configuration.
The Victron GX integration provides the following types of entities:
Sensors
Read-only sensors for monitoring system metrics, such as:
Battery voltage, current, power, temperature, and state of charge
Solar panel voltage, current, power, and daily yield
Grid voltage, current, power, and energy consumption
Inverter input and output power, frequency, and state
EV charger status, power, and session energy
Binary sensors
Status indicators for various system states, such as:
Alarms and warnings
Connection status
Relay states
Numbers
Adjustable numeric settings for fine-tuning device parameters, such as:
Battery charge current limits
Grid setpoint for ESS
Minimum state of charge limits
EV charger current limits
Selects
Configurable options for controlling device behavior, such as:
Inverter mode (on, off, charger only, inverter only)
Solar charger mode
Relay function configuration
EV charger charge mode (auto, manual, or scheduled charge)
ESS mode (optimized with or without phase compensation, or external control)
DESS mode (auto/VRM, buy, sell, off, or Node-RED)
ESS schedule charge slot days
Device trackers
GPS-equipped Victron devices (such as those with a built-in or connected GPS module) are exposed as device tracker entities, providing:
Latitude and longitude
Altitude, course, and speed (when available)
Switches
Toggle controls for enabling or disabling device functions, such as:
EV charger start/stop
Generator auto-start and manual start
Generator quiet hours and conditional start triggers ( SoC , temperature, voltage)
ESS disable charge and disable feed-in
ESS battery-only critical loads and schedule charge slot enabled
Relay states on GX devices, Multi RS, and solar chargers
Digital input inversion and switchable output states
PV DC overvoltage feed-in
VE.Bus PowerAssist, ignore AC input, and grid lost alarm settings
Times
Configurable time-of-day settings, such as:
ESS BatteryLife schedule charge start times
Buttons
Reboot device
Description : Reboots the GX device.
The integration receives updates through MQTT push, but limits entity updates to at most once every 30 seconds. This means rapidly changing values may appear with a short delay.
You can use this automation to receive a notification when your battery state of charge drops below a certain threshold. Replace sensor.battery_soc with your actual battery charge entity.
automation : - alias : " Notify when battery is low" triggers : - trigger : numeric_state entity_id : sensor.battery_soc below : 20 actions : - action : notify.notify data : title : " Low battery warning" message : > Your Victron battery charge is at {{ states('sensor.battery_soc') }}%.
Symptom: Connection fails during setup Description
The integration cannot establish a connection to your Victron device.
Resolution
To resolve this issue, try the following steps:
Verify your Victron device is powered on and connected to your network.
Check that the hostname or IP address is correct.
Ensure that MQTT is enabled on your Victron device.
Test connectivity from Home Assistant by opening a terminal and running:
nc -zv <VICTRON_IP> <MQTT_PORT>
Replace <VICTRON_IP> with your device’s IP address and <MQTT_PORT> with the MQTT port (usually 1883 or 8883 ). If you get a timeout or error, there is a network connectivity issue.
If Venus OS is rooted (SSH access enabled):
Use port 8883
Enable SSL
Use username root
Use the password you defined to protect the instance
Symptom: Authentication error during setup Description
The credentials provided are incorrect.
Double-check the username and password if authentication is enabled.
These are device credentials configured on the Victron device, not VRM portal credentials.
Verify the security profile setting on your Victron device under Settings > General > Local Network Security Profile .
Symptom: Integration sets up but no entities are created Description
The integration cannot discover or create entities from MQTT topics.
Verify that MQTT topics are being published by your Victron device.
Check the Home Assistant logs under Settings > System > Logs for any error messages.
Ensure the MQTT service on the Victron device is running and configured correctly.
Try increasing the Elevated tracing option in the integration settings for more detailed logging.
This integration follows standard integration removal.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Cerbo GX communication centre
Victron MQTT Python library
Supported entities documentation
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Victron GX hub was introduced in Home Assistant 2026.5, and it's used by
1898 active installations.
Its IoT class is Local Push.
🏆 Platinum quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@tomer-w
Categories
Binary sensor
Button
Number
Presence detection
Select
Sensor
Switch
Time
Back to top
