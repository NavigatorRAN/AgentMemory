---
source_url: "https://www.home-assistant.io/integrations/zwave_me"
final_url: "https://www.home-assistant.io/integrations/zwave_me"
canonical_url: "https://www.home-assistant.io/integrations/zwave_me/"
source_handle: "web:www-home-assistant-io:a8b7008eef7f"
source_section: "integrations-zwave-me"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "0224f73dff32bd555a5e1a5bd7ceeba188a82c4dd71d0a162e3ff3e8c0872b43"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Z-Wave.Me - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/zwave_me
- Final URL: https://www.home-assistant.io/integrations/zwave_me
- Canonical URL: https://www.home-assistant.io/integrations/zwave_me/
- Fetched at: 2026-06-28T03:31:30Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Z-Wave with Home Assistant via Z-Wave.Me Z-Way.

## Extracted Text

On this page
Configuration
Hardware requirements
Installing Z-Way
Migration to Z-Way
The Z-Wave.Me integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control a Z-Wave network via the Z-Wave.Me Z-Way . It combines the performance and power of the diagnostics tools built into Z-Way with the flexibility of Home Assistant. The integration brings all Z-Way devices into Home Assistant, including Z-Wave, Zigbee, EnOcean, HTTP-based, and others.
To add the Z-Wave.Me hub to your Home Assistant instance, use this My button:
Z-Wave.Me can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Z-Wave.Me .
Follow the instructions on screen to complete the setup.
URL
The IP address and port of the Z-Way server. You can prefix the address with wss:// to use a secure WebSocket connection (for example, when using the find.z-wave.me remote access service or a public IP with TLS).
API Token
The API access token of the Z-Way server. To get the token, go to the Z-Way Smart Home UI and select Menu > Settings > Users > Administrator > API token .
When connecting via the find.z-wave.me remote access service, you need to use a token with a global scope. To create one, sign in to Z-Way at find.z-wave.me .
Example of connecting to Z-Way in the local network:
URL: 192.168.1.39:8083
API Token: /112f7a4a-0051-cc2b-3b61-1898181b9950
Example of connecting to Z-Way via the find.z-wave.me remote access service:
URL: wss://find.z-wave.me
API Token: 0481effe8a5c6f757b455babb678dc0e764feae279/112f7a4a-0051-cc2b-3b61-1898181b9950
Example of connecting to Z-Way with a static public IP address:
URL: wss://87.250.250.242:8083
Warning
To grant access only to certain devices, create a new user and select the necessary devices from the list. Then use the API token of that user. Do not use the API token of the admin.
Tip
You can use Z-Wave.Me UI with its enhanced Z-Wave network diagnostics tools together with the Home Assistant UI.
Z-Wave.Me Z-Way requires Z-Wave.Me hardware:
RaZberry 7 and RaZberry 7 Pro
Wiren Board 7
Z-Station
Z-Wave & Zigbee mPCIe
RaZberry (old)
UZB1
Hub1
Any other Z-Wave.Me-based controller
Z-Wave.Me Z-Way runs on various platforms, including Raspberry Pi OS, Linux, and Windows. Follow the Z-Way installation instructions to set it up.
To migrate from any other Z-Wave controller to Z-Way, include Z-Way as a secondary controller (with security to let Z-Way learn the network key). Use the Z-Way migration tool to make the controller primary in your network.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Z-Wave.Me hub was introduced in Home Assistant 2022.3, and it's used by
85 active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@lawfulchaos
@Z-Wave-Me
@PoltoS
Categories
Binary sensor
Button
Climate
Cover
Fan
Hub
Light
Lock
Number
Sensor
Siren
Switch
Back to top
