---
source_url: "https://www.home-assistant.io/integrations/twilio_sms"
final_url: "https://www.home-assistant.io/integrations/twilio_sms"
canonical_url: "https://www.home-assistant.io/integrations/twilio_sms/"
source_handle: "web:www-home-assistant-io:34027088117f"
source_section: "integrations-twilio-sms"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "0211a9df0cf9d6622ae3ee00c74f68ca6e18d133102ae9ad7ffcb19cf70cfa9e"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Twilio SMS - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/twilio_sms
- Final URL: https://www.home-assistant.io/integrations/twilio_sms
- Canonical URL: https://www.home-assistant.io/integrations/twilio_sms/
- Fetched at: 2026-06-28T03:24:17Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to add Twilio SMS notifications to Home Assistant.

## Extracted Text

On this page
Configuration
Usage
The Twilio SMS integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] enables sending notifications via SMS, powered by Twilio .
The requirement is that you have set up Twilio .
To use this notification platform in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry notify : - name : NOTIFIER_NAME platform : twilio_sms from_number : E164_PHONE_NUMBER or SENDER_ID
Configuration Variables
Looking for your configuration file?
from_number string Required
An E.164 formatted phone number, like +14151234567. See Twilio’s guide to formatting phone numbers for more information. Alternatively, a sender ID can be used instead of a phone number. The sender ID must be formatted according to Twilio’s guidelines. See Twilio’s guide to sender ID for more information. Do keep in mind that not all countries support sender ID. See Twilio’s page of supported countries for more information.
name string ( Optional , default: notify )
Setting the optional parameter name allows multiple notifiers to be created. The notifier will bind to the notify.NOTIFIER_NAME action.
Twilio is a notification platform and thus can be controlled by calling the notify action as described here . It will send a notification to all E.164 phone numbers in the notification target . See the notes above regarding the from_number configuration variable for information about formatting phone numbers. It’s also possible to use whatsapp:+123456789 for sending notifications to a Whatsapp user.
Media can be included with messages by setting the optional media_url variable. Only .gif , .png , or .jpeg content are supported, according to the Twilio documentation and this feature is only supported in the US and Canada.
# Example automation notification entry automation : - alias : " The sun has set" triggers : - trigger : sun event : sunset actions : - action : notify.twilio_sms data : message : " The sun has set" target : - ' +14151234567' - ' +15105555555' data : media_url : - " https://www.home-assistant.io/images/supported_brands/home-assistant.png"
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Twilio SMS integration was introduced in Home Assistant 0.20, and it's used by
682 active installations.
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
