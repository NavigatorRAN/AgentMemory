# Notify.Events - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/notify_events
- Final URL: https://www.home-assistant.io/integrations/notify_events
- Canonical URL: https://www.home-assistant.io/integrations/notify_events/
- Fetched at: 2026-06-28T03:04:01Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Notify.Events service with your Home Assistant notifications.

## Extracted Text

On this page
Description
Setting up
That’s it!
Example action
Message optional parameters
Related topics
The Notify.Events service is an integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] for the notify integration.
This platform allows you to quickly configure the distribution of messages between different recipients, no matter how they are used to receiving notifications:
Telegram
Viber
Slack
Rocket.Chat
Discord
Jabber / XMPP
Webpush
SMS
VoiceCall
You can find a full supported messenger list here .
To start getting notifications, you need to follow those simple steps:
Sign up to Notify.Events and create a Channel
Add Home Assistant source to this channel and get your token
Add the Notify.Events integration to your installation by adding the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
notify_events : token : YOUR_TOKEN
Configuration Variables
Looking for your configuration file?
token string Required
Your channel source token.
Now you can use notify_events integration as a platform for your notify service , add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
:
# Example configuration.yaml entry notify : - name : NOTIFIER_NAME (e.g. "events") platform : notify_events
name string ( Optional , default: notify )
The optional parameter name allows multiple notifiers to be created. The notifier will bind to the notify.NOTIFIER_NAME action.
Now you can use the notify.events action inside your Home Assistant to:
Send any notifications or alerts
Distribute events by level and priority
Attach files and images (local or remote)
.. and just keep using your favorite messenger to receive them!
- action : notify.events data : message : " Backyard motion detected!" data : level : " warning" priority : " high" images : - name : " local_photo.jpg" path : " /tmp/backyard_cam/motion.jpg" - name : " remote_photo.jpg" url : " https://i.ibb.co/Jt1845X/motion.jpg"
The following attributes can be placed inside data for extended functionality.
Attribute Description title Message title. level For recipients who have differences in the display of messages at different levels, this level will be applied.
Available values: verbose , info , notice , warning , error , success . priority For recipients which supports priority, the message will be highlighted accordingly.
Available values: lowest , low , normal , high , highest . images Array of images to attach (see item properties below). files Array of files to attach (see item properties below). token Notify.Events channel token (in case you want to override the channel to get this message to).
Every item of images and files has the following properties:
Property Required Description path or url or content True File source. name False Result file name mime_type False File MIME-type
To use notifications effectively, please see the getting started with automation page .
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Notify.Events integration was introduced in Home Assistant 0.112, and it's used by
457 active installations.
Its IoT class is Cloud Push.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@matrozov
@papajojo
Categories
Notifications
Back to top
