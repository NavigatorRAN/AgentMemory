# Input Datetime - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/input_datetime
- Final URL: https://www.home-assistant.io/integrations/input_datetime
- Canonical URL: https://www.home-assistant.io/integrations/input_datetime/
- Fetched at: 2026-06-28T02:52:21Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate the Input Datetime integration into Home Assistant.

## Extracted Text

On this page
Attributes
Restore state
List of actions
Examples
The Input Datetime integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to define date and time values
that can be controlled via the frontend and can be used within automations and
templates.
The preferred way to configure input datetime is via the user interface at Settings > Devices & services > Helpers . Click the add button and then choose the Date and/or time option.
To be able to add Helpers via the user interface you should have default_config: in your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] , it should already be there by default unless you removed it.
If you removed default_config: from your configuration, you must add input_datetime: to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] first, then you can use the UI.
input_datetime can also be configured via YAML. To add three datetime inputs to your installation,
one with both date and time, and one with date or time each,
add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] :
# Example configuration.yaml entry input_datetime : both_date_and_time : name : Input with both date and time has_date : true has_time : true only_date : name : Input with only date has_date : true has_time : false only_time : name : Input with only time has_date : false has_time : true
Configuration Variables
Looking for your configuration file?
input_datetime map Required
Alias for the datetime input. Multiple entries are allowed.
name string ( Optional )
Friendly name of the datetime input.
has_time boolean ( Optional , default: false )
Set to true if the input should have a time. At least one of has_time or has_date must be defined.
has_date boolean ( Optional , default: false )
Set to true if the input should have a date. At least one of has_time or has_date must be defined.
icon icon ( Optional )
Icon to display in front of the input element in the frontend.
initial datetime | time | date ( Optional )
Set the initial value of this input, depending on has_time and has_date .
Default:
00:00 | 00:00 |
A datetime input entity’s state exports several attributes that can be useful in
automations and templates.
Attribute Description has_time true if this entity has a time. has_date true if this entity has a date. year
month
day The year, month and day of the date.
(only available if has_date: true ) timestamp A timestamp representing the time held in the input.
(only available if has_time: true )
If you set a valid value for initial , this integration will start with the state set to that value. Otherwise, it will restore the state it had before Home Assistant stopping.
The Input Datetime integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Reload input datetimes ( input_datetime.reload )
Reloads the input datetime helpers from the YAML configuration.
Set input datetime value ( input_datetime.set_datetime )
Sets the date and/or time of an input datetime.
For an overview of every action across all integrations, see the actions reference .
The following example shows the usage of the input_datetime as a trigger in an
automation:
# Example configuration.yaml entry # Turns on bedroom light at the time specified. automation : triggers : - trigger : time at : input_datetime.bedroom_alarm_clock_time actions : - action : light.turn_on target : entity_id : light.bedroom
To dynamically set the input_datetime you can call
input_datetime.set_datetime . The values for date , time and/or datetime must be in a certain format for the call to be successful. See the Set input datetime value action for the expected formats.
If you have a datetime object, you can use its timestamp method. Or, if you have a timestamp, you can just use it directly.
# Sets time to 05:30:00 - action : input_datetime.set_datetime target : entity_id : input_datetime.XXX data : time : " 05:30:00" # Sets time to time from datetime object - action : input_datetime.set_datetime target : entity_id : input_datetime.XXX data : time : " {{ now().strftime('%H:%M:%S') }}" # Sets date to 2020-08-24 - action : input_datetime.set_datetime target : entity_id : input_datetime.XXX data : date : " 2020-08-24" # Sets date to date from datetime object - action : input_datetime.set_datetime target : entity_id : input_datetime.XXX data : date : " {{ now().strftime('%Y-%m-%d') }}" # Sets date and time to 2020-08-25 05:30:00 - action : input_datetime.set_datetime target : entity_id : input_datetime.XXX data : datetime : " 2020-08-25 05:30:00" # Sets date and time from datetime object - action : input_datetime.set_datetime target : entity_id : input_datetime.XXX data : datetime : " {{ now().strftime('%Y-%m-%d %H:%M:%S') }}" # Sets date and/or time from UNIX timestamp # This can be used whether the input_datetime has just a date, # or just a time, or has both - action : input_datetime.set_datetime target : entity_id : input_datetime.XXX data : timestamp : " {{ now().timestamp() }}"
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Input Datetime helper was introduced in Home Assistant 0.55, and it's used by
16% of the active installations.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Categories
Automation
Helper
Back to top
