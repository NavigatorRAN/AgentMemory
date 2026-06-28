# Ubiquiti mFi mPort - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/mfi
- Final URL: https://www.home-assistant.io/integrations/mfi
- Canonical URL: https://www.home-assistant.io/integrations/mfi/
- Fetched at: 2026-06-28T02:59:48Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate mFi within Home Assistant.

## Extracted Text

On this page
Sensor
Switch
Related topics
There is currently support for the following device types within Home Assistant:
The mfi sensor integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] to allow you to monitor mFi mPort interface and sensors .
To add this integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] to your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry sensor : - platform : mfi host : IP_ADDRESS_OF_CONTROLLER username : YOUR_USERNAME password : YOUR_PASSWORD
Configuration Variables
Looking for your configuration file?
host string Required
The IP address or hostname of your mFi controller.
port integer ( Optional , default: 6080 (6443 for TLS) )
The port of your mFi controller.
username string Required
The mFi admin username.
password string Required
The mFi admin user’s password.
ssl boolean ( Optional , default: true )
If true , use SSL/TLS to contact the mFi controller.
verify_ssl boolean ( Optional , default: true )
Set this to false if your mFi controller has a self-signed certificate.
The mfi switch platform to allow you to control mFi Controllable Power Outlets .
To add this platform to your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry switch : - platform : mfi host : IP_ADDRESS_OF_CONTROLLER username : YOUR_USERNAME password : YOUR_PASSWORD
port integer ( Optional , default: 6443 )
The mFi admin password.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Ubiquiti mFi mPort integration was introduced in Home Assistant 0.13, and it's used by
30 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Network
Back to top
