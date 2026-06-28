---
source_url: "https://www.home-assistant.io/integrations/emoncms_history"
final_url: "https://www.home-assistant.io/integrations/emoncms_history"
canonical_url: "https://www.home-assistant.io/integrations/emoncms_history/"
source_handle: "web:www-home-assistant-io:c89dc8827530"
source_section: "integrations-emoncms-history"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "7be723129adab132288fc950f5979efe27a40f04b6c349f398b18948cfb4fd97"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Emoncms History - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/emoncms_history
- Final URL: https://www.home-assistant.io/integrations/emoncms_history
- Canonical URL: https://www.home-assistant.io/integrations/emoncms_history/
- Fetched at: 2026-06-28T02:40:04Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Emoncms history into Home Assistant.

## Extracted Text

On this page
Related topics
The Emoncms History integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] makes it possible to transfer (write) details collected with Home Assistant to Emoncms.org or your local running Emoncms instance. It will send the data to a specific input node on Emoncms with the entity IDs as a key. Afterwards you can create feeds and dashboards in Emoncms with the collected data.
To use the emoncms_history integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes.
# Example configuration.yaml entry emoncms_history : api_key : YOUR_EMONCMS_WRITE_API_KEY url : https://emoncms.org inputnode : 19 whitelist : - sensor.owm_temperature - sensor.owm_wind_speed
To read information from Emoncms to Home Assistant, you can use the emoncms integration.
Configuration Variables
Looking for your configuration file?
api_key string Required
The write API key for your Emoncms user.
url string Required
The base URL of Emoncms, use https://emoncms.org for the cloud-based version. For self-hosted Emoncms or EmonPi you may need a URL of http://x.x.x.x/emoncms .
inputnode integer Required
Input node that will be used inside Emoncms. Please make sure you use a dedicated, not used before, node for this integration!
whitelist list Required
List of entity IDs you want to publish.
scan_interval integer ( Optional , default: 30 )
Defines, in seconds, how regularly the states of the whitelisted entities are being gathered and send to Emoncms.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Emoncms History integration was introduced in Home Assistant 0.31, and it's used by
191 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@alexandrecuer
Categories
History
Back to top
