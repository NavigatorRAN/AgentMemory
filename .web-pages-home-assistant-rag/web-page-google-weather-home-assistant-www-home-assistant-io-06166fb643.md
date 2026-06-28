# Google Weather - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/google_weather
- Final URL: https://www.home-assistant.io/integrations/google_weather
- Canonical URL: https://www.home-assistant.io/integrations/google_weather/
- Fetched at: 2026-06-28T02:47:04Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Google Weather within Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Data updates
Known limitations
Troubleshooting
Removing the integration
To remove an integration instance from Home Assistant
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] uses Google Weather as a source for weather data for your location.
You need an API key. Follow instructions in the Google developer documentation for creating an API key.
Note
For pricing refer to the billing section in the Google developer documentation .
It is free as long as you stay under 10,000 requests per month.
To add the Google Weather service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Google Weather .
Follow the instructions on screen to complete the setup.
The integration fetches:
current weather conditions every 15 minutes
daily weather forecast for the next 10 days every 1 hour
hourly weather forecast for the next 24 hours every 1 hour
This results in 4,464 requests per month, meaning you could have up to 2 locations and still stay under the 10,000 free usage cap.
The weather.get_forecasts action uses the cached forecast data and will not issue any additional API calls to Google. You can use this action safely in templates or automations without affecting your quota usage.
Weather forecast information isn’t currently available in South Korea and Japan. Refer to the Google Help Center .
Enable debug logging and attach logs before opening an issue.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Google Weather service was introduced in Home Assistant 2025.12, and it's used by
1776 active installations.
Its IoT class is Cloud Polling.
🏆 Platinum quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@tronikos
Categories
Weather
Back to top
