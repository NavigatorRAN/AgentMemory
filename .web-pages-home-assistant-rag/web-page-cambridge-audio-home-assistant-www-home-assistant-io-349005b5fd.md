---
source_url: "https://www.home-assistant.io/integrations/cambridge_audio"
final_url: "https://www.home-assistant.io/integrations/cambridge_audio"
canonical_url: "https://www.home-assistant.io/integrations/cambridge_audio/"
source_handle: "web:www-home-assistant-io:349005b5fda7"
source_section: "integrations-cambridge-audio"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "7ec78b333ffccd50af9ad643c94ce7619c771a3ccc05146447639a57362668c8"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Cambridge Audio - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/cambridge_audio
- Final URL: https://www.home-assistant.io/integrations/cambridge_audio
- Canonical URL: https://www.home-assistant.io/integrations/cambridge_audio/
- Fetched at: 2026-06-28T02:33:11Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Cambridge Audio Receivers into Home Assistant.

## Extracted Text

On this page
Supported devices
Configuration
Data updates
Removing the integration
To remove an integration instance from Home Assistant
Available configuration entities
Pre-Amp
Control Bus
Equalizer
Playing media
Examples:
Browsing media
Troubleshooting
The buttons to skip, shuffle, and repeat the track are missing
The ability to change volume is missing
Turning on the device doesn’t work from Home Assistant
The Cambridge Audio integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control all receivers and streamers that support the StreamMagic app.
The integration automatically discovers all enabled zones and sources. Each zone is added as a media player device with the enabled sources available as inputs. Media information and controls (such as play, pause, skip) are supported if the selected source reports it. The integration allows you to navigate presets, control streaming (Spotify, Tidal, Qobuz), and play radio stations all from your Home Assistant dashboard.
This integration allows you to connect the following devices:
Cambridge Audio Evo One
Cambridge Audio Evo 75
Cambridge Audio Evo 150
Cambridge Audio CXN
Cambridge Audio CXN (v2)
Cambridge Audio CXN100
Cambridge Audio CXR120
Cambridge Audio CXR200
Cambridge Audio 851N
Cambridge Audio MXN10
Cambridge Audio AXN10
Cambridge Audio EXN100
Cambridge Audio Edge NQ
Older, RS-232 serial-based amplifiers like the CXA series
use a different protocol and are not currently supported.
To add the Cambridge Audio device to your Home Assistant instance, use this My button:
Cambridge Audio can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Cambridge Audio .
Follow the instructions on screen to complete the setup.
Host
The IP address of your device can be found by navigating to the device on the StreamMagic app and selecting Settings → IP address .
Cambridge Audio devices push data directly to Home Assistant, enabling immediate updates for device state changes, media information, and playback status.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
The integration provides a few entities to configure the device settings. The following entities are supported:
Display brightness
Early update
Audio output (Speaker select)
Control Bus mode
Room correction
Volume limit
Equalizer state
When Pre-Amp mode is enabled, Home Assistant can control the output volume of your device.
When Control Bus mode is enabled, Home Assistant can control the output volume of your power amplifier when it is connected to a Cambridge Audio network player using the Control Bus interface. In this case, Pre-Amp mode can be disabled. The network player will send the signal at full volume to the power amplifier, and the power amplifier’s volume can be controlled using the volume up and down controls. The Control Bus does not support setting the volume to a certain value; it can only increase and decrease the current volume.
If your device supports it, Home Assistant can enable or disable the equalizer.
Cambridge Audio supports playing a variety of formats using the media_player.play_media action.
Cambridge Audio can recall any stored presets saved on the device. An example action using a preset:
action : media_player.play_media target : entity_id : media_player.cambridge_audio data : media_content_type : " preset" media_content_id : " 1"
An example action using an Airable radio ID:
action : media_player.play_media target : entity_id : media_player.cambridge_audio data : media_content_type : " airable" media_content_id : " 12345678"
An example action using an internet radio url:
action : media_player.play_media target : entity_id : media_player.cambridge_audio data : media_content_type : " internet_radio" media_content_id : " https://example.com/internet-radio/station_abcd.mp3"
The Cambridge Audio integration allows you to browse saved presets from your dashboard.
All stored presets will be categorized into playlists, artists, and tracks.
Control functionality depends on the source / service that is currently selected.
The interface automatically sets which controls are available depending on which source is selected.
Volume control is supported only on all-in-one amplifiers, streamers in Pre-Amp mode, or streamers connected to an amplifier via the Control Bus interface.
If you do not see volume controls, your device is likely not configured to use Pre-Amp mode, or the Control Bus feature is not activated.
To check and adjust these settings:
In a web browser, go to the IP address of your device, or open the StreamMagic app, or open the device in Home Assistant.
In the settings, set Pre-Amp to On , or set Control Bus mode to Amplifier .
Cambridge Audio devices come with ECO mode enabled by default, which disables the network interface when
the device is powered down. This can be changed by navigating to the IP address of the device in a web browser,
or selecting settings in the StreamMagic app and setting Standby Mode to Network standby .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Cambridge Audio device was introduced in Home Assistant 2024.10, and it's used by
457 active installations.
Its IoT class is Local Push.
🏆 Platinum quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@noahhusby
Categories
Media player
Select
Back to top
