---
source_url: "https://www.home-assistant.io/integrations/linode"
final_url: "https://www.home-assistant.io/integrations/linode"
canonical_url: "https://www.home-assistant.io/integrations/linode/"
source_handle: "web:www-home-assistant-io:d28f22a2cf9b"
source_section: "integrations-linode"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "fcdc75bd9f4121e7d97ab9a8997048102268094b716210a2eb2e673c97a13934"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Linode - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/linode
- Final URL: https://www.home-assistant.io/integrations/linode
- Canonical URL: https://www.home-assistant.io/integrations/linode/
- Fetched at: 2026-06-28T02:56:56Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up Linode within Home Assistant.

## Extracted Text

On this page
Setup
Configuration
Binary sensor
Switch
Related topics
The Linode integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to access the information about your Linode systems from Home Assistant.
There is currently support for the following device types within Home Assistant:
Obtain your oAuth2 Access Token from Linode account.
https://cloud.linode.com
Log in
Select API Tokens
Create a Personal Access Token,
Assigned scope (Please choose the least possible access required.)
To integrate Linode with Home Assistant, add the following section to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry linode : access_token : YOUR_ACCESS_TOKEN
Configuration Variables
Looking for your configuration file?
access_token string Required
The Linode access token.
The linode binary sensor platform allows you to monitor your Linode nodes.
Add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry binary_sensor : - platform : linode nodes : - ' myvpsname'
nodes string Required
List of VPSs you want to control.
The linode switch platform allows you to turn your Linode nodes on and off.
# Example configuration.yaml entry switch : - platform : linode nodes : - ' myvpsname'
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Linode integration was introduced in Home Assistant 0.57, and it's used by
16 active installations.
Its IoT class is Cloud Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
System monitor
Back to top
