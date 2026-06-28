---
source_url: "https://www.home-assistant.io/integrations/hyperion"
final_url: "https://www.home-assistant.io/integrations/hyperion"
canonical_url: "https://www.home-assistant.io/integrations/hyperion/"
source_handle: "web:www-home-assistant-io:1e4bc0a048f8"
source_section: "integrations-hyperion"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "389c909412ce6d1f12d8104e382d1f2fbf41f474b5875fb792f07b5eb36544e6"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Hyperion - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/hyperion
- Final URL: https://www.home-assistant.io/integrations/hyperion
- Canonical URL: https://www.home-assistant.io/integrations/hyperion/
- Fetched at: 2026-06-28T02:50:54Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Hyperion into Home Assistant.

## Extracted Text

On this page
Configuration
Extra configuration of the integration
Hyperion instances
Light entity
Effects
Hyperion camera
Sensors
Advanced entities
Control over external sources: Screen capture and USB capture
Control over Hyperion functionality
Examples
The Hyperion integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to integrate your
Hyperion into Home Assistant. Hyperion is
an open source Ambilight implementation which runs on many platforms.
NOTE : Hyperion-NG is
supported, the original discontinued Hyperion is not supported by
this integration.
To add the Hyperion hub to your Home Assistant instance, use this My button:
Hyperion can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Hyperion .
Follow the instructions on screen to complete the setup.
All configuration options are offered from the frontend. Choose Options under the
relevant entry on the Integrations page.
Options supported:
Priority : The priority for color and effects. Hyperion will choose the source
with the lowest priority number as active input. If you have other sources (not
originating from Home Assistant) configured, make sure this option is lower than
those sources priority in Hyperion itself (typically lower than 200 is appropriate).
Effects to hide : An optional selection of effects to hide from the light effects
list. New effects added to the Hyperion server will be shown by default.
This integration supports multiple Hyperion instances running on a single Hyperion
server. As instances are added/removed on the Hyperion UI, they will automatically be
added/removed from Home Assistant.
The default light entity will send data to Hyperion on the priority you have configured
during integration setup. When turned off, it will clear the configured priority again.
Other light sources independent of Home Assistant configured in Hyperion might still be
active and cause light to be emitted. To turn the light output off entirely
regardless of active light sources, you can enable the LED device entity that acts as
a global switch (see Advanced Entities).
The effect list is dynamically pulled from the Hyperion server. Additionally, there
will be a ‘Solid’ effect to switch (back) to showing a solid color only.
A Hyperion camera entity is created that shows a stream of the input to Hyperion (e.g., a
USB Capture device). This could be used to show a small “preview window” next to TV
controls, for example.
Only the currently live Hyperion priority can be streamed, and only
streamable sources will actually stream content (e.g., USB Capture Devices will work, but
static colors will not).
A sensor (Visible Priority) provides the effect currently displayed by the Hyperion server for the selected instance. Attributes of this sensor provide more details on the nature of the effect. For a detailed description, refer to the Hyperion API .
The Hyperion integration comes with a series of disabled-by-default entities for
advanced usecases. These entities expose ‘raw’ underlying Hyperion API components for
improved extensibility and interoperability which are particularly useful in cases where
there are multiple Hyperion server clients (of which Home Assistant is one).
These entities may be enabled by visiting the Integrations page, choosing the relevant
entity and toggling Enable entity , followed by Update .
Provided entities for controlling external sources:
switch.[instance]_component_platform_capture : Toggles the Screen Capture source
switch.[instance]_component_usb_capture : Toggles the USB Capture source
switch.[instance]_component_audio_capture : Toggles the Audio Capture source
Further advanced entities to control Hyperion functionality:
There will be additional switch.[instance]_component_[component] entities that can
be used to toggle the relevant underlying Hyperion component as shown on the Hyperion
server Remote Control page under Components Control . This allows fine grained
control over Hyperion functionality (e.g. Blackbar Detection ) or device
state ( LED Device ).
switch.[instance]_component_all : refers to the entire Hyperion instance state that
controls the toggle on the Hyperion server Dashboard page.
To start Hyperion with an effect, use the following automation:
automation : - alias : " Turn Hyperion effect on when light goes on" triggers : - trigger : state entity_id : light.hyperion to : " on" actions : - action : light.turn_on target : entity_id : light.hyperion data : effect : " Full color mood blobs"
To have the lights playing an effect when pausing, idle or turn off a media player like Plex you can use this example:
- alias : " Set hyperion effect after playback" triggers : - trigger : state entity_id : media_player.plex to : " off" - trigger : state entity_id : media_player.plex.plex to : " paused" - trigger : state entity_id : media_player.plex.plex to : " idle" actions : - action : light.turn_on target : entity_id : light.hyperion data : effect : " Full color mood blobs"
To capture the screen on a USB capture device, when playing something on a media_player, you can use this example:
- alias : " Set hyperion when playback starts" triggers : - trigger : state entity_id : media_player.plex to : " playing" actions : - action : switch.turn_on target : entity_id : switch.[instance]_component_usb_capture
To toggle the LED device together with the light entity to turn light output on or off for all sources. In this example both entities are turned on together, create another automation with the values reversed for turning both off:
- alias : " Turn LED device on when Hyperion light is activated" triggers : - trigger : state entity_id : - light.hyperion from : " off" to : " on" conditions : - condition : state entity_id : switch.[instance]_component_led_device state : " off" actions : - action : switch.turn_on target : entity_id : switch.[instance]_component_led_device
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Hyperion hub was introduced in Home Assistant 0.7.6, and it's used by
1567 active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@dermotduffy
Categories
Light
Back to top
