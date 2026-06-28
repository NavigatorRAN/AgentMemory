# Manual MQTT Alarm control panel - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/manual_mqtt
- Final URL: https://www.home-assistant.io/integrations/manual_mqtt
- Canonical URL: https://www.home-assistant.io/integrations/manual_mqtt/
- Fetched at: 2026-06-28T02:58:30Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate manual alarms into Home Assistant with MQTT support.

## Extracted Text

On this page
Configuration
Examples
MQTT control
Related topics
The MQTT integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] extends the manual alarm by adding support for MQTT control of the alarm by a remote device. It can be used to create external keypads which simply change the state of the manual alarm in Home Assistant.
It’s essentially the opposite of the MQTT Alarm Panel which allows Home Assistant to observe an existing, fully-featured alarm where all of the alarm logic is embedded in that physical device.
The integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] will accept the following commands from your Alarm Panel via the command_topic :
DISARM
ARM_HOME
ARM_AWAY
ARM_NIGHT
ARM_VACATION
ARM_CUSTOM_BYPASS
When the state of the manual alarm changes, Home Assistant will publish one of the following states to the state_topic :
‘disarmed’
‘armed_home’
‘armed_away’
‘armed_night’
‘armed_vacation’
‘armed_custom_bypass’
‘pending’
‘triggered’
To use your panel in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry alarm_control_panel : - platform : manual_mqtt state_topic : home/alarm command_topic : home/alarm/set
The following configuration variables from the base manual alarm platform are available:
Configuration Variables
Looking for your configuration file?
name string ( Optional , default: HA Alarm )
The name of the alarm.
code string ( Exclusive )
If defined, specifies a code to enable or disable the alarm in the frontend. This code is not required for MQTT interactions. Only one of code and code_template can be specified.
code_template string ( Exclusive )
If defined, returns a code to enable or disable the alarm in the frontend; an empty string disables checking the code. Inside the template, the variables from_state and to_state identify the current and desired state. Only one of code and code_template can be specified.
code_arm_required boolean ( Optional , default: true )
If true, the code is required to arm the alarm. If false, the code is not validated.
delay_time integer ( Optional , default: 0 )
The time in seconds of delay added to the triggered state’s pending_time before triggering the alarm.
pending_time integer ( Optional , default: 60 )
The time in seconds of the pending time before effecting a state change.
trigger_time integer ( Optional , default: 120 )
The time in seconds of the trigger time in which the alarm is firing.
disarm_after_trigger boolean ( Optional , default: false )
If true, the alarm will automatically disarm after it has been triggered instead of returning to the previous state.
armed_home/armed_away/armed_night/armed_vacation/armed_custom_bypass/disarmed/triggered list ( Optional )
State specific settings
delay_time integer ( Optional )
State specific setting for delay_time (all states except triggered ).
pending_time integer ( Optional )
State specific setting for pending_time (all states except disarmed ).
trigger_time integer ( Optional )
State specific setting for trigger_time (all states except triggered ).
See the documentation for the manual alarm platform for a description.
Additionally, the following MQTT configuration variables are also available.
state_topic string Required
The MQTT topic Home Assistant will publish state updates to.
command_topic string Required
The MQTT topic Home Assistant will subscribe to, to receive commands from a remote device to change the alarm state.
qos integer ( Optional , default: 0 )
The maximum QoS level to be used when receiving and publishing messages.
payload_disarm string ( Optional , default: DISARM )
The payload to disarm this Alarm Panel.
payload_arm_home string ( Optional , default: ARM_HOME )
The payload to set armed-home mode on this Alarm Panel.
payload_arm_away string ( Optional , default: ARM_AWAY )
The payload to set armed-away mode on this Alarm Panel.
payload_arm_night string ( Optional , default: ARM_NIGHT )
The payload to set armed-night mode on this Alarm Panel.
payload_arm_vacation string ( Optional , default: ARM_VACATION )
The payload to set armed-vacation mode on this Alarm Panel.
payload_arm_custom_bypass string ( Optional , default: ARM_CUSTOM_BYPASS )
The payload to set armed-custom bypass mode on this Alarm Panel.
In the configuration example below:
The disarmed state never triggers the alarm
The armed_home state will leave no time to leave the building or disarm the alarm
While other states state will give 30 seconds to leave the building before triggering the alarm, and 20 seconds to disarm the alarm when coming back
Setting pending_time to 0 for triggered state allows the alarm to trigger after previous state’s delay time only. If not set, the alarm will be pending for previous state’s delay_time plus the default pending_time before triggering.
# Example configuration.yaml entry alarm_control_panel : - platform : manual_mqtt state_topic : home/alarm command_topic : home/alarm/set pending_time : 30 delay_time : 20 trigger_time : 4 disarmed : trigger_time : 0 armed_home : pending_time : 0 delay_time : 0 triggered : pending_time : 0
Refer to the Manual Alarm Control page for more real-life examples on how to use this panel.
The state of this alarm can be controlled using MQTT . Ensure you’ve configured that before adding this component.
To change the state of the alarm, publish one of the following messages to the command_topic :
To receive state updates from HA, subscribe to the state_topic . Home Assistant will publish a new message whenever the state changes:
disarmed
armed_home
armed_away
armed_night
armed_vacation
armed_custom_bypass
pending
triggered
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Manual MQTT Alarm control panel integration was introduced in Home Assistant 0.50, and it's used by
166 active installations.
Its IoT class is Local Push.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Alarm
Back to top
