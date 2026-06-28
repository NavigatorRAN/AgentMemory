# IFTTT Alarm control panel - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/alarm_control_panel.ifttt
- Final URL: https://www.home-assistant.io/integrations/alarm_control_panel.ifttt
- Canonical URL: https://www.home-assistant.io/integrations/alarm_control_panel.ifttt/
- Fetched at: 2026-06-28T02:27:12Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate IFTTT-controlled security systems into Home Assistant.

## Extracted Text

On this page
Configuration
Required IFTTT applets
Related topics
The IFTTT integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to integrate security systems that have no open API but can be controlled through IFTTT .
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] depends on the IFTTT Home Assistant integration. See the integrations documentation to set it up.
Note
It is important to note that this platform fully relies on IFTTT to receive updates when the security system’s state changes. Therefore, this platform shows an assumed state.
To enable this, add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes.
# Example configuration.yaml entry ifttt : key : YOUR_WEBHOOK_KEY alarm_control_panel : - platform : ifttt name : YOUR_ALARM_NAME code : YOUR_ALARM_CODE event_arm_away : YOUR_ARM_AWAY_EVENT event_arm_home : YOUR_ARM_HOME_EVENT event_arm_night : YOUR_ARM_NIGHT_EVENT event_disarm : YOUR_DISARM_EVENT
Configuration Variables
Looking for your configuration file?
name string ( Optional )
The name of your Home Assistant alarm control panel.
code string ( Optional )
The code for the alarm control panel.
code_arm_required boolean ( Optional , default: true )
If true, the code is required to arm the alarm.
event_arm_away string ( Optional , default: alarm_arm_away )
IFTTT webhook event to call when the state is set to armed away.
event_arm_home string ( Optional , default: alarm_arm_home )
IFTTT webhook event to call when the state is set to armed home.
event_arm_night string ( Optional , default: alarm_arm_night )
IFTTT webhook event to call when the state is set to armed night.
event_disarm string ( Optional , default: alarm_disarm )
IFTTT webhook event to call when the state is set to disarmed.
optimistic boolean ( Optional , default: false )
Specify if the state will be updated by an ifttt.push_alarm_state call (false) or can be set immediately (true).
Warning
It is strongly discouraged to use this platform when you don’t use encryption; otherwise, your API password will be sent unprotected through the IFTTT Webhooks. It is advised to set up encryption using Let’s Encrypt .
Next, you will need to set up the required IFTTT applets as listed below.
This platform supports the alarm_disarm , alarm_arm_away , alarm_arm_home and alarm_arm_night actions. For each of these actions, an IFTTT webhook will be triggered.
For this system to operate correctly, the following IFTTT applets have to be set up. Obviously, if your alarm device does not support some states, no applets have to be provided for those.
IF Webhook event YOUR_DISARM_EVENT is called, THEN disarm the alarm system.
IF Webhook event YOUR_ARM_HOME_EVENT is called, THEN set the alarm system to armed home.
IF Webhook event YOUR_ARM_NIGHT_EVENT is called, THEN set the alarm system to armed away.
IF Webhook event YOUR_DISARM_EVENT is called, THEN set the alarm system to armed night.
IF the alarm system was disarmed, THEN perform a Webhook POST web request to URL https://HASS_URL/api/services/ifttt/push_alarm_state?api_password=API_PASSWORD with content type application/json and body {"entity_id": "alarm_control_panel.DEVICE_NAME", "state": "disarmed"} .
IF the alarm system state changed to armed home, THEN perform a Webhook POST web request to URL https://HASS_URL/api/services/ifttt/push_alarm_state?api_password=API_PASSWORD with content type application/json and body {"entity_id": "alarm_control_panel.DEVICE_NAME", "state": "armed_home"} .
IF the alarm system state changed to armed away, THEN perform a Webhook POST web request to URL https://HASS_URL/api/services/ifttt/push_alarm_state?api_password=API_PASSWORD with content type application/json and body {"entity_id": "alarm_control_panel.DEVICE_NAME", "state": "armed_away"} .
IF the alarm system state changed to armed night, THEN perform a Webhook POST web request to URL https://HASS_URL/api/services/ifttt/push_alarm_state?api_password=API_PASSWORD with content type application/json and body {"entity_id": "alarm_control_panel.DEVICE_NAME", "state": "armed_night"} .
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The IFTTT Alarm control panel integration was introduced in Home Assistant 0.66, and it's used by
1.6% of the active installations.
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Alarm
Back to top
