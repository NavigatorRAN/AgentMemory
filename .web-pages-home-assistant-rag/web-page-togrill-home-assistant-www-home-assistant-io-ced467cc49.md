# ToGrill - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/togrill
- Final URL: https://www.home-assistant.io/integrations/togrill
- Canonical URL: https://www.home-assistant.io/integrations/togrill/
- Fetched at: 2026-06-28T03:22:57Z
- Content type: text/html; charset=UTF-8

## Description

Control and monitor your ToGrill compatible BBQ thermometers.

## Extracted Text

On this page
Configuration
Known working devices
Events
Sensors
Select
Numbers
Removing the integration
To remove an integration instance from Home Assistant
The ToGrill integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to connect your ToGrill compatible Bluetooth grill thermometer.
Tip
The recommended way to connect the device to Home Assistant is by using an ESPHome Bluetooth Proxy , as they provide the best experience.
To add the ToGrill device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select ToGrill .
Follow the instructions on screen to complete the setup.
Home Assistant will display a list of addresses of the available desks, and you just need to select the one you want to add. Repeat the process to add more than one desk.
Note
When the Home Assistant integration is active, it will take exclusive control over the device and block access by other controllers like the standard smart phone applications.
Many ToGrill compatible devices exist from many different vendors. Only a subset has been tested successfully. These are known to work. Other detected devices may work or may not work as expected.
Device Model Rubicson - BBQ probe thermometer Pro-05
Event : The most recently triggered alarm or event on the probe. The following event types are expected:
ambient_cool_down - The ambient temperature returned to normal.
ambient_low_temp - The ambient temperature is too low.
ambient_over_heat - The ambient temperature is too high.
device_high_temp - Internal temperature too high.
device_low_power - Power is low.
ignition_failure - Ignition failed.
probe_above_maximum - Temperature is above the allowed range.
probe_acknowledge - Temperature probe alarm was acknowledged by user.
probe_alarm - Temperature has reached it’s set temperature target.
probe_below_minimum - Temperature is below the allowed range.
probe_disconnected - Probe disconnected from device.
probe_timer_alarm - Timer alarm triggered (Note. some device will instead trigger probe_alarm ).
Temperature : The current temperature of the given temperature probe
Battery : The current battery level of the device.
Grill type : The meat that is currently being measured.
Taste : The taste wanted when finished.
Target temperature : The target temperature of the given temperature probe. Set value to 0 to disable target alarm.
Minimum temperature : The minimum temperature the grill probe is allowed to reach. Set value to 0 to disable target alarm.
Maximum temperature : The maximum temperature the grill probe is allowed to reach. Set value to 0 to disable target alarm.
Alarm interval : The interval in minutes between successive alarms.
Target temperature and the Minimum temperature / Maximum temperature are exclusive, and will disable the other setting when set on same probe.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The ToGrill device was introduced in Home Assistant 2025.9, and it's used by
44 active installations.
Its IoT class is Local Push.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@elupus
Categories
Event
Number
Sensor
Back to top
