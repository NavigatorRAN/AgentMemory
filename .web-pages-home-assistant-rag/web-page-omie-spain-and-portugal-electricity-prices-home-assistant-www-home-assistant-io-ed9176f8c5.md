# OMIE - Spain and Portugal electricity prices - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/omie
- Final URL: https://www.home-assistant.io/integrations/omie
- Canonical URL: https://www.home-assistant.io/integrations/omie/
- Fetched at: 2026-06-28T03:05:21Z
- Content type: text/html; charset=UTF-8

## Description

Monitor OMIE day-ahead electricity market prices for Spain and Portugal directly in Home Assistant.

## Extracted Text

On this page
Configuration
Sensors
Data updates
Removing the integration
To remove an integration instance from Home Assistant
OMIE is the electricity market operator for the day-ahead and intraday energy markets in Spain and Portugal. The OMIE integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] retrieves day-ahead market prices from the OMIE APIs and makes them available within Home Assistant.
Having the wholesale electricity prices within Home Assistant enables a range of use cases, such as:
Calculating electricity bills ahead of time (for those on variable-price tariffs that are linked to the wholesale price)
Deciding whether to export locally produced energy (for example from solar panels) to the grid
To add the OMIE - Spain and Portugal electricity prices service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select OMIE - Spain and Portugal electricity prices .
Follow the instructions on screen to complete the setup.
The OMIE integration retrieves the results of the day-ahead market for Spain and Portugal daily and exposes them as the following sensors Sensors return information about a thing, for instance the level of water in a tank. [Learn more] .
Portugal spot price : Current quarter-hour electricity spot price in Portugal, in €/kWh.
Spain spot price : Current quarter-hour electricity spot price in Spain, in €/kWh.
The OMIE integration polls Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] OMIE for new data at the start of each quarter-hour (in Central European Time).
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The OMIE - Spain and Portugal electricity prices service was introduced in Home Assistant 2026.5, and it's used by
79 active installations.
Its IoT class is Cloud Polling.
🥈 Silver quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@luuuis
Categories
Energy
Sensor
Back to top
