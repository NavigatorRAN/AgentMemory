---
source_url: "https://www.home-assistant.io/integrations/ripple"
final_url: "https://www.home-assistant.io/integrations/ripple"
canonical_url: "https://www.home-assistant.io/integrations/ripple/"
source_handle: "web:www-home-assistant-io:ec24838cef07"
source_section: "integrations-ripple"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "fad8ee27360e8cced192f9ff38fd81ba9ed90f2bf0932a3716fa508b064e75c2"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Ripple - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/ripple
- Final URL: https://www.home-assistant.io/integrations/ripple
- Canonical URL: https://www.home-assistant.io/integrations/ripple/
- Fetched at: 2026-06-28T03:12:34Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate ripple.com data within Home Assistant.

## Extracted Text

On this page
Related topics
The Ripple integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] displays Ripple wallet balances from Ripple.com .
To add the Ripple integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] to your installation, specify a ripple address to watch in the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry sensor : - platform : ripple address : " r3kmLJN5D28dHuH8vZNUZpMC43pEHpaocV"
Configuration Variables
Looking for your configuration file?
address string Required
Ripple wallet address to watch.
name string ( Optional , default: Ripple Balance )
Name for the sensor to use in the frontend.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Ripple integration was introduced in Home Assistant 0.47, and it's used by
4 active installations.
Its IoT class is Cloud Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Finance
Back to top
