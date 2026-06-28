---
source_url: "https://www.home-assistant.io/integrations/philips_js"
final_url: "https://www.home-assistant.io/integrations/philips_js"
canonical_url: "https://www.home-assistant.io/integrations/philips_js/"
source_handle: "web:www-home-assistant-io:2b42d4d340c6"
source_section: "integrations-philips-js"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "555fe16e4e7baaae02b03eded17e7a7741e476e82965cf024c1aad512fe43c36"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Philips TV - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/philips_js
- Final URL: https://www.home-assistant.io/integrations/philips_js
- Canonical URL: https://www.home-assistant.io/integrations/philips_js/
- Fetched at: 2026-06-28T03:07:59Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to add Philips TVs to Home Assistant.

## Extracted Text

On this page
Prerequisites
Check if this integration can be used
Configuration
Features
Turn on device
Remote
Ambilight
Binary sensor
The Philips TV integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control Philips TVs which expose the jointSPACE JSON-API.
Before adding the integration, it is worth checking if this integration works for you. As there are differences between TVs, you may need to try different addresses:
Some TVs use https:// and port 1926, other TVs use http:// and port 1925.
Check if your TV responds to one of the following combinations:
http://IP_ADDRESS_OF_TV:1925/system
https://IP_ADDRESS_OF_TV:1926/system
If you get a response, then this integration can be used.
In the response, you should also be able to see the version of the API the TV uses ( "api_version":{"Major":6... ).
For older TVs, follow instructions on how to activate the API and if your model is supported here .
Note that not all listed, jointSPACE-enabled devices will have JSON-interface running on port 1925.
This is true at least for some models before year 2011.
Also, note that version 6 of the API needs to be authenticated by a PIN code displayed on your TV.
To add the Philips TV device to your Home Assistant instance, use this My button:
Philips TV can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Philips TV .
Follow the instructions on screen to complete the setup.
Feature 1 5 6 (Android) 6 (Saphi) Power On WOL / IR Blaster ? Yes (if always on) WOL / IR Blaster Volume Detect Yes ? Yes (not over CEC) Yes Volume Up/Down Yes ? Yes Yes Volume Set Yes ? Yes Yes Source Select Yes ? Yes No Source Detect Yes ? No No Channel Select Yes ? Yes Yes Channel Detect Yes ? Yes No Channel Favorites No ? Yes Yes Application Select No ? Yes No Application Detect No ? Yes No Browse URL No No No No Send Key No No No Yes Ambilight Control Yes ? Yes ? Ambilight Styles No ? Yes Yes Ambilight Measure No No No No
The Philips TV does not always support turning on via the API. You can either turn it on via an IR blaster or on some models using Wake On LAN (WOL). To trigger this command from the entities, the integration exposes a device trigger that can be set up to execute when the media_player is asked to turn on.
The integration provides a remote entity for sending remote key presses directly to the TV. The following list of commands are available for use with the remote.send_command action.
Command Comment Standby CursorUp CursorDown CursorLeft CursorRight Confirm Back Exit WatchTV Home Source List Find Options Adjust RedColour GreenColour YellowColour BlueColour Play PlayPause Mapped to same as Play on Android devices Pause FastForward Stop Rewind Record ChannelStepUp ChannelStepDown Digit0 Digit1 Digit2 Digit3 Digit4 Digit5 Digit6 Digit7 Digit8 Digit9 Dot VolumeUp VolumeDown Mute Teletext Subtitle ClosedCaption TvGuide Info AmbilightOnOff Viewmode 3dFormat Multiview PictureStyle 3dDepth SoundStyle SurroundMode HeadphonesVolume 2PlayerGaming Setup WhiteColour PowerOn PowerOff Mapped to same as Standby on Android Online SmartTV PhilipsMenu
The integration exposes a single light entity to control the mode of the ambilight on the TV. It allows setting a fixed background color or switching the TV to one of the lounge modes supported by the TV.
When the light entity is turned on, it is controlling the ambilights, when it is turned off the TV is in control of the ambilight in its standard video-based fashion.
Limits:
The integration does not expose current ambilight measured values since it would
overload the event bus in Home Assistant.
There is no support to control the standard, non-expert, styles of the TV.
Ambilight+Hue
Some TV’s allow you to sync the processed ambilight color data to your Philips Hue bridge. This will make your Hue lights sync with the TV ambilight without the need to purchase a Hue Play HDMI Sync Box.
The integration exposes a “Ambilight+Hue” switch entity when your TV supports it which enables you to toggle this.
Some newer OS versions support live TV recording functions via the API.
For those TVs, this integration supports two entities:
New recording available
Recording ongoing
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Philips TV device was introduced in Home Assistant 0.34, and it's used by
2.3% of the active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@elupus
Categories
Light
Media player
Back to top
