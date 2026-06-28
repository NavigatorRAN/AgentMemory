---
source_url: "https://www.home-assistant.io/integrations/sensibo"
final_url: "https://www.home-assistant.io/integrations/sensibo"
canonical_url: "https://www.home-assistant.io/integrations/sensibo/"
source_handle: "web:www-home-assistant-io:c790c149e7f6"
source_section: "integrations-sensibo"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "41cbd488153d730683f5626ce810d589f79101306b425ca95c5fa7dbfe016a6d"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Sensibo - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/sensibo
- Final URL: https://www.home-assistant.io/integrations/sensibo
- Canonical URL: https://www.home-assistant.io/integrations/sensibo/
- Fetched at: 2026-06-28T03:14:30Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Sensibo A/C controller into Home Assistant.

## Extracted Text

On this page
Prerequisites
Supported devices
Configuration
Supported functionality
Sensibo Sky, Air, Air Pro, Pure, Elements and Room sensor
Sensibo Sky, Air, Air Pro, Pure, and Elements
Sensibo Sky, Air, and Air Pro
Sensibo Air, Air Pro, and Elements
Sensibo Elements
Sensibo Pure
Sensibo Room sensor
Actions
Get device mode capabilities
Set full state
Assume state
Enable Pure Boost
Enable timer
Enable Climate React
Examples
Template switch to turn HVAC device on or off
Start the timer for 30 minutes when I get home
Set a full state of the HVAC device at 6pm
Data fetching and limitations
Troubleshooting
Specific log entries
Remove the integration
To remove an integration instance from Home Assistant
The Sensibo integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] integrates Sensibo devices into Home Assistant.
Please click here and register to obtain the API key.
Tip
If you create the API key using a dedicated user (and not your main user),
then in the Sensibo app log you will be able to distinguish between actions
done in the app and actions done by Home Assistant.
The Sensibo integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] supports the following devices and accessories.
Sensibo Sky : Smart AC control device.
Sensibo Air : Smart AC control device.
Sensibo Air Pro : Smart AC control device with air quality monitoring.
Sensibo Pure : Smart air purifier.
Sensibo Elements : Smart air quality monitoring.
Sensibo Room Sensor : Motion sensor and temperature readings (needs to be connected with an Air device).
To add the Sensibo hub to your Home Assistant instance, use this My button:
Sensibo can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Sensibo .
Follow the instructions on screen to complete the setup.
API key
The previously created API key.
Note
Some entities are disabled by default, so you need to enable them to use them.
Depending on device support, some entities might not be available as the device does not support them.
Numbers
Temperature calibration : Calibrate the temperature reading of the device.
Humidity calibration : Calibrate the humidity reading of the device.
Updates
Firmware : Firmware update available.
Binary sensors
Filter clean required : Does the A/C’s filter need cleaning.
Buttons
Reset filter : Reset the filter timer after cleaning.
Climates
[Name of device] : The main climate entity for the device to control HVAC mode.
Selects
Light : Turn the light on/off or dim for the device.
Sensors
Filter last reset : Last reset of the filter cleaning.
Feels like : Feels like temperature.
Timer end time : End time of timer.
Climate React type : Climate React type: Temperature, Feels like, or Humidity.
Climate React low temperature threshold : Low temperature threshold setting for Climate react.
Climate React high temperature threshold : High temperature threshold setting for Climate react.
Switches
Timer : Timer on/off. Enabling the timer, sets it to 10 minutes.
Climate React : Enable/Disable Climate React.
TVOC : TVOC reading from device.
Co2 : Co2 reading from device.
PM2.5 : PM2.5 reading from device.
Ethanol : Ethanol reading from device.
Air quality : Air quality based on readings from device.
Pure Boost linked with AC : Is Pure Boost linked with an A/C device.
Pure Boost linked with presence : Is Pure Boost linked to presence.
Pure Boost linked with indoor air quality : Is Pure Boost linked with indoor air quality.
Pure Boost linked with outdoor air quality : Is Pure Boost linked with outdoor air quality.
Pure AQI : PM2.5 level indicated as ‘Good’, ‘Moderate’, and ‘Bad’.
Pure Boost Sensitivity : Sensitivity for Pure Boost.
Pure Boost : Enable/Disable Pure Boost.
Motion : Is there motion
Connectivity : Is the motion sensor alive and connected
Main sensor : Is the connected motion sensor the main sensor for the connected Air device.
Room occupied : Is there presence in the room of the connected Air device.
As the below custom actions Full state and Climate react both require their inputs to match the API requirements precisely, this custom action will provide the capabilities for the device for a certain HVAC mode to help the users on using those actions properly.
Action configuration:
Target
Select the Sensibo climate entity.
HVAC mode
Select the HVAC mode for which you want to get the capabilities.
Proposed action use:
Go to Settings > Developer tools > YAML .
Switch to the Actions page.
Use the sensibo.get_device_capabilities action.
Select the climate entity as the target.
Select the hvac_mode from the available list.
Select Perform action to retrieve the available options.
Copy the case-sensitive options as needed to other action calls, automations or scripts.
You can send a full state command to Sensibo instead of single commands using the sensibo.full_state action.
All fields are required to be according to Sensibo API specifications and are case-sensitive.
Only provide the fields which are supported by the device.
Target temperature
Provide a target temperature if applicable.
Fan mode
Provide a fan mode if applicable.
Swing mode
Provide a swing mode if applicable.
Horizontal swing mode
Provide a horizontal swing mode if applicable.
Light
Provide a setting for the light if applicable.
Use the Get device mode capabilities action to provide a list of capabilities.
An HVAC device often has a manual remote or other means of control which can put Sensibo out of sync with the HVAC device.
Use the sensibo.assume_state action to tell Sensibo if the HVAC device is currently on or off without sending a control to the actual device.
State
Select if the HVAC device is on or off.
You can configure your Pure Boost settings using the sensibo.enable_pure_boost action.
AC integration and Geo integration needs to be pre-configured via the app before first use.
AC integration
Integrate with an HVAC device.
Geo integration
Integrate with presence.
Indoor air quality
Integrate with indoor air quality.
Outdoor air quality
Integrate with outdoor air quality.
Sensitivity
Set the sensitivity to Normal or Sensitive .
You can enable a timer to turn the HVAC device on or off for a certain time, using the sensibo.enable_timer action that is provided.
Minutes
Number of minutes to turn the device on or off.
You can configure your Climate React settings using the sensibo.enable_climate_react action.
Configuring this action also turns Climate React on.
When using the action, the state needs to be set to precisely what Sensibo API expects. The first time, it’s recommended to use the app to configure it.
Threshold high
When the trigger goes above this value.
State high threshold
The full state to configure above the high threshold.
Threshold low
When the trigger goes below this value.
State low threshold
The full state to configure below the low threshold.
Trigger type
The trigger type ( temperature , feelsLike , or humidity ).
Example full state:
on : true fanLevel : " high" temperatureUnit : " C" targetTemperature : 23 mode : " cool" swing : " fixedBottom" horizontalSwing : " fixedLeft" light : " on"
A simple switch which has heat or off as mode.
switch : - platform : template switches : ac : friendly_name : " AC" value_template : " {{ is_state('climate.ac', 'heat') }}" turn_on : action : climate.set_hvac_mode target : entity_id : climate.ac data : hvac_mode : " heat" turn_off : action : climate.set_hvac_mode target : entity_id : climate.ac data : hvac_mode : " off"
automation : alias : " Example timer" triggers : - trigger : zone entity_id : person.me zone : zone.home event : enter actions : - action : sensibo.enable_timer data : minutes : 30 target : entity_id : climate.hvac_device
automation : alias : " Example full state" triggers : - trigger : time at : " 18:00:00" actions : - action : sensibo.full_state data : mode : " heat" target_temperature : 23 fan_mode : " medium" swing_mode : " fixedMiddleTop" horizontal_swing_mode : " fixedCenter" light : " off" target : entity_id : climate.hvac_device
Data is polled Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] from the Sensibo API once every minute for all devices.
If polling Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] cannot happen because of no connectivity or a malfunctioning API, it will retry a few times before failing.
The user can use the homeassistant.update_entity action to manually try again later, in the case the user has solved the connectivity issue.
This service is reliant on an internet connection and that the Sensibo API is available. Here are the things you can try before raising an issue:
Check that internet is available in your Home Assistant instance.
Check that the Sensibo API is available by accessing the Sensibo API page . If you have previously logged in to Sensibo web, you will get a JSON back with the provided information about your account. If not logged in, the API will respond with login_required .
Use curl in a terminal on your Home Assistant instance using the same URL as previously opened in the browser. curl https://home.sensibo.com/api/v1/users/me
Log entry: Device [name of device] not correctly registered with remote on Sensibo cloud.
When setting up a device the first time, a remote needs to be defined for the device in the Sensibo app, either automatically or manually.
The device will appear in Home Assistant, but won’t be usable as no HVAC modes can be selected.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Sensibo hub was introduced in Home Assistant 0.44, and it's used by
1.1% of the active installations.
Its IoT class is Cloud Polling.
🏆 Platinum quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@andrey-git
@gjohansson-ST
Categories
Binary sensor
Button
Climate
Fan
Number
Select
Sensor
Switch
Update
Back to top
