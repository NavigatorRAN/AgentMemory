---
source_url: "https://www.home-assistant.io/integrations/frontier_silicon"
final_url: "https://www.home-assistant.io/integrations/frontier_silicon"
canonical_url: "https://www.home-assistant.io/integrations/frontier_silicon/"
source_handle: "web:www-home-assistant-io:a963c5a3a76d"
source_section: "integrations-frontier-silicon"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "df8354ad69b0936cc765475f2b23c3b07c257468d9c6d1fa993b0139022bd8bc"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Frontier Silicon - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/frontier_silicon
- Final URL: https://www.home-assistant.io/integrations/frontier_silicon
- Canonical URL: https://www.home-assistant.io/integrations/frontier_silicon/
- Fetched at: 2026-06-28T02:44:39Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Frontier Silicon Internet Radios into Home Assistant.

## Extracted Text

On this page
Supported models
Prerequisites
Configuration
Screenshots:
Removing the integration
To remove an integration instance from Home Assistant
Notes and Limitations
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides support for Internet Radios based on the Frontier Silicon chipset . Some manufacturers that offer products based on these chips include Hama, Medion, Silvercrest, Auna, TechniSat, Revo, and Pinell. These devices are usually controlled with the OKTIV or UNDOK apps.
Frontier Silicon is used by many different brands of radio manufacturers.
Supported devices include, but are not limited to:
Hama: IR50 , IR110 , DIR3110 , [DIR355BT]
Medion: Medion Radios
Silvercrest: SIRD 14 C2 (archived website)
Teufel: Radio 3sixty (2019)
Roberts: Roberts Stream 94i
TechniSat: DIGITRADIO 10 IR , and some other models
Some models from: Auna, Revo, Pinell, Como Audio
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] was developed and tested with a Roberts Stream 94i .
If your device is supported by the OKTIV or UNDOK apps, then it is also supported by this integration.
The integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] supports automatic discovery of your Internet Radio. If you need to set up the device manually, please provide the device IP-address. Some models use a separate port (2244) for API access, this can be verified by visiting http://[host]:[port]/device .
The default PIN for Frontier Silicon-based devices is 1234. You can set the PIN code of your device (depending on manufacturer) under:
MENU button > Main Menu > System setting > Network > NetRemote PIN setup
To add the Frontier Silicon device to your Home Assistant instance, use this My button:
Frontier Silicon can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Frontier Silicon .
Follow the instructions on screen to complete the setup.
In case your device (friendly name) is called badezimmer , an example automation can look something like this:
# Example configuration.yaml automation alias : " Bathroom Motion Detected" triggers : - trigger : state entity_id : binary_sensor.motion_sensor_166d0001171111 from : " off" to : " on" actions : - action : media_player.turn_on target : entity_id : " media_player.badezimmer"
Overview DAB+ (Badezimmer) and Spotify (Küche):
Overview of the info dialog:
To remove this integration, follow the standard integration removal steps. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Warning
Some older devices may require setting up a session to process requests. This is automatically detected by the underlying library. There is always a single user (session) controlling a device, which means that once Home Assistant connects to a device all other sessions will be invalidated.
This renders the usage of [UNDOK] almost impossible for these older devices, as the Home Assistant integration polls the device state every 30 seconds or issues a command by creating a new session. In that case, you have to disable the integration if you want to use UNDOK.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Frontier Silicon device was introduced in Home Assistant 0.40, and it's used by
1% of the active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@wlcrs
Categories
Media player
Back to top
