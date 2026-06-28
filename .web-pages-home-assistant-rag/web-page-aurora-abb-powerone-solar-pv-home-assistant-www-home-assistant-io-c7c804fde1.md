---
source_url: "https://www.home-assistant.io/integrations/aurora_abb_powerone"
final_url: "https://www.home-assistant.io/integrations/aurora_abb_powerone"
canonical_url: "https://www.home-assistant.io/integrations/aurora_abb_powerone/"
source_handle: "web:www-home-assistant-io:c7c804fde12f"
source_section: "integrations-aurora-abb-powerone"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "5f1bf9f70b3e0b24982a4b6d790d9453ae207f139fd5da4fa6451e699ef479d5"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Aurora ABB PowerOne Solar PV - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/aurora_abb_powerone
- Final URL: https://www.home-assistant.io/integrations/aurora_abb_powerone
- Canonical URL: https://www.home-assistant.io/integrations/aurora_abb_powerone/
- Fetched at: 2026-06-28T02:29:55Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate an Aurora ABB PowerOne solar inverter within Home Assistant.

## Extracted Text

On this page
Configuration
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] implements a direct RS485 connection to a solar inverter in the
PVI-3.0/3.6/4.2-TL-OUTD ABB series, and may work on others.
The inverter was formerly made by PowerOne who got taken over by ABB.
The TCP/IP method of communicating with inverters is supported by the
Python library, but not by this implementation in this integration.
This integration creates the inverter as a device with three sensors, reporting live power output in Watts, energy generated in kWh and device temperature.
Note the PV inverter will be unresponsive to communications when in darkness,
so the sensors will report ‘Unavailable’ during the night.
The RS485 connection can be made using a low-cost USB-RS485 converter. It works using a 2-wire interface but an interface with a separate ground reference may be more reliable.
To add the Aurora ABB PowerOne Solar PV device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Aurora ABB PowerOne Solar PV .
Follow the instructions on screen to complete the setup.
The inverter will need to be on (that is, in daylight) and connected correctly to do the first-time setup. Normally it is sufficient to select the correct serial port and leave the default address 2 .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Aurora ABB PowerOne Solar PV device was introduced in Home Assistant 0.96, and it's used by
46 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@davet2001
Categories
Energy
Sensor
Back to top
