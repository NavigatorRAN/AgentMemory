# Avi-on - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/avion
- Final URL: https://www.home-assistant.io/integrations/avion
- Canonical URL: https://www.home-assistant.io/integrations/avion/
- Fetched at: 2026-06-28T02:30:12Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up GE Avi-on Bluetooth dimmers within Home Assistant.

## Extracted Text

On this page
Setup
Configuration
Full example
Support for the Avi-on Bluetooth dimmer switch Avi-on .
If you want to add your devices manually (like in the example below) then you need to get the API key. The API key can be obtained by executing the following command:
$ curl -X POST -H "Content-Type: application/json" \ -d '{"email": " [email protected] ", "password": "password"}' \
https://api.avi-on.com/sessions | jq
with the email and password fields replaced with those used when registering the device via the mobile app. The pass phrase field of the output should be used as the API key in the configuration.
To enable these lights, add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry light : - platform : avion
There are two ways to configure this integration: username & password, or list of devices. You must choose one.
Configuration Variables
Looking for your configuration file?
username string ( Optional )
The username used in the Avion app. If username and password are both provided, all associated switches will automatically be added to your configuration.
password string ( Optional )
The password used in the Avion app.
devices list ( Optional )
An optional list of devices with their Bluetooth addresses.
name string ( Optional )
A custom name to use in the frontend.
api_key string Required
The API Key.
id string Required
The ID of the dimmer switch. Only needed for independent control of multiple devices.
If username and password are not supplied, devices must be configured manually like so:
# Manual device configuration.yaml entry light : - platform : avion devices : 00:21:4D:00:00:01 : name : Light 1 api_key : YOUR_API_KEY
For independent control of multiple devices, you must specify each device’s ID (integer starting with 1). Each switch’s ID can be guessed or detected from the Avi-on API.
# Manual device configuration.yaml entry light : - platform : avion devices : 00:21:4D:00:00:01 : name : Light 1 api_key : YOUR_API_KEY id : 1 00:21:4D:00:00:02 : name : Light 1 api_key : YOUR_API_KEY id : 2
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Avi-on integration was introduced in Home Assistant 0.37, and it's used by
0 active installations.
Its IoT class is Assumed State.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Light
Back to top
