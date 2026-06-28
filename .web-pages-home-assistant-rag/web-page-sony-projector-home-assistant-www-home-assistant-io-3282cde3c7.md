---
source_url: "https://www.home-assistant.io/integrations/sony_projector"
final_url: "https://www.home-assistant.io/integrations/sony_projector"
canonical_url: "https://www.home-assistant.io/integrations/sony_projector/"
source_handle: "web:www-home-assistant-io:3282cde3c794"
source_section: "integrations-sony-projector"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "8cf94d6ff330eaef080e5f8cd1dc0e187b3e6a2b239e8e78b0fd841f52784f78"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Sony Projector - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/sony_projector
- Final URL: https://www.home-assistant.io/integrations/sony_projector
- Canonical URL: https://www.home-assistant.io/integrations/sony_projector/
- Fetched at: 2026-06-28T03:18:18Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Sony Projector switches into Home Assistant.

## Extracted Text

On this page
Configuration
The Sony Projector integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control the state of SDCP compatible network-connected projectors from Sony .
To use your Sony Projector in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry switch : - platform : sony_projector host : " 192.168.1.47" name : " Projector"
Configuration Variables
Looking for your configuration file?
host string Required
The hostname or IP address of the projector.
name string ( Optional )
The name to use when displaying this switch.
Under your projector’s web interface Advanced Menu , you may need to:
Enable/start the PJ Talk service.
Add the IP of your Home Assistant server to the Host Address field.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Sony Projector integration was introduced in Home Assistant 0.89, and it's used by
126 active installations.
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
