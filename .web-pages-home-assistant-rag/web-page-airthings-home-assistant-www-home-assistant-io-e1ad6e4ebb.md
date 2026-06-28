# Airthings - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/airthings
- Final URL: https://www.home-assistant.io/integrations/airthings
- Canonical URL: https://www.home-assistant.io/integrations/airthings/
- Fetched at: 2026-06-28T02:26:45Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Airthings into Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Troubleshooting
The radon sensor does not show up
Integrates Airthings sensors into Home Assistant.
Airthings provide different sensors for measuring the air quality. The focus specially on Radon sensors.
While this integration works without an Airthings SmartLink hub, using one will provide live updates to your sensor data. Without a hub, you’ll need to rely on the Airthings mobile app to sync data over Bluetooth and upload it to the cloud.
Requires Airthings hardware and a valid Airthings Dashboard login.
Airthings API setup (needed to acquire the required ID and Secret for the Home Assistant Airthings Integration).
Login here to find your credentials.
Select Integrations from the left side-bar.
Click on “Request API Client” to set up an API connection.
Name your API connection (e.g., “Home Assistant”). Note: The name field has a character limit and longer names will be truncated.
Give the connection an accurate description.
Select a Resource Scope.
Select an access Type, for example, Confidential.
Select a flow type.
Set enable to “on”.
Save the settings.
Upon saving the settings, you will be presented with a generated id and secret.
The Airthings integration can now be activated using the generated id and secret that you have just created.
To add the Airthings hub to your Home Assistant instance, use this My button:
Airthings can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Airthings .
Follow the instructions on screen to complete the setup.
Initially, the radon sensor may not be published by the Airthings API (at device startup, the value is considered “unknown”), and so you may have to wait for the radon sensor to appear for a new device.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Airthings hub was introduced in Home Assistant 2021.10, and it's used by
3645 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@danielhiversen
@LaStrada
Categories
Environment
Health
Sensor
Back to top
