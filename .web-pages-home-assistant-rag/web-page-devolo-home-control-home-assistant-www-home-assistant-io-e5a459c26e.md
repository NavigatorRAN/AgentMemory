---
source_url: "https://www.home-assistant.io/integrations/devolo_home_control"
final_url: "https://www.home-assistant.io/integrations/devolo_home_control"
canonical_url: "https://www.home-assistant.io/integrations/devolo_home_control/"
source_handle: "web:www-home-assistant-io:e5a459c26e8d"
source_section: "integrations-devolo-home-control"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "0c227419e53e53fa16aad52fcad5c7870f511feb628afc2a76b0f91368dfdd4c"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# devolo Home Control - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/devolo_home_control
- Final URL: https://www.home-assistant.io/integrations/devolo_home_control
- Canonical URL: https://www.home-assistant.io/integrations/devolo_home_control/
- Fetched at: 2026-06-28T02:37:01Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate devolo Home Control with Home Assistant.

## Extracted Text

On this page
Configuration
Supported devices and functions
Switches
Binary sensors
Cover
Climate
Lights
Sensor
Siren
Known limitations
Removing the integration
To remove an integration instance from Home Assistant
There is an active alert for this integration!
LEARN MORE
devolo Home Control is a Z-Wave ecosystem with a Z-Wave to IP gateway in the center. The integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control devices connected to the gateway.
To add the devolo Home Control hub to your Home Assistant instance, use this My button:
devolo Home Control can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select devolo Home Control .
Follow the instructions on screen to complete the setup.
Email / mydevolo ID
Email address you used to register the central unit at mydevolo.
Password
Password of your mydevolo account.
Note
Your mydevolo account is only used to acquire local credentials. Afterward, communication is completely local as long as the gateway is within the same network.
The integration provides support for the following Z-Wave devices:
devolo Metering Plug v1
devolo Metering Plug v2
devolo Switch FM
Qubino Flush 1 Relay
Qubino Flush 1D Relay
Fibaro Wall Plug
Fibaro Double Relay Switch
devolo Door/Window Contact
devolo Flood Sensor
devolo Key-Fob Switch
devolo Motion Sensor
devolo Smoke Detector
devolo Wall Switch
Fibaro Floor Sensor
Fibaro Motion Sensor
Fibaro Smoke Sensor
The integration provides support for the following features:
Overload alarm sensor of various switches
Sensors I2 and I3 of devolo and Qubino flush mounted relays
devolo Shutter FM
Qubino Flush Shutter
devolo Radiator Thermostat
Danfoss Living Connect Z Radiator Thermostat
devolo Dimmer FM
Qubino Flush Dimmer
Temperature and brightness of devolo Sensors, that support it
Consumptions of devolo and Qubino devices, that support it
Voltage of devolo Metering Plug v2
devolo Siren
Device addition and removal are not supported by this integration as the local API rejects these operations.
To add or remove devices, please use the devolo Home Control app or the web interface.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The devolo Home Control hub was introduced in Home Assistant 0.110, and it's used by
64 active installations.
Its IoT class is Local Push.
🥈 Silver quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@2Fake
@Shutgun
Categories
Binary sensor
Light
Switch
Back to top
