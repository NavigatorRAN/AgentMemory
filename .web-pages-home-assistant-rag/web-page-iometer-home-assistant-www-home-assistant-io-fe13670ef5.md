---
source_url: "https://www.home-assistant.io/integrations/iometer"
final_url: "https://www.home-assistant.io/integrations/iometer"
canonical_url: "https://www.home-assistant.io/integrations/iometer/"
source_handle: "web:www-home-assistant-io:fe13670ef5df"
source_section: "integrations-iometer"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "67b204da9773bc69aaf4f4218626111bfcaea902ad3a6ae98efc4eac9d06c542"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# IOmeter - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/iometer
- Final URL: https://www.home-assistant.io/integrations/iometer
- Canonical URL: https://www.home-assistant.io/integrations/iometer/
- Fetched at: 2026-06-28T02:52:48Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate IOmeter within Home Assistant.

## Extracted Text

On this page
Configuration
Configuration parameters
Data updates
Available sensors
Troubleshooting
Removing the integration
To remove an integration instance from Home Assistant
The IOmeter integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] fetches data from your IOmeter device, by using the local HTTP API.
IOmeter is a German company that provides the IOmeter device for reading electricity meters.
Important
In order for the IOmeter to be used by Home Assistant, the Core/Bridge firmware version should be at least 62/69.
To add the IOmeter device to your Home Assistant instance, use this My button:
IOmeter can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select IOmeter .
Follow the instructions on screen to complete the setup.
IP address
The IP address of your IOmeter.
The integration will update its sensors by polling the IOmeter Bridge every ten seconds for new values. We recommend using USB-C power for the IOmeter Core instead of batteries.
The following sensors are supported:
Power (W): Active power
Total energy usage (kWh): How much energy the meter used
Total energy usage T1 (kWh): How much energy the meter used on tariff T1
Total energy usage T2 (kWh): How much energy the meter used on tariff T2
Total energy returned (kWh): How much energy the meter returned to the grid
Meter number: Electricity meter number
Pin status: Electricity meter pin status
Core battery level: Battery level of the IOmeter Core in percent
Core power status: Battery or USB-C power for the IOmeter Core
Signal strength WiFi: WiFi connection strength of the Bridge
Signal strength Core/Bridge: Sub-GHz connection strength between Core and Bridge
Core/Bridge connection status: If Core and Bridge are connected
Core attachment status: If the IOmeter Core is attached to the electricity meter
There are no commonly known issues with this integration.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The IOmeter device was introduced in Home Assistant 2025.3, and it's used by
826 active installations.
Its IoT class is Local Polling.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@jukrebs
Categories
Energy
Sensor
Back to top
