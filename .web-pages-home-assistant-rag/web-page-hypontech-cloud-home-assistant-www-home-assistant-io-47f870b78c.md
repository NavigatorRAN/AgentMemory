# Hypontech Cloud - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/hypontech
- Final URL: https://www.home-assistant.io/integrations/hypontech
- Canonical URL: https://www.home-assistant.io/integrations/hypontech/
- Fetched at: 2026-06-28T02:50:56Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Hypontech Cloud solar inverters within Home Assistant.

## Extracted Text

On this page
Supported devices
Prerequisites
Configuration
Supported functionality
Sensors
Data updates
Actions
Known limitations
Removing the integration
To remove an integration instance from Home Assistant
The Hypontech Cloud integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to monitor your Hypontech solar inverter system through the Hypontech Cloud platform and integrate the data into your Home Assistant installation.
This integration supports all Hypontech inverters and micro inverters that are connected to the Hypontech Cloud platform.
To use this integration, you need:
A Hypontech Cloud account with access to your solar inverter system
Your Hypontech Cloud username and password
To add the Hypontech Cloud hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Hypontech Cloud .
Follow the instructions on screen to complete the setup.
To set up the integration, you need the following information:
Username
Your Hypontech Cloud account username.
Password
Your Hypontech Cloud account password.
The integration provides one Plant device for each location (for example: Balcony, Garden, Home, Office) and one Overview (aggregation) device. Each has the following sensors:
Power (W): Current power production from your solar system
Today energy (kWh): Total energy produced today
Lifetime energy (kWh): Total energy produced since installation
All sensors are updated every minute.
The integration polls data from the Hypontech Cloud every 60 seconds.
This integration provides no additional actions.
There is no support for batteries yet.
This integration can be removed by following these steps:
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Hypontech Cloud hub was introduced in Home Assistant 2026.3, and it's used by
52 active installations.
Its IoT class is Cloud Polling.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@jcisio
Categories
Energy
Sensor
Back to top
