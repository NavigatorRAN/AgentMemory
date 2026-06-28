# Zinvolt - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/zinvolt
- Final URL: https://www.home-assistant.io/integrations/zinvolt
- Canonical URL: https://www.home-assistant.io/integrations/zinvolt/
- Fetched at: 2026-06-28T03:31:10Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Zinvolt batteries with Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Supported functionality
Entities
Data updates
Removing the integration
To remove an integration instance from Home Assistant
The Zinvolt integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to monitor your Zinvolt batteries in Home Assistant.
A migrated Zinvolt account
To add the Zinvolt hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Zinvolt .
Follow the instructions on screen to complete the setup.
Email
The email of your Zinvolt account
Password
The password of your Zinvolt account
The Zinvolt integration provides the following entities.
Binary sensors
Connected to grid : Whether the battery is connected to the grid.
Numbers
Minimum charge level : The minimum charge level of the battery in percentage.
Maximum charge level : The maximum charge level of the battery in percentage.
Standby time : The time in minutes that the battery remains inactive before it is automatically turned off.
Maximum output : The maximum output of the battery in watts.
Select
Mode : The current mode of the battery.
Sensors
State of charge : The current state of charge of the battery in percentage.
The integration polls Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] the Zinvolt servers every 5 minutes to update sensor data.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Zinvolt hub was introduced in Home Assistant 2026.3, and it's used by
33 active installations.
Its IoT class is Cloud Polling.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@joostlek
Categories
Binary Sensor
Energy
Sensor
Back to top
