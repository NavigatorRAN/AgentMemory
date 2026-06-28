# Russound RIO - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/russound_rio
- Final URL: https://www.home-assistant.io/integrations/russound_rio
- Canonical URL: https://www.home-assistant.io/integrations/russound_rio/
- Fetched at: 2026-06-28T03:13:15Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Russound RIO devices into Home Assistant.

## Extracted Text

On this page
Supported devices
Configuration
Data updates
Removing the integration
To remove an integration instance from Home Assistant
Available configuration entities
Playing media
Examples:
Browsing media
Troubleshooting
There is a delay on getting the current status
The Russound RIO integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control Russound devices that use the RIO protocol.
The platform automatically discovers all enabled zones and sources. Each zone is added as a media player device with the enabled sources available as inputs. Media information is supported if the selected source reports it. The integration allows you to navigate presets, control volume of all zones, and play radio stations all from your Home Assistant dashboard.
This integration allows you to connect the following controllers:
Russound SMZ8
Russound SMZ16-PRE
Russound MBX-PRE
Russound MBX-AMP
Russound ACA-E5
Russound MCA-C3
Russound MCA-C5
Russound MCA-66
Russound MCA-88
Rusosund MCA-88x
Russound XSource
Russound XZone4
Russound XZone70V
Russound XStream-X5
To add the Russound RIO hub to your Home Assistant instance, use this My button:
Russound RIO can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Russound RIO .
Follow the instructions on screen to complete the setup.
Host
The IP address of your device can be found by navigating to the device on the Russound app and selecting Settings . If you are using a third-party RS232 to IP adapter, refer to the user manual about finding the IP address.
Port
The port of your device. This is 9621 on all devices except for the XZone4, which uses ports 9621-9624. The port may be different if a RS232 to IP adapter is used.
Path
The path of your device if connected by a USB-to-serial adapter. The available devices will be automatically found by Home Assistant and listed for selection.
Baud Rate
The speed of the serial bus. The default for Russound RIO is 19200 . The available speeds are 19200 , 38400 , 57600 , 115200 and depends on your controller’s configuration.
Russound RIO devices push data directly to Home Assistant, enabling immediate updates for device state changes, media information, and playback status.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
The integration provides a few entities to configure the device settings. The following entities are supported:
Bass and Treble
Balance
Loudness
Turn on volume
Party mode
Russound RIO supports recalling AM/FM and Sirius XM presets using the media_player.play_media action.
Russound RIO can recall any stored presets saved on the device for a given source. The preset ID can be between 1-36. Some devices may display presets within banks of six presets total. The preset ID can be calculated by combining the current bank and preset. An example action using a preset for Bank 1, Preset 1:
action : media_player.play_media target : entity_id : media_player.russound_deck data : media_content_type : " preset" media_content_id : " 1"
An example action using a preset for Bank 2, Preset 1:
action : media_player.play_media target : entity_id : media_player.russound_deck data : media_content_type : " preset" media_content_id : " 7"
The action will only impact the current source for a zone. If you want to recall a preset on a specific source, you can use the format source_id,preset_id . For example, if you want to recall Bank 2, Preset 2 using Source 1:
action : media_player.play_media target : entity_id : media_player.russound_deck data : media_content_type : " preset" media_content_id : " 1,8"
The Russound RIO integration allows you to browse saved presets from your dashboard.
Some older Russound devices have a slight delay before posting a new status to Home Assistant.
This can be resolved by updating the unit to the latest firmware.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Russound RIO hub was introduced in Home Assistant 0.49, and it's used by
100 active installations.
Its IoT class is Local Push.
🥈 Silver quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@noahhusby
Categories
Media player
Back to top
