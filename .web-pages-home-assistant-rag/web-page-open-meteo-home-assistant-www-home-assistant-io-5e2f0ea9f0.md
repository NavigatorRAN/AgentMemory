# Open-Meteo - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/open_meteo
- Final URL: https://www.home-assistant.io/integrations/open_meteo
- Canonical URL: https://www.home-assistant.io/integrations/open_meteo/
- Fetched at: 2026-06-28T03:05:41Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Open-Meteo within Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Supported functionality
Weather
Data updates
Known limitations
Troubleshooting
The weather entity shows as unavailable
Removing the integration
To remove an integration instance from Home Assistant
The Open-Meteo integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] adds free weather forecasts to Home Assistant for any location you choose, with no account or API key to set up.
Open-Meteo is a weather service that is free for open-source and non-commercial use. It works together with national weather services and picks the best available forecast model for your location, at a resolution of 1 to 11 km. Point it at your home, a holiday address, or any other place you have set up as a zone, and Home Assistant gets the current conditions and a forecast you can show on a dashboard or use to drive automations, such as a reminder to bring in the laundry before the rain arrives.
You need a zone Zones allow you to specify certain regions on a map. They enable zone presence-detection and can be used in automations. For example, to start the vacuum after you left home or start the heating at home when you leave the office. [Learn more] to forecast for. Home Assistant already has a Home zone set to your installation’s location, so in most cases there is nothing to prepare. To forecast for another place, add a zone first under Settings > Areas, labels & zones .
No account or API key is required.
To add the Open-Meteo service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Open-Meteo .
Follow the instructions on screen to complete the setup.
Zone
The zone whose location is used for the weather forecast. Choose the Home zone, or any other zone you have created.
Each zone you add gives you one weather entity, named after that zone. To forecast for more than one location, add the integration again and choose a different zone.
The integration provides a single weather entity for the selected zone. It reports the current conditions along with a daily and an hourly forecast.
The current conditions include:
The weather condition, such as sunny, cloudy, or rainy
Temperature
Wind speed and direction
The daily forecast adds a high and low temperature, expected precipitation, and wind for each day. The hourly forecast covers the condition, temperature, and precipitation for the hours ahead.
You can show the forecast on a dashboard with the weather card, or read it in an automation or script with the weather.get_forecasts action. Temperature, wind speed, and precipitation are shown in the units from your Home Assistant settings.
Home Assistant polls Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] Open-Meteo for new data every 30 minutes.
Open-Meteo is free for open-source and non-commercial use. For commercial use, see the Open-Meteo website .
A forecast is only as precise as the weather model available for the chosen location, so accuracy varies from place to place.
New data arrives every 30 minutes, so the current conditions are not real-time.
Open-Meteo is an online service. If the weather entity becomes unavailable, check that your Home Assistant instance can reach the internet. The entity recovers on its own once Open-Meteo is reachable again and the next update succeeds.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Open-Meteo service was introduced in Home Assistant 2022.2, and it's used by
2.8% of the active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@frenck
Categories
Back to top
