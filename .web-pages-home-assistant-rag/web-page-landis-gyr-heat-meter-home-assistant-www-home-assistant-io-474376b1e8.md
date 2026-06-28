# Landis+Gyr Heat Meter - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/landisgyr_heat_meter
- Final URL: https://www.home-assistant.io/integrations/landisgyr_heat_meter
- Canonical URL: https://www.home-assistant.io/integrations/landisgyr_heat_meter/
- Fetched at: 2026-06-28T02:55:22Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate your Landis+Gyr Heat Meter device into Home Assistant.

## Extracted Text

On this page
Configuration
Sensors
Energy dashboard
Polling the device
Polling manually (optional)
The Landis+Gyr Heat Meter integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] for Home Assistant allows you to read the meter values from Ultraheat devices by Landis & Gyr. These devices are commonly used for district heating. The integration has been tested with the Landis & Gyr Ultraheat 50 (UH50), type LUGCUH50. Other models are likely to work as well.
The device is read through the optical interface. An (USB) IR reader is needed and connected to Home Assistant.
To add the Landis+Gyr Heat Meter device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Landis+Gyr Heat Meter .
Follow the instructions on screen to complete the setup.
The integration will create the following sensors:
Heat usage (MWh)
Volume usage (m3)
To be compatible with the Home Assistant energy units of measurement, heat usage is converted to MWh, from usage in GJ, which is supplied by the device, using a conversion factor: 1 GJ = 0.277778 MWh.
Further data that is read from the device is added as diagnostic entities:
Heat usage measured in GJ, as is read from the device before conversion
Ownership number
Volume previous year (m3)
Heat previous year (MWh)
Heat previous year (GJ)
Error number
Device number
Measurement period minutes
Power max (kW)
Power max previous year (kW)
Flow rate max (m3ph)
Flow rate max previous year (m3ph)
Flow temperature max (°C)
Return temperature max (°C)
Flow temperature max previous year (°C)
Return temperature max previous year (°C)
Operating hours
Fault hours
Fault hours previous year
Yearly set day
Monthly set day
Meter date time
Measuring range (m3ph)
Settings and firmware
Flow hours
Either heat usage or volume usage can be used as “Gas” on the energy dashboard. If you want to supply a price per MWh, make sure to apply the conversion factor first.
Polling is by default done only once per day (and once right after adding the integration). Every time the Heat Meter values are read, battery time of the device will (supposedly) go down by about 30 minutes.
For detailed control on when the device is polled, disable the default polling for this integration and create an automation that will update one of the entities (the other entities will be updated as well)
If you’re comfortable with YAML, this code could be used:
alias : " Heat Meter manual update" triggers : - trigger : time at : " 23:30:00" actions : - action : homeassistant.update_entity target : entity_id : sensor.heat_meter_heat_usage_gj
For more detailed steps on how to define a custom polling interval, follow the procedure below.
Defining a custom polling interval
If you want to define a specific interval at which your device is being polled for data, you can disable the default polling interval and create your own polling automation.
To add the automation:
Go to Settings > Devices & services , and select your integration.
On the integration entry, select the .
Then, select System options and toggle the button to disable polling.
To define your custom polling interval, create an automation.
Go to Settings > Automations & scenes and create a new automation.
Define any trigger and condition you like.
Select Add action , then select Other actions .
Select Perform action , and from the list, select the homeassistant.update_entity action .
Add the entities you want to poll to the Entity field. The homeassistant.update_entity action only supports targeting by entity. Selecting an area, device, or label is not supported.
Save your new automation to poll for data.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Landis+Gyr Heat Meter device was introduced in Home Assistant 2022.9, and it's used by
19 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@vpathuis
Categories
Energy
Sensor
Back to top
