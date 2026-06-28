---
source_url: "https://www.home-assistant.io/integrations/clicksend"
final_url: "https://www.home-assistant.io/integrations/clicksend"
canonical_url: "https://www.home-assistant.io/integrations/clicksend/"
source_handle: "web:www-home-assistant-io:e9cdc4f6462e"
source_section: "integrations-clicksend"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "06542d38c96c6a383b88d5e5dc22fd7f4accee5b737f89b7fbfbd30a8057a14b"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# ClickSend SMS - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/clicksend
- Final URL: https://www.home-assistant.io/integrations/clicksend
- Canonical URL: https://www.home-assistant.io/integrations/clicksend/
- Fetched at: 2026-06-28T02:34:01Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to add ClickSend notifications to Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Related topics
The ClickSend SMS integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] uses ClickSend to deliver notifications from Home Assistant.
Go to your ClickSend Dashboard section and create your new project. After creating your project, you should now be able to obtain your username and api_key .
To add ClickSend to your installation, add the following to your Home Assistant configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry notify : - platform : clicksend name : ClickSend username : CLICKSEND_USERNAME api_key : CLICKSEND_API_KEY recipient : PHONE_NO # Multiple recipients notify : - platform : clicksend name : ClickSend username : CLICKSEND_USERNAME api_key : CLICKSEND_API_KEY recipient : [ PHONE_NO1 , PHONE_NO2 ]
Configuration Variables
Looking for your configuration file?
name string ( Optional )
Setting the optional parameter name allows multiple notifiers to be created. The default value is ClickSend . The notifier will bind to the notify.NOTIFIER_NAME action.
username string Required
Your Clicksend username.
api_key string Required
Your Clicksend API Key.
recipient string | list Required
A single or multiple phone numbers. This is where you want to send your SMS notification messages, for example, 09171234567 or [09171234567, 09177654321] .
sender string ( Optional , default: hass )
The name or number of the sender. (Limited to 11 characters.)
To use notifications, please see the getting started with automation page .
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The ClickSend SMS integration was introduced in Home Assistant 0.48, and it's used by
211 active installations.
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
