---
source_url: "https://www.home-assistant.io/integrations/openalpr_cloud"
final_url: "https://www.home-assistant.io/integrations/openalpr_cloud"
canonical_url: "https://www.home-assistant.io/integrations/openalpr_cloud/"
source_handle: "web:www-home-assistant-io:09a1151944d1"
source_section: "integrations-openalpr-cloud"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "d49a26005979e9a44ec779d9f5918fde8bfede65858cb1e1f276e0db99631560"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# OpenALPR Cloud - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/openalpr_cloud
- Final URL: https://www.home-assistant.io/integrations/openalpr_cloud
- Canonical URL: https://www.home-assistant.io/integrations/openalpr_cloud/
- Fetched at: 2026-06-28T03:05:48Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate licences plates with OpenALPR cloud into Home Assistant.

## Extracted Text

On this page
Configuration
Related topics
The OpenALPR integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] for Home Assistant allows you
to process license plates from a camera. This allows you to open a garage door
or trigger any other automation based on a license plate.
For using the result inside an automation rule,
take a look at the integration page.
To enable the OPENALPR integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] , add it to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes.
# Example configuration.yaml entry image_processing : - platform : openalpr_cloud api_key : YOUR_API_KEY region : eu source : - entity_id : CAMERA.GARAGE
Configuration Variables
Looking for your configuration file?
region string Required
Country or region. List of supported values .
api_key string Required
You need an API key from OpenALPR Cloud .
confidence integer ( Optional , default: 80 )
The minimum of confidence in percent to process with Home Assistant.
source list Required
List of image sources.
entity_id string Required
A camera entity id to get picture from.
name string ( Optional )
This parameter allows you to override the name of your OpenALPR entity.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The OpenALPR Cloud integration was introduced in Home Assistant 0.36, and it's used by
7 active installations.
Its IoT class is Cloud Push.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Image processing
Back to top
