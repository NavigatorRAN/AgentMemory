---
source_url: "https://www.home-assistant.io/integrations/solax"
final_url: "https://www.home-assistant.io/integrations/solax"
canonical_url: "https://www.home-assistant.io/integrations/solax/"
source_handle: "web:www-home-assistant-io:9b2fe2a633d5"
source_section: "integrations-solax"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "deba796237b84acbe670be5d8f54a1b3d12190bdfdd73defdd012b06fc4f7f12"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# SolaX Power - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/solax
- Final URL: https://www.home-assistant.io/integrations/solax
- Canonical URL: https://www.home-assistant.io/integrations/solax/
- Fetched at: 2026-06-28T03:17:58Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Solax sensor within Home Assistant.

## Extracted Text

On this page
Configuration
Optional template sensor
Configuring the Energy Dashboard
The SolaX Power integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] connects Home Assistant to Solax solar power inverters. Solax inverters may be connected to a home Wi-Fi network and expose a REST API. This integration retrieves information such as photovoltaic power production, battery levels and power, and how much power is being fed back into the grid.
To add the SolaX Power device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select SolaX Power .
Follow the instructions on screen to complete the setup.
If you would like to convert the values from multiple panels or view the total power the house is using, you can use the template platform .
# Example configuration.yaml entry for template platform template : - sensor - name : Total PV power unit_of_measurement : " W" state : " {{ (states('sensor.pv1_power') | float(default=0)) + (states('sensor.pv2_power') | float(default=0)) }}" - name : Load power unit_of_measurement : " W" state : " {{ (states('sensor.power_now') | float(default=0)) - (states('sensor.exported_power') | float(default=0)) }}"
There are generally at least 3 sensors from your inverter that you need to configure in the energy dashboard:
The consumption sensor (in kWh) for the Grid Consumption .
The feed-in sensor (in kWh) for the Return to grid , for example, the solar panel energy you do not consume and return to the grid instead.
The on-grid yield sensor (in kWh) for the Solar production .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The SolaX Power device was introduced in Home Assistant 0.94, and it's used by
785 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@squishykid
@Darsstar
Categories
Energy
Sensor
Back to top
