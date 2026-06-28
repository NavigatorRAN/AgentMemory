# Abode - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/abode
- Final URL: https://www.home-assistant.io/integrations/abode
- Canonical URL: https://www.home-assistant.io/integrations/abode/
- Fetched at: 2026-06-28T02:25:41Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on integrating Abode home security with Home Assistant.

## Extracted Text

On this page
Configuration
Events
List of actions
The Abode integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to integrate your Abode Home Security systems into Home Assistant and use its alarm system and sensors to trigger automations.
Please visit the Abode website for further information about Abode Security.
There is currently support for the following device A device is a model representing a physical or logical unit that contains entities. types within Home Assistant:
Alarm control panel : Reports on the current alarm status and can be used to arm and disarm the system.
Binary sensor : Reports on Quick Actions , Door Contacts , Connectivity sensors Sensors return information about a thing, for instance the level of water in a tank. [Learn more] (remotes, keypads, and status indicators), Moisture sensors, and Motion or Occupancy sensors.
Camera : Reports on Camera devices and will download and show the latest captured still image. Can be turned off and on using the camera.turn_off and camera.turn_on actions Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] .
Cover : Reports on Secure Barriers and can be used to open and close the cover.
Lock : Reports on Door Locks and can be used to lock and unlock the door.
Light : Reports on Dimmer lights and can be used to dim or turn the light on and off.
Switch : Reports on Power Switch and Water Valve devices which can be turned on and off. Also reports on Automations set up in the Abode system and allows you to activate or deactivate them.
Sensor : Reports on Temperature , Humidity , and Light sensors.
To add the Abode integration to your Home Assistant instance, use this My button:
Abode can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Abode .
Follow the instructions on screen to complete the setup.
There are several events Every time something happens in Home Assistant, an event is fired. There are different types of events, such as state change events, when an action was triggered, or the time changed. All entities produce state change events. Every time a state changes, a state change event is produced. Events can be used to trigger automations or scripts. For example, you can trigger an automation when a light is turned on, then a speaker turns on in that room. Events can also be used to trigger actions in the frontend. For example, you can trigger an action when a button is pressed. [Learn more] that can be triggered from Abode.
They are grouped into the below events:
abode_alarm : Fired when an alarm event is triggered from Abode. This includes Smoke, CO, Panic, and Burglar alarms.
abode_alarm_end : Fired when an alarm end event is triggered from Abode.
abode_automation : Fired when an Automation is triggered from Abode.
abode_panel_fault : Fired when there is a fault with the Abode hub. This includes events like loss of power, low battery, tamper switches, polling failures, and signal interference.
abode_panel_restore : Fired when the panel fault is restored.
abode_disarm : Fired when the alarm is disarmed.
abode_arm : Fired when the alarm is armed (home or away).
abode_arm_fault : Fired when the alarm is armed (home or away) and has a fault. This includes open door/windows, low battery, backup connection. abode_arm is not fired if a fault is present.
abode_test : Fired when a sensor is in test mode.
abode_capture : Fired when an image is captured.
abode_device : Fired for device changes/additions/deletions.
All events Every time something happens in Home Assistant, an event is fired. There are different types of events, such as state change events, when an action was triggered, or the time changed. All entities produce state change events. Every time a state changes, a state change event is produced. Events can be used to trigger automations or scripts. For example, you can trigger an automation when a light is turned on, then a speaker turns on in that room. Events can also be used to trigger actions in the frontend. For example, you can trigger an action when a button is pressed. [Learn more] have the fields:
Field Description device_id The Abode device ID of the event. device_name The Abode device name of the event. device_type The Abode device type of the event. event_code The event code of the event. event_name The name of the event. event_type The type of the event. event_utc The UTC timestamp of the event. user_name The Abode user that triggered the event, if applicable. app_type The Abode app that triggered the event (e.g., web app, iOS app, etc.). event_by The keypad user that triggered the event. date The date of the event in the format MM/DD/YYYY . time The time of the event in the format HH:MM AM .
There is a unique list of known event_codes are defined in
events.csv
and the inferred groups and their ranges of event codes are defined in
timeline.py .
The Abode integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Capture image ( abode.capture_image )
Requests a new still image from an Abode camera.
Change setting ( abode.change_setting )
Changes a setting on your Abode system.
Trigger automation ( abode.trigger_automation )
Triggers an automation on your Abode system.
For an overview of every action across all integrations, see the actions reference .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Abode integration was introduced in Home Assistant 0.52, and it's used by
921 active installations.
Its IoT class is Cloud Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@shred86
Categories
Alarm
Binary sensor
Camera
Cover
Hub
Light
Lock
Sensor
Switch
Back to top
