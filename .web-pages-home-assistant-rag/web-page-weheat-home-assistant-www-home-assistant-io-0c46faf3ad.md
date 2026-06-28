# Weheat - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/weheat
- Final URL: https://www.home-assistant.io/integrations/weheat
- Canonical URL: https://www.home-assistant.io/integrations/weheat/
- Fetched at: 2026-06-28T03:28:22Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on setting up Weheat within Home Assistant.

## Extracted Text

On this page
Supported devices
Prerequisites
Configuration
Entities
Sensors
Data updates
Actions
Known limitations
Troubleshooting
Removing the integration
To remove an integration instance from Home Assistant
The Weheat integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to display your Weheat devices through Home Assistant.
The Blackbird, Sparrow and Flint heat pumps are supported.
You need a Weheat account, username , and password
When adding the integration in Home Assistant, you will be prompted to enter a Name , Client ID , and Client Secret .
The name is arbitrary, the ID and secret are provided in the knowledge base .
During setup of the integration in Home Assistant, you will be redirected to the Weheat login provider. Log in using your username and password .
After login, select link account to link your account.
To add the Weheat hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Weheat .
Follow the instructions on screen to complete the setup.
The Weheat integration provides the following sensors:
Output power : Thermal power added to the water in Watts
Input power : Electrical power in Watts
COP : The Coefficient of performance between the above two power measurements
Water inlet temperature : The heat pump water inlet temperature in °C
Water outlet temperature : The heat pump water outlet temperature in °C
Water target temperature : Target for the water temperature in °C
Central heating inlet temperature : The central heating inlet temperature in °C
Central heating flow The flow volume of the central heating pump
Outside temperature : Outside temperature in °C
Current room temperature : Current room temperature in °C
Room temperature setpoint : Setpoint for the room temperature in °C
Electricity used heating : Total electricity used in kWh during central heating mode
Electricity used DHW : Total electricity used in kWh during DHW mode (optional)
Electricity used cooling : Total electricity used in kWh during cooling mode
Electricity used defrost : Total electricity used in kWh during defrost mode
Electricity used standby : Total electricity used in kWh during standby mode
Electricity used : Total electricity used in kWh
Energy output heating : Total output generated in kWh during central heating mode
Energy output DHW : Total output generated in kWh during DHW mode (optional)
Energy output cooling : Total output generated in kWh during cooling mode. Note that this energy number is negative and decreasing as energy is removed from the house.
Energy output defrost : Total output generated in kWh during defrost mode. Note that this energy number is negative and decreasing as energy is removed from the house.
Energy output : Total output generated in kWh
State : The current heat pump state
DHW top temperature : The domestic hot water temperature in the top of the vessel in °C (optional)
DHW bottom temperature” : The domestic hot water temperature in the bottom of the vessel in °C (optional)
DHW pump flow : The flow volume of the DHW pump (optional)
Compressor RPM : The rpm of the compressor fan.
Compressor percentage : The percentage of the compressor fan. Can exceed 100% for some models.
Depending on the model/installation, states for the Indoor Unit states are available:
Indoor unit water pump
Indoor unit auxiliary water pump
Indoor unit DHW valve or water pump
Indoor unit gas boiler heating allowed - Note: This may be True even when no gas boiler is installed or active.
Indoor unit electric heater
The integration uses polling Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] to retrieve data every 120 seconds for a single heat pump. This interval increases proportionally with the number of heat pumps, for example, to 240 seconds for two heat pumps. Additionally, energy data is retrieved from the cloud every 1800 seconds.
This integration does not provide any actions.
There is currently no way to control the heat pump via this integration.
In case no devices are discovered, make sure that you can log in to the Weheat portal and the correct heat pumps are visible there. If they are available there, contact Weheat support.
This integration follows standard integration removal, no extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Weheat hub was introduced in Home Assistant 2024.10, and it's used by
226 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@barryvdh
Categories
Climate
Energy
Sensor
Back to top
