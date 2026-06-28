# Intergas gateway - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/incomfort
- Final URL: https://www.home-assistant.io/integrations/incomfort
- Canonical URL: https://www.home-assistant.io/integrations/incomfort/
- Fetched at: 2026-06-28T02:51:58Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate an Intergas gateway with Home Assistant.

## Extracted Text

On this page
Supported devices
Boiler
Rooms
Configuration
Options
Sensors for diagnostics
Troubleshooting
Data updates
Removing the integration
To remove an integration instance from Home Assistant
Automation
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] links Home Assistant with your Intergas gateway, including the boiler and any room thermostats attached to it.
The integration uses the incomfort-client library.
The Intergas Gateway connects thermostats based on the OpenTherm standard. An example of such a thermostat is the Comfort Touch Thermostat . The thermostats and LAN2RF gateway are often sold as a set. The gateway is suitable for use with Intergas Kombi Kompakt HRE and HReco appliances from year of manufacture 2014. If the Comfort Touch thermostat is used together with the gateway, then this will work in combination with Intergas Kombi Kompakt HRE, HReco, or Xtreme devices from year of manufacture 2017.
Important
The V3 version (EAN: 8718556040273) of the Intergas LAN2RF Gateway is not supported by this integration.
The boiler is represented as a Water heater device. It will report the boiler’s state and current_temperature . The gateway does not expose any means to directly control the boiler or change its configuration.
Note that the current_temperature will switch between the CV (circulating volume) and Tap temperatures according to the current operating mode of the boiler. If the boiler is neither pumping nor tapping, it will be reported as the higher of the two.
Any room thermostats (there can be 0, 1 or 2) are represented as Climate devices. They will report the thermostat’s target temperature and current_temperature and the target temperature can be changed. This is similar to changing the target temperature override using the Comfort Touch App that comes with the thermostat/gateway. Note that any override will be reset when a new set point is reached on the thermostat’s schedule.
To add the Intergas gateway hub to your Home Assistant instance, use this My button:
Intergas gateway can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Intergas gateway .
Follow the instructions on screen to complete the setup.
host
Hostname or IP-address of the Intergas gateway.
username
The username to log into the gateway. This is admin in most cases.
password
The password to log into the gateway, is printed at the bottom of the gateway or is intergas for some older devices.
The hub does not have to be in the same network as HA, but must be reachable via port 80/HTTP.
The above configuration can also be adjusted later via
Settings > Devices & services ,
select “Intergas gateway” and click and select Reconfigure .
Some older room thermostats might report the wrong setpoint when the setpoint is manually changed on the room thermostat. If you encounter this behavior, you can enable the Legacy setpoint handling option.
To define options for Intergas gateway, follow these steps:
In Home Assistant, go to Settings > Devices & services .
If multiple instances of Intergas gateway are configured, choose the instance you want to configure.
On the card, select the cogwheel .
If the card does not have a cogwheel, the integration does not support options for this device.
Edit the options, then select Submit to save the changes.
Note that all sensors are disabled by default.
Sensors
Boiler Pressure: Indicates the boilers pressure.
Boiler Temperature: Indicates the central heating temperature.
Boiler Tap temperature: Indicates the tap water temperature.
Binary sensors
Boiler Burner: Indicates if the burner is on.
Boiler Fault: Indicates if there is a problem. The fault code is set as an attribute.
Boiler Hot water tap: Indicates if the hot water tap is running.
Boiler Pump: Indicate the pump is running for cental heating.
In case setting up an older gateway type fails, then try to leave username and password fields empty.
The Intergas gateway will fetch state data from the gateway every 30 seconds. When the target temperature on the thermostat is changed, it might take some time for the set point to be updated on the Home Assistant climate entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] .
This integration follows standard integration removal, no extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
To send an alert if the CV pressure is too low or too high, consider the following example:
- alias : " Low CV Pressure Alert" triggers : - trigger : numeric_state entity_id : sensor.boiler_pressure below : 1.0 actions : - action : notify.pushbullet_notifier data : title : " Warning: Low CH Pressure" message : >- {{ trigger.to_state.attributes.friendly_name }} is low, {{ trigger.to_state.state }} bar.
Other properties are available via each device’s attributes.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Intergas gateway hub was introduced in Home Assistant 0.93, and it's used by
309 active installations.
Its IoT class is Local Polling.
🏆 Platinum quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@jbouwh
Categories
Binary sensor
Climate
Sensor
Water heater
Back to top
