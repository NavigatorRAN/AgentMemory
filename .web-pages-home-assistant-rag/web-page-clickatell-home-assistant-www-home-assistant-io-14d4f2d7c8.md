---
source_url: "https://www.home-assistant.io/integrations/clickatell"
final_url: "https://www.home-assistant.io/integrations/clickatell"
canonical_url: "https://www.home-assistant.io/integrations/clickatell/"
source_handle: "web:www-home-assistant-io:14d4f2d7c83c"
source_section: "integrations-clickatell"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "4a85305b3704cadadf60795757b52ab8829f85db14849a859812b7f9672a46f1"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Clickatell - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/clickatell
- Final URL: https://www.home-assistant.io/integrations/clickatell
- Canonical URL: https://www.home-assistant.io/integrations/clickatell/
- Fetched at: 2026-06-28T02:33:59Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to add Clickatell notifications to Home Assistant.

## Extracted Text

On this page
Setup
Configuration
Related topics
The Clickatell integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] uses Clickatell to deliver SMS notifications from Home Assistant.
Go to your Clickatell SMS Platform Portal section and create a new SMS integration. There are three screens of information required to create an integration. Please ensure the following:
Give the new Integration an identification name.
Ensure it is set for ‘production’ use.
Select ‘HTTP’ as your API type.
Ensure that the you select for the messaging type to be ‘one way messaging’.
Be aware of the international number format option as this impacts the structure of the phone numbers you provide.
Once you have completed entering your details an API key is generated. Copy the API key.
To add Clickatell to your installation, add the following to your Home Assistant configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry notify : - platform : clickatell name : USER_DEFINED_NAME api_key : CLICKATELL_API_KEY recipient : PHONE_NO
Configuration Variables
Looking for your configuration file?
name string ( Optional , default: clickatell )
Setting the optional parameter name allows multiple notifiers to be created. The notifier will bind to the notify.NOTIFIER_NAME action.
api_key string Required
Your Clicktell API key.
recipient string Required
Your phone number. This is where you want to send your notification SMS messages, for example, 61444333444 .
To use notifications, please see the getting started with automation page .
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Clickatell integration was introduced in Home Assistant 0.56, and it's used by
32 active installations.
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
