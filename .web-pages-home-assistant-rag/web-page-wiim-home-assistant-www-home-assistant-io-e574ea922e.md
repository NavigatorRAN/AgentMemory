# WiiM - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/wiim
- Final URL: https://www.home-assistant.io/integrations/wiim
- Canonical URL: https://www.home-assistant.io/integrations/wiim/
- Fetched at: 2026-06-28T03:28:39Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate WiiM devices into Home Assistant.

## Extracted Text

On this page
Configuration
Supported functionality
Media Player
Buttons
Actions
Removing the integration
To remove an integration instance from Home Assistant
The WiiM integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control different WiiM devices from Home Assistant.
To add the WiiM hub to your Home Assistant instance, use this My button:
WiiM can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select WiiM .
Follow the instructions on screen to complete the setup.
The media player entity gives you complete control over your WiiM device from Home Assistant. In addition to standard playback functionality, it offers:
Playback controls: Control playback state, skip tracks, adjust volume, seek, select sound modes, and set repeat or shuffle modes directly from the Home Assistant UI or automations.
Multiroom Audio : Seamlessly group multiple WiiM devices to create synchronized multiroom playback. Use the standard Home Assistant services: media_player.join and media_player.unjoin .
Media Browsing : Browse presets, playlists, and the device’s current playback queue, enabling dynamic selection of media from the Home Assistant interface.
The button entities provide some additional WiiM features available on the device:
Time Sync : Synchronizes the device’s internal clock with the current time on your Home Assistant server, ensuring features like scheduled playback or time-based automations remain accurate.
Restart Device : Reboots the device remotely, providing a quick way to recover from connectivity issues or apply configuration changes without physical interaction.
The WiiM integration makes various custom actions available in addition to the standard media player actions .
This integration follows the standard integration removal process; no extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The WiiM hub was introduced in Home Assistant 2026.4, and it's used by
3124 active installations.
Its IoT class is Local Push.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@Linkplay2020
Categories
Media player
Back to top
