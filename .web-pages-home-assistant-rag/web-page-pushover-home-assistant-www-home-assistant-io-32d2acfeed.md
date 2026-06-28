# Pushover - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/pushover
- Final URL: https://www.home-assistant.io/integrations/pushover
- Canonical URL: https://www.home-assistant.io/integrations/pushover/
- Fetched at: 2026-06-28T03:10:03Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to add Pushover notifications to Home Assistant.

## Extracted Text

On this page
Configuration
Sending messages
Targeting specific devices
Time-to-live (TTL)
Emergency notifications
Examples
The Pushover action is a platform for the notify integration. This allows integrations to send messages to the user using Pushover.
To get an API key, you need to register an application on the Pushover website. Your Pushover user key can be found on the Pushover dashboard .
To add the Pushover service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Pushover .
Follow the instructions on screen to complete the setup.
Example automation:
- action : notify.entity_id data : message : " This is the message" title : " Title of message" data : url : " https://www.home-assistant.io/" sound : pianobar priority : 0 attachment : " local/image.png"
Integration-specific values in the nested data section are optional.
Image attachments can be added using the attachment parameter, which must be a local file reference (ex: /tmp/image.png ).
When sending a notification, optional parameters can also be set as per the Pushover API documentation .
To use a specific Pushover device, set it using target . If one of the entered devices doesn’t exist or is disabled in your Pushover account it will send a message to all your devices. To send to all devices, just skip the target attribute.
- action : notify.entity_id data : message : " This is the message" title : " Title of message" target : - pixel3 - pixel4a data : sound : pianobar priority : 0
Using the ttl parameter, messages may be set to delete automatically after a certain period of time. This is useful for messages that, at some point, outlive their usefulness. The ttl parameter specifies a time-to-live in seconds. In the following example, the message will self-delete from the targeted device(s) after 6 hours.
- action : notify.pushover data : message : " This is the message" title : " Title of message" target : - pixel9 - johnsmith data : ttl : 21600
To use the highest priority, which repeats the notification every x seconds ( retry ) for the duration of y seconds ( expire ), you MUST specify these parameters. The minimal time for the retry parameter is 30 seconds. The expire parameter has a maximum of 10800 seconds (3 hours). If you target more than one device, make sure to enable the advanced option “Notification dismissal sync” in the app to be able to dismiss the alert on all devices simultaneously.
- action : notify.entity_id data : message : " This is the message" title : " Title of message" target : - iphone11pro data : priority : 2 sound : " siren" expire : 300 retry : 30
To use notifications, please see the getting started with automation page .
Example notification triggered from the Alexa integration for an intents is shown below which also uses Automation Templating for the message:
# Example configuration.yaml entries alexa : intents : LocateIntent : action : action : notify.notify data : message : " The location of {{ User }} has been queried via Alexa." title : " Home Assistant" target : pixel data : sound : falling url : " https://www.home-assistant.io/" attachment : " /tmp/image.png"
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Pushover service was introduced in Home Assistant pre 0.7, and it's used by
4592 active installations.
Its IoT class is Cloud Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@engrbm87
Categories
Notifications
Back to top
