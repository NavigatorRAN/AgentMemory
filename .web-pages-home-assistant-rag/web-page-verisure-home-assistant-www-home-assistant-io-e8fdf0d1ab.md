# Verisure - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/verisure
- Final URL: https://www.home-assistant.io/integrations/verisure
- Canonical URL: https://www.home-assistant.io/integrations/verisure/
- Fetched at: 2026-06-28T03:26:24Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up Verisure devices within Home Assistant.

## Extracted Text

On this page
Configuration
Options
Alarm control panel
List of actions
Binary sensor
Lock
Limitations and known issues
Troubleshooting
Home Assistant has support to integrate your Verisure devices.
There is currently support for the following device types within Home Assistant:
Alarm
Camera
Switch (Smartplug)
Sensor (Thermometers and Hygrometers)
Binary sensor (Door & Window)
To add the Verisure hub to your Home Assistant instance, use this My button:
Verisure can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Verisure .
Follow the instructions on screen to complete the setup.
To define options for Verisure, follow these steps:
In Home Assistant, go to Settings > Devices & services .
If multiple instances of Verisure are configured, choose the instance you want to configure.
On the card, select the cogwheel .
If the card does not have a cogwheel, the integration does not support options for this device.
Edit the options, then select Submit to save the changes.
The Verisure alarm control panel platform allows you to control your Verisure Alarms.
The requirement is that you have set up your Verisure hub first, with the instruction above.
The changed_by attribute enables one to be able to take different actions depending on who armed/disarmed the alarm in automation .
automation : - alias : " Alarm status changed" triggers : - trigger : state entity_id : alarm_control_panel.alarm_1 actions : - action : notify.notify data : message : > Alarm changed from {{ trigger.from_state.state }} to {{ trigger.to_state.state }} by {{ trigger.to_state.attributes.changed_by }}
The Verisure integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Capture SmartCam image ( verisure.capture_smartcam )
Captures a new image from a Verisure SmartCam.
Disable autolock ( verisure.disable_autolock )
Disables autolock on a Verisure Lockguard Smartlock.
Enable autolock ( verisure.enable_autolock )
Enables autolock on a Verisure Lockguard Smartlock.
For an overview of every action across all integrations, see the actions reference .
Ethernet status
method state attribute Description thumb Lock was locked/unlocked by interior thumb switch star Lock was locked by exterior star button code Lock was unlocked by exterior code auto Lock was locked/unlocked automatically by Verisure rule remote Lock was locked/unlocked automatically by Verisure App
Some users have reported that this integration currently doesn’t work in the following countries:
France
Ireland
Italy
Spain
If you get an error message stating something like “The code for lock.XXX doesn’t match pattern ^\d{0}$ .” , make sure the number of digits for your code matches the number defined in the configuration options .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Verisure hub was introduced in Home Assistant pre 0.7, and it's used by
2330 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Hub
Sensor
Switch
Back to top
