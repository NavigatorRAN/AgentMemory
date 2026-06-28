---
source_url: "https://www.home-assistant.io/integrations/local_file"
final_url: "https://www.home-assistant.io/integrations/local_file"
canonical_url: "https://www.home-assistant.io/integrations/local_file/"
source_handle: "web:www-home-assistant-io:6711929bf2d4"
source_section: "integrations-local-file"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "c811d32d4dd47c7255bc1c95c4e9edd24d1e35133125731dba17dc454a168547"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Local file - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/local_file
- Final URL: https://www.home-assistant.io/integrations/local_file
- Canonical URL: https://www.home-assistant.io/integrations/local_file/
- Fetched at: 2026-06-28T02:57:17Z
- Content type: text/html; charset=UTF-8

## Description

Instructions how to use local file as a camera within Home Assistant.

## Extracted Text

On this page
Configuration
List of actions
Related topics
The Local file camera integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to integrate an image file from disk into Home Assistant as a camera. If the image is updated on the file system, the image displayed in Home Assistant will also be updated. The local_file.update_file_path action can be used to update the image using an automation.
The local_file camera can for example be used with various camera platforms that save a temporary images locally. It can also be used to display a graph that you render periodically and will then be displayed in Home Assistant.
Note
The file path must be added to allowlist_external_dirs for the integration to be able to read it.
To add the Local file integration to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Local file .
Follow the instructions on screen to complete the setup.
The Local file integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Update file path ( local_file.update_file_path )
Changes the image file that a local file camera displays.
For an overview of every action across all integrations, see the actions reference .
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Local file integration was introduced in Home Assistant 0.22, and it's used by
2393 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Camera
Back to top
