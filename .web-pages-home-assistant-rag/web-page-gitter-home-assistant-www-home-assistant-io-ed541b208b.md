---
source_url: "https://www.home-assistant.io/integrations/gitter"
final_url: "https://www.home-assistant.io/integrations/gitter"
canonical_url: "https://www.home-assistant.io/integrations/gitter/"
source_handle: "web:www-home-assistant-io:ed541b208bef"
source_section: "integrations-gitter"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "f0e1aa6b819a3f29c35457e33e2bf2b61b35a4c3a720a26fa3b3f88186ce5ffc"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Gitter - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/gitter
- Final URL: https://www.home-assistant.io/integrations/gitter
- Canonical URL: https://www.home-assistant.io/integrations/gitter/
- Fetched at: 2026-06-28T02:46:08Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate a Gitter room sensor with Home Assistant

## Extracted Text

On this page
Configuration
Related topics
This Gitter integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows one to monitor a Gitter.im chatroom for unread messages.
Visit Gitter Developer Apps to retrieve your “Personal Access Token”.
To use a Gitter integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry sensor : - platform : gitter api_key : YOUR_API_TOKEN
Configuration Variables
Looking for your configuration file?
api_key string Required
Your Gitter.im API token.
room string ( Optional )
Gitter room to monitor.
Default:
home-assistant/home-assistant
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Gitter integration was introduced in Home Assistant 0.47, and it's used by
0 active installations.
Its IoT class is Cloud Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Sensor
Back to top
