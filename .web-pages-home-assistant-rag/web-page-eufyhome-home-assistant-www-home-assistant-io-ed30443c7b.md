# EufyHome - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/eufy
- Final URL: https://www.home-assistant.io/integrations/eufy
- Canonical URL: https://www.home-assistant.io/integrations/eufy/
- Fetched at: 2026-06-28T02:41:19Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate EufyHome devices into Home Assistant.

## Extracted Text

On this page
Related topics
The EufyHome integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] is the main integration to integrate eufy devices sold under the EufyHome product line with Home Assistant.
There is currently support for the following device types within Home Assistant:
Light
Switch
Supported devices will be discovered after the EufyHome integration is added to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry eufy : username : EMAIL_ADDRESS password : PASSWORD
where username and password are the ones configured in the EufyHome app. Alternately, EufyHome devices that are not discoverable can be statically configured.
eufy : devices : - address : 192.168.1.10 access_token : 1234567890abcdef type : T1012 name : Smart Light - address : 192.168.1.11 access_token : abcdef1234567890 type : T1201 name : Smart Switch
access_token can be obtained by running:
$ curl -H "Content-Type: application/json" \ -d '{"client_id":"eufyhome-app", "client_Secret":"GQCpr9dSp3uQpsOMgJ4xQ", "email":"USERNAME", "password":"PASSWORD"}' \
https://home-api.eufylife.com/v1/user/email/login
replacing USERNAME and PASSWORD with the EufyHome username and password. This will give an access_token . Then run:
$ curl -H token:TOKEN -H category:Home \
https://home-api.eufylife.com/v1/device/list/devices-and-groups
replacing TOKEN with the access_token from the previous command. This will provide the local_code for each device.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The EufyHome integration was introduced in Home Assistant 0.68, and it's used by
171 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Hub
Back to top
