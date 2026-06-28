---
source_url: "https://www.home-assistant.io/integrations/iotawatt"
final_url: "https://www.home-assistant.io/integrations/iotawatt"
canonical_url: "https://www.home-assistant.io/integrations/iotawatt/"
source_handle: "web:www-home-assistant-io:b2a8b58b775d"
source_section: "integrations-iotawatt"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "cf1998ebd52870ef3918d33eb6248d718dae063cc72cc4906170e0e97670e995"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# IoTaWatt - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/iotawatt
- Final URL: https://www.home-assistant.io/integrations/iotawatt
- Canonical URL: https://www.home-assistant.io/integrations/iotawatt/
- Fetched at: 2026-06-28T02:52:53Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate IoTaWatt into Home Assistant.

## Extracted Text

On this page
Configuration
Energy management and sensor availability
Energy production systems
Configure IoTaWatt
Configure Energy Management
Integration for the IoTaWatt Open WiFi Electricity Monitor. It
will collect data from the Current Transformer Clamps (Input CTs) and any Outputs that are defined on the IoTaWatt
and create them as sensors in Home Assistant.
To add the IoTaWatt device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select IoTaWatt .
Follow the instructions on screen to complete the setup.
You can use the energy sensors directly with the Home Assistant energy dashboard.
IoTaWatt Inputs are available as sensors and are shown on the IoTaWatt device page in Home Assistant.
Any Outputs you create within the IoTaWatt unit are also available as sensors for use in the energy dashboard and templates. However, they are not listed on the IoTaWatt device page because of the Home Assistant policy on unique naming. When you configure the energy dashboard or create a template or helper, start typing the name of a defined IoTaWatt output. Home Assistant suggests completing the sensor name.
If you have an energy production system such as solar panels, follow these instructions:
You will need to configure IoTaWatt output sensors for consumption, export, and production.
For example:
Name Unit Formula MainsConsumption Watts (Main_In_Red + Main_In_White + Main_In_Blue) max 0 MainsExport Watts ((Main_In_Red + Main_In_White + Main_In_Blue) min 0) abs Solar Watts ((Solar_Red max 0) + (Solar_White max 0) + (Solar_Blue max 0))
Replace (Main_In_Red + Main_In_White + Main_In_Blue) with the correct formula for your main feed.
Using a solar net system
The IoTaWatt team recommends that the inputs for solar reads positive which can be achieved by either changing the orientation of the CT sensor or in the IoTaWatt’s input settings, check Reverse .
Replace (Main_In_Red + Main_In_White + Main_In_Blue) with (Main_In_Red + Main_In_White + Main_In_Blue - Solar)
If you have two solar sensors named Solar1 and Solar2 you would use:
(Main_In_Red + Main_In_White + Main_In_Blue - Solar1 - Solar2)
The IoTaWatt Outputs are available for use:
In the Grid Consumption settings, select MainsConsumption.wh
In the Return to grid settings, select MainsExport.wh
In the Solar production settings, select Solar.wh
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The IoTaWatt device was introduced in Home Assistant 2021.9, and it's used by
538 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@gtdiehl
@jyavenard
Categories
Energy
Back to top
