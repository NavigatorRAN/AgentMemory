---
source_url: "https://www.home-assistant.io/integrations/intellifire"
final_url: "https://www.home-assistant.io/integrations/intellifire"
canonical_url: "https://www.home-assistant.io/integrations/intellifire/"
source_handle: "web:www-home-assistant-io:66fade457a2a"
source_section: "integrations-intellifire"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "1ba7b69e8d2158882dec7c5be4c00df5de127122e3977ff5108a69d8cb9e46ba"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# IntelliFire - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/intellifire
- Final URL: https://www.home-assistant.io/integrations/intellifire
- Canonical URL: https://www.home-assistant.io/integrations/intellifire/
- Fetched at: 2026-06-28T02:52:41Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on the IntelliFire Fireplace integration for Home Assistant.

## Extracted Text

On this page
Configuration
Configuration options
API credentials
Entities
Switch
Fan
Climate
Light
Number
Sensor Types
Binary sensors
Sensor
Diagnostic Sensors
Troubleshooting
IntelliFire Wi-Fi fireplace modules provide app-based and Alexa control to various fireplaces. The modules do expose an unencrypted HTTP endpoint on the network that provides status information. This integration will read that URL and create a set of sensors displaying the current fireplace state.
To add the IntelliFire device to your Home Assistant instance, use this My button:
IntelliFire can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select IntelliFire .
Follow the instructions on screen to complete the setup.
After the integration is set up, you can configure how it communicates with your fireplace. Go to Settings > Devices & services , select the IntelliFire integration, and select Configure .
The integration provides the following configuration options:
Read data from
Select whether to read fireplace status data from the local network or from the cloud. Local reads directly from the fireplace on your network, while Cloud reads from IntelliFire’s servers.
Send commands to
Select whether to send control commands through the local network or through the cloud. Local sends commands directly to the fireplace on your network, while Cloud routes commands through IntelliFire’s servers.
Tip
Some people find that their fireplace hardware prioritizes cloud communication and may experience timeouts with local control. If you encounter connectivity issues, try switching to Cloud for the affected endpoint.
To fully configure the IntelliFire integration you will need to enter your IntelliFire credentials which are the same ones you would use with the mobile app.
The following controllable entities are available:
Flame - Turn fireplace on/off.
Pilot Light - Turn pilot light on/off.
If your unit is equipped with a fan - this entry will be present. There are 5 possible fan control values:
0% - Off
25% - Quiet
50% - Low
75% - Medium
100% - High
Thermostat - This entity will be present if your unit has thermostatic control.
The integration provides a light entity if the unit is equipped with lights.
The integration uses a Number entity to control flame height. Valid flame height vales are 1-5 .
The following sensors are available as a binary sensor when dealing with on/off.
Flame Sensor : Whether the fire is on.
Pilot Light Sensor : Whether the pilot light is turned on.
Timer Sensor : Whether the sleep timer is turned on.
Thermostat Sensor : Whether the thermostat is turned on.
Flame Height : Numerical indicator of flame height, where 1 is the lowest setting and 5 is the highest setting.
Temperature : Current ambient temperature as read by the fireplace remote.
Target Temperature : If the thermostat is engaged this is the target temperature the fireplace will try to reach, as measured by the remote.
Fan Speed : Numerical indicator of fan speed.
Timer End Time : If the sleep timer is enabled, this is time it will finish.
Connection Quality - Local network connection quality (disabled by default) .
Downtime - Unit downtime. Will read Unknown if there is currently no downtime.
ECM Latency - Electronic Control Module Latency value (disabled by default) .
IP - IP Address of the unit.
Uptime - Unit uptime.
Errors - Error status (see below)
Binary Error Sensors
The following is a description of the various diagnostic error sensors and what they mean:
The following details the various error states and the descriptions associated with them in the IntelliFire Android application.
Accessory - Your appliance has detected that an AUX port or accessory is not functional. Please contact your dealer and report this issue.
Disabled - Appliance Safely Disabled: Your appliance has been disabled. Please contact your dealer and report this issue.
ECM Offline - ECM is offline.
Fan - Fan Error. Your appliance has detected that an accessory is not functional. Please contact your dealer and report this issue.
Fan Delay - Fan Information: Fan will turn on within 3 minutes. Your appliance has a built-in delay that prevents the fan from operating within the first 3 minutes of turning on the appliance. This allows the air to be heated before circulation.
Flame - Pilot Flame Error. Your appliance has been safely disabled. Please contact your dealer and report this issue.
Lights - Lights Error. Your appliance has detected that an accessory is not functional. Please contact your dealer and report this issue.
Maintenance - Maintenance: Your appliance is due for a routine maintenance check. Please contact your dealer to ensure your appliance is operating at peak performance.
Offline - Your appliance is currently offline.
Pilot Flame - Pilot Flame Error: Your appliance has been safely disabled. Please contact your dealer and report this issue.
Soft Lock Out - Sorry your appliance did not start. Try again by pressing Flame ON.
The IFT module can suffer a variety of issues that will render it inoperable. Some of these have been confirmed by the manufacturer and some appear to be random. There are two paths to try when attempting to reset the module:
Enabling Debugging
To turn on debug logging modify your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file in the /config directory and add the following:
logger : logs : homeassistant.components.intellifire : debug intellifire4py : debug
Issue a Soft Reset
There is a debug web interface available at iftapi.net/webaccess . From here you can log in and then navigate to your individual fireplace unit and issue a Soft Reset as follows:
In some cases, this will restore control to the fireplace, but if it doesn’t you are best to try the following method.
Power Cycle
The sure fire way to reset the IFT module is to just power-cycle it. This will work just about every time.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The IntelliFire device was introduced in Home Assistant 2022.2, and it's used by
111 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@jeeftor
Categories
Binary sensor
Back to top
