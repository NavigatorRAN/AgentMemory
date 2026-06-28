---
source_url: "https://www.home-assistant.io/integrations/acer_projector"
final_url: "https://www.home-assistant.io/integrations/acer_projector"
canonical_url: "https://www.home-assistant.io/integrations/acer_projector/"
source_handle: "web:www-home-assistant-io:01c82685fb8f"
source_section: "integrations-acer-projector"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "cb79a7fe61ff5fcfe81c03975bf6496124c9b458b5035873b03acf51365531ff"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Acer Projector - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/acer_projector
- Final URL: https://www.home-assistant.io/integrations/acer_projector
- Canonical URL: https://www.home-assistant.io/integrations/acer_projector/
- Fetched at: 2026-06-28T02:25:48Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Acer Projector switches into Home Assistant.

## Extracted Text

On this page
Configuration
Related topics
The Acer Projector integration allows you to control the state of RS232 connected projectors from Acer .
To use your Acer Projector in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry switch : - platform : acer_projector filename : /dev/ttyUSB0
Configuration Variables
Looking for your configuration file?
filename string Required
The pipe where the projector is connected to.
name string ( Optional )
The name to use when displaying this switch.
timeout integer ( Optional )
Timeout for the connection in seconds.
write_timeout integer ( Optional )
Write timeout in seconds.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Acer Projector integration was introduced in Home Assistant 0.19, and it's used by
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
Multimedia
Back to top
