---
source_url: "https://www.home-assistant.io/integrations/ws66i"
final_url: "https://www.home-assistant.io/integrations/ws66i"
canonical_url: "https://www.home-assistant.io/integrations/ws66i/"
source_handle: "web:www-home-assistant-io:485916a1edfa"
source_section: "integrations-ws66i"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "672c70b5977a914d67e585bb01b7e711d1aa09d8c80368e7470ea6085d8f9eff"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Soundavo WS66i 6-Zone Amplifier - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/ws66i
- Final URL: https://www.home-assistant.io/integrations/ws66i
- Canonical URL: https://www.home-assistant.io/integrations/ws66i/
- Fetched at: 2026-06-28T03:29:15Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate WS66i 6-Zone Home Audio Controller into Home Assistant.

## Extracted Text

On this page
Configuration
Configuration notes
Source management
The Soundavo WS66i 6-Zone Amplifier integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control the Soundavo Whole-Home Audio Amplifier via the local network. This amplifier is an upgrade of the amplifier sold by Monoprice that adds 2 built-in wireless streamers and an Ethernet port for control over LAN.
To add the Soundavo WS66i 6-Zone Amplifier device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Soundavo WS66i 6-Zone Amplifier .
Follow the instructions on screen to complete the setup.
Enter the IP address of the WS66i amplifier when prompted to connect to the device and hit submit. It will detect the number of connected amplifiers and present each zone as an entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] .
1 Amplifier: Zones 11..16
2 Amplifiers: Zones 11..16, Zones 21..26
3 Amplifiers: Zones 11..16, Zones 21..26, Zones 31..36
Once detected, you can add them to an area.
You can configure source names by hitting the CONFIGURE button in the integration card.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Soundavo WS66i 6-Zone Amplifier device was introduced in Home Assistant 2022.6, and it's used by
23 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@ssaenger
Categories
Media player
Back to top
