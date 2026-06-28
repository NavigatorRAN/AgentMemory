# Daikin AC - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/daikin
- Final URL: https://www.home-assistant.io/integrations/daikin
- Canonical URL: https://www.home-assistant.io/integrations/daikin/
- Fetched at: 2026-06-28T02:35:49Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Daikin AC devices with Home Assistant.

## Extracted Text

On this page
Supported hardware
Configuration
Climate
Zone climate entities
Sensor
Switch
Region changing
The Daikin integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] integrates Daikin air conditioning systems into Home Assistant.
There is currently support for the following device types within Home Assistant:
The European versions of the Wifi Controller Unit (BRP069A41, 42, 43, 45), which is powered by the ONECTA application ( Google Play , App Store , previously known as Daikin Online Controller ). The new version of WiFi Controller Unit BRP069Bxx is also confirmed to work, tested and working devices are the BRP069B41 and BRP069B45.
The Australian version of the Daikin Wifi Controller Unit BRP072A42, which is operated by the Daikin Mobile Controller (iOS) ( Android ) application. Confirmed working on a Daikin Cora Series Reverse Cycle Split System Air Conditioner 2.5kW Cooling FTXM25QVMA with operation mode, temp, fan swing (3d, horizontal, vertical).
BRP072Cxx based units (including Zena devices)*.
The United States version of the Wifi Controller Unit (BRP072A43), which is powered by the Daikin Comfort Control application. Confirmed working on a Daikin Wall Units FTXS09LVJU, FTXS15LVJU, FTXS18LVJU and a Floor Unit FVXS15NVJU with operation mode, temp, fan swing (3d, horizontal, vertical).
BRP069C4x/BRP084Cxx units using firmware 2.8.0 was added in Home Assistant 2025.9.
The Australian version of the Daikin Wifi Controller for AirBase units (BRP15B61), which is operated by the Daikin Airbase application.
SKYFi based units, which is operated by the SKYFi application*.
If your unit is not in the list above there is another option, to buy and install an ESP32-Faikout .
To add the Daikin AC device to your Home Assistant instance, use this My button:
Daikin AC can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Daikin AC .
Follow the instructions on screen to complete the setup.
If your device is set up with password, use the password. If it has an API key, use the API key. In all other cases, leave the fields blank.
Note
If your Daikin unit does not reside in the same network as your Home Assistant instance (that is, your network is segmented), note that a couple of UDP connections are made during discovery:
From Home Assistant to the Daikin controller: UDP:30000 => 30050
From the Daikin controller to Home Assistant: UDP:<random port> => 30000
If this situation applies to you, you may need to adjust your firewall(s) accordingly.
The daikin climate platform integrates Daikin air conditioning systems into Home Assistant, enabling control of setting the following parameters:
set_hvac_mode ( off , heat , cool , heat_cool , or fan_only )
target temperature
turn on/off
fan mode (speed)
swing mode
set_preset_mode (away, none)
Current inside temperature is displayed.
When your controller supports zone temperature control (AirBase/SKYFi), the integration also exposes one climate entity per zone.
Each zone climate entity can set the temperature within a ±2 °C window around the system set point.
Turning a zone on or off continues to rely on the existing zone switch entities. The zone climate entity is exclusively for temperature management.
Even when a zone is switched off you can adjust its target temperature; Daikin applies the stored set point as soon as the zone is re-enabled.
Only controllers that advertise Linear Zone Control and expose the zone temperature tables (for example AirHub Touch Zone Controller, AirBase/SKYFi models with Linear Zone Control) create these extra climate entities.
The primary Daikin climate continues to provide the zone_temps attribute for a quick overview of all zone targets.
Some models do not support setting of fan speed or swing mode .
Preset mode away translates to Daikin’s “Holiday Mode”:
“Holiday mode” is used when you want to turn off your units when you leave you home for a longer time.
When “Holiday mode” is enabled, the following action take place:
All connected units are turned OFF.
All schedule timers are disabled.
The daikin sensor platform integrates Daikin air conditioning systems into Home Assistant, enabling displaying the following parameters by device:
Inside temperature
Inside humidity
Hourly energy consumption in cool mode
Hourly energy consumption in heat mode
Today’s total energy consumption (updated hourly, resets at 00:00)
The integration displays the following parameters for the outdoor compressor:
Outside temperature
Outside compressor Estimated power consumption (sum of all devices)
Outside compressor Energy consumption (sum of all devices, resets at 00:00)
Outside compressor frequency
Some models only report outside temperature when they are turned on.
Some models do not have humidity sensor.
Some models do not report the power/energy consumption.
Some models do not report the compressor frequency.
The ‘Outdoor compressor Energy consumption’ and ‘Outdoor compressor Estimated power consumption’ sensors are updated every time 100 Wh are consumed by all different operating modes summed together.
The ‘Outdoor compressor Estimated power consumption’ sensor is derived from the above energy consumption and not provided by the AC directly.
The ‘cool/heat’ energy sensors are updated hourly with the previous hour energy consumption
of a given mode and a given AC.
The ‘cool’ mode also includes the ‘fan’ and ‘dehumidifier’ modes’ power consumption.
If you have multiple indoor devices, the ‘Outdoor compressor’ sensors will be created multiple times but will all report the same values. You can disable all but one.
AirBase and SKYFi units exposes zones (typically rooms) that can be switched on/off individually.
Zones with the name - will be ignored, just as the AirBase application is working.
A switch is created for each device that will toggle the unit on/off. This will turn the unit on to its previous state, or toggle it off. This switch works in conjunction with the climate entity.
Additionally the Daikin Streamer (air purifier) function can be toggled on supported devices using a switch. Note that it isn’t currently possible to reliably detect whether a specific device has streamer support, so the switch may appear in the UI even if the functionality isn’t actually supported.
The European and United States controllers (Most likely the Australian controllers too) have an HTTP API endpoint that allows you to change the controllers region so that other regional apps can be used. (Sometimes these controllers get exported to regions that cannot download the app for the controllers region.)
http://Daikin-IP-Address/common/set_regioncode?reg=XX Replace XX with your region code of choice.
Currently known region codes:
AU
EU
JP
US
TH
If you experience problems with certain apps such as the Daikin ONECTA, try setting a lowercase region code (for example, eu ).
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Daikin AC device was introduced in Home Assistant 0.59, and it's used by
1.2% of the active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@fredrike
Categories
Energy
Back to top
