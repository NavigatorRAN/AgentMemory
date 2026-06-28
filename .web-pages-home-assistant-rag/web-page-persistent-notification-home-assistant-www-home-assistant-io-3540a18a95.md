---
source_url: "https://www.home-assistant.io/integrations/persistent_notification"
final_url: "https://www.home-assistant.io/integrations/persistent_notification"
canonical_url: "https://www.home-assistant.io/integrations/persistent_notification/"
source_handle: "web:www-home-assistant-io:3540a18a9574"
source_section: "integrations-persistent-notification"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "7ec4e6671a8b037ff97cccc2d940d719514a12c00ce15b0124f8b61fbbd69bf8"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Persistent Notification - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/persistent_notification
- Final URL: https://www.home-assistant.io/integrations/persistent_notification
- Canonical URL: https://www.home-assistant.io/integrations/persistent_notification/
- Fetched at: 2026-06-28T03:07:49Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate persistent notifications into Home Assistant.

## Extracted Text

On this page
Automation
Action: Create
Markdown support
Create a persistent notification
Use as a notifier
The Persistent Notification integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] can be used to show a notification on the frontend that has to be dismissed by the user.
Persistent notification triggers enable automations to be triggered when persistent notifications are updated. Triggers can be limited to a specific notification by providing an ID for notification_id , or when this value is omitted the automation will trigger for any notification ID. If no update_type is provided, the automation will trigger for the following update types: added , removed , updated , or current . By providing one or more of these values to the update_type option, the automation triggers only on these update_type events.
Review the Automating Home Assistant getting started guide on automations or the Automation documentation for full details.
An example of a persistent notification trigger in YAML:
automation : - triggers : - trigger : persistent_notification # Optional. Possible values: added, removed, updated, current update_type : - added - removed # Optional. notification_id : invalid_config
See Automation Trigger Variables: Persistent Notification for additional trigger data available for conditions or actions.
The persistent_notification.create action creates a persistent notification with a message, title, and notification ID.
Data attribute Optional Description message no Body of the notification. title yes Title of the notification. notification_id yes If notification_id is given, it will overwrite the notification if there already was a notification with that ID.
Here is how an action of your automation setup with static content could look like.
actions : - action : persistent_notification.create data : message : " Your message goes here" title : " Custom subject"
If you want to show some runtime information, you have to use templates .
actions : - action : persistent_notification.create data : title : > Thermostat is {{ state_attr('climate.thermostat', 'hvac_action') }} message : " Temperature {{ state_attr('climate.thermostat', 'current_temperature') }}"
The persistent_notification.dismiss action requires a notification_id .
Data attribute Optional Description notification_id no the notification_id is required to identify the notification that should be removed.
This action allows you to remove a notifications by script or automation.
actions : - action : persistent_notification.dismiss data : notification_id : " 1234"
The persistent_notification.dismiss_all action allows you to remove all notifications.
actions : - action : persistent_notification.dismiss_all
The message attribute supports the Markdown formatting syntax . Some examples are:
Type Message Headline 1 # Headline Headline 2 ## Headline Newline \n Bold **My bold text** Italic *My italic text* Link [Link](https://home-assistant.io/) Image ![image](/local/my_image.jpg)
Note
/local/ in this context refers to the .homeassistant/www/ folder.
Go to Settings > Developer tools > Actions , then select the persistent_notification.create action from the Action dropdown. Enter something like the sample below into the data field and press the Perform action button.
{ "notification_id" : "1234" , "title" : "Sample notification" , "message" : "This is a sample text." }
This will create the notification entry shown above.
Persistent notifications can also be used as a pre-configured notifier for the Notify integration if that integration is loaded. It is available as notify.persistent_notification . This enables it to be used with features that require a notifier like Notify Groups or the Alert integration .
The following attributes can be placed inside data for extended functionality.
Data attribute Optional Description notification_id yes If notification_id is given, it will overwrite the notification if there already was a notification with that ID.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Persistent Notification system was introduced in Home Assistant 0.23, and it's used by
1% of the active installations.
Its IoT class is Local Push.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Categories
Other
Back to top
