# MyNeomitis - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/myneomitis
- Final URL: https://www.home-assistant.io/integrations/myneomitis
- Canonical URL: https://www.home-assistant.io/integrations/myneomitis/
- Fetched at: 2026-06-28T03:01:57Z
- Content type: text/html; charset=UTF-8

## Description

Connect the MyNeomitis devices (radiators, towel rails, relays, underfloor heating) to Home Assistant using the cloud API.

## Extracted Text

On this page
Prerequisites
Supported devices
Configuration
Use cases
Supported functionality
Climate
Selects
Data updates
Removing the integration
To remove an integration instance from Home Assistant
The MyNeomitis integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] connects your Axenco MyNeomitis heating and energy management devices to Home Assistant. With this integration, you can control your devices, such as electric radiators, towel rails, and underfloor heating, directly from Home Assistant.
Create a MyNeomitis account via the MYNEOMITIS app.
Add your devices to the account using the app.
Eftair towel rails with blower
Ebath towel rails
Estyle radiant panel heater
Efluid radiator
Myneo Fluid radiator
Myneo stat thermostat
Myneo Link smart Wi-Fi switch
To add the MyNeomitis hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select MyNeomitis .
Follow the instructions on screen to complete the setup.
Email
The email address associated with your MyNeomitis account.
Password
The password for your MyNeomitis account.
Control temperature and change operating modes.
Allows you to view and edit weekly schedules from the Home Assistant Interface.
Allows you to monitor the energy consumption of compatible products.
The MyNeomitis integration provides the following entities:
Climate ( climate )
Description : Controls temperature, preset modes, and HVAC modes for supported radiators, thermostats, and towel rails.
Features : Set target temperature, change preset, and switch between heating/cooling/off (where supported).
Presets : Comfort , Comfort + , Eco , Eco -1 , Eco -2 , Frost protection , Boost , Setpoint , Standby .
Available for devices : EV30, ECTRL, ESTAT, RSS-ECTRL, NTD, ETRV models
Pilot wire mode ( pilote )
Description : Controls the operating mode of heating devices via the pilot wire.
Options : Comfort , Comfort + , Eco , Eco -1 , Eco -2 , Frost protection , Boost , Setpoint , Standby , Auto
Available for devices : EWS devices without a relay mode
Switch mode ( relais )
Description : Controls the operating mode of smart switch/relay devices.
Options : On , Off , Auto
Available for devices : EWS devices with a relay mode
Underfloor heating mode ( ufh )
Description : Controls whether underfloor heating operates in heating or cooling mode.
Options : Heating , Cooling
Available for devices : UFH devices
The MyNeomitis integration receives real-time updates from the Axenco cloud API. Device state changes are pushed to Home Assistant immediately without polling Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] .
This integration follows standard integration removal.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The MyNeomitis hub was introduced in Home Assistant 2026.3, and it's used by
3 active installations.
Its IoT class is Cloud Push.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@l-pr
Categories
Select
Back to top
