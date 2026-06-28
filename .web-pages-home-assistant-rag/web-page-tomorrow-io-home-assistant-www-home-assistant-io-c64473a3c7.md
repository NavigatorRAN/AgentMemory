# Tomorrow.io - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/tomorrowio
- Final URL: https://www.home-assistant.io/integrations/tomorrowio
- Canonical URL: https://www.home-assistant.io/integrations/tomorrowio/
- Fetched at: 2026-06-28T03:23:05Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate the Tomorrow.io Weather and Air Quality API into Home Assistant.

## Extracted Text

On this page
Obtain an API key
Supported Forecast Types
Configuration
The Tomorrow.io integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to obtain weather, air quality, pollen, and fire information from the Tomorrow.io API .
You can obtain a free API key by signing up with Tomorrow.io . The integration assumes that your API key is associated with a free Tomorrow.io account. Free accounts include a limited number of daily API requests and the number of daily API requests included varies by account. Log in to Tomorrow.io to view the number of daily API requests included with your account.
The refresh interval defaults to a time period that is compatible with an account limited to 100 daily API requests and this integration should use around 90% of the available daily requests.
When using a free account, the information provided by Tomorrow.io is limited to the Core layer . It does not include the Air Quality layer or other layers. A paid Tomorrow.io account is required to retrieve those layers.
Forecast Type Description nowcast Up to the 1 minute predictions. Supports 300 minutes or a max of 30 forecasts depending on the chosen timestep hourly Hourly forecasts for the next 24 hours daily Daily forecasts for the next 14 days
To add the Tomorrow.io service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Tomorrow.io .
Follow the instructions on screen to complete the setup.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Tomorrow.io service was introduced in Home Assistant 2022.4, and it's used by
3140 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@raman325
@lymanepp
Categories
Environment
Health
Sensor
Weather
Back to top
