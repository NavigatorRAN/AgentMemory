# Music Assistant - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/music_assistant
- Final URL: https://www.home-assistant.io/integrations/music_assistant
- Canonical URL: https://www.home-assistant.io/integrations/music_assistant/
- Fetched at: 2026-06-28T03:01:48Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Music Assistant into Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Manual configuration
Supported functionality
Media player entities
Favorite current song button
Player options
List of actions
Notes
Supported devices
Known limitations
Troubleshooting
Can’t find the MA actions
Removing the integration
To remove an integration instance from Home Assistant
The Music Assistant (MA) integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to connect Home Assistant to a Music Assistant Server . Once configured, all MA Players show up as Home Assistant media player entities . Media players will allow you to control media playback and see the currently playing item.
Before installing this integration, ensure you have a running Music Assistant server. Instructions for installing the Music Assistant server are available in the Music Assistant documentation
To add the Music Assistant service to your Home Assistant instance, use this My button:
Music Assistant can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Music Assistant .
Follow the instructions on screen to complete the setup.
Under normal circumstances, Home Assistant automatically discovers your running Music Assistant server. If there is something special about the Home Assistant or Music Assistant setup (for example, the Music Assistant server is running as a remote Docker container) or discovery is not working, you can manually specify the URL to your Music Assistant server.
There is currently support for the following Home Assistant Platforms:
Media player
Button
Depending on the player provider, additional platforms are supported: Number, Select, Sensor, Switch, Text .
All of the Home Assistant Media Player Control Actions are supported.
If using media_player.play_media , then note the media_content_id payload can be any of the following:
The name of a track, artist, or album. For example, Queen .
A track or album combined with the artist’s name. For example, Queen - Innuendo .
A streaming provider URI. For example, spotify://artist/12345 .
A streaming provider URL. For example, https://open.spotify.com/track/31cWPvM99ZHxMl3mdgiw4I .
If using media_player.browse_media , then the media_content_id payload must be a URI of the form library://artist/1 , library://album/20 , or spotify://album/5zj4Ej0FrlJQaSo0d6cttH . The type of item that the URI refers to must be an album or artist.
These URIs can, for example, be obtained from the output of the Get library items or Search Music Assistant actions, or the media_player.browse_media action from Home Assistant.
Streaming provider URLs can be obtained from the web interface of the provider.
The Music Assistant integration creates media player entities for all players and groups available in MA, including those imported from Home Assistant. This is needed to provide the full functionality Music Assistant has to offer. This full functionality includes transfer of the playing queue of music from one player to another, automatic pausing of playback during announcements, and richer options for selecting the media for playback. These entities will display media information, playback progress, and playback controls.
The Music Assistant integration creates a button entity for each player to favorite the current song. Pressing this button (manually or by automation) adds the current song to your Music Assistant favorites. This works for songs stored locally as well as for tracks from streaming providers. It also works with remote content such as Spotify Connect, AirPlay, or a radio station, as long as the external source provides an artist and title combination (and optionally the album).
If a player provider supports player options, the Music Assistant integration exposes additional entities. For example, you may have a number entity to adjust the media player’s bass or treble value. Refer to the Player documentation to see whether your player supports this.
The Music Assistant integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Get library items ( music_assistant.get_library )
Retrieves items from a Music Assistant library.
Get queue details ( music_assistant.get_queue )
Retrieves the details of the active queue of a Music Assistant player.
Play announcement ( music_assistant.play_announcement )
Plays an announcement on a Music Assistant player with fine-grained control options.
Play media ( music_assistant.play_media )
Plays media on a Music Assistant player with fine-grained control options.
Search Music Assistant ( music_assistant.search )
Performs a global search on the Music Assistant library and all providers.
Transfer queue ( music_assistant.transfer_queue )
Transfers a player’s queue to another Music Assistant player.
For an overview of every action across all integrations, see the actions reference .
Any Home Assistant players added to Music Assistant will appear duplicated as the MA version of the player is created. The original HA player can be hidden if desired.
This integration requires Music Assistant server version 2.4 or later. The integration can connect to Music Assistant servers hosted as an app or in a separate Docker container.
Music Assistant supports a wide range of devices both natively and through the Home Assistant provider . The Home Assistant provider, when installed, allows any Home Assistant media player to appear as a player in Music Assistant and thereby benefit from the advanced playback functionality that Music Assistant provides. As a general note, if there is a native Music Assistant provider then devices should be added via that method instead of using the Home Assistant media player. Any limitations associated with the providers are described on the related Player Provider page in the Music Assistant documentation .
The data returned by the get_queue action will be partially limited if the item is not in the library (For example, if an item was selected for playback directly from Spotify). Metadata such as favorite status, explicit status, last played, played count, and disc art URL are only available for items that are in the MA library.
Radio mode is only available with certain music providers, and an error will be shown if attempting to enable radio mode on an item that isn’t linked to one of those providers. Review the Music Assistant documentation to identify which providers support this functionality.
Symptom: No Music Assistant actions are shown in the editor
When trying to set up a script or automation via the GUI, no MA actions can be found.
Description
This means the app may have been installed, but the integration has not.
Resolution
Go to the Configuration section and install the integration.
This integration follows standard integration removal.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
After deleting the integration, go to the Settings > Apps and remove the Music Assistant app from there as well (if installed).
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Music Assistant service was introduced in Home Assistant 2024.12, and it's used by
9.8% of the active installations.
Its IoT class is Local Push.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@music-assistant
@arturpragacz
Categories
Back to top
