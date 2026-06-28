# Sinch SMS - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/sinch
- Final URL: https://www.home-assistant.io/integrations/sinch
- Canonical URL: https://www.home-assistant.io/integrations/sinch/
- Fetched at: 2026-06-28T03:16:15Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to add Sinch notifications to Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Full configuration example
Related topics
The Sinch SMS integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] uses Sinch to deliver notifications from Home Assistant.
Go to your Sinch Dashboard and click “Add new REST API”. You should now be able to obtain your service_plan_id and api_key .
To add Sinch to your installation, add the following to your Home Assistant configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry notify : - platform : sinch service_plan_id : SINCH_SERVICE_PLAN_ID api_key : SINCH_API_KEY
Configuration Variables
Looking for your configuration file?
name string ( Optional )
Setting the optional parameter name allows multiple notifiers to be created. The default value is Sinch . The notifier will bind to the notify.NOTIFIER_NAME action.
service_plan_id string Required
Your Sinch Service Plan ID.
api_key string Required
Your API Token.
default_recipient string | list ( Optional )
A single or multiple phone numbers. This is where you want to send your SMS notification messages by default (when not specifying target in the action), e.g., 09171234567 or [09171234567, 09177654321] .
sender string ( Optional , default: Home Assistant )
The name or number of the sender.
To use notifications, please see the getting started with automation page .
# Example configuration.yaml entry notify : - platform : sinch name : Sinch service_plan_id : SINCH_SERVICE_PLAN_ID api_key : SINCH_API_KEY default_recipient : [ PHONE_NO1 , PHONE_NO2 ] sender : Home Assistant
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Sinch SMS integration was introduced in Home Assistant 0.101, and it's used by
15 active installations.
Its IoT class is Cloud Push.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@bendikrb
Categories
Notifications
Back to top
