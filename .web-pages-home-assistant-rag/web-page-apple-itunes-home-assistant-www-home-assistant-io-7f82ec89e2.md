---
source_url: "https://www.home-assistant.io/integrations/itunes"
final_url: "https://www.home-assistant.io/integrations/itunes"
canonical_url: "https://www.home-assistant.io/integrations/itunes/"
source_handle: "web:www-home-assistant-io:7f82ec89e21c"
source_section: "integrations-itunes"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "b3c455b064fcd765db35b53d7865bee3f069934bfac74c4901f822cc75d2e01a"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Apple iTunes - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/itunes
- Final URL: https://www.home-assistant.io/integrations/itunes
- Canonical URL: https://www.home-assistant.io/integrations/itunes/
- Fetched at: 2026-06-28T02:53:39Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate iTunes into Home Assistant.

## Extracted Text

On this page
Configuration
Related topics
The Apple iTunes integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control iTunes from Home Assistant. It uses a 3rd party server that you run on your Mac called itunes-api . Play, pause or skip songs remotely on iTunes running on your Mac.
In addition to controlling iTunes, your available AirPlay endpoints will be added as media players as well. You can then individually address them and turn them on, turn them off or adjust their volume.
To add iTunes to your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry media_player : - platform : itunes host : 192.168.1.50
Configuration Variables
Looking for your configuration file?
host string Required
The IP of the itunes-api API, e.g., 192.168.1.50.
port integer ( Optional , default: 8181 )
The port where itunes-api is accessible, e.g., 8181.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Apple iTunes integration was introduced in Home Assistant 0.7.3, and it's used by
140 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Media player
Back to top
