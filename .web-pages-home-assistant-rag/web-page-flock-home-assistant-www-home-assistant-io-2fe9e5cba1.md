---
source_url: "https://www.home-assistant.io/integrations/flock"
final_url: "https://www.home-assistant.io/integrations/flock"
canonical_url: "https://www.home-assistant.io/integrations/flock/"
source_handle: "web:www-home-assistant-io:2fe9e5cba1ad"
source_section: "integrations-flock"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "8e133606133622b871fe96cb348d7c5a8436f932e6ec7b09a9654feef9a6d514"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Flock - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/flock
- Final URL: https://www.home-assistant.io/integrations/flock
- Canonical URL: https://www.home-assistant.io/integrations/flock/
- Fetched at: 2026-06-28T02:43:27Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to add Flock notifications to Home Assistant.

## Extracted Text

On this page
Setup
Configuration
Related topics
The Flock integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] uses Flock.com to deliver notifications from Home Assistant.
Go to the Flock.com Admin website and create a new “Incoming Webhooks”. Choose a channel to send the notifications from Home Assistant to, specify a name and press Save and Generate URL .
You will need the last part of the URL which is the access_token for your room.
To add Flock notifications to your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry notify : - name : NOTIFIER_NAME platform : flock access_token : YOUR_ROOM_TOKEN
Configuration Variables
Looking for your configuration file?
name string ( Optional , default: notify )
The optional parameter name allows multiple notifiers to be created. The notifier will bind to the notify.NOTIFIER_NAME action.
access_token string Required
The last part of the webhook URL.
To use notifications, please see the getting started with automation page .
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Flock integration was introduced in Home Assistant 0.71, and it's used by
5 active installations.
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
