---
source_url: "https://www.home-assistant.io/integrations/cmus"
final_url: "https://www.home-assistant.io/integrations/cmus"
canonical_url: "https://www.home-assistant.io/integrations/cmus/"
source_handle: "web:www-home-assistant-io:5030278e62fc"
source_section: "integrations-cmus"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "94be1ae3e74e8d32eb5ebd9ae75b2d9a68c73909c0826b61cab497e173420e92"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# cmus - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/cmus
- Final URL: https://www.home-assistant.io/integrations/cmus
- Canonical URL: https://www.home-assistant.io/integrations/cmus/
- Fetched at: 2026-06-28T02:34:19Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate cmus Music Player into Home Assistant.

## Extracted Text

On this page
The cmus integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control a cmus music player on a remote or local machine from Home Assistant.
To add cmus to your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
Running it locally will look like:
# Example configuration.yaml entry media_player : - platform : cmus
If cmus is running on a remote server:
# Example configuration.yaml entry media_player : - platform : cmus host : IP_ADDRESS_OF_CMUS_PLAYER password : YOUR_PASSWORD
Configuration Variables
Looking for your configuration file?
host string ( Inclusive )
Hostname or IP address of the machine running cmus. Note if a remote cmus is configured that instance must be configured to listen to remote connections, which also requires a password to be set.
password string ( Inclusive )
Password for your cmus player.
port integer ( Optional , default: 3000 )
Port of the cmus socket.
name string ( Optional , default: cmus )
The name you’d like to give the cmus player in Home Assistant.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The cmus integration was introduced in Home Assistant 0.23, and it's used by
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
Media player
Back to top
