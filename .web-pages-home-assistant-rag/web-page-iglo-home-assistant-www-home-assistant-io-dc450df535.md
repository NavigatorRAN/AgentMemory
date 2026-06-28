---
source_url: "https://www.home-assistant.io/integrations/iglo"
final_url: "https://www.home-assistant.io/integrations/iglo"
canonical_url: "https://www.home-assistant.io/integrations/iglo/"
source_handle: "web:www-home-assistant-io:dc450df535c6"
source_section: "integrations-iglo"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "32dc611885fcf839d5f539d236612a17acb7e716bd4ebc118f967c1c939687bb"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# iGlo - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/iglo
- Final URL: https://www.home-assistant.io/integrations/iglo
- Canonical URL: https://www.home-assistant.io/integrations/iglo/
- Fetched at: 2026-06-28T02:51:22Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate iGlo lights into Home Assistant.

## Extracted Text

On this page
Related topics
The iGlo integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to integrate your iGlo Lights into Home Assistant.
To use your iGlo light in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry light : - platform : iglo host : 192.168.1.10
Configuration Variables
Looking for your configuration file?
host string Required
The IP address for connecting to the light.
name string ( Optional , default: iGlo Light )
The name for this light.
port integer ( Optional , default: 8080 )
The port used to connect to the light.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The iGlo integration was introduced in Home Assistant 0.61, and it's used by
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
Light
Back to top
