---
source_url: "https://www.home-assistant.io/integrations/worxlandroid"
final_url: "https://www.home-assistant.io/integrations/worxlandroid"
canonical_url: "https://www.home-assistant.io/integrations/worxlandroid/"
source_handle: "web:www-home-assistant-io:8b639817dd7b"
source_section: "integrations-worxlandroid"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "a4c579b0c5faa27ad1e1b168f5279ef73a1f4be574e83ac91bc02680368f45b8"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Worx Landroid - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/worxlandroid
- Final URL: https://www.home-assistant.io/integrations/worxlandroid
- Canonical URL: https://www.home-assistant.io/integrations/worxlandroid/
- Fetched at: 2026-06-28T03:29:12Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Worx Landroid WG796E.1 or WG797E as sensors within Home Assistant.

## Extracted Text

On this page
Related topics
The Worx Landroid integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to get the current state, battery level and error status Worx Landroid WG796E.1 or WG797E.
To use your Worx Landroid mower in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry sensor : - platform : worxlandroid host : 192.168.0.10 pin : 1234
Configuration Variables
Looking for your configuration file?
host string Required
The IP address or host name of the mower.
pin string Required
The pin code for the mower.
allow_unreachable boolean ( Optional , default: true )
This will allow the mower to be outside of Wi-Fi range without raising an error.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Worx Landroid integration was introduced in Home Assistant 0.54, and it's used by
416 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
DIY
Back to top
