---
source_url: "https://www.home-assistant.io/integrations/scsgate"
final_url: "https://www.home-assistant.io/integrations/scsgate"
canonical_url: "https://www.home-assistant.io/integrations/scsgate/"
source_handle: "web:www-home-assistant-io:dd4dfc0224c9"
source_section: "integrations-scsgate"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "025fe9616a09afb3e1829824f7a3558d92b5026a94ff82f418bcc0011e1acc9c"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# SCSGate - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/scsgate
- Final URL: https://www.home-assistant.io/integrations/scsgate
- Canonical URL: https://www.home-assistant.io/integrations/scsgate/
- Fetched at: 2026-06-28T03:14:11Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate SCSGate into Home Assistant.

## Extracted Text

On this page
How to find the scs_id for your devices
Cover
Light
Switch
Related topics
The SCSGate integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] support the SCSGate device. This a home-brew device allows you to interact with the MyHome system from BTicino/Legrande.
There is currently support for the following device types within Home Assistant:
To enable SCSGate in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry scsgate : device : PATH_TO_DEVICE
Configuration Variables
Looking for your configuration file?
device string Required
The path to your device, e.g., /dev/ttyACM0 .
The SCSGate integration relies on the scsgate Python module.
This module provides also a command line tool called scs-monitor . This program can be used to find the IDs of your lights, switches and roller shutters and produce the YAML snippet to insert into your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
For more information checkout this section of scsgate ’s documentation.
The SCSGate devices can control motorized covers connected to the BTicino MyHome system.
To enable SCSGate covers in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry cover : - platform : scsgate devices : living_room : name : Living Room scs_id : XXXXX
devices list Required
A list of devices.
slug list Required
Slug of the device.
name string Required
Name to use in the frontend.
scs_id string Required
The ID of your SCSGate device.
Note
Known limitation: It is not possible to know the current state of the cover.
The SCSGate device can control lights of the BTicino MyHome system.
To enable SCSGate lights in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry light : - platform : scsgate devices : living_room : name : Living Room scs_id : XXXXX
A list of devices with their name to use in the frontend.
The SCSGate device can control switches of the BTicino MyHome system.
To enable SCSGate switches in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry switch : - platform : scsgate devices : living_room : scs_id : XXXXX
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The SCSGate integration was introduced in Home Assistant 0.13, and it's used by
0 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Hub
Back to top
