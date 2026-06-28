---
source_url: "https://www.home-assistant.io/integrations/ntfy"
final_url: "https://www.home-assistant.io/integrations/ntfy"
canonical_url: "https://www.home-assistant.io/integrations/ntfy/"
source_handle: "web:www-home-assistant-io:d94d7231d711"
source_section: "integrations-ntfy"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "f122906c00e1b9f9cb7f970a39eb4bd4fcec8c26af0c064ce22a62adbd3fe01c"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# ntfy - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/ntfy
- Final URL: https://www.home-assistant.io/integrations/ntfy
- Canonical URL: https://www.home-assistant.io/integrations/ntfy/
- Fetched at: 2026-06-28T03:04:18Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate ntfy with Home Assistant.

## Extracted Text

On this page
About ntfy
How you can use this integration
Prerequisites
Configuration
Topic configuration parameters
Topic options
Supported functionality
Notifiers
Events
Sensors
Updates
List of actions
Data updates
Known limitations
Troubleshooting
Removing the integration
To remove an integration instance from Home Assistant
The ntfy integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows publishing push notifications on ntfy.sh or other ntfy services.
ntfy is a simple HTTP-based pub-sub notification service that allows you to send notifications to phones or desktops. The official ntfy service also provides additional features, such as notifications via email or phone calls using text-to-speech to read messages aloud. Since ntfy is 100% open-source, you can choose to use alternative public ntfy services or even host your own instance.
The ntfy integration can be used to send and receive messages via an ntfy server. For example, to send a notification from Home Assistant to your mobile or send messages from a script to Home Assistant.
Service URL
To set up the ntfy integration, you need the URL of the ntfy service you wish to use.
Use https://ntfy.sh for the official ntfy service.
Provide the URL of an alternative public ntfy service or your self-hosted instance (for example, https://your-ntfy-instance.com ).
Authentication (optional)
Depending on whether the server is configured to support access control, some topics may be read/write protected so that only users with the correct credentials can subscribe or publish to them.
The ntfy integration uses access token authentication to access protected topics. When you provide your ntfy username and password, Home Assistant automatically generates and uses an access token for authentication.
Adding a topic
To set up topics for notifications, select Add topic , then, if prompted, select the ntfy service you previously configured.
You can now choose one of the following options:
Select Enter topic to add a new topic. Use an existing topic name by retrieving it from the ntfy app or the ntfy service’s website. Simply copy and paste the topic name into the configuration.
Select Generate topic name to allow the integration to generate a random topic name automatically.
Repeat these steps for each topic you want to add.
Note
Topics may not be password-protected, so choose a name that’s not easy to guess. If you are sending sensitive information, consider reserving the topic and restricting access to it.
To add the ntfy service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select ntfy .
Follow the instructions on screen to complete the setup.
Address of the ntfy service. Defaults to https://ntfy.sh .
Verify SSL certificate
Enable SSL certificate verification for secure connections.
Username (optional)
Username required to authenticate with protected ntfy topics.
Password (optional)
Password corresponding to the provided username for authentication.
Each topic subentry provides the following configuration parameters:
Topic
Name of the topic.
Display name (optional)
An alternative name to display instead of the topic name. This helps identify topics with complex or hard-to-read names more easily.
Each topic provides the following optional configuration options to allow narrowing down the messages received when Home Assistant subscribes to the topic. Filters apply only to the event entity .
Filter by priority
Include messages that match any of the selected priority levels. If no priority is selected, all messages are included by default.
Filter by tags
Only include messages that have all selected tags.
Filter by title
Include messages with a title that exactly matches the specified text.
Filter by message content
Include messages with content that exactly matches the specified text.
The ntfy integration will add a device A device is a model representing a physical or logical unit that contains entities. with an associated notify entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] for each configured topic. To publish notifications, you can use the notify.send_message action Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] . To use notifications, please see the getting started with automation page .
Example YAML configuration
Action Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called *sequence*. [Learn more] action: notify.send_message
data:
message: "Reminder: Have you considered frogs?"
target:
entity_id: notify.mytopic
An event Every time something happens in Home Assistant, an event is fired. There are different types of events, such as state change events, when an action was triggered, or the time changed. All entities produce state change events. Every time a state changes, a state change event is produced. Events can be used to trigger automations or scripts. For example, you can trigger an automation when a light is turned on, then a speaker turns on in that room. Events can also be used to trigger actions in the frontend. For example, you can trigger an action when a button is pressed. [Learn more] entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] is created for each configured topic. These entities subscribe to their respective topics and receive notifications from the ntfy service in real-time. Each event entity exposes the full contents of the notification through its attributes. These attributes include links, attachments, tags, and other metadata.
You can use event Every time something happens in Home Assistant, an event is fired. There are different types of events, such as state change events, when an action was triggered, or the time changed. All entities produce state change events. Every time a state changes, a state change event is produced. Events can be used to trigger automations or scripts. For example, you can trigger an automation when a light is turned on, then a speaker turns on in that room. Events can also be used to trigger actions in the frontend. For example, you can trigger an action when a button is pressed. [Learn more] entities An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] in automations. For example, to trigger actions in Home Assistant, or to forward notifications to other devices for further processing or alerting.
Automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] triggers:
- trigger: numeric_state
entity_id:
- event.mytopic
attribute: priority
above: 4
actions:
- action: notify.send_message
entity_id: notify.my_device
message: "Received new ntfy notification"
The ntfy integration adds a device representing the service, along with various sensors that display your usage statistics and current account limits.
📊 Message stats
Messages published
Description : The total number of messages sent today.
Messages remaining
Description : The number of messages that can still be sent before the daily limit is reached.
Remarks : Disabled by default
Messages usage limit
Description : The maximum number of messages allowed per day on the account.
Category : Diagnostic
Messages expiry duration
Description : The duration for which published messages are cached before automatic deletion.
✉️ Email stats
Emails sent
Description : The number of email notifications sent today.
Emails remaining
Description : The number of email notifications that can still be sent today.
Email usage limit
Description : The daily limit for email notifications on the account.
📞 Phone call stats
Phone calls made
Description : The total phone call alerts made today.
Phone calls remaining
Description : The number of phone call alerts that can still be made today.
Phone calls usage limit
Description : The maximum number of phone call alerts allowed per day on the account.
🔒 Reserved topics
Reserved topics
Description : The number of reserved topics currently assigned to the account.
Reserved topics remaining
Description : The number of topics that can still be reserved.
Reserved topics limit
Description : The maximum number of reserved topics allowed for the account.
📎 Attachment stats
Attachment storage
Description : The amount of storage space currently used by file attachments.
Attachment storage remaining
Description : The remaining storage capacity available for attachments.
Attachment storage limit
Description : The total storage quota allocated for attachments.
Attachment expiry duration
Description : The duration attachments are retained before being automatically deleted.
Attachment file size limit
Description : The maximum allowed size for a single attachment file.
Attachment bandwidth limit
Description : The daily bandwidth cap for uploading and downloading attachments.
⭐ Account
Subscription tier
Description : The subscription plan currently assigned to the ntfy account.
For self-hosted ntfy instances, Home Assistant creates an update entity that shows when a new version of ntfy is available for download. To perform an update, refer to the official documentation .
ntfy version 2.17.0 or later
Configured user with administrator privileges on the instance
The ntfy integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Dismiss notification ( ntfy.clear )
Dismiss a message from a ntfy topic by marking it as read.
Delete notification ( ntfy.delete )
Delete a notification from a ntfy topic.
Publish notification ( ntfy.publish )
Publish a notification to a ntfy topic. Optionally customize message content and appearance with priority, links, attachments, tags, emojis, and more.
For an overview of every action across all integrations, see the actions reference .
The integration retrieves data from ntfy.sh (or your own ntfy instance) every 15 minutes to update the usage statistics sensors.
ntfy imposes various rate and usage limits. The official ntfy.sh service allows up to 60 messages in a burst , with a replenishment rate of one message every 5 seconds (that is, the full 60-message capacity refills in 5 minutes).
Additional usage limits depend on your account tier. To view your current limits, go to Account → Usage .
Limits may vary when using other ntfy services. If you’re using a self-hosted instance, you can configure higher limits or disable them entirely.
The ntfy integration relies on an active internet connection to communicate with the ntfy service. If you encounter issues, verify that your network connection is stable and the ntfy service is reachable. Additionally, the ntfy service itself may experience downtime, whether unexpected or due to scheduled maintenance.
In any case, when reporting an issue, please enable debug logging , restart the integration, and as soon as the issue reoccurs, stop the debug logging again ( download of debug log file will start automatically ). Further, if still possible, please also download the diagnostics data. If you have collected the debug log and the diagnostics data, provide them with the issue report.
This integration can be removed by following these steps:
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The ntfy service was introduced in Home Assistant 2025.5, and it's used by
1350 active installations.
Its IoT class is Cloud Push.
🏆 Platinum quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@tr4nt0r
Categories
Event
Notifications
Update
Back to top
