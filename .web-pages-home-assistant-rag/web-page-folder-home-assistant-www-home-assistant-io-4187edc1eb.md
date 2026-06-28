---
source_url: "https://www.home-assistant.io/integrations/folder"
final_url: "https://www.home-assistant.io/integrations/folder"
canonical_url: "https://www.home-assistant.io/integrations/folder/"
source_handle: "web:www-home-assistant-io:4187edc1eb95"
source_section: "integrations-folder"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "1e7ac8c80f28721150e0907942b8a7817b3e4d051f82e778a22f41c17ceaf050"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Folder - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/folder
- Final URL: https://www.home-assistant.io/integrations/folder
- Canonical URL: https://www.home-assistant.io/integrations/folder/
- Fetched at: 2026-06-28T02:43:40Z
- Content type: text/html; charset=UTF-8

## Description

Sensor for monitoring the contents of a folder.

## Extracted Text

On this page
Configuration
Sensor for monitoring the contents of a folder. Note that folder paths must be added to allowlist_external_dirs . Optionally a wildcard filter can be applied to the files considered within the folder. The state of the sensor is the size in MB of files within the folder that meet the filter criteria.
The sensor exposes the number of filtered files in the folder, total size in bytes of those files and a comma separated list of the file paths as attributes.
To enable the folder sensor in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
sensor : - platform : folder folder : /config
Configuration Variables
Looking for your configuration file?
folder string Required
The folder path
filter string ( Optional , default: * )
Filter to apply
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Folder integration was introduced in Home Assistant 0.64, and it's used by
834 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Sensor
Utility
Back to top
