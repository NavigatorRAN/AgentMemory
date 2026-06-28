# Tank Utility - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/tank_utility
- Final URL: https://www.home-assistant.io/integrations/tank_utility
- Canonical URL: https://www.home-assistant.io/integrations/tank_utility/
- Fetched at: 2026-06-28T03:20:50Z
- Content type: text/html; charset=UTF-8

## Description

How to integrate Tank Utility sensors within Home Assistant.

## Extracted Text

On this page
Setup
Authentication
Devices
Using TankUtility API to Obtain Device ID
Configuration
Related topics
Add Tank Utility propane tank monitors to Home Assistant.
Authentication for the Tank Utility API is performed with the same email and password credentials used at https://app.tankutility.com .
Each item in the list of devices is a 24 character string. These values can be found by clicking on the Usage Reports link at the bottom of the graph on the Tank Utility devices page .
The device item value is the last segment of the URL path, e.g., the URL
https://app.tankutility.com/#/reports/000000000000000000000000 would indicate 000000000000000000000000 as a device value.
Obtain your personal token:
curl --user <my_username>:<my_password> https://data.tankutility.com/api/getToken
The JSON response structure should resemble:
{ "token" : "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE0MzgyMjQwODE0NjIsInYiOjAsImQiOnsidWleejoic2ltcGxlbG9naW46MzM1In0sImlhdCI6wwDIyMzk5NX0.kbYzxRtbGB2ke3IBgQTVMNQprHOWJZFgQQnPK6Wyas4" }
Receive the list of devices you have in your account:
curl https://data.tankutility.com/api/devices?token = <my_personal_token>
{ "devices" :[ "54df6a066667531535371367" , "54ff69057492666782350667" ]}
To enable the integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] , add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry sensor : - platform : tank_utility email : YOUR_EMAIL_ADDRESS password : YOUR_PASSWORD devices : - " 000000000000000000000000"
Configuration Variables
Looking for your configuration file?
email string Required
Your https://app.tankutility.com email address.
password string Required
Your https://app.tankutility.com password.
devices map Required
All devices to monitor.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Tank Utility integration was introduced in Home Assistant 0.53, and it's used by
44 active installations.
Its IoT class is Cloud Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Energy
Back to top
