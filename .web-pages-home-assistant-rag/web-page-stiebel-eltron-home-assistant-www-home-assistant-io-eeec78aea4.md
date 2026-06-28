---
source_url: "https://www.home-assistant.io/integrations/stiebel_eltron"
final_url: "https://www.home-assistant.io/integrations/stiebel_eltron"
canonical_url: "https://www.home-assistant.io/integrations/stiebel_eltron/"
source_handle: "web:www-home-assistant-io:eeec78aea44f"
source_section: "integrations-stiebel-eltron"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "b96013c82a305ce26ebbdd5070451e3fc92c93a61fd7f54f5d8611fe7713cf9a"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# STIEBEL ELTRON - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/stiebel_eltron
- Final URL: https://www.home-assistant.io/integrations/stiebel_eltron
- Canonical URL: https://www.home-assistant.io/integrations/stiebel_eltron/
- Fetched at: 2026-06-28T03:19:04Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate STIEBEL ELTRON integral ventilation and heat pump units into Home Assistant.

## Extracted Text

On this page
Supported units
HVAC modes
Preset modes
Configuration
Related topics
The STIEBEL ELTRON integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you control integral ventilation or heat pump units of STIEBEL ELTRON .
It requires the following components:
Compatible STIEBEL ELTRON unit (see “Compatibility overview” in Software Documentation Modbus TCP/IP )
ISG web , with the Modbus module enabled
IP network connection to the ISG web
By now, the following units are tested:
LWZ 504e
LWZ 404eco
LWZ 304
LWZ 304 Trend
The following HVAC modes are supported. The STIEBEL ELTRON modes are mapped and configurable as follows:
Auto (HVAC_MODE_AUTO): Automatic mode
Manual (HVAC_MODE_HEAT): Manual mode
Off (HVAC_MODE_OFF): DHW mode (domestic hot water mode, heating is switched off)
The following preset modes are supported. The STIEBEL ELTRON modes are mapped and configurable as follows:
Eco mode (PRESET_ECO)
Day mode (PRESET_DAY)
Setback mode (PRESET_SETBACK)
Emergency mode (PRESET_EMERGENCY)
To enable this integration, add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry stiebel_eltron : name : LWZ504e host : IP_ADDRESS port : 502
Configuration Variables
Looking for your configuration file?
name string ( Optional , default: Unnamed Device )
Displayed name of the unit.
host string Required
The hostname or IP of the stiebel eltron ISG.
port integer ( Optional , default: 502 )
The port of the stiebel eltron ISG.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The STIEBEL ELTRON device was introduced in Home Assistant 0.92, and it's used by
49 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@fucm
@ThyMYthOS
Categories
Climate
Back to top
