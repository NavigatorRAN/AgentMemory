---
source_url: "https://www.home-assistant.io/integrations/solaredge_local"
final_url: "https://www.home-assistant.io/integrations/solaredge_local"
canonical_url: "https://www.home-assistant.io/integrations/solaredge_local/"
source_handle: "web:www-home-assistant-io:1faf6aa13eb0"
source_section: "integrations-solaredge-local"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "03bbd505c2ddc479052ca65d932d80b6c75d72abc7fdad9f81124b9ebaa2d948"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# SolarEdge Local - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/solaredge_local
- Final URL: https://www.home-assistant.io/integrations/solaredge_local
- Canonical URL: https://www.home-assistant.io/integrations/solaredge_local/
- Fetched at: 2026-06-28T03:17:50Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate SolarEdge sensor within Home Assistant via Local API.

## Extracted Text

On this page
Configuration
Full configuration sample
Related topics
The SolarEdge Local integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] uses the local API available on some SolarEdge Inverters to allow you to get details from your SolarEdge solar power setup and integrate these into your Home Assistant installation.
Only specific models support the local API. The local API is available on inverters that do not have an LCD character screen. You can also check the datasheets if in the section “Additional Features”, sub-section “Inverter Commissioning” is present the following line “With the SetApp mobile application using built-in Wi-Fi access point for local connection”. These inverters also have a part number that ends with a 4. For example: SEXXK-XXXXXBXX4 or SEXXXXH-XXXXXBXX4
You can check if the local API works by finding the IP address of your inverter and visiting it in a browser. If it supports the local API, you’ll see an HTML page with the SolarEdge logo and a “Commissioning” menu.
Warning
Recent firmware updates have disabled the local API on many inverters. Please enter the IP address of your inverter in a browser before attempting to use this integration. If the local API is enabled, you’ll see a web page with the SolarEdge logo and a “Commissioning” menu. See this issue and this issue for additional details.
If your inverter does not support the local API, you can use the cloud based version
To use the SolarEdge integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more]
# Example configuration.yaml entry sensor : - platform : solaredge_local ip_address : IP_ADDRESS
Configuration Variables
Looking for your configuration file?
ip_address string Required
The IP Address of your SolarEdge inverter.
name string ( Optional , default: SolarEdge )
Let you overwrite the name of the device in the frontend.
A full configuration entry would look like the sample below.
# Example configuration.yaml entry sensor : - platform : solaredge_local name : SolarEdge ip_address : 192.168.1.123
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The SolarEdge Local integration was introduced in Home Assistant 0.95, and it's used by
0 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@drobtravels
@scheric
Categories
Energy
Sensor
Back to top
