# Growatt - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/growatt_server
- Final URL: https://www.home-assistant.io/integrations/growatt_server
- Canonical URL: https://www.home-assistant.io/integrations/growatt_server/
- Fetched at: 2026-06-28T02:47:37Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate your Growatt server solar inverter within Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Server regions
Authentication
Obtaining an API token
Compatibility
Known limitations
Rate limiting with username/password authentication
Inverter controls
Numbers
Switches
Actions
Action: Update time segment
Action: Read time segments
Action: Write AC charge times
Action: Write AC discharge times
Action: Read AC charge times
Action: Read AC discharge times
Examples
Off-peak charging schedule
Peak hour export schedule
Daytime home priority schedule
Reading current TOU configuration
Writing SPH AC charge times
Reading SPH AC discharge times
Data updates
Troubleshooting
API token authentication shows “No plant found” error
Account locked or authentication failing
Enable debug logging
Reporting issues
Removing the integration
To remove an integration instance from Home Assistant
The Growatt integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] enables you to retrieve data from Growatt inverters and control certain inverter settings.
Once configured, the integration connects to your Growatt account and creates entities for your plant and inverters, allowing you to monitor energy production and control settings in Home Assistant. You can select from various regional server endpoints during setup to ensure optimal connectivity for your account location.
If you have multiple plants registered in your Growatt account, you can select which one to integrate during the setup process.
A Growatt system and account
Login credentials (username and password) or API token for your Growatt account
To add the Growatt hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Growatt .
Follow the instructions on screen to complete the setup.
During setup, you’ll be asked to provide the following parameters:
Server
Select the server region that matches your Growatt account location. See the Server regions section below for available options.
Username
Your Growatt account username (typically your email address). Required when using username and password authentication.
Password
Your Growatt account password. Required when using username and password authentication.
API token
Your Growatt API token used for authentication. Required when using API token authentication.
Plant
Select which plant to integrate if you have multiple plants registered in your Growatt account.
The Server parameter offers the following options:
North America : For accounts registered in the United States or Canada. Uses https://openapi-us.growatt.com/
Australia/New Zealand : For accounts registered in Australia or New Zealand. Uses https://openapi-au.growatt.com/
China : For accounts registered in China. Uses https://openapi-cn.growatt.com/
Other regions : Default option to be used for all locations worldwide except those listed above. Uses https://openapi.growatt.com/
SMTEN server : For SMTEN-branded systems. Uses http://server.smten.com/
Era server (Atess Power) : For Atess Power systems. Uses http://ess-server.atesspower.com/
Selecting the correct server region for your account location improves the reliability and performance of data collection.
The integration supports two authentication methods:
Username and password : Use your Growatt account credentials for authentication.
API token : Use an API token for authentication. This is the officially supported method by Growatt and offers better security, more features, and improved stability. Not all inverter models are supported yet—check the Compatibility section below to confirm your inverter is supported.
You can generate an API token using either the web interface or the ShinePhone mobile app.
Generate API token via web interface
Log in to your Growatt account on the Growatt server .
Navigate to Settings > Account Management > API Key .
Select Generate or Retrieve to get your API token.
Copy the token and use it during the integration setup in Home Assistant.
Generate API token via ShinePhone mobile app
Download and install the ShinePhone app from the App Store (iOS) or Google Play Store (Android) .
Log in with your Account Manager username (visitor accounts cannot generate API tokens).
Go to the Me tab.
Select your username.
Select API Token .
Select Reopen to generate a new API token.
Classic API
When using username and password authentication the Growatt integration uses the same API as the ShinePhone app. Hence, if your inverter can be controlled via the ShinePhone app, the Growatt integration can access the same data.
Authentication using API token is currently supported for the following inverters. For the integration to support additional models, they must first be supported by the Growatt Python library .
MIC 600-3300TL-X Series : 600TL-X, 750TL-X, 800TL-X, 1000TL-X, 1500TL-X, 2000TL-X, 3000TL-X, 3300TL-X
MIN 2500-6000TL-X Series : 2500TL-X, 3000TL-X, 3600TL-X, 4200TL-X, 4600TL-X, 5000TL-X, 6000TL-X
MIN 2500-6000TL-XE Series : 2500TL-XE, 3000TL-XE, 3600TL-XE, 4200TL-XE, 4600TL-XE, 5000TL-XE, 6000TL-XE
MIN 2500-6000TL-XH Series : 2500TL-XH, 3600TL-XH, 4200TL-XH, 4600TL-XH, 5000TL-XH, 6000TL-XH
MIN 2500-6000TL-XA Series : 2500TL-XA, 3000TL-XA, 3600TL-XA, 4200TL-XA, 4600TL-XA, 5000TL-XA
MIN 3000-7600TL-XH US Series : 3000TL-XH US, 3800TL-XH US, 5000TL-XH US, 6000TL-XH US, 7600TL-XH US, 8200TL-XH US, 9000TL-XH US, 10000TL-XH US, 11400TL-XH US
MOD 3-10KTL3-XH Series : 3000TL3-XH, 4000TL3-XH, 5000TL3-XH, 6000TL3-XH, 7000TL3-XH, 8000TL3-XH, 9000TL3-XH, 10KTL3-XH
MID 11-30KTL3-XH Series : 11KTL3-XH, 12KTL3-XH, 13KTL3-XH, 15KTL3-XH, 17KTL3-XH, 20KTL3-XH, 25KTL3-XH, 30KTL3-XH
SPH 3000-6000 Series : SPH 3000, SPH 3600, SPH 4000, SPH 4600, SPH 5000, SPH 6000
SPH 3000-6000TL BL-UP Series : SPH 3000 TL3 BL-UP, SPH 3600 TL3 BL-UP, SPH 4000 TL3 BL-UP, SPH 4600 TL3 BL-UP, SPH 5000 TL3 BL-UP, SPH 6000 TL3 BL-UP
SPH 10000TL-X Series : SPH 10000TL-X
SPH 4000-10000TL3 BH Series : SPH 4000TL3 BH, SPH 5000TL3 BH, SPH 6000TL3 BH, SPH 7000TL3 BH, SPH 8000TL3 BH, SPH 10000TL3 BH
SPH 4000-10000TL3 BH-UP Series : SPH 4000TL3 BH-UP, SPH 5000TL3 BH-UP, SPH 6000TL3 BH-UP, SPH 7000TL3 BH-UP, SPH 8000TL3 BH-UP, SPH 10000TL3 BH-UP
SPH 3000-6000TL BL-US Series : SPH 3000TL BL-US, SPH 4000TL BL-US, SPH 5000TL BL-US, SPH 6000TL BL-US
The classic API (username/password authentication) has strict rate limits that can result in your account being locked out for up to 24 hours if these limits are exceeded. To avoid this issue, use one of the following options:
Option 1: Your inverter supports API token : Use token authentication instead, as this uses the official Growatt V1 API that does not have this limitation.
Option 2: Your inverter doesn’t support API token : Avoid all unnecessary integration reloads, as a reload triggers re-login via Growatt classic API.
When using API token authentication, the integration provides additional control entities:
Important
These controls directly modify your inverter’s operational settings. Only change these values if you understand their impact on your system. Incorrect settings may damage your battery, reduce system efficiency, or void your warranty. Use at your own risk.
Charge power
Description : Set the charge power as a percentage (0-100%)
Charge stop SOC
Description : Set the state of charge at which charging should stop (0-100%)
Discharge power
Description : Set the discharge power as a percentage (0-100%)
Discharge stop SOC
Description : Set the state of charge percentage at which discharging should stop (0-100%)
AC charge
Description : Enable or disable AC charging
The integration provides the following actions for managing battery schedules:
Time-of-Use (TOU) schedules for MIN inverters
AC charge and discharge period schedules for SPH inverters
The growatt_server.update_time_segment action configures individual time segments (1-9) with battery operation mode, time range, and enable/disable state for automated battery charging and discharging schedules.
Supported on MIN inverters.
This action modifies your inverter’s TOU scheduling settings. Incorrect configuration may affect your battery’s charging/discharging behavior and energy costs. Ensure you understand your electricity tariff structure before making changes.
Data attributes:
device_id (string, required) : The device ID of the inverter
segment_id (integer, required) : Time segment number (1-9)
batt_mode (string, required) : Energy priority mode for the system:
load_first : Prioritize powering home loads from available energy sources (solar/battery), discharge battery when needed to meet home consumption
battery_first : Prioritize charging the battery from available sources (solar/grid)
grid_first : Prioritize exporting energy to grid from available sources (solar/battery), will discharge battery for grid export
Note
The battery mode controls when and why discharge occurs. The actual discharge rate is controlled by the Discharge power number entity (0-100%).
start_time (time, required) : Start time for the segment (HH:MM format)
end_time (time, required) : End time for the segment (HH:MM format)
enabled (boolean, required) : Whether this time segment is active
The growatt_server.read_time_segments action reads the current configuration of all 9 time segments from an inverter and returns the complete TOU schedule configuration.
device_id (string, required) : The device ID of the MIN inverter
The growatt_server.write_ac_charge_times action writes AC charge settings and up to three configurable charge periods on supported SPH devices.
Supported on SPH inverters.
This action modifies inverter charging behavior. Incorrect settings can affect battery lifespan and charging costs. Make changes only if you understand your battery and tariff setup.
device_id (string, required) : The device ID of the Growatt SPH inverter
charge_power (integer, optional) : Charge power limit percentage (0-100%)
charge_stop_soc (integer, optional) : Stop charging state of charge percentage (0-100%)
mains_enabled (boolean, optional) : Enable AC (mains) charging
period_1_start (time, optional) : Start time for period 1 ( HH:MM or HH:MM:SS )
period_1_end (time, optional) : End time for period 1 ( HH:MM or HH:MM:SS )
period_1_enabled (boolean, optional) : Enable period 1
period_2_start (time, optional) : Start time for period 2 ( HH:MM or HH:MM:SS )
period_2_end (time, optional) : End time for period 2 ( HH:MM or HH:MM:SS )
period_2_enabled (boolean, optional) : Enable period 2
period_3_start (time, optional) : Start time for period 3 ( HH:MM or HH:MM:SS )
period_3_end (time, optional) : End time for period 3 ( HH:MM or HH:MM:SS )
period_3_enabled (boolean, optional) : Enable period 3
You can provide a full payload or only the fields you want to change. Omitted fields keep their current values from the inverter settings.
The growatt_server.write_ac_discharge_times action writes AC discharge settings and up to three configurable discharge periods on supported SPH devices.
This action modifies inverter discharge behavior. Incorrect settings can affect battery lifespan and energy costs. Make changes only if you understand your battery and tariff setup.
discharge_power (integer, optional) : Discharge power limit (0-100)
discharge_stop_soc (integer, optional) : Stop discharging state of charge (0-100)
The growatt_server.read_ac_charge_times action reads AC charge periods from a supported SPH device.
The growatt_server.read_ac_discharge_times action reads AC discharge periods from a supported SPH device.
Charge the battery during cheap electricity hours (e.g., midnight to 6 AM):
action : growatt_server.update_time_segment data : device_id : " YOUR_MIN_DEVICE_ID" segment_id : 1 batt_mode : " battery_first" start_time : " 00:00" end_time : " 06:00" enabled : true
Remember to also set the Charge power number entity (0-100%) to control the charging power rate during this time period.
Export battery power to grid during expensive electricity hours (e.g., 4 PM to 8 PM):
action : growatt_server.update_time_segment data : device_id : " YOUR_MIN_DEVICE_ID" segment_id : 2 batt_mode : " grid_first" start_time : " 16:00" end_time : " 20:00" enabled : true
Remember to also set the Discharge power number entity (0-100%) to control the discharge power rate during this time period.
Prioritize home consumption during typical usage hours (e.g., 6 AM to 10 PM):
action : growatt_server.update_time_segment data : device_id : " YOUR_MIN_DEVICE_ID" segment_id : 3 batt_mode : " load_first" start_time : " 06:00" end_time : " 22:00" enabled : true
Check your current time segment settings:
action : growatt_server.read_time_segments data : device_id : " YOUR_MIN_DEVICE_ID"
Configure charge behavior and two charge periods on an SPH inverter:
action : growatt_server.write_ac_charge_times data : device_id : " YOUR_SPH_DEVICE_ID" charge_power : 100 charge_stop_soc : 95 mains_enabled : true period_1_start : " 00:00" period_1_end : " 06:00" period_1_enabled : true period_2_start : " 12:00" period_2_end : " 14:00" period_2_enabled : false
Read the current discharge periods from an SPH inverter:
action : growatt_server.read_ac_discharge_times data : device_id : " YOUR_SPH_DEVICE_ID"
The Growatt integration polls Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] data from the Growatt cloud every 5 minutes.
If you’re getting a “No plant found” error when using API token authentication, but username/password authentication works correctly, the problem is often related to how the API token was created.
Some people have reported that API tokens generated via the web interface do not work properly, while tokens generated in the ShinePhone mobile app work correctly.
Try the following steps:
Generate a new API token using the ShinePhone mobile app instead of the web interface.
Reconfigure the Growatt integration in Home Assistant to use the new API token. See the Obtaining an API token section above for detailed instructions on generating and using a token via the mobile app.
If you’re experiencing authentication failures or account lockouts:
Accept new terms and conditions : Open the ShinePhone mobile app and log in with your Growatt account. You may need to accept updated terms and conditions before the integration can access your account successfully.
Account locked due to rate limiting : If you’re using username/password authentication and your account has been locked due to rate limiting:
Wait for the lockout period to expire (up to 24 hours).
Consider switching to API token authentication if you have a supported inverter.
Avoid frequent integration reloads, which can trigger rate limits.
Prevent lockouts during Home Assistant restarts :
If you experience frequent lockouts, temporarily disable the integration before restarting Home Assistant.
To disable: Go to Settings > Devices & services , select the Growatt integration, click the three dots menu, and select Disable .
Re-enable after Home Assistant has fully restarted.
To help diagnose issues, enable debug logging:
Add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
logger : logs : homeassistant.components.growatt_server : debug
Restart Home Assistant.
Try to set up or reload the integration.
Check the logs under Settings > System > Logs .
For more information about debug logging, see debug logs and diagnostics .
If you encounter problems with the integration that you cannot resolve using the troubleshooting steps above:
Enable debug logging for the integration.
Reload the integration from Settings > Devices & services , select Growatt , open the three dots menu , then select Reload .
Wait for the issue to occur or try to reproduce it.
Download the logs from Settings > System > Logs .
If possible, also download the diagnostics data for the integration.
Report the issue on GitHub, including:
The debug logs
The diagnostics data
Your inverter model
Screenshots
A clear description of the problem
Steps to reproduce the issue
Providing debug logs will help resolve your issue much faster.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Growatt hub was introduced in Home Assistant 0.99, and it's used by
4168 active installations.
Its IoT class is Cloud Polling.
🥈 Silver quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@johanzander
Categories
Energy
Sensor
Back to top
