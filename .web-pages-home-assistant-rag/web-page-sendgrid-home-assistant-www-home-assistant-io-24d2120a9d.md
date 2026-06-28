# SendGrid - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/sendgrid
- Final URL: https://www.home-assistant.io/integrations/sendgrid
- Canonical URL: https://www.home-assistant.io/integrations/sendgrid/
- Fetched at: 2026-06-28T03:14:22Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to add email notifications via SendGrid to Home Assistant.

## Extracted Text

On this page
Setup
Configuration
Related topics
The SendGrid integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] sends email notifications via SendGrid , a proven cloud-based email platform.
You need an API key from SendGrid.
To enable notification emails via SendGrid in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry notify : - name : NOTIFIER_NAME platform : sendgrid api_key : YOUR_API_KEY sender : SENDER_EMAIL_ADDRESS recipient : YOUR_RECIPIENT
Configuration Variables
Looking for your configuration file?
name string ( Optional , default: notify )
Setting the optional parameter name allows multiple notifiers to be created. The notifier will bind to the notify.NOTIFIER_NAME action.
api_key string Required
Your SendGrid API key.
sender string Required
The email address of the sender.
sender_name string ( Optional )
The name of the sender. Defaults to “Home Assistant” if not set.
recipient string Required
The recipient of the notification.
To use notifications, please see the getting started with automation page .
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The SendGrid integration was introduced in Home Assistant 0.14, and it's used by
31 active installations.
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
