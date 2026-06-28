---
source_url: "https://www.home-assistant.io/integrations/iotty"
final_url: "https://www.home-assistant.io/integrations/iotty"
canonical_url: "https://www.home-assistant.io/integrations/iotty/"
source_handle: "web:www-home-assistant-io:1c39febc47b4"
source_section: "integrations-iotty"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "ff7939cbe4588d6e3733eeba7401981030c7eeea2899591464837bd42fbaa0cf"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# iotty - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/iotty
- Final URL: https://www.home-assistant.io/integrations/iotty
- Canonical URL: https://www.home-assistant.io/integrations/iotty/
- Fetched at: 2026-06-28T02:52:55Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to connect iotty Smart Devices to Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Supported devices
iotty Smart Switch
iotty Shutter
iotty Outlet
Supported entities
Switches
Covers
The iotty integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you integrate iotty devices into Home Assistant. The iotty family includes the smart switch for lights and gates, the smart shades switch for blinds and shutters, and the smart outlet.
To use this integration, you must have an iotty account, and enter its credentials during account pairing.
To create an iotty account, you need to get the App from the App Store or Play Store .
To add the iotty device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select iotty .
Follow the instructions on screen to complete the setup.
This integration currently supports the following iotty devices:
US version:
1-Switch Controller
2-Switch Controller
3-Switch Controller
4-Switch Controller
EU version:
E1 PLUS Smart Switch - for lights and gates
E2 PLUS Smart Switch - for lights and gates
i3 PLUS Smart Switch - for lights and gates
E2S PLUS Smart Shades Switch - for shutters and blinds
i3S PLUS Smart Shades Switch - for shutters and blinds
OiT PLUS Smart Outlet
ODE PLUS Smart Outlet
OFR PLUS Smart Outlet
iotty Smart Outlet - Italy
iotty Smart Outlet - Germany
iotty Smart Outlet - France
Each iotty device gets mapped into one Home Assistant device per gang, each with its own Switch entity.
The main, unnamed, switch entity controls the light switch or the outlet switch, turning it on or off the gang related to it.
The main, unnamed, cover entity controls the shutter, opening, closing, stopping, and moving to a specific position the target.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The iotty device was introduced in Home Assistant 2024.8, and it's used by
88 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@shapournemati-iotty
Categories
Cover
Switch
Back to top
