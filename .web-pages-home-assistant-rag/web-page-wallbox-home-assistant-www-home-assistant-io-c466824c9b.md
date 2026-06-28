# Wallbox - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/wallbox
- Final URL: https://www.home-assistant.io/integrations/wallbox
- Canonical URL: https://www.home-assistant.io/integrations/wallbox/
- Fetched at: 2026-06-28T03:27:31Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate sensors Wallbox EV chargers to Home Assistant

## Extracted Text

On this page
Configuration
Sensors
Number
Lock
Select
Switch
Data updates
Troubleshooting
Setup errors
Connection failures
Insufficient Rights
Other issues
Removing the integration
To remove an integration instance from Home Assistant
The Wallbox integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] pulls data from the MyWallbox Portal for your Wallbox charging station.
Use this integration to monitor the charging of your car by the Wallbox charger and modify settings such as Charging Power , Energy Price , Solar Charging and Pause/Resume . The energy usage collected by this integration can be used in the Energy dashboard .
To add the Wallbox device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Wallbox .
Follow the instructions on screen to complete the setup.
Station Serial Number
The Serial number of your charger. You can find it in the Wallbox App or on the Wallbox Portal.
Username
This integration only supports a regular / email login, Apple or Google accounts are not supported.
The integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] adds the following sensors:
Added energy (kWh)
Added green energy (kWh)
Added grid energy (kWh)
Added range (km)
Charging power (kW)
Charging speed
Charging time
Cost ([default currency])
Current mode
Depot price ([default currency]/kWh)
Energy price ([default currency]/kWh)
Max available power (A)
State of charge (%)
Status description
Max charging current (A)
Max ICP current (A)
The integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] adds the following number entities:
Max ICP current; this is the maximum current available for load balancing (A)
The number entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] is only loaded if the supplied username has sufficient rights to change the Max. Charging Current.
The integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] adds a lock entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] , allowing you to lock the charger. This only works with a user with admin rights.
The integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] adds a select entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] to control solar charging options, allowing you to choose between Eco mode , Full solar , or Disable solar charging .
The integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] adds a switch entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] , allowing you to pause/resume the charging process.
Data is refreshed once every 90 seconds for owners of 1 charger, this rate is multiplied by the amount of chargers for owners of multiple Wallboxes. Note that this update interval has been chosen in conjunction with Wallbox to prevent overloading their infrastructure. Altering this refresh rate is not recommended.
You can only use a regular login with this integration.
Google or Apple logins are not supported.
You can find the serial number of your charger in the Wallbox app or on the Wallbox Portal under the Chargers section.
Users often report issues with the Wi-Fi reception of their charger; use a wired connection if possible. Also verify that the charger is communicating with the Wallbox Portal.
This integrations needs admin credentials to function properly. Please assign the user appropriate permissions in the Wallbox portal.
Always first check whether the data is being received by the Wallbox Portal as this integration uses the same API. Many problems are related to the connectivity of the charger.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Wallbox device was introduced in Home Assistant 2021.6, and it's used by
2523 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@hesselonline
Categories
Car
Back to top
