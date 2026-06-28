---
source_url: "https://www.home-assistant.io/integrations/panasonic_viera"
final_url: "https://www.home-assistant.io/integrations/panasonic_viera"
canonical_url: "https://www.home-assistant.io/integrations/panasonic_viera/"
source_handle: "web:www-home-assistant-io:c891e5ff76c3"
source_section: "integrations-panasonic-viera"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "f5ba2cf8e4b22dd2bab5ef7ccd6ec92fc43a9293d3df7b155badfb9dbdad7594"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Panasonic Viera - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/panasonic_viera
- Final URL: https://www.home-assistant.io/integrations/panasonic_viera
- Canonical URL: https://www.home-assistant.io/integrations/panasonic_viera/
- Fetched at: 2026-06-28T03:07:21Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate a Panasonic Viera TV with Home Assistant.

## Extracted Text

On this page
Configuration
Manual configuration
Example turn_on_action
Example play_media script
Remote
Currently known supported models
Related topics
The Panasonic Viera integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control a Panasonic Viera TV.
There is currently support for the following device types within Home Assistant:
Media player
To add the Panasonic Viera device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Panasonic Viera .
Follow the instructions on screen to complete the setup.
If your TV needs to be paired, you will be prompted to type the PIN code that will be displayed on it.
To allow your TV to be turned on or controlled while off, enable Powered On By Apps in your settings (if available): Network > TV Remote App Settings
If you prefer to use YAML to set up your Panasonic Viera TV, you can still do it. It also allows for some extra settings.
To enable the integration via YAML, add it to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry panasonic_viera : host : YOUR_TV_IP
Configuration Variables
Looking for your configuration file?
host string Required
The IP address of your Panasonic Viera TV, e.g., 192.168.1.10 .
name string ( Optional , default: Panasonic Viera TV )
The name you would like to give to the TV entity.
port integer ( Optional , default: 55000 )
The port number of your Panasonic Viera TV.
turn_on_action list ( Optional )
Defines an action to turn the TV on. If not specified, a power key signal will try to be sent to the TV. Be aware that it might not work properly with some models.
When you restart Home Assistant, make sure the TV is turned on and connected to your local network. If your TV needs to be paired, you’ll need to go to Settings > Devices & services to type the PIN code that will be displayed on it and finish the setup.
This example uses a turn_on_action , to turn on the TV using a magic wake on
LAN packet. This example requires the Wake on LAN
integration to be set up.
# Example turn_on_action configuration.yaml entry with Wake-on-LAN panasonic_viera : host : YOUR_TV_IP name : Living Room TV turn_on_action : - action : wake_on_lan.send_magic_packet data : mac : " AA:BB:CC:DD:99:1A"
The play_media function can be used to open web pages and other media types (images, movies) via URLs in the TV web browser.
# Example play_media script script : front_door_camera : alias : " Show who's at the door" sequence : - action : media_player.turn_on target : entity_id : media_player.living_room_tv - action : media_player.play_media target : entity_id : media_player.living_room_tv data : media_content_type : " url" media_content_id : YOUR_URL - delay : seconds : 5 - action : media_player.media_stop target : entity_id : media_player.living_room_tv
When the integration is configured, two entities will be created: a media_player and a remote . The remote allows you to send key commands to your TV with the remote.send_command action.
Some of the known valid key values are:
up
down
left
right
enter
home
back
power
The list with all known valid keys can be found here . Additionally, you can also send custom commands, such as "NRC_HOME-ONOFF" (which is the same as home ). Further undocumented commands are "NRC_HDMI1-ONOFF" , "NRC_HDMI2-ONOFF" , "NRC_HDMI3-ONOFF" and "NRC_HDMI4-ONOFF" for selecting HDMI inputs and "NRC_NETFLIX-ONOFF" , "NRC_APPS-ONOFF" , “ NRC_MYAPP-ONOFF ” for apps.
TC-P50ST50
TC-P55ST50
TC-P60S60
TC-P60ST50 (can’t power on)
TC-P65VT30
TH-32ES500
TH-P60ST50A (can’t power on)
TX-32AS520E
TX-32DSX609
TX-40CXE720
TX-40DX600
TX-40DX700B
TX-42AS650
TX-49DX650B
TX-49FXW654
TX-50DX700B
TX-55ASM655
TX-55ASW654
TX-55CS630E (can’t power on)
TX-55CX680B
TX-55CX700E
TX-55EXW584
TX-55EXW604S
TX-55FX680W
TX-55FZ802B
TX-55JZ1000W
TX-58AX802B
TX-58DX700B
TX-58DX800E
TX-65CX800E
TX-65EXW784
TX-65FX720W
TX-65GZ1000E
TX-L42ET50
TX-L42EW6 (can’t power on)
TX-L47ET60E (can’t power on)
TX LF37E30 (can’t power on)
TX-P42STW50
TX-P42VT30E
TX-P50GT30Y
TX-P50GT60E
TX-65HZ1000W
TX-65HZ1500
If your model is not on the list, give it a test. If everything works correctly, then add it to the list on GitHub .
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Panasonic Viera device was introduced in Home Assistant 0.17, and it's used by
2006 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Back to top
