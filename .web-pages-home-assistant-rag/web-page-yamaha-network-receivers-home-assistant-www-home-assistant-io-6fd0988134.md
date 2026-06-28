---
source_url: "https://www.home-assistant.io/integrations/yamaha"
final_url: "https://www.home-assistant.io/integrations/yamaha"
canonical_url: "https://www.home-assistant.io/integrations/yamaha/"
source_handle: "web:www-home-assistant-io:6fd098813446"
source_section: "integrations-yamaha"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "444bf4e68d0225c36e002bd85b380ef5fb111d68ebc2d76632acbb14d13ce876"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Yamaha Network Receivers - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/yamaha
- Final URL: https://www.home-assistant.io/integrations/yamaha
- Canonical URL: https://www.home-assistant.io/integrations/yamaha/
- Fetched at: 2026-06-28T03:30:04Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Yamaha Network Receivers into Home Assistant.

## Extracted Text

On this page
Supported operations
Example configuration
Example play_media script
List of actions
Related topics
The Yamaha Network Receivers integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control Yamaha Network Receivers from Home Assistant.
Supported devices:
HTR-4065
RX-V473
RX-V573
RX-V585
RX-V673
RX-V685
RX-V773
RX-V3067
And more
To add a Yamaha Network Receiver to your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry media_player : - platform : yamaha
You must enable network standby on your receiver, or else startup of Home Assistant will hang if you
have your receiver switched off.
Configuration Variables
Looking for your configuration file?
name string ( Optional )
Name of the device. This overrides the default name (often model number) that is returned by the device.
host string ( Optional )
IP address or hostname of the device.
source_ignore list ( Optional )
List of sources to hide in the front-end.
source_names list ( Optional )
Mapping of internal AVR source names to custom ones, allowing one to rename e.g., HDMI1 to ChromeCast .
zone_ignore list ( Optional )
List of zones to hide in the front-end.
zone_names list ( Optional )
Mapping of zone names to custom ones, allowing one to rename e.g., Main_Zone to Family Room .
Media players created by Yamaha support powering on/off, mute,
volume control and source selection. Playback controls, for instance
play and stop are available for sources that supports it.
The play_media action is implemented for NET RADIO source
only. The media_id is a > separated string of the menu path on
the vtuner service. For instance Bookmarks>Internet>WAMC 90.3 FM .
MusicCast devices use the path Radio>Favorites>WAMC 90.3 FM .
A full configuration example will look like the sample below:
# Example configuration.yaml entry media_player : - platform : yamaha host : 192.168.0.10 source_ignore : - " AUX" - " HDMI6" source_names : HDMI1 : " ChromeCast" AV4 : " Vinyl" zone_ignore : - " Zone_2" zone_names : Main_Zone : " Family Room"
The play_media function can be used in scripts easily to build media
player presets. When done in scripts, the sequence will also allow you
to set volume per source.
# Example play_media script # # This is for an environment where Zone 2 of the receiver named # `Living Room Stereo` drives outdoor speakers on the porch. script : rp_porch : alias : " Radio Paradise Porch" sequence : - action : media_player.turn_on target : entity_id : media_player.living_room_stereo_zone_2 - action : media_player.volume_set target : entity_id : media_player.living_room_stereo_zone_2 data : volume_level : 0.48 - action : media_player.play_media target : entity_id : media_player.living_room_stereo_zone_2 data : media_content_type : " NET RADIO" media_content_id : " Bookmarks>Internet>Radio Paradise"
The Yamaha Network Receivers integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Enable output ( yamaha.enable_output )
Enables or disables an output port on a Yamaha receiver.
Menu cursor ( yamaha.menu_cursor )
Controls the on-screen menu cursor of a Yamaha receiver.
Select scene ( yamaha.select_scene )
Selects a scene on a Yamaha receiver.
For an overview of every action across all integrations, see the actions reference .
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Yamaha Network Receivers integration was introduced in Home Assistant 0.16, and it's used by
816 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Media player
Back to top
