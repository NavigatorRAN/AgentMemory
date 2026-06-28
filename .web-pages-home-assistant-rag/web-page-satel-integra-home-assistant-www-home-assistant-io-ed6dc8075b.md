---
source_url: "https://www.home-assistant.io/integrations/satel_integra"
final_url: "https://www.home-assistant.io/integrations/satel_integra"
canonical_url: "https://www.home-assistant.io/integrations/satel_integra/"
source_handle: "web:www-home-assistant-io:ed6dc8075bd4"
source_section: "integrations-satel-integra"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "22d7fb94397f5c762e3112fb3bf09585f4728f8c2ed460d0f9c50101ef33d507"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Satel Integra - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/satel_integra
- Final URL: https://www.home-assistant.io/integrations/satel_integra
- Canonical URL: https://www.home-assistant.io/integrations/satel_integra/
- Fetched at: 2026-06-28T03:13:43Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate a Satel Integra alarm panel with Home Assistant using an ETHM network extension from Satel.

## Extracted Text

On this page
Supported devices
Prerequisites
Configuration
Configuring partitions, zones, and outputs
Removing the integration
To remove an integration instance from Home Assistant
The Satel Integra integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to connect your Satel Integra alarm system to Home Assistant to control and monitor your alarm system.
There is currently support for the following device types within Home Assistant:
Binary sensor: Reports on zone or output statuses
Switch: allows for setting states of selected outputs
Alarm control panel: represents the zones (in Polish: “strefa”). Reports its status, and can be used to arm/disarm the partition
Sensor: Reports zone temperatures for zones that have temperature support
The module communicates via Satel’s open TCP protocol published on their website. It subscribes for new events coming from alarm system and reacts to them immediately.
The integration only supports the ETHM-1 Plus , with firmware version 2.00 or greater. Only the Integra line of alarm systems is supported.
Open the DLOADX installer program.
Open your existing project file.
Open the System and hardware structure tab.
Navigate to the Hardware section, expand the tree and select the ETHM-1 Plus module.
Select the Integration checkbox.
Configure encryption:
If you want to use an unencrypted connection, clear the Encrypted integration checkbox.
If you want to use an encrypted connection, select the Encrypted integration checkbox and note the
integration encryption key you configured in the Keypads module from the navigation tree.
Note
If you do not have access to the DLOADX program or your project file, ask your installer to adjust the settings for you.
To add the Satel Integra device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Satel Integra .
Follow the instructions on screen to complete the setup.
Host
The IP address of the Satel Integra ETHM module.
Port
The port on which the ETHM module listens for clients using the integration protocol.
Integration encryption key
Encryption key to use if an encrypted connection is used, as configured in DLOADX for the ETHM-1 Plus module. Leave empty if not using an encrypted connection.
Code
Optional code that will be used to toggle switchable outputs.
After setting up the connection details, you can configure partitions, zones, and outputs as Subentries on the Satel Integra integration page.
A list of all partition, zone, and output IDs can be acquired by running the DLOADX program and connecting to your alarm.
To create the respective entities, select the Add partition , Add zone , Add output , or Add switchable output buttons. Follow the instructions in the UI to set up the individual entities.
Result : Each partition will have its own alarm panel. Each zone and output will have a binary sensor, and a switch will be created for each switchable output. Sensors will be created for each zone that has temperature sensor support enabled.
Having configured the zones and the outputs, you can use them for automation, such as to react on the movement in your bedroom.
For example:
alias : " Flick the input switch when movement in bedroom detected" triggers : - trigger : state entity_id : " binary_sensor.bedroom" to : " on" actions : - action : input_boolean.turn_on target : entity_id : input_boolean.movement_detected
This integration follows standard integration removal. Once the integration is removed, consider disabling the communication ability to the ETHM-1 Plus module using DLOADX to reduce security risks.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Satel Integra device was introduced in Home Assistant 0.54, and it's used by
803 active installations.
Its IoT class is Local Push.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@Tommatheussen
Categories
Alarm
Binary sensor
Hub
Sensor
Switch
Back to top
