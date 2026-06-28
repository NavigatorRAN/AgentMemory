---
source_url: "https://www.home-assistant.io/integrations/free_mobile"
final_url: "https://www.home-assistant.io/integrations/free_mobile"
canonical_url: "https://www.home-assistant.io/integrations/free_mobile/"
source_handle: "web:www-home-assistant-io:86386d8618d3"
source_section: "integrations-free-mobile"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "4797b39a68235ce230b423d3ed06db6852ca3531faef4f4d44e781dedf6140b3"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Free Mobile - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/free_mobile
- Final URL: https://www.home-assistant.io/integrations/free_mobile
- Canonical URL: https://www.home-assistant.io/integrations/free_mobile/
- Fetched at: 2026-06-28T02:44:06Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to add Free Mobile SMS notifications to Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Related topics
The Free Mobile integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] uses the French mobile operator Free Mobile to send SMS to your own cell phone.
Before doing anything, you have to activate the SMS API option in your Free Mobile account (In “Gérer mon compte -> Mes Options”). Activating this option will automatically generate a token which is required in your configuration.
This API only sends classic SMS messages and only to the cell phone of the account owner. So you only have to provide a text message in your payload.
Note
If you disable and re-enable the SMS API option, please be sure to update your token in your configuration.
To use this notification platform in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry notify : - name : NOTIFIER_NAME platform : free_mobile username : YOUR_ACCOUNT_ID access_token : TOKEN
Configuration Variables
Looking for your configuration file?
name string ( Optional , default: notify )
The optional parameter name allows multiple notifiers to be created. The notifier will bind to the notify.NOTIFIER_NAME action.
username string Required
This is the id given by FreeMobile to access your online account.
access_token string Required
You can get this token by activating the SMS API in your online account.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Free Mobile integration was introduced in Home Assistant 0.11, and it's used by
763 active installations.
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
