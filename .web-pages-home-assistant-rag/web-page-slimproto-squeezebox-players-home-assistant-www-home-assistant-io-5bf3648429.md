---
source_url: "https://www.home-assistant.io/integrations/slimproto"
final_url: "https://www.home-assistant.io/integrations/slimproto"
canonical_url: "https://www.home-assistant.io/integrations/slimproto/"
source_handle: "web:www-home-assistant-io:5bf3648429cd"
source_section: "integrations-slimproto"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "16d421e12150e02179388a23947bcf9165a9c90cf7a81f191b6bf81c76660262"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# SlimProto (Squeezebox players) - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/slimproto
- Final URL: https://www.home-assistant.io/integrations/slimproto
- Canonical URL: https://www.home-assistant.io/integrations/slimproto/
- Fetched at: 2026-06-28T03:16:51Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate a SlimProto-based player (e.g., Squeezebox) into Home Assistant without the need for a media server.

## Extracted Text

On this page
Configuration
Basic support only
Advanced: Player events
The SlimProto integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control a Squeezebox music player directly from Home Assistant, without the need for an external Media Server such as Logitech Media Server. This lets you control Squeezebox hardware like the Classic, Transporter, Duet, Boom, Radio, and Touch and software players like Squeezelite , PiCorePlayer or Max2Play . For the real DIY enthusiast, there even is a player for the ESP32 .
To add the SlimProto (Squeezebox players) device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select SlimProto (Squeezebox players) .
Follow the instructions on screen to complete the setup.
Note
This integration talks directly to the player running the “SLIM” protocol, effectively turning Home Assistant into the Media Server so you will not need an external Media Server like Logitech Media Server or Roon. This means that the media you want to play is available in/from Home Assistant itself, for example by using the Radio Browser integration or the custom Music Assistant integration.
This integration is aimed to be as simple as possible, allowing the basic controls of the player from Home Assistant and the possibility to send a URL to stream to the player.
At the time of writing the following is not yet supported:
Player groups (synced multi-room audio) - will be added in a later release.
Display support (for official Squeezebox hardware) - might be added in a later release if enough interest.
Events emitted by players that are not handled by the integration itself, for example pressing the “next track” button on a player, will be forwarded to the Home Assistant event bus for you to act on, for example, using an automation.
The event that is submitted is slimproto_event .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The SlimProto (Squeezebox players) device was introduced in Home Assistant 2022.5, and it's used by
595 active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@marcelveldt
Categories
Media player
Back to top
