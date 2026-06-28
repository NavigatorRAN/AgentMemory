# Prowl - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/prowl
- Final URL: https://www.home-assistant.io/integrations/prowl
- Canonical URL: https://www.home-assistant.io/integrations/prowl/
- Fetched at: 2026-06-28T03:09:25Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to add Prowl notifications to Home Assistant.

## Extracted Text

On this page
Prowl action data
Related topics
The Prowl integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] uses Prowl to deliver push notifications from Home Assistant to your iOS device.
Go to the Prowl website and create a new API key.
To add Prowl notifications to your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry notify : - name : NOTIFIER_NAME platform : prowl api_key : YOUR_API_KEY
Configuration Variables
Looking for your configuration file?
name string ( Optional , default: notify )
Setting the optional parameter name allows multiple notifiers to be created. The notifier will bind to the notify.NOTIFIER_NAME action.
api_key string Required
The Prowl API key to use.
The following attributes can be placed data for extended functionality.
Data attribute Optional Default Description priority yes 0 Priority level, for more info refer to the Prowl API documentation . url yes n/a URL to be attached, for more info refer to the Prowl API documentation .
To use notifications, please see the getting started with automation page .
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Prowl service was introduced in Home Assistant 0.52, and it's used by
131 active installations.
Its IoT class is Cloud Push.
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Notifications
Back to top
