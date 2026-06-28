---
source_url: "https://www.home-assistant.io/integrations/pglab"
final_url: "https://www.home-assistant.io/integrations/pglab"
canonical_url: "https://www.home-assistant.io/integrations/pglab/"
source_handle: "web:www-home-assistant-io:6bbd03e96d2e"
source_section: "integrations-pglab"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "c5582520f0f3d781790cb0b52d5075e77cf9516a6b9e4a031fdc003de22c9753"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# PG LAB Electronics - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/pglab
- Final URL: https://www.home-assistant.io/integrations/pglab
- Canonical URL: https://www.home-assistant.io/integrations/pglab/
- Fetched at: 2026-06-28T03:07:57Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate PG LAB Electronics with Home Assistant.

## Extracted Text

On this page
Supported devices
Prerequisites
Device configuration
Configuration
Supported features
Removing the integration
To remove an integration instance from Home Assistant
The PG LAB Electronics integrations Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control PG LAB Electronics devices in Home Assistant.
E-BOARD : Controller board to interface I2C devices by a local LAN connection.
E-RELAY : 8 Channels relay board controlled by I2C connection.
[E-SWITCH]: Coming soon
Each E-BOARD device can be connected to a maximum of 8 E-RELAY boards. E-BOARD can control
up to 64 relays or 32 shutters or a mixed configuration.
MQTT broker and the MQTT integration set up in Home Assistant.
PG LAB Electronics devices MQTT setting configured to communicate with the MQTT broker.
Once the device is connected to your MQTT broker, it should be discovered by Home Assistant.
Add PG LAB Electronics integration.
Configure each PG LAB Electronics devices following these steps:
Power the device and connect it to your local network.
From your router, get the IP address of your device (for example: 192.168.1.7).
Connect to the internal device web server with a web browser ( don’t use ‘https://…’, instead, connect to ‘ http://192.168.1.7 ’).
Change the default device name. Use a unique, meaningful name such as E_Board_Office, or E_Board_Garden.
Note: Every device MUST have a unique name.
Set up the MQTT broker address, port number, username, and password.
Save the configuration and restart the device.
To add the PG LAB Electronics hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select PG LAB Electronics .
Follow the instructions on screen to complete the setup.
PG LAB Electronics relays, sensors, and switches are supported.
PG LAB Relays will be added as Home Assistant switch entities.
PG LAB Shutters will be added as Home Assistant cover entities.
PG LAB Sensors will be added as Home Assistant sensor entities.
The integration will also create diagnostic status sensors, with device different information.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The PG LAB Electronics hub was introduced in Home Assistant 2025.3, and it's used by
4 active installations.
Its IoT class is Local Push.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@pglab-electronics
Categories
Cover
Sensor
Switch
Back to top
