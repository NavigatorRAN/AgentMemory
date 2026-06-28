---
source_url: "https://www.home-assistant.io/integrations/llamalab_automate"
final_url: "https://www.home-assistant.io/integrations/llamalab_automate"
canonical_url: "https://www.home-assistant.io/integrations/llamalab_automate/"
source_handle: "web:www-home-assistant-io:1fe0b1deb6f3"
source_section: "integrations-llamalab-automate"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "f99e44bb92dd207438622e0d49418699dcc7cbd6a01291cceb98c33c223c8e86"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# LlamaLab Automate - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/llamalab_automate
- Final URL: https://www.home-assistant.io/integrations/llamalab_automate
- Canonical URL: https://www.home-assistant.io/integrations/llamalab_automate/
- Fetched at: 2026-06-28T02:57:13Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to add LlamaLab Automate notifications to Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Related topics
The LlamaLab Automate integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] uses Googles Cloud Messaging Services to push messages from Home Assistant to your Android device running the LlamaLab Automate app. This can serve as an alternative to Tasker + AutoRemote.
Go to https://llamalab.com/automate/cloud/ and create a new API key/secret.
To use this notification integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry notify : - name : NOTIFIER_NAME platform : llamalab_automate api_key : YOUR_API_KEY to : YOUR_EMAIL_ADDRESS
Configuration Variables
Looking for your configuration file?
name string ( Optional , default: notify )
Setting the optional parameter name allows multiple notifiers to be created. The notifier will bind to the notify.NOTIFIER_NAME action.
api_key string Required
Enter the API key for Automate.
to string Required
Email address the Automate-Fiber is configured for.
device string ( Optional )
Name of the target device to receive the messages.
Example Automation:
- action : notify.entity_id data : message : " This is the message" data : priority : Normal
Message delivery priority in the nested data section is optional (default value: Normal).
Value “High” attempts to awaken the receiving device.
Receiving cloud messages in Automate:
Add a new flow
Insert block “Messaging -> Cloud message receive”
Insert block “Interface -> Toast show”
Connect OK from Flow beginning to IN of Cloud receive
Connect OK from Cloud receive to Toast show
Connect OK form Toast show to IN of Cloud receive
Tap Cloud receive and select the email account as set up in your configuration
Assign a variable name for the Payload
Tap Toast show and set the message value to the variable you’ve specified
If you have multiple devices paired to one Google Mail account and want to control each instance of Automate individually, you can set the notifier to target a specific device. To determine your devices name, add a Cloud Message send block to your flow, tap it and scroll all the way to the bottom. Device names are case sensitive.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The LlamaLab Automate integration was introduced in Home Assistant 0.27, and it's used by
61 active installations.
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
