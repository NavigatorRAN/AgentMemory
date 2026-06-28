# Teleinfo - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/teleinfo
- Final URL: https://www.home-assistant.io/integrations/teleinfo
- Canonical URL: https://www.home-assistant.io/integrations/teleinfo/
- Fetched at: 2026-06-28T03:21:18Z
- Content type: text/html; charset=UTF-8

## Description

Read electricity consumption data from French Linky smart meters using the Télé-Information Client (TIC) protocol.

## Extracted Text

On this page
Supported devices
Meters
USB adapters
Prerequisites
Configuration
Supported functionality
Sensors
Examples
Energy dashboard
Automation: high power alert
Automation: tomorrow’s Tempo color
Data updates
Known limitations
Historique mode only
Single-phase only
Troubleshooting
Serial port not found
Permission denied on serial port
Timeout waiting for Teleinfo data
“Failed to decode Teleinfo frame” error
USB device not auto-detected
Removing the integration
To remove an integration instance from Home Assistant
The Teleinfo integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] reads data from the French electricity metering system known as Télé-Information Client (TIC). This protocol is used by Linky smart meters and older electronic meters deployed by Enedis , the French electricity distribution network operator.
By connecting a Teleinfo USB adapter to your meter’s TIC output, you can monitor real-time electricity consumption data directly in Home Assistant. This includes energy indexes for each tariff period, apparent power, instantaneous current, and tariff information. All data is read locally from the serial port, with no cloud dependency.
Linky smart meters (deployed by Enedis in France) with the TIC output enabled in historique mode
Older electronic meters with TIC output (pre-Linky) in historique mode
The integration auto-discovers the following USB adapters:
FTDI FT2232 (USB VID:PID 0403:6015 ): GCE Electronics Teleinfo USB, Cartelectronic
Silicon Labs CP2102 (USB VID:PID 10C4:EA60 ): Various Teleinfo USB dongles
You can also manually configure any serial adapter connected to the meter’s TIC output.
Before setting up this integration, make sure you have the following:
A Linky meter (or compatible electronic meter) with the TIC output enabled and set to historique mode. The newer standard mode is not supported. If your meter is in standard mode, you can ask Enedis to switch it back to historique mode.
A Teleinfo USB adapter connected to the meter’s TIC terminals (I1 and I2).
The USB adapter plugged into your Home Assistant host.
To add the Teleinfo device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Teleinfo .
Follow the instructions on screen to complete the setup.
Serial port
The path to the serial port connected to the Teleinfo USB adapter (for example, /dev/ttyUSB0 or a /dev/serial/by-id/ path).
The Teleinfo integration provides the following entities An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] .
The sensors created depend on your electricity contract type. The integration automatically detects your contract and creates only the relevant sensors.
Common sensors (all contracts)
Apparent power ( PAPP )
Description : Instantaneous apparent power (VA).
Device class : apparent_power
Instantaneous current ( IINST )
Description : Instantaneous current draw (A). Disabled by default.
Device class : current
Current tariff period ( PTEC )
Description : The active tariff period code.
Base contract
Base index ( BASE )
Description : Total energy index (Wh). Total increasing counter.
Device class : energy
HC (Heures Creuses) contract
Off-peak index ( HCHC )
Description : Energy index for off-peak hours (Wh). Total increasing counter.
Peak index ( HCHP )
Description : Energy index for peak hours (Wh). Total increasing counter.
EJP contract
Normal hours index ( EJPHN )
Description : Energy index for normal hours (Wh). Total increasing counter.
Peak mobile hours index ( EJPHPM )
Description : Energy index for peak mobile hours (Wh). Total increasing counter.
EJP warning ( PEJP )
Description : Minutes before the next EJP peak period. Disabled by default.
Device class : duration
Tempo (BBR) contract
Blue day off-peak index ( BBRHCJB )
Description : Energy index for blue day off-peak hours (Wh). Total increasing counter.
Blue day peak index ( BBRHPJB )
Description : Energy index for blue day peak hours (Wh). Total increasing counter.
White day off-peak index ( BBRHCJW )
Description : Energy index for white day off-peak hours (Wh). Total increasing counter.
White day peak index ( BBRHPJW )
Description : Energy index for white day peak hours (Wh). Total increasing counter.
Red day off-peak index ( BBRHCJR )
Description : Energy index for red day off-peak hours (Wh). Total increasing counter.
Red day peak index ( BBRHPJR )
Description : Energy index for red day peak hours (Wh). Total increasing counter.
Tomorrow color ( DEMAIN )
Description : The Tempo color for the next day. Disabled by default.
You can add the energy index sensors to the energy dashboard to track your electricity consumption over time:
Go to Settings > Dashboards > Energy .
Under Electricity grid > Consumption , select Add consumption .
Select the appropriate index sensors based on your tariff. For the Tempo tariff, add all six index sensors (blue, white, and red day peak and off-peak).
- alias : " High power consumption alert" triggers : - trigger : numeric_state entity_id : sensor.teleinfo_XXXXXXXXXXXX_apparent_power above : 6000 actions : - action : notify.send_message target : entity_id : notify.my_device data : title : " High power usage" message : " Apparent power is above 6000 VA"
- alias : " Notify tomorrow's Tempo color" triggers : - trigger : time at : " 18:00:00" conditions : - condition : not conditions : - condition : state entity_id : sensor.teleinfo_XXXXXXXXXXXX_tomorrow_color state : " unknown" actions : - action : notify.send_message target : entity_id : notify.my_device data : title : " Tempo color tomorrow" message : >- Tomorrow is a {{ states( 'sensor.teleinfo_XXXXXXXXXXXX_tomorrow_color' ) }} day
The Teleinfo integration polls Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] data from the serial port every 10 seconds. Each poll opens the serial port at 1200 baud (historique mode), reads a complete Teleinfo frame, and decodes the label-value pairs using the pyteleinfo library.
If no data is received or the frame is incomplete within the 10-second timeout, the entities become unavailable until the next successful read.
Only the legacy 1200 baud historique TIC mode is supported. The newer “standard” mode (9600 baud) available on some Linky meters is not yet implemented.
The integration reads single-phase Teleinfo labels. Three-phase installations are not supported.
Make sure the USB adapter is plugged in. You can verify by checking for /dev/ttyUSB* or /dev/serial/by-id/ devices.
If you are using Home Assistant OS, the device should be automatically passed through. For container installations, make sure the device is mapped (for example, --device=/dev/ttyUSB0 ).
The user running Home Assistant needs read access to the serial device.
On Linux, add the user to the dialout group: sudo usermod -aG dialout homeassistant .
Restart Home Assistant after changing group membership.
Make sure the meter’s TIC output is enabled (contact Enedis if needed).
Check the wiring between the meter’s I1/I2 terminals and the USB adapter.
If your adapter has a mode switch, verify it is set to historique mode (1200 baud).
This typically indicates corrupted data on the serial line. Check for electrical interference or loose connections, and try using a shorter cable between the meter and the adapter.
Only FTDI FT2232 ( 0403:6015 ) and Silicon Labs CP2102 ( 10C4:EA60 ) adapters are auto-discovered. For other adapters, use the manual configuration flow and enter the serial port path directly.
This integration follows standard integration removal.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Teleinfo device was introduced in Home Assistant 2026.5, and it's used by
17 active installations.
Its IoT class is Local Polling.
🥈 Silver quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@esciara
Back to top
