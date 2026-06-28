# EPH Controls - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/ephember
- Final URL: https://www.home-assistant.io/integrations/ephember
- Canonical URL: https://www.home-assistant.io/integrations/ephember/
- Fetched at: 2026-06-28T02:40:51Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate EPH Controls EMBER thermostats within Home Assistant.

## Extracted Text

On this page
Related topics
The EPH Controls integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you control EPH Controls thermostats. The module only works if you have a Wi-Fi gateway to control your EPH system and an account on the EMBER app.
To set it up, add the following information to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
climate : - platform : ephember username : YOUR_EMAIL password : YOUR_PASSWORD
A single interface can handle up to 32 connected devices.
Configuration Variables
Looking for your configuration file?
username string Required
The email address you used to sign up to the EMBER app.
password string Required
The password you used to sign up to the EMBER app.
The supported operation modes map to the ON/OFF period selection of your timeswitch / EMBER app. These include:
Auto The timeswitch operates 3 on / off periods per day.
On The timeswitch is permanently on.
Off The timeswitch is permanently off.
If All Day is selected in the EMBER app it will show as Auto in Home Assistant.
To Boost your heating, you should use the climate.set_aux_heater action on your zone entity. This will then Boost that zone for 1 hour.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The EPH Controls integration was introduced in Home Assistant 0.57, and it's used by
31 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@ttroy50
@roberty99
Categories
Climate
Back to top
