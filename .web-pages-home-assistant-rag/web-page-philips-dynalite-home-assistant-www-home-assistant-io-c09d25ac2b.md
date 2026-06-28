---
source_url: "https://www.home-assistant.io/integrations/dynalite"
final_url: "https://www.home-assistant.io/integrations/dynalite"
canonical_url: "https://www.home-assistant.io/integrations/dynalite/"
source_handle: "web:www-home-assistant-io:c09d25ac2b99"
source_section: "integrations-dynalite"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "7f66234b49094c591df275caee2514536bd8ec1fe9bdca8ecad7985f95ee5673"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Philips Dynalite - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/dynalite
- Final URL: https://www.home-assistant.io/integrations/dynalite
- Canonical URL: https://www.home-assistant.io/integrations/dynalite/
- Fetched at: 2026-06-28T02:38:39Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on setting up Philips Dynalite within Home Assistant.

## Extracted Text

On this page
Configuration
Setup
Initial configuration and discovery
List of actions
Events
Event dynalite_preset
Event dynalite_packet
Philips Dynalite support is integrated into Home Assistant as a hub that can drive the light, switch, and cover platforms.
There is currently support for the following device types within Home Assistant:
Lights
Switches
Covers
A Philips Dynalite hub connects to the Dynet network, which is composed of areas, channels, and preset.
A Dynalite area typically (although not necessarily) defines some physical area, such as a room.
Each area can have one or more channels that correspond to the different devices they control. A channel can relate to a dimmable light, or other devices.
Additionally, each area can have one or more presets that determine the behavior of all the channels, and sometimes trigger additional actions. Typically, preset ‘1’ in an area means ‘on’, and preset ‘4’ means ‘off’. Additional presets could be used for scenes and dimming.
To add the Philips Dynalite integration to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Philips Dynalite .
Follow the instructions on screen to complete the setup.
Since Philips Dynalite has virtually no auto-discover capabilities, once it is added via the UI, it needs to be configured via Dynalite panel. Note that the panel is only available to “admin” level users.
There are global setup parameters and advanced parameters that should normally be left as is. The most important part is defining the areas. Each area normally corresponds to a room or function. They have to be added manually via the UI and match the setup of the existing dynalite installation.
Maybe the most difficult thing about a Dynalite system is finding out the areas and channel mapping. If you have them or have access to the Dynalite software and your configuration files, this could be easy,
but in the likely case that your system was installed by an integrator, you will have to discover them on your own.
This is where the autodiscover option comes handy. If it is on, the component will track the Dynet network and every time a device is used, it will be added to Home Assistant. It will initially show as “Area 123 Channel 7”, but you can then add it to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] with the correct configuration.
For example, you would go to your kitchen light and turn it on. Now you sign in to Home Assistant and see what the channel was. If there was more than one discovered (for example, someone turned off the living room lights), you can try one, turn it on and off in Home Assistant and see which light it affects.
The initial process can be a bit time consuming and tedious, but it only has to be done once. Once you are done configuring, it is better to set autodiscover to false , since there are many “fake” channels and areas that the system uses for internal communication and you do not want to have visible.
The Philips Dynalite integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Request area preset ( dynalite.request_area_preset )
Asks a Dynalite area to report its currently selected preset.
Request channel level ( dynalite.request_channel_level )
Asks a Dynalite channel to report its current level.
For an overview of every action across all integrations, see the actions reference .
Event dynalite_preset is fired every time a preset is selected in a given Dynalite area.
Field Description host Host IP of the Dynalite gateway area Area number where preset was selected preset The specific preset that was selected
Event dynalite_packet is fired whenever there is a packet on the Dynalite network.
Field Description host Host IP of the Dynalite gateway packet List of integers representing the 8-byte packet, including the checksum
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Philips Dynalite integration was introduced in Home Assistant 0.106, and it's used by
65 active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@ziv1234
Categories
Cover
Hub
Light
Switch
Back to top
