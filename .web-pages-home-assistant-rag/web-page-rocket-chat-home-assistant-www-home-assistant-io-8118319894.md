# Rocket.Chat - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/rocketchat
- Final URL: https://www.home-assistant.io/integrations/rocketchat
- Canonical URL: https://www.home-assistant.io/integrations/rocketchat/
- Fetched at: 2026-06-28T03:12:45Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to add Rocket.Chat notifications to Home Assistant.

## Extracted Text

On this page
Configuration
Script example
Related topics
The Rocket.Chat integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to send messages to your Rocket.Chat instance from Home Assistant.
To add Rocket.Chat to your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry notify : - platform : rocketchat name : NOTIFIER_NAME url : https://rocketchat.example.com username : YOUR_USERNAME password : YOUR_PASSWORD room : YOUR_ROOM_NAME
name ( Optional ): Name displayed in the frontend. The notifier will bind to the notify.NOTIFIER_NAME action.
url ( Required ): The URL of your Rocket.Chat instance.
username ( Required ): The Rocket.Chat username.
password ( Required ): The Rocker.Chat password.
room ( Required ): The chat room name to send messages to.
rocketchat_notification : sequence : - action : notify.NOTIFIER_NAME data : message : " Message to Rocket.Chat from Home Assistant!" data : emoji : " :smirk:"
Message variables
message ( Required ): Message to be displayed.
data ( Optional ): Dictionary containing any of the variables defined in the Rocket.Chat documentation
To use notifications, please see the getting started with automation page .
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Rocket.Chat integration was introduced in Home Assistant 0.56, and it's used by
7 active installations.
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
