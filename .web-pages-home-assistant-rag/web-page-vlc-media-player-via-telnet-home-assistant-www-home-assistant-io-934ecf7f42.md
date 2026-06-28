---
source_url: "https://www.home-assistant.io/integrations/vlc_telnet"
final_url: "https://www.home-assistant.io/integrations/vlc_telnet"
canonical_url: "https://www.home-assistant.io/integrations/vlc_telnet/"
source_handle: "web:www-home-assistant-io:934ecf7f4229"
source_section: "integrations-vlc-telnet"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "beeb24d7724b8b07adbf65d8bfc0da24c979dd74927cffa2fc09a31d1da936cf"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# VLC media player via Telnet - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/vlc_telnet
- Final URL: https://www.home-assistant.io/integrations/vlc_telnet
- Canonical URL: https://www.home-assistant.io/integrations/vlc_telnet/
- Fetched at: 2026-06-28T03:27:03Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate VLC media player into Home Assistant using the telnet interface.

## Extracted Text

On this page
Configuration
Actions
VLC app for Home Assistant
The VLC media player via Telnet integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control a VLC media player using the built in telnet interface.
This action will control any instance of VLC player on the network with the telnet interface activated.
To activate the telnet interface on your VLC Player please read the official VLC documentation . Also remember to add a firewall rule allowing inbound connections for the port used in the device running VLC.
In case the VLC is running on a host with a locale other than English, you may get some errors during the volume change.
This is related to the different use of the decimal separator in other countries.
Consider to set the locale to en_US before starting VLC.
To add the VLC media player via Telnet service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select VLC media player via Telnet .
Follow the instructions on screen to complete the setup.
When using the media_player.play_media action, only the “music” media type is supported for now.
You can run a VLC Media Player on your Home Assistant installation using the official VLC app .
Using it you can play files on the local network, Internet or files and playlist locally saved to the /share and /media folder of your Home Assistant installation.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The VLC media player via Telnet service was introduced in Home Assistant 0.95, and it's used by
1.8% of the active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@rodripf
@MartinHjelmare
Categories
Media player
Back to top
