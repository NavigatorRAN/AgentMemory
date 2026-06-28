---
source_url: "https://www.home-assistant.io/integrations/kiwi"
final_url: "https://www.home-assistant.io/integrations/kiwi"
canonical_url: "https://www.home-assistant.io/integrations/kiwi/"
source_handle: "web:www-home-assistant-io:3b942da60488"
source_section: "integrations-kiwi"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "78cecb2c753e755828c3af2884211788e06ee14f3fa3c7cc6ac39c4a3f9436e4"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# KIWI - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/kiwi
- Final URL: https://www.home-assistant.io/integrations/kiwi
- Canonical URL: https://www.home-assistant.io/integrations/kiwi/
- Fetched at: 2026-06-28T02:54:41Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate KIWI Smart Lock and Smart Entry.

## Extracted Text

On this page
Configuration
Related topics
The KIWI integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to open your KIWI Smart Locks and Smart Entry Devices.
All you need to get started is a KIWI account. Register at the KIWI website .
To enable the KIWI integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] , add it to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry lock : - platform : kiwi username : [email protected] password : mySecretPassword
Configuration Variables
Looking for your configuration file?
username string Required
The username of your KIWI account.
password string Required
The password of your KIWI account.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The KIWI integration was introduced in Home Assistant 0.72, and it's used by
1 active installations.
Its IoT class is Cloud Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Lock
Back to top
