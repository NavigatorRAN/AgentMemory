---
source_url: "https://www.home-assistant.io/integrations/tapsaff"
final_url: "https://www.home-assistant.io/integrations/tapsaff"
canonical_url: "https://www.home-assistant.io/integrations/tapsaff/"
source_handle: "web:www-home-assistant-io:ec7df4a39896"
source_section: "integrations-tapsaff"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "0e7e74695f311f535184ec683d96a7b10dd272dc71cf36b2d21cd42f65681bdc"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Taps Aff - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/tapsaff
- Final URL: https://www.home-assistant.io/integrations/tapsaff
- Canonical URL: https://www.home-assistant.io/integrations/tapsaff/
- Fetched at: 2026-06-28T03:20:55Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to use the Taps Aff binary sensor in Home Assistant.

## Extracted Text

On this page
Configuration
Related topics
The Taps Aff integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the ‘Taps Aff’ status for a given location within the UK using Taps Aff .
To enable this integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] , add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry binary_sensor : - platform : tapsaff location : glasgow
Configuration Variables
Looking for your configuration file?
location string Required
The location for the Taps Aff. It must be configured with a UK postcode or city to work.
name string ( Optional , default: Taps Aff )
The name to use when displaying this sensor.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Taps Aff integration was introduced in Home Assistant 0.47, and it's used by
4 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@bazwilliams
Categories
Weather
Back to top
