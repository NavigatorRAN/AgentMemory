---
source_url: "https://www.home-assistant.io/integrations/lw12wifi"
final_url: "https://www.home-assistant.io/integrations/lw12wifi"
canonical_url: "https://www.home-assistant.io/integrations/lw12wifi/"
source_handle: "web:www-home-assistant-io:c01d77f8e5fa"
source_section: "integrations-lw12wifi"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "7892f5506583e67f26ab9a30fa2620ad42e952a854e35fb4eef986f25ed8b825"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# LAGUTE LW-12 - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/lw12wifi
- Final URL: https://www.home-assistant.io/integrations/lw12wifi
- Canonical URL: https://www.home-assistant.io/integrations/lw12wifi/
- Fetched at: 2026-06-28T02:58:14Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up Lagute LW-12 Wifi LED controller within Home Assistant.

## Extracted Text

On this page
Configuration
Related topics
The LAGUTE LW-12 integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] supports Lagute LW-12 Wifi LED controller.
To enable these lights, add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry light : - platform : lw12wifi host : IP_ADDRESS_CONTROLLER
Configuration Variables
Looking for your configuration file?
host string Required
Host name or IP of LW-12 LED stripe to control.
port integer ( Optional , default: 5000 )
Some firmware versions of the LW-12 controller listen on different ports.
name string ( Optional , default: LW-12 FC )
Name to use in the frontend.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The LAGUTE LW-12 integration was introduced in Home Assistant 0.71, and it's used by
0 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Light
Back to top
