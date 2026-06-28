---
source_url: "https://www.home-assistant.io/integrations/qbus"
final_url: "https://www.home-assistant.io/integrations/qbus"
canonical_url: "https://www.home-assistant.io/integrations/qbus/"
source_handle: "web:www-home-assistant-io:e9a5d0fcef82"
source_section: "integrations-qbus"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "d0044eb75bf6b19c378b0db13d1a076df46fd62df3697e49c1c063cb5fe43900"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Qbus - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/qbus
- Final URL: https://www.home-assistant.io/integrations/qbus
- Canonical URL: https://www.home-assistant.io/integrations/qbus/
- Fetched at: 2026-06-28T03:10:22Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate your Qbus installation with Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Supported devices
Available entities
Removing the integration
To remove an integration instance from Home Assistant
Data updates
Examples
Automation to activate Qbus scene
Qbus scene triggers media player
Known limitations
Troubleshooting
Can’t set up the device
The Qbus integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to integrate your Qbus Control into Home Assistant. Qbus is a Belgian manufacturer of Home Automation systems.
This integration communicates with a Qbus controller over an MQTT server.
The controllers cannot communicate directly with MQTT. Therefore, you need to install the Qbus gateway before enabling this integration. The Qbus gateway is a software tool that runs on all Linux platforms. It can be installed by running a script or a Docker container. For detailed instructions, please refer to the Qbus MQTT Gateway documentation .
For information on setting up Home Assistant with a Qbus controller, refer to the Qbus documentation . The documentation is currently only available in Dutch, but translations are planned for the future.
Once the Qbus controller is connected to the MQTT server, you need to set up an MQTT client in Home Assistant to enable communication between Home Assistant and your Qbus system. This client should connect to the same MQTT Server as your Qbus controller. For detailed instructions, refer to the MQTT integration documentation .
To add the Qbus hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Qbus .
Follow the instructions on screen to complete the setup.
There is currently support for the following Qbus products within Home Assistant:
CTD01E to CTD03E (CTD 3.0) : main controllers (yellow).
CTD10 to CTDMax (CTD 3.5) : main controllers (black).
Binary sensor : display values from weather stations and controller information.
Climate : manage thermostats by setting temperature and choosing presets.
Cover : operate covers with support for actions like open, close, stop, position adjustment, and tilt — depending on your setup.
Light : control dimmer lights, allowing both on/off functionality and brightness adjustment.
Scene : activate predefined scenes.
Select : select stepper values.
Sensor : display sensor values from devices like gauges, humidity sensors, thermostats, ventilation, and weather stations.
Switch : toggle on/off outputs.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
All data from Qbus entities are pushed to Home Assistant over MQTT.
This automation will activate the Watching TV Qbus scene when turning on your TV.
Replace media_player.my_tv with your TV entity and scene.ctd_000001_watching_tv with your Qbus scene entity.
alias : Activate TV scene when turning on TV description : " " mode : single triggers : - entity_id : - media_player.my_tv from : " off" to : " on" trigger : state conditions : [] actions : - target : entity_id : scene.ctd_000001_watching_tv metadata : {} alias : Activate TV scene action : scene.turn_on data : {}
Automations can also be triggered by Qbus scenes. The following automation will play the Home Assistant Homies playlist on the media player in the living room.
An extra condition has been added to make sure the automation is not triggered when Home Assistant reboots or when the integration reloads.
Replace scene.ctd_111111_play_music with your Qbus scene entity id, media_player.living_room with your media player entity id, and fill in the data element as desired.
alias : Play music in living room description : " " mode : single triggers : - trigger : state entity_id : - scene.ctd_111111_play_music from : null to : null conditions : - condition : template value_template : >- {{ trigger.from_state is not none and trigger.from_state.state not in ['unavailable', 'unknown'] and trigger.to_state is not none and trigger.to_state.state not in ['unavailable', 'unknown'] }} actions : - action : media_player.play_media alias : Play media target : entity_id : media_player.living_room data : enqueue : replace media_content_id : Home Assistant Homies media_content_type : playlist
The integration does not provide a way to update the firmware on the devices. This can only be done with the configuration software System Manager.
Symptom: “No devices are discovered”
When trying to set up the integration, no devices are discovered.
Description
This means that the integration did not receive a valid configuration from the gateway.
Resolution
To resolve this issue, try the following steps:
Make sure your controller is online and not connected to System Manager.
Make sure you have an MQTT broker running.
Make sure that the gateway software is up and running (see Prerequisites ) and connected to the broker.
Make sure you have an MQTT client integration (see Prerequisites ) connected to the broker.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Qbus hub was introduced in Home Assistant 2025.2, and it's used by
79 active installations.
Its IoT class is Local Push.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@Qbus-iot
@thomasddn
Categories
Binary sensor
Climate
Cover
Hub
Light
Scene
Select
Sensor
Switch
Back to top
