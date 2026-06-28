# CentriConnect/MyPropane - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/centriconnect
- Final URL: https://www.home-assistant.io/integrations/centriconnect
- Canonical URL: https://www.home-assistant.io/integrations/centriconnect/
- Fetched at: 2026-06-28T02:33:29Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate CentriConnect/MyPropane monitors into Home Assistant.

## Extracted Text

On this page
Supported devices
Prerequisites
Configuration
Supported functionality
Sensors
Examples
Display the current tank level as a gauge
Data updates
Known limitations
Troubleshooting
Removing the integration
To remove an integration instance from Home Assistant
CentriConnect/MyPropane integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to monitor the level and status of propane tanks equipped with centriconnect.com monitoring devices from within Home Assistant. You can then set up automations based on that information.
The following devices are known to be supported by the integration:
MyPropane Tank Monitor (Above Ground)
MyPropane Tank Monitor (Under Ground)
To use this integration, you need to register your tank monitor with CentriConnect and create an account.
Make note of the full Device ID and Device Authentication Code printed on the setup card.
Download the MyPropane app and connect by scanning the QR code on the back of your tank monitor.
Follow the steps to create an account and register the device.
Select Account from the main menu.
Copy or write down your User ID .
To add the CentriConnect/MyPropane device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select CentriConnect/MyPropane .
Follow the instructions on screen to complete the setup.
Device ID
The unique identifier for your tank monitor. You can find it on the back of the device or on the setup card.
Device Authentication Code
The secret authentication code for the device. It is only located on the setup card.
User ID
The unique identifier for your CentriConnect/MyPropane account. You can find it in the Account settings in the app.
The CentriConnect/MyPropane integration provides the following entities:
Alert Status
Description : The alert status of the tank level with respect to the configured alert levels.
Possible Values : ‘No Alert’, ‘Low Level’, ‘Critical Level’
Remarks : Alert levels are configured in the app and when the tank level falls below those levels this value is updated.
Altitude
Description : Current altitude of the device in meters above sea level.
Remarks : Disabled by default.
Battery
Description : Current battery percentage of the device.
Remarks : Battery is charged by the solar panel, if the battery is low, check to make sure the solar panel is clean and the device is oriented towards the sun.
Battery Voltage
Description : Current battery voltage in volts
Remarks : Disabled by default. Usually between 3.5V and 4.05V.
Device Temperature
Description : Current temperature measured by the device in °F
Remarks : Disabled by default. Not particularly useful as a thermometer since the value updates 2-3 times per day.
LTE Signal Level
Description : Current cellular signal level as a percentage
Remarks : -
LTE Signal Strength
Description : Current cellular signal strength in dBm
Remarks : Disabled by default. Usually between -140 dBm and -70 dBm.
Solar Level
Description : Current solar power level as a percentage
Solar Voltage
Description : Current solar power in volts
Remarks : Disabled by default. Usually between 0V and 2.86V.
Tank Level
Description : Current tank level as a percentage
Remarks : This is the sensor you’re looking for.
Tank Remaining Volume
Description : Estimated remaining volume of fluid/gas in the tank
Remarks : Tank Level multiplied by Tank Size. The units of this sensor reflect the units provided for the tank size during device registration.
Tank Size
Description : The total volume of the tank. Provided during device registration.
Remarks : The units of this sensor reflect the units provided during device registration.
The example below uses the common gauge card in the frontend The frontend is a necessary component for the UI, it is also where you can define your themes. [Learn more] to show the tank level with colored severity bands.
type : gauge entity : sensor.my_propane_tank_level name : Tank Level unit : " %" needle : true severity : green : 30 yellow : 15 red : 0
The CentriConnect/MyPropane integration polls Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] data from the API every 6 hours.
The tank monitor only provides new data 2-3 times a day so more frequent polling is not configurable.
This integration exposes all the data provided in the API but not all data about the tank configuration shown in the app is exposed in the API.
Before reporting an issue, enable debug logging and restart the integration.
As soon as the issue recurs, stop the debug logging again ( a download of the debug log file will start automatically ).
Additionally, download the diagnostics The diagnostics integration provides a way to download diagnostic data from a device or integration for sharing in issue reports. Sharing diagnostics data when reporting an issue allows developers to diagnose and fix your reported problem quicker. [Learn more] data. Once you have collected the debug log and the diagnostics data, include them in the issue report.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The CentriConnect/MyPropane device was introduced in Home Assistant 2026.6, and it's used by
3 active installations.
Its IoT class is Cloud Polling.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@gresrun
Categories
Energy
Sensor
Back to top
