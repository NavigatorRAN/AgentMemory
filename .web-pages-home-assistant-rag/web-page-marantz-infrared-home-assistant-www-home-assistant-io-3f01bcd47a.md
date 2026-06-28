---
source_url: "https://www.home-assistant.io/integrations/marantz_infrared"
final_url: "https://www.home-assistant.io/integrations/marantz_infrared"
canonical_url: "https://www.home-assistant.io/integrations/marantz_infrared/"
source_handle: "web:www-home-assistant-io:3f01bcd47a9c"
source_section: "integrations-marantz-infrared"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "575049d84f4d5ce0ab74f2ab008d2c608732618644bcd27da28798dad0e18fa1"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Marantz Infrared - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/marantz_infrared
- Final URL: https://www.home-assistant.io/integrations/marantz_infrared
- Canonical URL: https://www.home-assistant.io/integrations/marantz_infrared/
- Fetched at: 2026-06-28T02:58:34Z
- Content type: text/html; charset=UTF-8

## Description

Integration to control Marantz amplifiers using an infrared transmitter.

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
The Marantz Infrared integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you control a Marantz amplifier using any infrared transmitter previously configured in Home Assistant.
Because the integration communicates over infrared, it operates in a one-way, fire-and-forget fashion: commands are sent to the amplifier but there is no feedback channel to confirm the current state. The integration therefore uses assumed states.
Before setting up the Marantz Infrared integration, you need a working infrared transmitter set up in Home Assistant that exposes an Infrared entity. For example, you can use an ESPHome device with an IR LED pointed at your Marantz amplifier.
To add the Marantz Infrared device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Marantz Infrared .
Follow the instructions on screen to complete the setup.
Model
The Marantz model to control. Currently, only PM6006 is supported.
Infrared transmitter
The infrared transmitter entity to use for sending commands. This must be an entity provided by a hardware integration (such as ESPHome) that has already been set up with an IR transmitter.
The integration currently supports the Marantz PM6006 integrated amplifier. Other Marantz amplifiers share much of the IR command set, but each model has its own quirks (for example, which inputs are present, which functions exist as discrete codes versus toggles, and which proprietary “Pre-Code” 38 kHz raw timings are needed for digital inputs). Adding more models is a community effort — if you own another Marantz amplifier and want it supported, please open an issue on the infrared-protocols repository with captured IR signals from your remote.
The Marantz Infrared integration provides the following entities.
Buttons
Button entities are created for amplifier functions that aren’t part of the media player. Each button sends the corresponding infrared command when pressed.
Speaker A/B — toggles between the A and B speaker outputs.
Source direct — toggles the source-direct mode.
Loudness — toggles the loudness contour.
Media player
Marantz Amplifier PM6006
Description : Represents the amplifier and allows you to control it via IR commands.
Supported features : Turn on, turn off, volume up, volume down, mute, and source select.
Sources : CD, Coax, Network, Optical, Phono, Recorder, Tuner.
The integration uses assumed state, meaning Home Assistant cannot read the actual state of the amplifier (for example, whether it is on or off, what the current volume is, or which source is active).
Turning on and turning off the amplifier both send the same IR power toggle command, as is standard with infrared remotes.
Volume control is step-based only; there is no way to set an absolute volume level.
The Optical source is a single toggle that cycles between the amplifier’s two optical inputs (Optical 1 / Optical 2). The amplifier does not expose discrete IR codes for each one, so the integration cannot deterministically pick a specific optical input — pressing Optical moves to whichever optical input the amplifier remembers as last used, and pressing it again switches to the other.
This integration follows standard integration removal.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Marantz Infrared device was introduced in Home Assistant 2026.6, and it's used by
12 active installations.
Its IoT class is Assumed State.
🥈 Silver quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@balloob
Categories
Back to top
