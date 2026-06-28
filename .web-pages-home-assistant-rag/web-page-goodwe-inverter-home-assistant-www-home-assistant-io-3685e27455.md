# GoodWe Inverter - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/goodwe
- Final URL: https://www.home-assistant.io/integrations/goodwe
- Canonical URL: https://www.home-assistant.io/integrations/goodwe/
- Fetched at: 2026-06-28T02:46:21Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to connect your GoodWe Inverter to Home Assistant.

## Extracted Text

On this page
Configuration
Energy dashboard
Inverter polling interval
Defining a custom polling interval
The GoodWe integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] will poll a GoodWe solar inverter over the local network and present its runtime values as sensors in Home Assistant.
It works with GoodWe ET, EH, BT, BH, ES, EM, DT, MS, D-NS, XS and BP families of inverters. Different inverter families/models expose different sets of sensors, the newer models have usually broader support.
Note
If you can’t communicate with the inverter even though your model is listed above, ensure the Modbus TCP option is enabled on the communication dongle. It is also possible you have an old ARM firmware version. You should ask manufacturer support to upgrade your ARM firmware (not just inverter firmware) to be able to communicate with the inverter via UDP.
It may work on other inverter families as well, as long as they listen on UDP port 8899 and respond to one of the supported communication protocols. In general, if you can communicate with the inverter via an official mobile application (PvMaster, SolarGo), it is very likely the integration will work too.
To add the GoodWe Inverter device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select GoodWe Inverter .
Follow the instructions on screen to complete the setup.
The plugin provides several values suitable for the energy dashboard.
The best supported are the inverters of ET/EH families, where the sensors Meter Total Energy (export) , Meter Total Energy (import) , Total PV Generation , Total Battery Charge and Total Battery Discharge are the most suitable for the dashboard measurements and statistics.
For the other inverter families, if such sensors are not directly available by the inverter, they can be calculated from existing sensors. Template Sensor can be used to separate buy and sell power values and Riemann Sum can be used to convert these instant power (W) values into cumulative energy values (Wh), which then can be used within the energy dashboard.
The integration will poll the inverter for new values every 10 seconds. If you wish to receive fresh inverter data less (or more) frequently, you can disable the automatic refresh in the integration’s system options (Enable polling for updates) and create your own automation with your desired polling frequency.
- alias : " Goodwe inverter data polling" triggers : - trigger : time_pattern hours : " *" minutes : " *" seconds : " /30" actions : - action : homeassistant.update_entity target : entity_id : sensor.ppv
It has been observed in some rare situations that frequent polling conflicts with updates to the Goodwe SEMS cloud portal and do not receive any updates anymore. Reducing polling frequency to 30 seconds or 1 minute seems to help in such cases.
For more detailed steps on how to define a custom polling interval, follow the procedure below.
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
The GoodWe Inverter device was introduced in Home Assistant 2022.2, and it's used by
3063 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@mletenay
@starkillerOG
Categories
Energy
Sensor
Back to top
