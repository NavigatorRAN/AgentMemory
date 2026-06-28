# Dovado - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/dovado
- Final URL: https://www.home-assistant.io/integrations/dovado
- Canonical URL: https://www.home-assistant.io/integrations/dovado/
- Fetched at: 2026-06-28T02:37:59Z
- Content type: text/html; charset=UTF-8

## Description

How to integrate Dovado within Home Assistant.

## Extracted Text

On this page
Notifications
Usage
Sensor
Related topics
The Dovado integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] manages communication with the Dovado router.
There is currently support for the following device types within Home Assistant:
To add a Dovado integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] to your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry dovado : username : YOUR_USERNAME password : YOUR_PASSWORD
Configuration Variables
Looking for your configuration file?
username string Required
Your Dovado username.
password string Required
Your Dovado password.
host string ( Optional )
The IP address of your router.
Default:
Home Assistant’s default gateway
port integer ( Optional , default: 6435 )
The port number of your router.
The dovado notify platform allows you to send SMS from your Dovado router, if it supports it.
To add the Dovado integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] to your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
# Example configuration.yaml entry notify : - platform : dovado
This is a notify platform and thus can be controlled by calling the notify action as described here . It will send an SMS notification to a single phone number in the notification target .
# Example automation notification entry automation : - alias : " The sun has set" triggers : - trigger : sun event : sunset actions : - action : notify.dovado data : message : " The sun has set" target : " +14151234567"
The dovado sensor platform let you monitor your Dovado router.
To add a Dovado sensor to your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry sensor : - platform : dovado sensors : - network
sensors list Required
Conditions to display in the frontend. Only accepts the values listed here.
network
Creates a sensor for Network State, such as 3G or 4G.
signal
Creates a sensor for the signal strength.
download
Creates a sensor for download speed.
upload
sms
Creates a sensor for number of unread text messages.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Dovado integration was introduced in Home Assistant 0.87, and it's used by
0 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
System monitor
Back to top
