# APC UPS Daemon - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/apcupsd
- Final URL: https://www.home-assistant.io/integrations/apcupsd
- Canonical URL: https://www.home-assistant.io/integrations/apcupsd/
- Fetched at: 2026-06-28T02:28:29Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate apcupsd status with Home Assistant.

## Extracted Text

On this page
Supported devices
Prerequisites
Configuration
Supported functionality
Entities
Examples
Send me a push notification when UPS load is high
Data updates
Known limitations
Troubleshooting
Failed to connect
Some entities are no longer provided
Removing the integration
To remove an integration instance from Home Assistant
The APC UPS Daemon integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] is used to integrate with UPS devices from APC when the Network Information Server ( apcupsd ) is configured on the APC devices. Use case: When the Notify integration is set up in Home Assistant, you can send notifications. For example, when the UPS switches to battery power, or when the battery level drops low. You can also use it to track the UPS load.
Generally any device supported by apcupsd is also supported by this integration. This includes most APC UPS models, such as Smart-UPS models and simple signaling models like Back-UPS models.
Install apcupsd.
First, install apcupsd on the machine connected to your UPS. It works on Linux, macOS, Windows, BSD, Solaris, and more.
You can usually install it through your operating system’s package manager.
Configure apcupsd for network access.
Open the apcupsd.conf file (usually found in /etc/apcupsd/ ) and make sure it’s set to listen for network connections.
Look for the lines: NISIP 0.0.0.0 and NISPORT 3551 .
This setting allows it to accept connections on all network interfaces on port 3551.
If you prefer, you can set this to a specific IP address and port that Home Assistant can reach.
Start the apcupsd service.
To add the APC UPS Daemon device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select APC UPS Daemon .
Follow the instructions on screen to complete the setup.
Host
The IP address of the APC UPS Daemon configured above.
Port
The port of the APC UPS Daemon configured above.
The APC UPS Daemon integration provides the following entities.
Binary sensors
Online Status
Description : Indicates whether the UPS is online, supplying power to connected devices from utility line, not the battery.
Available for machines : all
Sensors
Note
Some sensors are disabled by default, since they are primarily useful for diagnostics or troubleshooting. You can manually enable them in Settings > Devices & services > Entities > the sensor entity you want to enable > > Enabled .
Alarm Delay
Description : The delay period for the UPS alarm.
Battery Replaced
Description : The date that batteries were last replaced.
Battery Voltage
Description : Battery voltage as supplied by the UPS.
Battery
Description : The percentage charge on the batteries.
Total Time on Battery
Description : Total (cumulative) time on batteries in seconds since apcupsd startup.
Date and Time
Description : The time and date that the STATUS record was written.
Transfer High
Description : The line voltage above which the UPS will switch to batteries.
Input Voltage
Description : The current line voltage as returned by the UPS.
Load
Description : The percentage of load capacity as estimated by the UPS.
Transfer Low
Description : The line voltage below which the UPS will switch to batteries.
Battery Timeout
Description : apcupsd will shut down your system if the time on batteries exceeds this value. A value of zero disables the feature. Value is set in the configuration file (TIMEOUT).
Battery Shutdown
Description : If the battery charge percentage (BCHARGE) drops below this value, apcupsd will shut down your system. Value is set in the configuration file (BATTERYLEVEL).
Shutdown Time
Description : apcupsd will shut down your system if the remaining runtime equals or is below this point. Value is set in the configuration file (MINUTES).
Battery Nominal Voltage
Description : The nominal battery voltage.
Nominal Input Voltage
Description : The input voltage that the UPS is configured to expect.
Nominal Output Power
Description : The maximum power in Watts that the UPS is designed to supply.
Transfer Count
Description : The number of transfers to batteries since apcupsd startup.
Last Self-test
Description : The date and time of the last self-test performed by the UPS.
Remarks : This only becomes available when a self-test (either automatic or manual) is performed.
Self Test Result
Description : The results of the last self test, and may have the following values:
OK: self test indicates good battery
BT: self test failed due to insufficient battery capacity
NG: self test failed due to overload
NO: No results
Startup Time
Description : The time/date that apcupsd was started.
Status
Description : The current status of the UPS (such as ONLINE, CHARGING, or ONBATT)
Time Left
Description : The remaining runtime left on batteries as estimated by the UPS.
Time on Battery
Description : Time in seconds currently on batteries, or 0.
Mode
Description : The mode in which apcupsd is operating as specified in the configuration file (UPSMODE)
Transfer from Battery
Description : Time and date of last transfer from batteries.
Transfer to Battery
Description : Time and date of last transfer to batteries.
Remarks : This entity only becomes available after a transfer to battery event happens.
Battery Status
Description : The status of the batteries.
Available for machines : Back-UPS Pro and Smart-UPS
Line Frequency
Description : Line frequency in hertz as given by the UPS.
Load Apparent Power
Description : An “apparent load” condition, indicating the calculated load on the UPS based on the voltage and current. This is a measure of how much power the UPS is supplying to connected devices, often reported as a percentage of its capacity.
Output Voltage
Description : The voltage the UPS is supplying to your equipment
Bad Batteries
Description : The number of bad battery packs.
Available for machines : Smart-UPS
Dip Switch Settings
Description : The current dip switch settings on UPSes that have them.
Low Battery Signal
Description : The remaining runtime below which the UPS sends the low battery signal. At this point apcupsd will force an immediate emergency shutdown.
Shutdown Delay
Description : The grace delay that the UPS gives after receiving a power down command from apcupsd before it powers off your equipment.
Wake Delay
Description : The amount of time the UPS will wait before restoring power to your equipment after a power off condition when the power is restored.
External Batteries
Description : The number of external batteries as defined by the user. A correct number here helps the UPS compute the remaining runtime more accurately.
Internal Temperature
Description : Internal UPS temperature as supplied by the UPS.
Input Voltage Status
Description : The input line voltage status. “OK” indicates normal operation.
Master Update
Description : The last time the master sent an update to the device.
Input Voltage High
Description : The maximum line voltage since the UPS was started, as reported by the UPS.
Input Voltage Low
Description : The minimum line voltage since the UPS was started, as returned by the UPS.
Nominal Output Voltage
Description : The output voltage that the UPS will attempt to supply when on battery power.
Nominal Apparent Power
Description : The rated apparent power capacity.
Output Current
Description : The output current being supplied by the UPS to the connected devices
Restore Requirement
Description : The percentage charge that the batteries must have after a power off condition before the UPS will restore power to your equipment.
Self Test Interval
Description : The interval in hours between automatic self tests.
Description : The date and time of last transfer off battery since apcupsd startup.
Ambient Humidity
Description : The humidity as measured by the UPS.
Available for machines : Smart-UPS with optional accessories (e.g., temperature/humidity sensors or SNMP network cards).
Ambient Temperature
Description : The ambient temperature as measured by the UPS.
Status Data
Description : Header record indicating the STATUS format revision level, the number of records that follow the APC statement, and the number of bytes that follow the record.
Remarks : Disabled by default.
Model
Description : The old APC model identification code.
Cable Type
Description : The cable as specified in the configuration file (UPSCABLE).
Status Date
Description : The date and time that the information was last obtained from the UPS.
Driver
Description : The driver used to communicate with the UPS.
Firmware Version
Description : The firmware revision number as reported by the UPS.
Hostname
Description : The name of the machine that collected the UPS data.
Last Transfer
Description : The reason for the last transfer to batteries.
Manufacture Date
Description : The date the UPS was manufactured.
Description : The UPS model as derived from information from the UPS.
Register 1 Fault
Description : The value from the UPS fault register 1.
Register 2 Fault
Description : The value from the UPS fault register 2.
Register 3 Fault
Description : The value from the UPS fault register 3.
Sensitivity
Description : The sensitivity level of the UPS to line voltage fluctuations.
Serial Number
Description : The UPS serial number.
Status Flag
Description : Status flag. English version is given by STATUS.
Name
Description : The name of the UPS as stored in the EEPROM or in the UPSNAME directive in the configuration file.
Daemon Info
Description : The apcupsd release number, build date, and platform.
alias : " APC UPS Load High Notification" description : " Notify when APC UPS load is too high" mode : single triggers : - trigger : numeric_state entity_id : - sensor.apc_ups_load above : 80 conditions : [] actions : - action : notify.notify data : message : " APC UPS load is high: {{ states('sensor.apc_ups_load') }}%"
The integration polls Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] data from your APC UPS Daemon every 60 seconds by default.
This integration does not allow you to control the UPS. For example, you cannot run a self-test. To run a self-test, use the apctest command provided by apcupsd .
If you get a Failed to connect error when setting up the integration (and/or ConnectionRefusedError: Connection refused errors in the Home Assistant logs), it means that Home Assistant is not able to connect to the APC UPS daemon. Please check if the NISIP / NISPORT in the apcupsd configuration file is properly configured. Additionally, try running apcaccess on the host machine to see if the daemon is working properly.
If certain entities are missing after a Home Assistant restart, it’s likely because they represent event-based data that only appears after specific UPS events (for example, transfer to battery). These entities are cleared when the APC UPS Daemon restarts and won’t reappear until the corresponding event occurs again.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The APC UPS Daemon device was introduced in Home Assistant 0.13, and it's used by
1570 active installations.
Its IoT class is Local Polling.
🏆 Platinum quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@yuxincs
Categories
Binary sensor
Sensor
System monitor
Back to top
