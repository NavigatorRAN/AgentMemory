---
source_url: "https://www.home-assistant.io/integrations/motionblinds_ble"
final_url: "https://www.home-assistant.io/integrations/motionblinds_ble"
canonical_url: "https://www.home-assistant.io/integrations/motionblinds_ble/"
source_handle: "web:www-home-assistant-io:3eb08b515460"
source_section: "integrations-motionblinds-ble"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "7d360a67110f30c1665d480201f431c0e74fa68859bdd0fdd6dea7e25f054482"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Motionblinds Bluetooth - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/motionblinds_ble
- Final URL: https://www.home-assistant.io/integrations/motionblinds_ble
- Canonical URL: https://www.home-assistant.io/integrations/motionblinds_ble/
- Fetched at: 2026-06-28T03:01:15Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Motionblinds Bluetooth motors into Home Assistant.

## Extracted Text

On this page
Configuration
Setup
Entities
Actions
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] adds support for Motionblinds Bluetooth motors. Want to motorize your existing blinds? This can be done with Motionblinds motor CMD-03. Made-to-measure window coverings with Motionblinds are available through a worldwide reseller network.
Beware that this integration does not work with Eve Motionblinds motors. Eve Motionblinds can be added to Home Assistant using the HomeKit Device integration or the Matter integration.
To add the Motionblinds Bluetooth device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Motionblinds Bluetooth .
Follow the instructions on screen to complete the setup.
During the setup of a Motionblinds Bluetooth motor, you will be asked what kind of blind you have. There are 8 different blind types:
Roller blind : can change position and speed.
Honeycomb blind : can change position and speed.
Roman blind : can change position and speed.
Venetian blind : can change position, tilt, and speed.
Venetian blind (tilt-only) : can change tilt and speed.
Double Roller blind : can change position, tilt, and speed.
Curtain blind : can change position. May need to be calibrated if the end positions are lost, which can be done by using the open/close cover button or the set cover position slider. This will trigger a calibration which will first make the curtain find the end positions after which it will run to the position as indicated by the command that was given.
Vertical blind : can change position and tilt. May need to be calibrated if the end positions are lost, which must be done using the Motionblinds Bluetooth app.
The following entities are available for a Motionblinds Bluetooth device:
Cover entity: depending on the blind that was chosen during the setup, this entity has a slider that makes it possible to change position and tilt, and buttons that allow you to open the blind, close the blind, tilt it open, tilt it closed and stop it.
Button entities:
Connect button: allows you to connect to the blind.
Disconnect button: allows you to disconnect the blind.
Favorite button: allows you to move the blind to the favorite position.
Select entities:
Speed select: allows you to change the speed of the motor to low, medium, or high. Available for all blinds except curtain blinds and vertical blinds.
Sensor entities:
Battery sensor: shows the battery percentage. The icon also reflects whether the motor is currently charging and/or whether the motor is wired and, therefore, does not have a battery.
Calibration sensor: shows whether the blind is still calibrated. The motor can move to an uncalibrated state when it has been moved to a different position while not powered. This sensor is available for curtain blinds and vertical blinds, as these can be moved while not powered.
Connection sensor: shows whether the blind is connected, disconnected, connecting, or disconnecting.
Signal strength sensor: shows the signal strength in dBm.
Since Motionblinds Bluetooth motors require a Bluetooth connection to control them, Home Assistant does not get automatic updates of the motor’s state by default. Therefore, you can use the homeassistant.update_entity action on any entity belonging to a Motionblinds Bluetooth device, which will connect to your Motionblinds Bluetooth motor and update the state of all entities belong to that device. However, be aware that doing so may impact battery life.
This can also be automated using a YAML automation. For instance, the following automation connects to your Motionblind every 24 hours to update its state in Home Assistant:
alias : " Motionblinds Bluetooth polling automation" triggers : - trigger : time_pattern hours : " /24" actions : - action : homeassistant.update_entity target : entity_id : cover.motion_shade
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Motionblinds Bluetooth device was introduced in Home Assistant 2024.4, and it's used by
221 active installations.
Its IoT class is Assumed State.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@LennP
@jerrybboy
Categories
Cover
Back to top
