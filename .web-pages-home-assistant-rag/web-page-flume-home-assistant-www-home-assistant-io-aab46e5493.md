---
source_url: "https://www.home-assistant.io/integrations/flume"
final_url: "https://www.home-assistant.io/integrations/flume"
canonical_url: "https://www.home-assistant.io/integrations/flume/"
source_handle: "web:www-home-assistant-io:aab46e5493eb"
source_section: "integrations-flume"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "78acf5c6b11a58c4ec0f06297323a222ccd648df822e409c6f50946936bc6a5e"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Flume - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/flume
- Final URL: https://www.home-assistant.io/integrations/flume
- Canonical URL: https://www.home-assistant.io/integrations/flume/
- Fetched at: 2026-06-28T02:43:30Z
- Content type: text/html; charset=UTF-8

## Description

Documentation about the flume sensor.

## Extracted Text

On this page
Configuration
Notifications
Configuration for binary sensor
Related topics
The Flume integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] will show you the current Flume status for the given Device ID.
Flume monitors the real-time status of your home water meter. Allowing the end-user to detect small leaks, gain real-time information on household water consumption, set water goals and budgets, and receive push notifications when suspicious water activities occur.
To add the Flume hub to your Home Assistant instance, use this My button:
Flume can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Flume .
Follow the instructions on screen to complete the setup.
You can find your Client ID and Client Secret under “API Access” on the settings page .
To add Flume to your installation, go to Settings > Devices & services in the UI, click the button with + sign and from the list of integrations select Flume .
Flume notifications are fetched every 5 minutes and are available via the flume.list_notifications action. Some notifications are available via the following binary sensors:
Bridge disconnected
High flow
Leak detected
Low battery
To clear the notifications, you will need to use your Flume app or go to: https://portal.flumewater.com/notifications and clear the notification in question.
Example of an automation that sends a Home Assistant notification of the most recent usage alert:
alias : " Notify: flume" triggers : - trigger : time_pattern minutes : /5 actions : - action : flume.list_notifications data : config_entry : 1234 # replace this with your config entry id response_variable : notifications - if : - condition : template value_template : >- {{ notifications.notifications | selectattr('type', 'equalto', 1) | sort(attribute == ('created_datetime', reverse == true) | length > 0 }} then : - action : notify.all data : message : >- {%- set usage_alert == notifications.notifications | selectattr('type', 'equalto', 1) | sort(attribute == 'created_datetime', reverse == true) | first %} {{ usage_alert.message }} title : >- {%- set usage_alert == notifications.notifications | selectattr('type', 'equalto', 1) | sort(attribute == 'created_datetime', reverse=true) | first %} {{ usage_alert.title }}
The following YAML creates a binary sensor. This requires the default sensor to be configured successfully.
# Example configuration.yaml entry template : - binary_sensor : - name : " Flume Flow Status" state : >- {{ states('sensor.flume_sensor') != "0" }}
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Flume hub was introduced in Home Assistant 0.103, and it's used by
1497 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@ChrisMandich
@bdraco
@jeeftor
Categories
Binary sensor
Sensor
Back to top
