---
source_url: "https://www.home-assistant.io/integrations/vera"
final_url: "https://www.home-assistant.io/integrations/vera"
canonical_url: "https://www.home-assistant.io/integrations/vera/"
source_handle: "web:www-home-assistant-io:f9b47be092dc"
source_section: "integrations-vera"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "097a666b6697d659d18b79f58163d5bb14ec6e3b32e509bc1a2b2996a4699d21"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Vera - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/vera
- Final URL: https://www.home-assistant.io/integrations/vera
- Canonical URL: https://www.home-assistant.io/integrations/vera/
- Fetched at: 2026-06-28T03:26:21Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up Vera Z-Wave hubs and configure devices within Home Assistant.

## Extracted Text

On this page
Configuration
Options
Using Z-Wave devices in automation
Sensor
The Vera hub is a controller mainly for connecting to Z-Wave devices.
The supported Vera hubs (Edge, Plus and Secure) are no longer available and the firmware is not being actively enhanced by the vendor. New Z-Wave devices are not directly supported and so are not easy to add to the platform.
The newer Ezlo hubs use a different firmware and are not supported by this integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] .
Z-Wave JS is a better choice for new Z-Wave users or for users wanting support for new Z-Wave devices.
There is currently support for the following device types within Home Assistant:
Binary sensor
Cover
Light
Lock
Scene
Switch
Climate
and will be automatically added when HA connects to your Vera controller.
To add the Vera hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Vera .
Follow the instructions on screen to complete the setup.
Important
Ensure the protocol and port are added to the Controller URL . For example http://192.168.1.1:3480 .
Tip
It is recommended to assign a static IP address to your Vera Controller. This ensures that it won’t change IP addresses, so you won’t have to change the vera_controller_url if it reboots and comes up with a different IP address. See your router’s manual for details on how to set this up. If you need the MAC address of your Vera, check the label on the bottom.
Once the Vera integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] is configured, you can set additional options in the integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] , click the gear icon.
Vera switch device - By default your switches will be added to Home Assistant as switches, however, if some of them are light switches, you can tell Home Assistant this by providing a list of light ids.
Vera device ids to exclude - Vera imports detailed Z-Wave devices into Home Assistant. This can include system devices and other devices that you don’t use; you can tell Home Assistant not to load these devices by providing a list of device ids.
You can find the Vera device id either via the advanced properties of the device in the Vera UI or by checking the Vera Device Id attribute on each device imported into Home Assistant (under the developer tools).
If you want to use a Z-Wave device from the Vera controller in Home Assistant automation, you’ll need the entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] id. In the Home Assistant UI you’ll find all entities listed under Settings > Developer tools > States . Look for entities that contain ‘Vera Device Id’ in their attributes, and you’ll find the entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] id on the left.
The vera platform allows you to get data from your Vera sensors from within Home Assistant.
Some Vera sensors (such as motion and flood sensors) are armable which means that Vera will send alerts (email messages to txts) when they are armed and change state.
Home Assistant will display the state of these sensors regardless of the armed state.
To allow you to change the armed state - Home Assistant will create a switch as well as a sensor for each Armable sensor.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Vera hub was introduced in Home Assistant pre 0.7, and it's used by
382 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Hub
Back to top
