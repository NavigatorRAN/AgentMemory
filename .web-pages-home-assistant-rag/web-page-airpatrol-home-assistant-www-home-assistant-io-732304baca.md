# AirPatrol - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/airpatrol
- Final URL: https://www.home-assistant.io/integrations/airpatrol
- Canonical URL: https://www.home-assistant.io/integrations/airpatrol/
- Fetched at: 2026-06-28T02:26:40Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Airpatrol air conditioning controllers into Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Supported functionality
Climate
Sensors
Known limitations
Removing the integration
To remove an integration instance from Home Assistant
The Airpatrol integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control air conditioning units through Airpatrol devices in Home Assistant.
Important
Your Airpatrol WiFi unit must be configured via the native Airpatrol application before being usable with this integration. This includes setting up the Wi-Fi connection and any initial device configuration.
To add the AirPatrol device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select AirPatrol .
Follow the instructions on screen to complete the setup.
Email
The email to your account with the Airpatrol application.
Password
The password to your account with the Airpatrol application.
The integration will create a climate entity for each air conditioning system found. The climate entity allows you to control:
HVAC mode : Set the operation mode, such as off, heat, and cool.
Target temperature : Set the desired temperature for heating or cooling.
Fan mode : Control the fan speed (if supported by your system).
The integration will create the following sensors for each air conditioning system found:
Temperature : Shows the current temperature (°C) in the room.
Humidity : Shows the current humidity in the room.
Some features may not be available depending on your specific Airpatrol model and firmware version. Check the Airpatrol documentation for your specific device to understand available features. This integration has only been tested with Airpatrol WiFi v5 .
This integration follows standard integration removal, no extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The AirPatrol device was introduced in Home Assistant 2026.1, and it's used by
10 active installations.
Its IoT class is Cloud Polling.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@antondalgren
Categories
Back to top
