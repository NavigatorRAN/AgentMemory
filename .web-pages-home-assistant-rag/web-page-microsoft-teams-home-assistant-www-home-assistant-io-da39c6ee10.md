# Microsoft Teams - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/msteams
- Final URL: https://www.home-assistant.io/integrations/msteams
- Canonical URL: https://www.home-assistant.io/integrations/msteams/
- Fetched at: 2026-06-28T03:01:40Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to send a notification to a Microsoft Teams channel.

## Extracted Text

On this page
Setup
Configuration
Microsoft Teams service data
The Microsoft Teams integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to send notifications from Home Assistant to a team channel in Microsoft Teams .
Note
Microsoft announced the retirement of the Office 365 connectors within Microsoft Teams. Existing connectors will continue to work until April 30, 2026 .
To send a notification to teams, you need to add the Incoming Webhook app to your team channel. When the app is added, you will receive a webhook URL that needs to be added to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] .
To add the Microsoft Teams platform to your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
notify : - platform : msteams url : https://outlook.office.com/webhook/<ID>
Configuration Variables
Looking for your configuration file?
name string ( Optional , default: notify )
Setting this parameter allows multiple notifiers to be created. The notifier will bind to the notify.NOTIFIER_NAME action.
url string Required
The webhook URL created in the setup step.
The following attributes can be placed inside data for extended functionality.
Data attribute Optional Description image_url yes Attach an image to the message.
The image must be an HTTPS URL, and as outlined by Microsoft in the Documentation , the picture must be on a publicly available location.
Example for posting file from URL:
title : Title of the message. message : Message that will be added. data : image_url : URL_OF_IMAGE
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Microsoft Teams integration was introduced in Home Assistant 0.101, and it's used by
123 active installations.
Its IoT class is Cloud Push.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@peroyvind
Categories
Notifications
Back to top
