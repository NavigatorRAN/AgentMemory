---
source_url: "https://www.home-assistant.io/integrations/message_bird"
final_url: "https://www.home-assistant.io/integrations/message_bird"
canonical_url: "https://www.home-assistant.io/integrations/message_bird/"
source_handle: "web:www-home-assistant-io:9d51c26f9a7a"
source_section: "integrations-message-bird"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "6e38faff8f4dbba5dc9940fff75615bdd99076e7e08aacb951922377278d1c4f"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# MessageBird - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/message_bird
- Final URL: https://www.home-assistant.io/integrations/message_bird
- Canonical URL: https://www.home-assistant.io/integrations/message_bird/
- Fetched at: 2026-06-28T02:59:29Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to add MessageBird notifications to Home Assistant.

## Extracted Text

On this page
Setup
Configuration
Usage
Related topics
The MessageBird integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] sends notifications as SMS messages using MessageBird to your mobile phone.
Go to MessageBird to retrieve your API key.
To enable MessageBird notifications in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry notify : - name : NOTIFIER_NAME platform : message_bird api_key : YOUR_API_KEY
Configuration Variables
Looking for your configuration file?
api_key string Required
Your MessageBird API key.
name string ( Optional , default: notify )
Setting the optional parameter name allows multiple notifiers to be created. The notifier will bind to the notify.NOTIFIER_NAME action.
sender string ( Optional , default: HA )
Setting the optional parameter sender . This will be the sender of the SMS. It may be either a telephone number (e.g., +4915112345678 ) or a text with a maximum length of 11 characters.
MessageBird is a notify platform and thus can be controlled by calling the notify action as described here . It will send a notification to the specified mobile phone number(s).
Example action payload
{ "message" : "A message for many people" , "target" : [ "+49123456789" , "+43123456789" ] }
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The MessageBird integration was introduced in Home Assistant 0.16, and it's used by
9 active installations.
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
