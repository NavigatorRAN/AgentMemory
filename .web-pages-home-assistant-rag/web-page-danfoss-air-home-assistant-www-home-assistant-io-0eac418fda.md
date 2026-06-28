---
source_url: "https://www.home-assistant.io/integrations/danfoss_air"
final_url: "https://www.home-assistant.io/integrations/danfoss_air"
canonical_url: "https://www.home-assistant.io/integrations/danfoss_air/"
source_handle: "web:www-home-assistant-io:0eac418fda29"
source_section: "integrations-danfoss-air"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "b62d16104e5557655a367b3aa436e2c9522216599b918e21caeb71c9c45b89d1"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Danfoss Air - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/danfoss_air
- Final URL: https://www.home-assistant.io/integrations/danfoss_air
- Canonical URL: https://www.home-assistant.io/integrations/danfoss_air/
- Fetched at: 2026-06-28T02:35:51Z
- Content type: text/html; charset=UTF-8

## Description

How to integrate Danfoss Air HRV in Home Assistant.

## Extracted Text

On this page
Binary sensor
Sensor
Switch
The Danfoss Air integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to access information from your Danfoss Air HRV unit.
Note : Danfoss Air CCM only accepts one TCP connection at a time. Due to this the integration will not work while you have the HRV PC-Tool open.
There is currently support for the following device types within Home Assistant:
To enable Danfoss Air, add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry danfoss_air : host : IP_ADDRESS_OF_CCM
Configuration Variables
Looking for your configuration file?
host string Required
Danfoss Air CCM IP.
The following binary sensor is supported.
Bypass active: Indicator if heat recovery is currently bypassed.
The following sensors are supported.
Outdoor temperature: Outdoor air temperature.
Supply temperature: Air temperature of the air supplied to the house.
Extract temperature: Air temperature of the air extracted from the house.
Exhaust temperature: Exhausted air temperature.
Remaining filter lifetime: Remaining filter lifetime measured in percent.
Humidity: Relative humidity in percent.
Fan step: Fan step.
Exhaust fan speed: Exhausted fan speed.
Supply fan speed: Supply fan speed.
Dial battery: Dial battery level in percent.
The following switches are supported.
Boost: Switch to manually activate boost.
Bypass: Switch to manually activate bypass.
Automatic bypass: Switch to enable automatic bypass.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Danfoss Air integration was introduced in Home Assistant 0.87, and it's used by
40 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Climate
Back to top
