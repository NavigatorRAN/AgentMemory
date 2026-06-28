# Aurora - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/aurora
- Final URL: https://www.home-assistant.io/integrations/aurora
- Canonical URL: https://www.home-assistant.io/integrations/aurora/
- Fetched at: 2026-06-28T02:29:52Z
- Content type: text/html; charset=UTF-8

## Description

Know when auroras might be visible at your location

## Extracted Text

On this page
Configuration
Options
Sensors
The Aurora integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] uses the NOAA Aurora Forecast action to let you know if an aurora might be visible at your home location in the next 30 minutes, based off of current solar flare activity.
This service gives a number 0-100 representing the current likelihood of visible auroras at your latitude/longitude. By default this sensor is set up to trigger when the reported likelihood for your location is > 75. It updates every 5 minutes.
To add the Aurora service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Aurora .
Follow the instructions on screen to complete the setup.
You can configure multiple locations by adding the integration multiple times.
Once installed you can adjust the threshold for this location by clicking on the Options link on the integration.
The integration will add two sensors for each location you configure:
Sensor Type Values Description binary_sensor on/off on = high chance of Aurora visibility, off = low chance of visibility sensor % value Percentage chance of visibility
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Aurora service was introduced in Home Assistant 0.39, and it's used by
3342 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@djtimca
Categories
Environment
Back to top
