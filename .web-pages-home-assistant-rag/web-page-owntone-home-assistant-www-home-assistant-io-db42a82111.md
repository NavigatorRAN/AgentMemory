# OwnTone - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/forked_daapd
- Final URL: https://www.home-assistant.io/integrations/forked_daapd
- Canonical URL: https://www.home-assistant.io/integrations/forked_daapd/
- Fetched at: 2026-06-28T02:43:53Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate an OwnTone server into Home Assistant.

## Extracted Text

On this page
Requirements
Configuration
Outputs
Pipes
Playlists
Spotify
The OwnTone integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control your OwnTone (previously forked-daapd) server from Home Assistant. This integration can control the OwnTone outputs (zones) with limited playback control (play/pause, previous/next track) and media info support. Playlist manipulation is not supported.
The OwnTone integration requires an OwnTone server built with libwebsockets enabled, version >= 27.0.
To add the OwnTone integration to your Home Assistant instance, use this My button:
OwnTone can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select OwnTone .
Follow the instructions on screen to complete the setup.
Once the OwnTone integration is set up, outputs will automatically be loaded from the server and added to Home Assistant in real-time.
As OwnTone supports playing audio input via a pipe, this integration supports the forwarding of basic player controls (play, pause, next track, previous track) directly to the pipe’s source. Currently, only the pipe source librespot-java is supported. To use this, configure your OwnTone server to autostart pipes and name your librespot-java pipe “librespot-java” (accompanying metadata is also supported through OwnTone via a metadata pipe named “librespot-java.metadata”). The OwnTone integration will find the librespot-java pipe in the database and will set it up as a source.
The OwnTone integration will treat playlists in the database as sources. The number of playlists shown as sources can be set in the integration’s configuration options.
The OwnTone integration supports media browsing via the Spotify integration . However, to play Spotify content, your OwnTone instance must be logged in with Spotify. This can be done through OwnTone’s own web interface. For more details, see OwnTone’s notes on Spotify . You should log in with the same Spotify account for both the OwnTone server and the Home Assistant Spotify integration .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The OwnTone integration was introduced in Home Assistant 0.110, and it's used by
308 active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@uvjustin
Categories
Media player
Back to top
