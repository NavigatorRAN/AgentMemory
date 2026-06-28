# SimpliSafe - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/simplisafe
- Final URL: https://www.home-assistant.io/integrations/simplisafe
- Canonical URL: https://www.home-assistant.io/integrations/simplisafe/
- Fetched at: 2026-06-28T03:16:06Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate SimpliSafe into Home Assistant.

## Extracted Text

On this page
SimpliSafe Plans
Configuration
Getting an Authorization Code
List of actions
Events
SIMPLISAFE_EVENT
Using secret alerts for sensor changes
SIMPLISAFE_NOTIFICATION
The SimpliSafe integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] integrates SimpliSafe home security (V2 and V3) systems into Home Assistant. Multiple SimpliSafe accounts can be accommodated.
There is currently support for the following device types within Home Assistant:
Alarm control panel : reports on the current alarm status and can be used to arm and disarm the system.
CO detector : reports on the carbon monoxide sensor status*.
Entry sensor : reports on the current entry sensor status*.
Freeze sensor : reports on the freeze sensor temperature*.
Glass Break Sensor : reports on the glass breakage sensor status*.
Lock : reports on Door Locks and can be used to lock and unlock a lock.
Motion Sensor : reports on motion detected*.
Siren : reports on the siren status*.
Smoke Detector : reports on the smoke sensor status*.
Smoke+CO Detector : reports on the smoke and carbon monoxide sensor status*.
Water Sensor : reports on water sensor status*.
Sensor status is only available for SimpliSafe V3 systems and is updated once every 30 seconds, so information displayed in Home Assistant may be delayed.
SimpliSafe offers several monitoring plans . All plans (including the free plan) should work with this integration.
To add the SimpliSafe hub to your Home Assistant instance, use this My button:
SimpliSafe can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select SimpliSafe .
Follow the instructions on screen to complete the setup.
Important
You must have multi-factor authentication (MFA) enabled on your SimpliSafe account for the below instructions to work. Without MFA enabled, you will never receive the correct authorization code!
SimpliSafe authenticates users via its web app. Due to technical limitations, there is a manual step when adding the integration. For in-depth guidance, refer to step 6 of the simplisafe-python documentation on authentication .
The SimpliSafe integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Remove PIN ( simplisafe.remove_pin )
Removes a SimpliSafe PIN by its label or value.
Set PIN ( simplisafe.set_pin )
Sets or updates a SimpliSafe PIN.
Set system properties ( simplisafe.set_system_properties )
Sets one or more properties on a SimpliSafe system.
For an overview of every action across all integrations, see the actions reference .
SIMPLISAFE_EVENT events represent events that appear on the timeline of the SimpliSafe
web and mobile apps. When received, they come with event data that contains the
following keys:
last_event_changed_by : the PIN that triggered the event (if appropriate)
last_event_type : the type of event
last_event_info : a human-friendly string describing the event in more detail
last_event_sensor_name : the sensor that triggered the event (if appropriate)
last_event_sensor_serial : the serial number of the sensor that triggered the event (if appropriate)
last_event_sensor_type : the type of sensor that triggered the event (if appropriate)
system_id : the system ID to which the event belongs
last_event_timestamp : the UTC datetime at which the event was received
For example, when someone rings the doorbell, a
SIMPLISAFE_EVENT event will fire with the following event data:
{ " event_type " : " SIMPLISAFE_EVENT " , " data " : { " last_event_changed_by " : "" , " last_event_type " : " doorbell_detected " , " last_event_info " : " Someone is at your \" Front Door \" " , " last_event_sensor_name " : " Front Door " , " last_event_sensor_serial " : "" , " last_event_sensor_type " : " doorbell " , " system_id " : [ systemid ], " last_event_timestamp " : " 2021-01-28T22:01:32+00:00 " }, " origin " : " LOCAL " , " time_fired " : " 2021-01-28T22:01:37.478539+00:00 " , " context " : { " id " : " [id] " , " parent_id " : null , " user_id " : null } }
last_event_type can have the following values:
automatic_test
camera_motion_detected
doorbell_detected
device_test
secret_alert_triggered
sensor_paired_and_named
user_initiated_test
To build an automation using one of these, use SIMPLISAFE_EVENT
as an event trigger, with last_event_type as the event_data .
For example, the following will trigger when the doorbell rings:
triggers : - trigger : event event_type : SIMPLISAFE_EVENT event_data : last_event_type : doorbell_detected
For cases where the default polling Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] interval of 30 seconds is too long for automations, you can use secret alerts to get push notifications of a sensor being triggered.
Home Assistant will automatically set the status to triggered for binary sensor devices that have secret alerts. However, due to the way Simplisafe implements secret alerts, you can only receive push notifications when a device is triggered, not when they are cleared. Clearing a binary sensor can only be accomplished by polling.
For cases where you wish to reliably determine each time a binary sensor is triggered, do the following:
Enable the secret alert for the device in the Simplisafe App.
Make a note of the serial number of the device.
You can see it in the top-left corner of the page where you set the alert.
Use the following event trigger:
triggers : - trigger : event event_type : SIMPLISAFE_EVENT event_data : last_event_type : secret_alert_triggered last_event_sensor_serial : " abc123xyz" # Replace with your device's serial number (use lowercase letters)
SIMPLISAFE_NOTIFICATION events represent system notifications that would appear in the
messages section of the SimpliSafe web and mobile apps. When received, they come with
event data that contains the following keys:
category : The notification category (e.g., error )
code : The SimpliSafe code for the notification
message : The actual text of the notification
timestamp : The UTC timestamp of the notification
Note that when Home Assistant restarts, SIMPLISAFE_NOTIFICATION events will fire once
again for any notifications still active in the SimpliSafe web and mobile apps. To
prevent this, either (a) clear them in the web/mobile app or (b) use the
clear_notifications button provided by the alarm control panel.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The SimpliSafe hub was introduced in Home Assistant 0.81, and it's used by
1529 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@bachya
Categories
Alarm
Button
Lock
Back to top
