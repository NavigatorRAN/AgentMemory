# Anglian Water - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/anglian_water
- Final URL: https://www.home-assistant.io/integrations/anglian_water
- Canonical URL: https://www.home-assistant.io/integrations/anglian_water/
- Fetched at: 2026-06-28T02:28:10Z
- Content type: text/html; charset=UTF-8

## Description

The Anglian Water integration allows you to access your smart meter data within Home Assistant.

## Extracted Text

On this page
Supported devices
Unsupported devices
Configuration
Supported functionality
Sensors
Long-term statistics
Identifying Anglian Water statistic entities
Setting up long-term statistics in the energy dashboard
Data updates
Known limitations
Troubleshooting
Readings are not updated
Smart meter unavailable
Removing the integration
To remove an integration instance from Home Assistant
The Anglian Water integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] is used to integrate with the smart meters of Anglian Water .
Smart water meters
Enhanced smart water meters
The following devices are not supported by the integration:
Basic water meters that require manual readings
To add the Anglian Water service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Anglian Water .
Follow the instructions on screen to complete the setup.
Username
The username / email used to log in to your Anglian Water account.
Password
The password used to log in to your Anglian Water account.
Account number
If a valid smart meter is not associated with the default billing account linked to your Anglian Water login, please have your latest bill handy. You will be asked to provide the account number found at the top.
The Anglian Water integration provides the following entities.
Latest reading
Description : Latest reading of your smart water meter.
Yesterday cost
Description : The total cost of yesterday’s water consumption.
Yesterday consumption
Description : Yesterday’s total water consumption in litres (this may not update until after 12pm).
The Anglian Water integration allows you to import all your historical consumption readings from your Anglian Water account into long-term statistic entities. These entities can be displayed in your Home Assistant energy dashboard, providing a comprehensive view of your consumption data over time.
The statistic entities imported via this integration have an anglian_water: prefix. This prefix helps you identify and distinguish these entities from other sensor statistics when setting up the long-term statistics in the energy dashboard.
To set up the Anglian Water long-term statistics in your Home Assistant energy dashboard, follow these steps:
Go to the energy configuration panel of your Home Assistant instance.
Go to Water consumption .
Select Add water source .
Choose the Water entity, for example, anglian_water:account_meter_usage .
The Anglian Water integration polls Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] data from the service every 60 minutes by default.
Data is delayed by up to 24 hours (and can even last longer if there are issues with the smart metering service).
Home Assistant will only poll the API for new data once every 60 minutes as your smart meter does not frequently report changes.
Yesterday’s cost sensor is provided by Anglian Water, as of 25th November 2025 this does not include standing charges or sewerage costs.
This can happen if the smart metering service is experiencing capacity problems or an outage. Check the Anglian Water website before logging an issue.
This means that the account number detected (or provided) does not have an active and supported smart meter and therefore cannot be used with this integration.
This integration follows standard integration removal.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Anglian Water service was introduced in Home Assistant 2025.12, and it's used by
245 active installations.
Its IoT class is Cloud Polling.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@pantherale0
Categories
Sensor
Back to top
