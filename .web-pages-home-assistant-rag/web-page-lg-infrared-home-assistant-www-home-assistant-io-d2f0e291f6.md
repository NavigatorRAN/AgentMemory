---
source_url: "https://www.home-assistant.io/integrations/lg_infrared"
final_url: "https://www.home-assistant.io/integrations/lg_infrared"
canonical_url: "https://www.home-assistant.io/integrations/lg_infrared/"
source_handle: "web:www-home-assistant-io:d2f0e291f65c"
source_section: "integrations-lg-infrared"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "e42befebf1d3d745fd10eb7923ea717533a326aaeff4eb5d3af913e3c3e064e2"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# LG Infrared - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/lg_infrared
- Final URL: https://www.home-assistant.io/integrations/lg_infrared
- Canonical URL: https://www.home-assistant.io/integrations/lg_infrared/
- Fetched at: 2026-06-28T02:56:06Z
- Content type: text/html; charset=UTF-8

## Description

Integration to control LG TVs using an infrared emitter and to receive commands from an LG remote using an infrared receiver.

## Extracted Text

On this page
Prerequisites
Configuration
Supported devices
Supported functionality
Entities
Known limitations
Removing the integration
To remove an integration instance from Home Assistant
The LG Infrared integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you control an LG TV using any infrared emitter previously configured in Home Assistant. It can also receive commands from an LG remote when you have an infrared receiver set up, allowing you to use the remote to trigger automations in Home Assistant.
Because the integration communicates over infrared, it operates in a one-way, fire-and-forget fashion: commands are sent to the TV but there is no feedback channel to confirm the current state of the TV. The integration therefore uses assumed states.
Before setting up the LG Infrared integration, you need a working infrared emitter, an infrared receiver, or both, already set up in Home Assistant. Each must expose an Infrared entity. For example, you can use an ESPHome device with an IR LED pointed at your LG TV to send commands, and an IR receiver module to capture commands from your LG remote.
To add the LG Infrared device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select LG Infrared .
Follow the instructions on screen to complete the setup.
Device type
The type of LG device to control. Currently, only TV is supported.
Infrared emitter
The infrared emitter entity to use for sending commands to your LG TV. This must be an entity provided by a hardware integration (such as ESPHome) that has already been set up with an IR emitter.
Infrared receiver
The infrared receiver entity to use for receiving commands from your LG remote. This must be an entity provided by a hardware integration (such as ESPHome) that has already been set up with an IR receiver.
At least one of Infrared emitter or Infrared receiver must be selected. Select both if you want to be able to send commands to the TV and react to commands from the remote.
The integration supports LG TVs that can be controlled via the standard LG infrared protocol.
The LG Infrared integration provides the following entities.
Buttons
Button entities are created when an infrared emitter is configured. Each button sends the corresponding infrared command to the TV when pressed.
Power on , Power off
HDMI 1 , HDMI 2 , HDMI 3 , HDMI 4
Input
Up , Down , Left , Right , OK
Back , Exit , Home , Menu
Info , Guide
0 through 9
Events
An event entity is created when an infrared receiver is configured. It fires an event each time an LG TV remote command is received, so you can use the remote to trigger automations in Home Assistant.
Received command
Description : Fires when a command from an LG TV remote is decoded from the infrared receiver. The fired event type matches the button pressed on the remote.
Event types :
Navigation: back , exit , guide , home , info , list , menu , nav_down , nav_left , nav_right , nav_up , ok , settings
Inputs and channels: channel_down , channel_up , hdmi_1 , hdmi_2 , hdmi_3 , hdmi_4 , input
Playback: fast_forward , pause , play , rewind , stop
Volume and audio: mute , sap , subtitle , text , volume_down , volume_up
Power: power , power_off , power_on
Number keys: num_0 through num_9
Color buttons: blue , green , red , yellow
Other LG commands: aspect , ez_adjust , in_start
unknown for any LG command that is not recognized
Remarks : Only commands using the LG infrared address are processed. Signals from other remotes are ignored.
Media player
A media player entity is created when an infrared emitter is configured.
LG TV
Description : Represents the LG TV and allows you to control it via IR commands.
Supported features : Turn on, turn off, volume up, volume down, mute, channel up, channel down, play, pause, and stop.
The integration uses assumed state, meaning Home Assistant cannot read the actual state of the TV (for example, whether it is on or off, or what the current volume is). Commands received through the infrared receiver are exposed as events only; they do not update the state of the media player entity.
Turning on and turning off the TV both send the same IR power toggle command, as is standard with infrared remotes.
Volume control is step-based only; there is no way to set an absolute volume level.
This integration follows standard integration removal.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The LG Infrared device was introduced in Home Assistant 2026.4, and it's used by
344 active installations.
Its IoT class is Assumed State.
🥈 Silver quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@abmantis
Categories
Event
Back to top
