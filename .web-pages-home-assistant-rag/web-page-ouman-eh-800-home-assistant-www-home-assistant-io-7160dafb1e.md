---
source_url: "https://www.home-assistant.io/integrations/ouman_eh_800"
final_url: "https://www.home-assistant.io/integrations/ouman_eh_800"
canonical_url: "https://www.home-assistant.io/integrations/ouman_eh_800/"
source_handle: "web:www-home-assistant-io:7160dafb1e8b"
source_section: "integrations-ouman-eh-800"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "99e44ef76016eeb7f3296aba7aa50bf8862cecd27deb269ef60e45e0c6f0768f"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Ouman EH-800 - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/ouman_eh_800
- Final URL: https://www.home-assistant.io/integrations/ouman_eh_800
- Canonical URL: https://www.home-assistant.io/integrations/ouman_eh_800/
- Fetched at: 2026-06-28T03:06:51Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate the Ouman EH-800 heating controller with Home Assistant.

## Extracted Text

On this page
Supported devices
Prerequisites
Configuration
Configuration parameters
Supported functionality
Climate entities
Number entities
Select entities
Sensors
Valve entities
Data updates
Removing the integration
To remove an integration instance from Home Assistant
Related links
The Ouman EH-800 integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] integrates the Ouman EH-800 heating controller with Home Assistant. It allows you to monitor and control your EH-800 device directly from Home Assistant over your local network.
The Ouman EH-800 is a heating controller used for water-based central heating systems. It supports up to two heating circuits (H1 and H2) with control curves based on the outside temperature.
The following devices are supported by this integration:
Ouman EH-800
The Ouman EH-800B is not supported as it does not have network connectivity.
Before setting up the Ouman EH-800 integration, make sure:
Your Ouman EH-800 controller is connected to your local network.
The device has a reachable IP address, subnet mask, and a configured username and password. Refer to the device manual for setup instructions.
The device’s web interface ( http://<ip_address>:<port> ) is reachable from Home Assistant.
Warning
The Ouman EH-800 only supports unencrypted HTTP and does not adhere to modern security standards. In addition, the device exposes all of its values to anyone who can reach it over the network. Authentication is not required for read operations, only for writes. Keep the device on your local network only. Exposing the device directly to the internet is strongly discouraged .
To add the Ouman EH-800 device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Ouman EH-800 .
Follow the instructions on screen to complete the setup.
URL
The URL of the Ouman EH-800 web interface, for example http://192.168.1.100 .
Username
The username configured on the Ouman EH-800 device.
Password
The password configured on the Ouman EH-800 device.
The integration creates one Ouman EH-800 device for the controller and one sub-device for each active heating circuit. Sub-devices are named Heating circuit 1 and Heating circuit 2 (referred to as H1 and H2 throughout this document and on the controller), with the circuit name configured on the controller appended when available (for example, Heating circuit 1 Radiator heating ). Climate, number, select, sensor, and valve entities are assigned to the device they belong to.
The integration exposes one climate entity per active heating circuit that has a room sensor installed. The entity reports the room temperature and lets you adjust the room temperature setpoint.
The HVAC mode shown on the climate card reflects the heating circuit’s operation mode: Heat when the controller is running a mode that uses the room temperature setpoint, Off otherwise. The three heating sub-modes that use the setpoint ( Auto , Temperature drop , Big temperature drop ) are exposed as Preset mode . Switching the HVAC mode to Heat defaults the preset mode to Auto .
The HVAC action reflects the current heating status: Heating when the mixing valve is open, Idle when it is closed, Off when the circuit isn’t using the setpoint.
Note
Operation modes other than the three heat sub-modes (for example Nominal temperature and Manual valve control ) ignore the room temperature setpoint. The climate entity reports Off for those modes. Use the operation mode select entity to switch the circuit into one of those modes.
The integration exposes number entities for the device’s configurable numeric setpoints. The exact set depends on which features and circuits are active on your device.
Enabled by default (categorized as configuration):
H1/H2 Water out minimum/maximum temperature : Lower and upper limits for the supply water temperature.
H1/H2 Curve -20°C / -10°C / 0°C / 10°C / 20°C temperature : Supply water temperatures at each outside-temperature point on the heating curve. The set of points depends on whether the controller is configured for a 3-point or 5-point curve.
H1/H2 Temperature drop , Big temperature drop : Offsets applied to the target when an automatic reduction is active.
H1/H2 Room temperature fine tuning : Manual offset for the room temperature target.
H1 Constant temperature setpoint (only when the heating mode is constant-temperature controller): The target supply water temperature.
Disabled by default (see enabling or disabling entities ):
Trend sampling interval (on the main device): The polling interval used by the controller’s trend recorder, in seconds.
The integration exposes select entities for the device’s mode controls. The exact set depends on which features are active on your device:
Home/Away mode (on the main device): Switch between Home , Away , and Off .
H1/H2 Operation mode (on each heating circuit): Switch between Auto , Temperature drop , Big temperature drop , Nominal temperature , Standby , and Manual valve control .
Relay control (on the main device, when the relay is configured for temperature, temperature-difference, H1 valve position, or time-program modes): Switch between Auto , On , and Off .
Pump summer stop (on the main device, when the relay is configured for pump summer stop mode): Switch between Auto , Stop , and Run .
The exact set of sensors depends on which features and circuits are active on your device. Sensors enabled by default include:
Outside temperature : The outside temperature measured by the controller.
H1/H2 supply water temperature : The current supply water temperature for the heating circuit.
H1/H2 supply water temperature setpoint : The target supply water temperature calculated by the controller.
H1/H2 valve position : The current position of the mixing valve, in percent.
H1/H2 room temperature : The room temperature measured by the room sensor (when installed).
H1/H2 room temperature setpoint : The target room temperature.
Additional diagnostic sensors are exposed but disabled by default. See enabling or disabling entities to enable them if needed:
H1/H2 curve supply water temperature : The supply water temperature derived from the heating curve.
H1/H2 delayed room temperature : A smoothed/delayed room temperature reading.
H1 fine adjustment effect : The temperature offset from the manual fine-adjustment.
H1 room sensor potentiometer : The room temperature offset from the room sensor’s adjustment knob.
H2 delayed outdoor temperature effect : The delayed outdoor temperature effect applied to the H2 setpoint.
The integration exposes one valve entity per active heating circuit for the mixing valve:
H1/H2 Valve position setpoint : The mixing valve position, in percent.
The valve setpoint only affects the device when the corresponding heating circuit is in manual valve control mode. In other operation modes, the controller calculates the valve position automatically and the setpoint has no effect.
This integration uses local polling Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] to fetch data from the Ouman EH-800 controller every 60 seconds.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Ouman EH-800 manufacturer website
Ouman EH-800 user manual
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Ouman EH-800 device was introduced in Home Assistant 2026.6, and it's used by
7 active installations.
Its IoT class is Local Polling.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@Markus98
Categories
Climate
Number
Select
Sensor
Valve
Back to top
