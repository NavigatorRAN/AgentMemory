# V2C - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/v2c
- Final URL: https://www.home-assistant.io/integrations/v2c
- Canonical URL: https://www.home-assistant.io/integrations/v2c/
- Fetched at: 2026-06-28T03:25:48Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate V2C Trydan EVSE with Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Binary Sensor
Sensor
Number
Light
Switch
The V2C integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows monitoring and control of a local V2C Trydan EVSE in Home Assistant.
There is currently support for the following platforms within Home Assistant:
Binary sensor
To configure the V2C integration you will need to enter the IP address of your Trydan EVSE.
To add the V2C device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select V2C .
Follow the instructions on screen to complete the setup.
The V2C integration currently exposes the following binary sensors:
connected: indicates if the EVSE is connected to the car
charging: indicates an ongoing charging session
ready: indicates you may disconnect from the car
The V2C integration currently exposes the following sensors:
charge_power: Current power charging your vehicle.
charge_energy: Energy transferred to your car during the current charging session.
charge_time: Time spent in the current charging session.
meter_error: Information from the EVSE on errors associated with the dynamic power control mode. It can be ignored when this mode is not used.
house_power: Power consumed by your household. This data is available if you installed and configured the settings in the V2C app for the CT clamp that was supplied with your EVSE ).
fv_power: Power produced by your photovoltaic system. This data is available if you installed and configured the settings in the V2C app for the CT clamp that was supplied with your EVSE ).
battery_power: Power directed to a home battery. This data is available if you installed and configured the settings in the V2C app for the CT clamp that was supplied with your EVSE ).
The V2C integration currently exposes the following number entity:
intensity: current used to charge your vehicle
The V2C integration currently exposes the following lights:
Logo LED: Indicates the light behind the V2C logo.
Light LED: Indicates the light of the charger.
The V2C integration currently exposes the following switches:
pause session: pause the charging session
lock EVSE: disables the EVSE
charge point timer: only allow charging during predefined period (set on the mobile application)
dynamic intensity modulation: enable dynamic intensity modulation
pause dynamic control modulation: paused the dynamic control modulation
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The V2C device was introduced in Home Assistant 2023.12, and it's used by
683 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@dgomes
Categories
Car
Back to top
