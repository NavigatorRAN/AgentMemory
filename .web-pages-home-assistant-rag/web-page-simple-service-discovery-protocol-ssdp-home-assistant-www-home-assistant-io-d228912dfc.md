---
source_url: "https://www.home-assistant.io/integrations/ssdp"
final_url: "https://www.home-assistant.io/integrations/ssdp"
canonical_url: "https://www.home-assistant.io/integrations/ssdp/"
source_handle: "web:www-home-assistant-io:d228912dfce7"
source_section: "integrations-ssdp"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "221a5e97e02ccc3f2c0cb1a196a7a69d0c2463bd1d2c40c425bae4cab14de487"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Simple Service Discovery Protocol (SSDP) - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/ssdp
- Final URL: https://www.home-assistant.io/integrations/ssdp
- Canonical URL: https://www.home-assistant.io/integrations/ssdp/
- Fetched at: 2026-06-28T03:18:41Z
- Content type: text/html; charset=UTF-8

## Description

Discover integrations on the network using the SSDP protocol.

## Extracted Text

On this page
Configuration
Troubleshooting
SSDP/UPnP Browser
Discovered integrations
The Simple Service Discovery Protocol (SSDP) (part of UPnP) integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] will scan the network for supported devices and services. Discovered integrations will show up in the discovered section on the integrations page in the configuration panel.
Integrations can opt-in to be found by adding an SSDP section to their manifest.json .
This integration is by default enabled, unless you’ve disabled or removed the default_config: line from your configuration. If that is the case, the following example shows you how to enable this integration manually:
# Example configuration.yaml entry ssdp :
The SSDP/UPnP Browser displays devices discovered by Home Assistant using SSDP (Simple Service Discovery Protocol), a core part of the UPnP (Universal Plug and Play) standard. Devices like smart TVs, media servers, and printers often use SSDP to announce themselves on the network. Home Assistant listens for these broadcasts to automatically detect compatible devices.
To open the SSDP/UPnP Browser, go to:
Settings > System > Network > SSDP Browser
The following integrations are automatically discovered by the SSDP integration:
Arcam FMJ Receivers
AVM FRITZ!Box Tools
AVM FRITZ!SmartHome
Axis
Belkin WeMo
Control4
deCONZ
Denon AVR Network Receivers
Denon HEOS
DirecTV
DLNA Digital Media Renderer
DLNA Digital Media Server
Frontier Silicon
Huawei LTE
Hyperion
Imeon Inverter
Kaleidescape
Keenetic NDMS2 Router
LaMetric
LG webOS TV
Linn / OpenHome
Logitech Harmony Hub
MusicCast
Nanoleaf
NETGEAR
OctoPrint
Onkyo
Roku
Samsung Smart TV
Samsung SyncThru Printer
Sonos
Sony Bravia TV
Sony Songpal
Synology DSM
UniFi Network
UniFi Protect
Universal Devices ISY/IoX
UPnP/IGD
WiLight
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Simple Service Discovery Protocol (SSDP) system was introduced in Home Assistant 0.94, and it's used by
1.5% of the active installations.
Its IoT class is Local Push.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Network
Back to top
