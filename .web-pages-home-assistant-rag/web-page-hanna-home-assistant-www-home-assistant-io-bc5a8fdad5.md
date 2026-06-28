# Hanna - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/hanna
- Final URL: https://www.home-assistant.io/integrations/hanna
- Canonical URL: https://www.home-assistant.io/integrations/hanna/
- Fetched at: 2026-06-28T02:47:51Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate HannaCloud within Home Assistant.

## Extracted Text

On this page
Supported devices
Prerequisites
Configuration
Configuration parameters
Data updates
Supported functionality
Entities
Troubleshooting
Removing the integration
To remove an integration instance from Home Assistant
The Hanna integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] fetches data from your Hanna Pool Controller device, by connecting to your HannaCloud account.
The following devices are known to be supported by the integration:
Hanna Instruments BL122
Hanna Instruments BL132
Before you can add the Hanna integration, you need:
A HannaCloud account.
Your HannaCloud login credentials (email and password).
A Hanna Pool Controller device that is connected to your HannaCloud account.
To add the Hanna hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Hanna .
Follow the instructions on screen to complete the setup.
email
The email address of your HannaCloud account.
password
The password associated with your HannaCloud account
The integration will update its sensors by polling Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] the HannaCloud account for new values.
The Hanna integration provides the following entities.
Sensors
Chlorine flow rate : Monitors chlorine dosing rate
Chlorine ORP value : Measures oxidation-reduction potential with calibration data as attributes
pH Acid/base flow rate : Monitors acid/base chemical dosing rate
pH value : Measures pH level with calibration data as attributes
Air temperature : Air temperature reported by the device
Water temperature : Water temperature reported by the device
There are no commonly known issues with this integration.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Hanna hub was introduced in Home Assistant 2025.12, and it's used by
11 active installations.
Its IoT class is Cloud Polling.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@bestycame
Categories
Sensor
Back to top
