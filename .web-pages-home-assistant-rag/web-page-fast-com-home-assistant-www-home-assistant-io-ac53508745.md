# Fast.com - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/fastdotcom
- Final URL: https://www.home-assistant.io/integrations/fastdotcom
- Canonical URL: https://www.home-assistant.io/integrations/fastdotcom/
- Fetched at: 2026-06-28T02:42:09Z
- Content type: text/html; charset=UTF-8

## Description

How to integrate Fast.com within Home Assistant.

## Extracted Text

On this page
Configuration
Notes
The Fast.com integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] uses the Fast.com web service to measure network bandwidth performance.
Note
Currently, the Fast.com integration only supports measuring download bandwidth.
If you want to measure bandwidth metrics other than download such as ping and upload, use the Speedtest.net integration.
Enabling this integration will automatically create the Fast.com Sensor.
By default, a speed test will be run every hour. The user can manually run a speed test via the homeassistant.update_entity action.
To add the Fast.com service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Fast.com .
Follow the instructions on screen to complete the setup.
When running on Raspberry Pi 3 or older, the maximum speed is limited by its 100 Mbit/s LAN adapter.
The sensor will return the maximum measured speed during a 15-second test.
Speed tests consume data depending on your internet speed. Make sure to consider this if your internet connection has limited bandwidth.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Fast.com service was introduced in Home Assistant 0.88, and it's used by
2829 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@rohankapoorcom
@erwindouna
Categories
Sensor
System monitor
Back to top
