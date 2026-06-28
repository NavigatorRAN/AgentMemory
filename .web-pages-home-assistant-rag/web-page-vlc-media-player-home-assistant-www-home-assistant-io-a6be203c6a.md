---
source_url: "https://www.home-assistant.io/integrations/vlc"
final_url: "https://www.home-assistant.io/integrations/vlc"
canonical_url: "https://www.home-assistant.io/integrations/vlc/"
source_handle: "web:www-home-assistant-io:a6be203c6ae1"
source_section: "integrations-vlc"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "896a7edd5653c588fd8336b9eb13ef50e91050d3eb6023fa80a16ad10bf4d30b"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# VLC media player - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/vlc
- Final URL: https://www.home-assistant.io/integrations/vlc
- Canonical URL: https://www.home-assistant.io/integrations/vlc/
- Fetched at: 2026-06-28T03:26:59Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate VLC media player into Home Assistant.

## Extracted Text

On this page
Configuration
Full configuration
Additional configuration on macOS
Additional configuration on Linux
Related topics
The VLC media player integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control VLC media player .
Important
The VLC media player integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] , is currently only available for installations that are based on the Home Assistant Core in a Python virtual environment.
To add a VLC media player to your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry media_player : - platform : vlc
Configuration Variables
Looking for your configuration file?
name string ( Optional )
The name to use in the frontend.
arguments string ( Optional )
Additional arguments to be passed to VLC.
Only the “music” media type is supported for now.
This action will control a background VLC instance, therefore you cannot use this to control a VLC instance launched on your desktop, unlike the Kodi media player for example.
A full configuration for VLC could look like the one below:
# Example configuration.yaml entry media_player : - platform : vlc name : speaker_1 arguments : " --alsa-audio-device=hw:1,0"
On macOS python-vlc won’t find the VLC plugin directory unless you add this to the user’s .bash_profile that is running Home Assistant:
export VLC_PLUGIN_PATH = $VLC_PLUGIN_PATH :/Applications/VLC.app/Contents/MacOS/plugins
You need to add the homeassistant user to the audio group:
sudo usermod -a -G audio homeassistant
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The VLC media player integration was introduced in Home Assistant 0.35, and it's used by
17 active installations.
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
