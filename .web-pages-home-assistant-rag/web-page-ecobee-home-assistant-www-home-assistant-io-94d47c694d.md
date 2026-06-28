# ecobee - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/ecobee
- Final URL: https://www.home-assistant.io/integrations/ecobee
- Canonical URL: https://www.home-assistant.io/integrations/ecobee/
- Fetched at: 2026-06-28T02:39:00Z
- Content type: text/html; charset=UTF-8

## Description

Instructions for how to integrate ecobee thermostats and sensors within Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Multi-factor authentication (MFA)
Notifications
Thermostat
Concepts
Attributes
Ventilator
Switch
Number
Auxiliary Heat
List of actions
The ecobee integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you control and view sensor data from ecobee thermostats.
Username and password for ecobee.com .
You will need it when adding the integration to set up a connection between the integration and Home Assistant.
Have the devices connected to your ecobee.com account.
You can add devices either before or after you configure the service in Home Assistant, but having them connected to your ecobee.com account ahead of time is recommended to confirm that they are picked up by the service correctly.
Note
Since version 2026.3, it is no longer required to get a developer API key to use this integration. Existing API keys will continue to function. If you revoke your existing key in the ecobee portal, the integration will fail, and you will need to remove the service in Home Assistant and set it up again.
To add the ecobee hub to your Home Assistant instance, use this My button:
ecobee can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select ecobee .
Follow the instructions on screen to complete the setup.
API key
If you have a developer API key, use this field and ignore the others. If you are logging in without an API key, leave this field blank and use username and password.
username
The email address you use to sign in to ecobee.com .
password
The password for the above account.
When signing in with your ecobee username and password, if your ecobee account has multi-factor authentication (MFA) enabled with a time-based one-time password (TOTP) from an authenticator app, Home Assistant will prompt you for the 6-digit code after you submit your credentials. The integration captures a refresh token after the initial login, so subsequent token refreshes happen without prompting you for the code again.
If the refresh token is ever invalidated (for example, after a password change on ecobee.com), Home Assistant will start a reauthentication flow. It will ask you for your password and the MFA code, if your account still has MFA enabled.
Other MFA methods (push, SMS, email) are not currently supported.
The ecobee notify platform allows you to send notifications to an ecobee thermostat. For each thermostat found, a notify entity will be added.
Example action:
action : notify.send_message data : message : " Hello, this is your thermostat." entity_id : notify.ecobee
To use notifications, please see the getting started with automation page .
The ecobee thermostat supports the following key concepts.
The target temperature is the temperature that the device attempts to achieve. The target temperature is either determined by the currently active climate or it may be overridden by a hold. When the
thermostat is not in auto mode, there is a single target temperature. When the thermostat is in auto HVAC mode, there is a pair of target temperatures: the lower target temperature determines the lowest desired temperature, while the higher target temperature determines the highest desired temperature (the thermostat will switch between heating and cooling to keep the temperature within these limits).
A climate is a predefined or user-defined set of presets that the thermostat aims to achieve. The ecobee thermostat provides three predefined climates: Home, Away, and Sleep. Ecobee refers to these as comfort settings . The user can define additional climates.
A preset is an override of the target temperature defined in the currently active climate. The temperature targeted in the preset mode may be explicitly set (temperature preset), it may be derived from a reference climate (such as home, away, or sleep), or it may be derived from a vacation defined by the thermostat. All holds are temporary. Temperature and climate holds expire when the thermostat transitions to the next climate defined in its program. A vacation hold starts at the beginning of the
defined vacation period and expires when the vacation period ends.
When in away preset , the target temperature is permanently overridden by the target temperature defined for the away climate. The away preset is a simple way to emulate a vacation mode.
The HVAC mode of the device is the currently active operational modes that the ecobee thermostat provides: heat, cool, auto, and off.
The target humidity is the humidity set point of the thermostat when a humidifier is connected and in manual control or “On” mode.
On a thermostat configured with auxiliary heat, an aux_heat_only switch will be present. When this switch is turned on, the ecobee thermostat HVAC mode will be changed to “Aux”. However, Home Assistant will reflect that the thermostat is in “heat” mode. Turning off the aux_heat_only switch will change the thermostat back to the last active HVAC mode (heat, auto, etc).
The ecobee climate entity has some extra attributes to represent the state of the thermostat.
Name Description fan If the fan is currently on or off: on / off . climate_mode This is the climate mode that is active, or would be active if no override is active. equipment_running This is a comma-separated list of equipment that is currently running. fan_min_on_time The minimum amount of time (in minutes) that the fan will run per hour. This is determined by the minimum fan runtime setting which can be changed in the ecobee app or on the thermostat itself.
The ecobee thermostat supports the addition of an accessory. If you have an air exchanger (ventilator, HRV, or ERV), you can control it via the minimum time home and minimum time away numbers.
The ventilator 20 min switch is behaving like the switch in the physical ecobee device. When switched on, the ventilator turns on for 20 min. When turned off, it stops the ventilator.
Note: this does not interact with the ventilator min time
Name Description ventilator_min_on_time_home The minimum amount of time (in minutes) that the ventilator will run per hour, when you are home. This is determined by the minimum ventilator runtime setting which can be changed in the ecobee app or on the thermostat itself. ventilator_min_on_time_away The minimum amount of time (in minutes) that the ventilator will run per hour, when you are away. This is determined by the minimum ventilator runtime setting which can be changed in the ecobee app or on the thermostat itself.
When an HVAC system is equipped with a heat pump, a form of auxiliary heat is usually included. This may also be referred to as ‘Emergency Heat’. You can control whether the thermostat requests only auxiliary heat, and adjust the outdoor temperature at which the heat pump compressor will no longer be used, for example, in response to utility costs or solar production in a hybrid system. A hybrid system refers to a system that does not use electricity for the auxiliary heat (such as natural gas or propane). This applies more to air source heat pumps than geothermal.
The Auxiliary heat only switch is provided to disable the use of the compressor (heat pump), only using the auxiliary heater. Be careful with this setting, as it can incur additional utility costs from using a less-efficient heat source.
The Compressor minimum temperature number represents the outdoor temperature at which the compressor (heat pump) will not run. This is represented in the temperature units you have selected in Home Assistant; however, ecobee allows configuration only in increments of 5 degrees Fahrenheit. This is also represented in the thermostat user interface. When the outdoor temperature is below this value, only auxiliary heat will be used. Be careful with this setting, as it can incur additional utility costs from using a less-efficient heat source.
Check your heat pump Owners’ Manual before adjusting this value; do not adjust it below the rated minimum operating temperature of the heat pump. Failure to observe the rated minimum operating temperature can cause damage to the system
The ecobee integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Create vacation ( ecobee.create_vacation )
Creates a vacation on the selected ecobee thermostat.
Delete vacation ( ecobee.delete_vacation )
Deletes a vacation on the selected ecobee thermostat.
Resume program ( ecobee.resume_program )
Resumes the programmed schedule on an ecobee thermostat.
Set daylight savings time mode ( ecobee.set_dst_mode )
Enables or disables automatic daylight savings time on an ecobee thermostat.
Set fan minimum on time ( ecobee.set_fan_min_on_time )
Sets the minimum amount of time the fan runs per hour.
Set mic mode ( ecobee.set_mic_mode )
Enables or disables the Alexa microphone on an ecobee 4 thermostat.
Set occupancy modes ( ecobee.set_occupancy_modes )
Enables or disables Smart Home/Away and Follow Me modes on an ecobee thermostat.
Set sensors used in climate ( ecobee.set_sensors_used_in_climate )
Sets which sensors participate in a climate program on an ecobee thermostat.
For an overview of every action across all integrations, see the actions reference .
In addition to these actions, the standard Climate actions are available for ecobee thermostats.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The ecobee hub was introduced in Home Assistant 0.9, and it's used by
1.4% of the active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Binary sensor
Climate
Humidifier
Sensor
Weather
Back to top
