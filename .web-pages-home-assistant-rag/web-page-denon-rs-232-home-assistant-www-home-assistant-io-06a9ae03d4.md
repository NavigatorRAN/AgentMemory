---
source_url: "https://www.home-assistant.io/integrations/denon_rs232"
final_url: "https://www.home-assistant.io/integrations/denon_rs232"
canonical_url: "https://www.home-assistant.io/integrations/denon_rs232/"
source_handle: "web:www-home-assistant-io:06a9ae03d421"
source_section: "integrations-denon-rs232"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "dc47630d8f8f1df0de36e38de37666655196ec97680db2a7df0c44658063ad7c"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Denon RS-232 - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/denon_rs232
- Final URL: https://www.home-assistant.io/integrations/denon_rs232
- Canonical URL: https://www.home-assistant.io/integrations/denon_rs232/
- Fetched at: 2026-06-28T02:36:36Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Denon receivers via their RS-232 serial port into Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Supported functionality
Media player controls
Zones
Source selection
The Denon RS-232 integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you control Denon receivers by connecting to their RS-232 serial port. By connecting the receiver to your Home Assistant server using a serial (RS-232) cable or a USB-to-serial adapter, you get local control with push-based state updates.
A Denon receiver that supports control over its RS-232 serial port.
A physical serial connection between your receiver and the system running Home Assistant, or ESPHome-based serial proxy.
To add the Denon RS-232 hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Denon RS-232 .
Follow the instructions on screen to complete the setup.
The integration adds media player entities as an entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] for your receiver.
For supported receivers, you can use Home Assistant to:
Turn the receiver on and off
Change the volume
Mute and unmute the main zone
Select the input source
If your receiver supports additional zones, Home Assistant adds separate media player entities for those zones.
Main zone
Zone 2
Zone 3
The available zones depend on your receiver model.
The available input sources depend on the receiver model you select during setup.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Denon RS-232 hub was introduced in Home Assistant 2026.5, and it's used by
11 active installations.
Its IoT class is Local Push.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@balloob
Categories
Media player
Back to top
