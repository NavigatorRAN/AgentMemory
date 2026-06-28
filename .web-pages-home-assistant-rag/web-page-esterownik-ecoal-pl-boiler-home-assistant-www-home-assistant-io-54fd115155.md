---
source_url: "https://www.home-assistant.io/integrations/ecoal_boiler"
final_url: "https://www.home-assistant.io/integrations/ecoal_boiler"
canonical_url: "https://www.home-assistant.io/integrations/ecoal_boiler/"
source_handle: "web:www-home-assistant-io:54fd1151553b"
source_section: "integrations-ecoal-boiler"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "01792ec3bba4ead06bc19999abd7985cd0de01c9dda2d736a3cfddba73c092da"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# eSterownik eCoal.pl Boiler - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/ecoal_boiler
- Final URL: https://www.home-assistant.io/integrations/ecoal_boiler
- Canonical URL: https://www.home-assistant.io/integrations/ecoal_boiler/
- Fetched at: 2026-06-28T02:38:57Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate eSterownik.pl eCoal.pl controller into Home Assistant.

## Extracted Text

On this page
Configuration
Related topics
The eSterownik eCoal.pl Boiler integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] is the base for pumps and sensors managed by esterownik.pl eCoal boiler controller .
To use your eCoal pumps or sensors in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry ecoal_boiler : host : YOUR_IP_ADDRESS username : YOUR_USERNAME password : YOUR_PASSWORD switches : monitored_conditions : - central_heating_pump - central_heating_pump2 sensors : monitored_conditions : - outdoor_temp - indoor_temp
Configuration Variables
Looking for your configuration file?
host string Required
The IP address or the hostname of eCoal controller.
username string ( Optional , default: admin )
Login used to connect to controller.
password string ( Optional , default: admin )
Password for username.
switches map ( Optional )
switch-related configuration options
monitored_conditions list ( Optional )
controller available source of switches
Default:
all ( central_heating_pump , central_heating_pump2 , domestic_hot_water_pump )
sensors map ( Optional )
sensor-related configuration options
controller available source of sensors
all ( outdoor_temp , indoor_temp , indoor2_temp , domestic_hot_water_temp , target_domestic_hot_water_temp , feedwater_in_temp , feedwater_out_temp , target_feedwater_temp , fuel_feeder_temp , exhaust_temp )
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The eSterownik eCoal.pl Boiler integration was introduced in Home Assistant 0.87, and it's used by
4 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Water heater
Back to top
