# Twilio Call - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/twilio_call
- Final URL: https://www.home-assistant.io/integrations/twilio_call
- Canonical URL: https://www.home-assistant.io/integrations/twilio_call/
- Fetched at: 2026-06-28T03:24:14Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to add Twilio Call notifications to Home Assistant.

## Extracted Text

On this page
Configuration
Usage
The Twilio Call integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] enables sending notifications via Voice, powered by Twilio .
Passed message will be read by Text-to-speech service.
The requirement is that you have set up Twilio .
To use this notification platform in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry notify : - name : NOTIFIER_NAME platform : twilio_call from_number : E164_PHONE_NUMBER
Configuration Variables
Looking for your configuration file?
from_number string Required
An E.164 formatted phone number, like +14151234567. See Twilio’s guide to formatting phone numbers for more information.
name string ( Optional , default: notify )
Setting the optional parameter name allows multiple notifiers to be created. The notifier will bind to the notify.NOTIFIER_NAME action.
Twilio is a notification platform and thus can be controlled by calling the notify action as described here . It will send a notification to all E.164 phone numbers in the notification target . See the notes above regarding the from_number configuration variable for information about formatting phone numbers.
# Example automation notification entry automation : - alias : " The sun has set" triggers : - trigger : sun event : sunset actions : - action : notify.twilio_call data : message : " The sun has set" target : - +14151234567 - +15105555555
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Twilio Call integration was introduced in Home Assistant 0.37, and it's used by
435 active installations.
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
