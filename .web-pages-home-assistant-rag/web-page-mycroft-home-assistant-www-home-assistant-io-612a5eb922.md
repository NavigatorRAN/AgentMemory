# Mycroft - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/mycroft
- Final URL: https://www.home-assistant.io/integrations/mycroft
- Canonical URL: https://www.home-assistant.io/integrations/mycroft/
- Fetched at: 2026-06-28T03:01:54Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up Mycroft AI within Home Assistant.

## Extracted Text

On this page
Configuration
Using notifications
Examples
Related topics
Mycroft is an open source voice assistant that allows you to send notifications and more to Mycroft from Home Assistant.
There is currently support for the following device types within Home Assistant:
Notifications - Allows you to deliver notifications from Home Assistant to Mycroft AI .
To use Mycroft in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry mycroft : host : 0.0.0.0
Configuration Variables
Looking for your configuration file?
host string Required
The IP address of your Mycroft instance.
To use Mycroft for sending notifications, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry notify : - platform : mycroft name : mycroft
name string Required
Frendly name of your Mycroft instance.
Send a message to Mycroft by calling notify.mycroft action:
message : " Hey Mycroft. Turn on the office light. "
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Mycroft integration was introduced in Home Assistant 0.53, and it's used by
2 active installations.
Its IoT class is Local Push.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Notifications
Voice
Back to top
