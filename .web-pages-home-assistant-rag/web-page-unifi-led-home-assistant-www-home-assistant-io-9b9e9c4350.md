---
source_url: "https://www.home-assistant.io/integrations/unifiled"
final_url: "https://www.home-assistant.io/integrations/unifiled"
canonical_url: "https://www.home-assistant.io/integrations/unifiled/"
source_handle: "web:www-home-assistant-io:9b9e9c4350d0"
source_section: "integrations-unifiled"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "292651219a2ab5bfc2882ba5b3811970329e3ad0caa877dc0e38cdea7fd500fa"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# UniFi LED - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/unifiled
- Final URL: https://www.home-assistant.io/integrations/unifiled
- Canonical URL: https://www.home-assistant.io/integrations/unifiled/
- Fetched at: 2026-06-28T03:25:00Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to configure the UniFi LED integration with UniFi LED Controller by Ubiquiti.

## Extracted Text

On this page
Configuration
Light
Related topics
UniFi LED by Ubiquiti Networks, inc. is a system of controller managed LED light panels and dimmers.
There is currently support for the following device type within Home Assistant:
To use the integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] in your installation, add it to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry light : - platform : unifiled host : IP_ADDRESS username : USERNAME password : PASSWORD
Configuration Variables
Looking for your configuration file?
host string Required , default: None
IP address or hostname used to connect to the UniFi LED controller.
port string ( Optional , default: 20443 )
Port used to connect to the UniFi LED controller.
username string Required , default: None
Username used to log into the UniFi LED controller.
password string Required , default: None
Password used to log into the UniFi LED controller.
The light panels output state and brightness are synchronized with Home Assistant.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The UniFi LED integration was introduced in Home Assistant 0.102, and it's used by
0 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@florisvdk
Categories
Back to top
