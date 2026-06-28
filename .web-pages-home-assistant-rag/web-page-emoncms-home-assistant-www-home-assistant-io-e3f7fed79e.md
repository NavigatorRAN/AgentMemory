# Emoncms - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/emoncms
- Final URL: https://www.home-assistant.io/integrations/emoncms
- Canonical URL: https://www.home-assistant.io/integrations/emoncms/
- Fetched at: 2026-06-28T02:40:02Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Emoncms feeds as sensors into Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Options
Sensors
Data updates
Troubleshooting
Removing the integration
To remove an integration instance from Home Assistant
Related topics
The Emoncms integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] creates sensors for the feeds available in your local or cloud based version of Emoncms .
To write information from Home Assistant to Emoncms, you can use the emoncms_history integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] .
To use this service, you need an Emoncms account and an API key. You can find the API key in your local or cloud-based Emoncms account settings.
To add the Emoncms service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Emoncms .
Follow the instructions on screen to complete the setup.
URL
The URL of the Emoncms server starting with the protocol ( http or https ). For cloud installations, use https://emoncms.org (trailing slash optional). For local installations, use your local server address (e.g., http://localhost:8080 ). Ensure the server is accessible from your Home Assistant instance.
API key
The 32-character read-only API key needed for authentication is found under “My Account > Read Only API Key” in Emoncms. The key should be a hexadecimal string. The read-and-write API key is not needed as this integration reads data from Emoncms. If you receive authentication errors, verify that you’ve copied the entire key correctly.
To define options for Emoncms, follow these steps:
In Home Assistant, go to Settings > Devices & services .
If multiple instances of Emoncms are configured, choose the instance you want to configure.
On the card, select the cogwheel .
If the card does not have a cogwheel, the integration does not support options for this device.
Edit the options, then select Submit to save the changes.
energy in Wh, kWh
power in W
voltage in V
current in A
apparent power in VA
temperature in °C, °F or K
frequency in Hz
pressure in hPa
This integration retrieves data from Emoncms every 60 seconds.
The Emoncms integration relies on an active local network or internet connection to communicate with your local or cloud based version of Emoncms. If you encounter issues, verify that your connection is stable.
This integration can be removed by following these steps:
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Emoncms service was introduced in Home Assistant 0.29, and it's used by
393 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@borpin
@alexandrecuer
Categories
Sensor
Back to top
