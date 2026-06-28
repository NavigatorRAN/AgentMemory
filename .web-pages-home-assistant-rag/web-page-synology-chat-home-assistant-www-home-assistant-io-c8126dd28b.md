---
source_url: "https://www.home-assistant.io/integrations/synology_chat"
final_url: "https://www.home-assistant.io/integrations/synology_chat"
canonical_url: "https://www.home-assistant.io/integrations/synology_chat/"
source_handle: "web:www-home-assistant-io:c8126dd28b58"
source_section: "integrations-synology-chat"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "ecb87d6888ba9097d2b96e4b60db942ac05fe3585c255c8aa962dff375a9cf39"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Synology Chat - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/synology_chat
- Final URL: https://www.home-assistant.io/integrations/synology_chat
- Canonical URL: https://www.home-assistant.io/integrations/synology_chat/
- Fetched at: 2026-06-28T03:20:16Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to add a Synology Chat Bot notifications to Home Assistant.

## Extracted Text

On this page
Related topics
The Synology Chat integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to deliver notifications to your Synology Chat install as a Synology Chat bot.
To configure a Synology Chat bot, first you must create a Synology Chat Integration Incoming Webhook . After this is complete, you will have a Webhook URL. This is what will be required in the Home Assistant configuration.
To enable the Synology Chat notification in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry notify : - platform : synology_chat name : hass_synchat resource : https://example.your.synology.com/webapi/entry.cgi?api=SYNO.Chat.External&method=incoming&version=1&token=ABCDEFG
Configuration Variables
Looking for your configuration file?
name string Required
Setting the parameter name allows multiple notifiers to be created. The notifier will bind to the notify.NOTIFIER_NAME action.
verify_ssl boolean ( Optional , default: true )
If SSL/TLS verification for HTTPS resources needs to be turned off (for self-signed certs).
resource string Required
The incoming webhook URL.
To use notifications, please see the getting started with automation page .
A full example of an action:
{ "message" : "This is a test message" , "data" :{ "file_url" : "https://example.com/wp-content/uploads/sites/14/2011/01/cat.jpg" } }
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Synology Chat integration was introduced in Home Assistant 0.65, and it's used by
179 active installations.
Its IoT class is Cloud Push.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Notifications
Back to top
