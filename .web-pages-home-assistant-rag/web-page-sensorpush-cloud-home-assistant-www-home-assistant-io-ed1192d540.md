# SensorPush Cloud - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/sensorpush_cloud
- Final URL: https://www.home-assistant.io/integrations/sensorpush_cloud
- Canonical URL: https://www.home-assistant.io/integrations/sensorpush_cloud/
- Fetched at: 2026-06-28T03:14:59Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate SensorPush Cloud devices into Home Assistant.

## Extracted Text

On this page
Prerequisites
Supported devices
Configuration
Sensors
Known limitations
Removing the integration
To remove an integration instance from Home Assistant
Integrates SensorPush Cloud devices into Home Assistant.
A G1 WiFi Gateway is required to use the Cloud API. To activate API access, log in to the Gateway Cloud Dashboard and agree to the terms of service.
Sensor entities (temperature, humidity, barometric pressure) will not be available to Home Assistant until you have activated the device with the SensorPush app on iOS or Android.
HT1 Temperature and Humidity Smart Sensor
HT.w Water-Resistant Temperature / Humidity Smart Sensor
HTP.xw Extreme Accuracy Water-Resistant Temperature / Humidity / Barometric Pressure Smart Sensor
To add the SensorPush Cloud hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select SensorPush Cloud .
Follow the instructions on screen to complete the setup.
For each device, the following sensors are created:
Sensor Description altitude Measures the altitude. (disabled by default) atmospheric_pressure Measures the barometric pressure. (disabled by default) battery_voltage Measures the battery voltage. (disabled by default) dewpoint Measures the dew point. (disabled by default) humidity Measures the relative humidity. signal_strength Measures the Bluetooth signal strength. (disabled by default) temperature Measures the temperature. vapor_pressure Measures the vapor-pressure deficit. (disabled by default)
atmospheric_pressure is not available on HT1 and HT.w series devices.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The SensorPush Cloud hub was introduced in Home Assistant 2025.3, and it's used by
95 active installations.
Its IoT class is Cloud Polling.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@sstallion
Categories
Sensor
Back to top
