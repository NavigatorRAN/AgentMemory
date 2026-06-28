---
source_url: "https://www.home-assistant.io/integrations/heatmiser"
final_url: "https://www.home-assistant.io/integrations/heatmiser"
canonical_url: "https://www.home-assistant.io/integrations/heatmiser/"
source_handle: "web:www-home-assistant-io:7bdc4cfc084b"
source_section: "integrations-heatmiser"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "fde74b61ab39b40214325f1153941b9321dfa417494fdbe07834a8b3f3fafb55"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Heatmiser - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/heatmiser
- Final URL: https://www.home-assistant.io/integrations/heatmiser
- Canonical URL: https://www.home-assistant.io/integrations/heatmiser/
- Fetched at: 2026-06-28T02:48:21Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Heatmiser thermostats within Home Assistant.

## Extracted Text

On this page
The Heatmiser integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you control Heatmiser DT/DT-E/PRT/PRT-E thermostats from Heatmiser. The module itself is currently set up to work over a RS232 -> RS485 converter, therefore it connects over IP.
Further work would be required to get this setup to connect over Wi-Fi, but the HeatmiserV3 Python module being used is a full implementation of the V3 protocol.
To set it up, add the following information to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
climate : - platform : heatmiser host : YOUR_IP_ADDRESS port : YOUR_PORT tstats : - id : THERMOSTAT_ID name : THERMOSTAT_NAME
A single interface can handle up to 32 connected devices.
Configuration Variables
Looking for your configuration file?
host string Required
The IP address of your interface.
port string Required
The port that the interface is listening on.
tstats list Required
A list of thermostats activated on the gateway.
id string Required
The ID of the thermostat as configured on the device itself.
name string Required
A friendly name for the thermostat.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Heatmiser integration was introduced in Home Assistant 0.10, and it's used by
1 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@andylockran
Categories
Climate
Back to top
