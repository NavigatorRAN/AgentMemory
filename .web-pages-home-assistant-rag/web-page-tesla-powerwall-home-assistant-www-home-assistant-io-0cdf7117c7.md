---
source_url: "https://www.home-assistant.io/integrations/powerwall"
final_url: "https://www.home-assistant.io/integrations/powerwall"
canonical_url: "https://www.home-assistant.io/integrations/powerwall/"
source_handle: "web:www-home-assistant-io:0cdf7117c7fc"
source_section: "integrations-powerwall"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "2237be7ab7b53f4f64bcb3de1ced68f8ca27fa584f72606e2b8c4dd95f9ae64e"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Tesla Powerwall - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/powerwall
- Final URL: https://www.home-assistant.io/integrations/powerwall
- Canonical URL: https://www.home-assistant.io/integrations/powerwall/
- Fetched at: 2026-06-28T03:09:00Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Tesla Power Walls into Home Assistant.

## Extracted Text

On this page
Supported devices
Unsupported devices
Configuration
Supported functionality
Binary sensor
Sensor
Switch
Device info
The Tesla Powerwall integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to integrate your Tesla Powerwall into Home Assistant.
The following devices are known to be supported by the integration:
Tesla Powerwall 2
The following devices are not supported by the integration:
Tesla Powerwall 1
Tesla Powerwall 3
To add the Tesla Powerwall device to your Home Assistant instance, use this My button:
Tesla Powerwall can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Tesla Powerwall .
Follow the instructions on screen to complete the setup.
There is currently support for the following device types within Home Assistant:
The following binary sensors are added for each Backup Gateway:
Grid Services - On/ Off
Grid Status - On/ Off
Powerwall Charging - Charging/ Not Charging
Powerwall Connected to Tesla - Connected / Not Connected
Powerwall Status - On/ Off
The following sensors are added for each Backup Gateway aggregated across all Powerwalls:
Powerwall Backup Reserve - Reserve energy for grid outages in %
Powerwall Battery Now - Power in kW (negative for charging)
Powerwall Charge - Percent charge remaining in %
Powerwall Generator Now - Power in kW (if applicable)
Powerwall Load Now - Power in kW
Powerwall Solar Now - Power in kW (if applicable)
Powerwall Site Now - Power in kW (negative for grid export)
Powerwall Backup Reserve - Percentage of battery which will be reserved for a grid outage
Frequency/ Average Current/ Average Voltage Now - in Hertz, Amps and Volts
The following sensors measure lifetime energy flow:
Powerwall Solar Export - Solar energy exported in kWh
Powerwall Solar Import - Solar energy imported in kWh (generally near zero)
Powerwall Site Export - Site energy exported in kWh
Powerwall Site Import - Site energy imported in kWh
Powerwall Battery Export - Battery energy exported in kWh
Powerwall Battery Import - Battery energy imported in kWh
Powerwall Load Export - Load energy exported in kWh (generally zero)
Powerwall Load Import - Load energy imported in kWh
Powerwall Generator Export - Generator energy exported in kWh
Powerwall Generator Import - Generator energy imported in kWh
A Powerwall battery device for each battery, connected to the Powerwall Gateway, with the following sensors:
Powerwall Battery Capacity - Energy in kWh
Powerwall Battery Remaining - Remaining energy in kWh
Frequency/ Average Current/ Average Voltage Now in Hertz, Amps and Volts
Powerwall Battery Power - Battery power in kW (negative for charging)
Powerwall Grid State - Battery grid compliance
The following switch is added for the Powerwall Backup Gateway:
Off-Grid operation - Take your Powerwall off-grid (simulate a grid outage)
Model Number
Firmware Revision
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Tesla Powerwall device was introduced in Home Assistant 0.108, and it's used by
1837 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@bdraco
@jrester
@daniel-simpson
Categories
Energy
Back to top
