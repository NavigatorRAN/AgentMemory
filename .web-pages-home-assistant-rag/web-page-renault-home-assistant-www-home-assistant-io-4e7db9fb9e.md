# Renault - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/renault
- Final URL: https://www.home-assistant.io/integrations/renault
- Canonical URL: https://www.home-assistant.io/integrations/renault/
- Fetched at: 2026-06-28T03:12:00Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Renault car into Home Assistant.

## Extracted Text

On this page
Configuration
Battery charge limits
Data updates
Actions
Action: Start A/C
Action: Cancel A/C
Action: Set A/C schedules
Action: Start charge
Action: Set charge schedules
Known limitations
Troubleshooting
Removing the integration
To remove an integration instance from Home Assistant
The Renault integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] offers integration with the MyRenault cloud service and provides sensors such as charger state and temperature.
This integration provides the following platforms:
Binary sensors - such as plug and charge status.
Buttons - to start air conditioning, start/stop the charge, flash lights, and sound horn. Although available, these actions do not work on all vehicles.
Device tracker - to track location of your car.
Numbers - to set battery charge limits (minimum and target charge levels for electric vehicles).
Selectors - to change the charge mode.
Sensors - such as battery level, outside temperature, odometer, estimated range, charging rate, and tyre pressure.
To add the Renault hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Renault .
Follow the instructions on screen to complete the setup.
Locale
The country code (e.g., fr_FR , en_GB ) used to connect to the Renault servers. This should match your MyRenault account’s locale setting.
Username
The username used to connect to the Renault servers.
Password
The password used to connect to the Renault servers.
Kamereon account id
The Kamereon account ID that your vehicles are assigned to. If there is only one account available it will be automatically selected.
All vehicles linked to the account should then get added as devices, with sensors added as linked entity.
In some situations, some of the features may require a subscription such as the Pack EV Remote Control and/or the Pack Smart Navigation subscription.
For electric vehicles that support battery state of charge ( SoC ) control, the integration provides two number entities to configure charging limits:
Minimum charge level : Sets the minimum battery charge level (range: 15% to 45% in 5% increments). This ensures the battery maintains at least this charge level.
Target charge level : Sets the target battery charge level (range: 55% to 100% in 5% increments). Charging will stop when the battery reaches this level.
These controls allow you to optimize battery health and charging costs by limiting how much the battery charges. For example, setting a target of 80% can help preserve long-term battery health, while setting a higher minimum level ensures you always have enough charge for daily use.
Note
Battery charge limit controls are only available for electric vehicles that support setting battery charge limits remotely through the MyRenault service. This feature may require an active subscription to services such as Pack EV Remote Control .
Due to rate limitations from the Renault servers, the integration limits polling Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] to 60 data requests/hour.
For a single vehicle with all 7 endpoints available, the integration fetches data from the device every 7 minutes.
The renault.ac_start action starts A/C on a vehicle.
Data attribute Required Description Example vehicle yes device_id of the vehicle temperature yes Target A/C temperature in °C when no Timestamp for the start of the A/C (optional - defaults to now) 2020-05-01T17:45:00
The renault.ac_cancel action cancels A/C on a vehicle.
Data attribute Required Description vehicle yes device_id of the vehicle
The renault.ac_set_schedules action updates A/C schedules on a vehicle.
Data attribute Required Description Example vehicle yes device_id of the vehicle schedules yes Schedule details. Can be a single schedule or a list of schedules see example below
Notes:
schedules can contain one or more schedules which are set within the same call.
The id is compulsory on each schedule (should be 1 to 5, depending on the vehicle).
The activated flag is an optional boolean. If it is not provided, then the existing flag will be kept as is.
The monday to sunday elements are optional. If they are not provided, then the existing settings will be kept for each day. If they are provided as None, then the existing setting will be cleared. If a value is provided, it must contain the key readyAtTime (in UTC format).
Example :
- id : 1 activated : true monday : readyAtTime : ' T12:00Z' - id : 2 activated : false monday : readyAtTime : ' T12:00Z' tuesday : readyAtTime : ' T12:00Z'
The renault.charge_start action starts charging on a vehicle.
Data attribute Required Description Example vehicle yes device_id of the vehicle when no Timestamp for charging to start, defaults to now 2020-05-01T17:45:00
The renault.charge_set_schedules action updates charge schedules on a vehicle.
schedules can contain one or more schedules which are set within the same call
the id is compulsory on each schedule (should be 1 to 5 depending on the vehicle)
the activated flag is an optional boolean. If it is not provided, then the existing flag will be kept as is.
the monday to sunday elements are optional. If they are not provided, then the existing settings will be kept for each day. If they are provided as None, then the existing setting will be cleared. If a value is provided, it must contain the keys startTime (in UTC format) and duration (in minutes).
- id : 1 activated : true monday : startTime : ' T12:00Z' duration : 15 - id : 1 activated : false monday : startTime : ' T12:00Z' duration : 15
Some of the features may require a subscription such as the Pack EV Remote Control and/or the Pack Smart Navigation subscription.
Newer vehicles use new endpoints for some actions, which are not yet supported by the underlying library. The corresponding actions will currently fail with error code err.func.wired.forbidden .
The Renault integration relies on:
A stable internet connection.
Renault server availability (unexpected downtime or scheduled maintenance).
You can quickly verify service status by opening the official Android/iOS app.
In any case, when reporting an issue, please enable debug logging , restart the integration, and as soon as the issue reoccurs, stop the debug logging again ( download of debug log file will start automatically ). Further, if still possible, please also download the diagnostics data. If you have collected the debug log and the diagnostics data, provide them with the issue report.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Renault hub was introduced in Home Assistant 2021.8, and it's used by
3760 active installations.
Its IoT class is Cloud Polling.
🥈 Silver quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@epenet
Categories
Binary sensor
Car
Number
Presence detection
Select
Sensor
Back to top
