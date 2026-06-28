---
source_url: "https://www.home-assistant.io/integrations/openerz"
final_url: "https://www.home-assistant.io/integrations/openerz"
canonical_url: "https://www.home-assistant.io/integrations/openerz/"
source_handle: "web:www-home-assistant-io:6e589e7b5d11"
source_section: "integrations-openerz"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "4b0c4a995ae46a75d6154ed561c4e9f3aa9a59f65a9507c29925a0b790f097a1"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Open ERZ - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/openerz
- Final URL: https://www.home-assistant.io/integrations/openerz
- Canonical URL: https://www.home-assistant.io/integrations/openerz/
- Fetched at: 2026-06-28T03:05:54Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate a OpenERZ API for Zurich city waste disposal with Home Assistant

## Extracted Text

On this page
Configuration
Related topics
The Open ERZ integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] uses OpenERZ API to access data from Entsorgung und Recycling Zürich (ERZ). It reports the next pickup date for the specified zip and waste type.
To enable this integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry sensor : - platform : openerz zip : 8001 waste_type : cardboard
Available (and tested) waste types are: paper , cardboard , waste , cargotram , etram , organic and textile .
Configuration Variables
Looking for your configuration file?
name string ( Optional )
The name to be used when displaying this sensor.
zip string Required
Postcode of the pickup location.
waste_type string Required , default: waste
Type of waste to be collected.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Open ERZ integration was introduced in Home Assistant 0.109, and it's used by
18 active installations.
Its IoT class is Cloud Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@misialq
Categories
Sensor
Back to top
