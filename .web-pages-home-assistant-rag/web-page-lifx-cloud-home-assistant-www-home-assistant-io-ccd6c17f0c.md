---
source_url: "https://www.home-assistant.io/integrations/lifx_cloud"
final_url: "https://www.home-assistant.io/integrations/lifx_cloud"
canonical_url: "https://www.home-assistant.io/integrations/lifx_cloud/"
source_handle: "web:www-home-assistant-io:ccd6c17f0cc6"
source_section: "integrations-lifx-cloud"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "890c49ba17b50ccc4e8027edccd9a0cf97c1f83fb782f24ac50974fc844b13a7"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# LIFX Cloud - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/lifx_cloud
- Final URL: https://www.home-assistant.io/integrations/lifx_cloud
- Canonical URL: https://www.home-assistant.io/integrations/lifx_cloud/
- Fetched at: 2026-06-28T02:56:31Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on using native LIFX scenes with Home Assistant.

## Extracted Text

On this page
Getting an API token
Related topics
The LIFX Cloud integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to activate the scenes that LIFX smartphone apps store in the LIFX cloud.
To enable the LIFX Cloud integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] , add it to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry scene : - platform : lifx_cloud token : YOUR_LIFX_TOKEN
You can then activate each scene with its name from the smartphone app:
- action : scene.turn_on target : entity_id : scene.goodnight
Configuration Variables
Looking for your configuration file?
token string Required
The API token for your LIFX Cloud account.
timeout integer ( Optional , default: 10 )
Network timeout in seconds.
You create your API token on the LIFX website:
Sign in to the LIFX Cloud
Click on your email address and select Personal Access Tokens
Now click Generate New Token
Enter a meaningful label, such as ‘Home Assistant’
Click Generate
Copy the token that now appears
Paste the token into the Home Assistant configuration file
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The LIFX Cloud integration was introduced in Home Assistant 0.43, and it's used by
145 active installations.
Its IoT class is Cloud Push.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Scene
Back to top
