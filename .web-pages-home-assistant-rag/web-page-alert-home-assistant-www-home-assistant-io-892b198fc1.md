# Alert - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/alert
- Final URL: https://www.home-assistant.io/integrations/alert
- Canonical URL: https://www.home-assistant.io/integrations/alert/
- Fetched at: 2026-06-28T02:27:19Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up automatic alerts within Home Assistant.

## Extracted Text

On this page
Basic example
Complex alert criteria
Dynamic notification delay times
Message templates
Additional parameters for notifiers
Related topics
The Alert integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] is designed to notify you when problematic issues arise.
For example, if the garage door is left open, the alert integration can be used
to remind you of this by sending you repeating notifications at customizable
intervals. This is also used for low battery sensors,
water leak sensors, or any condition that may need your attention.
Alerts will add an entity to the front end.
This entity allows you to silence an alert until it is resolved and has three
possible states:
State Description idle The condition for the alert is false. on The condition for the alert is true. off The condition for the alert is true but it was acknowledged.
The alert integration uses any of the notification integrations. To
set up the alert integration, first, you must set up a notification integration .
Then, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes.
# Example configuration.yaml entry alert : garage_door : name : Garage is open done_message : Garage is closed entity_id : input_boolean.garage_door state : " on" repeat : 30 can_acknowledge : true skip_first : true notifiers : - ryans_phone - kristens_phone
Configuration Variables
Looking for your configuration file?
name string Required
The friendly name of the alert.
entity_id string Required
The ID of the entity to watch.
title template ( Optional )
A title to be used for the notification if the notifier supports it with template support.
state string ( Optional , default: true )
The problem condition for the entity.
repeat integer | list Required
Number of minutes before the notification should be repeated. Can be either a number or a list of numbers.
can_acknowledge boolean ( Optional , default: true )
Control whether the notification can be acknowledged; set to false if the alert should not be acknowledgeable.
skip_first boolean ( Optional , default: false )
Controls whether the notification should be sent immediately or after the first delay.
message template ( Optional )
A message to be sent after an alert transitions from idle to on with template support.
done_message template ( Optional )
A message sent after an alert transitions from on or off to idle with template support. Is only sent if an alert notification was sent for transitioning from idle to on .
notifiers list ( Optional )
List of notification integrations to use for alerts.
data list ( Optional )
Dictionary of extra parameters to send to the notifier.
In this example, the garage door status ( input_boolean.garage_door ) is watched
and this alert will be triggered when its status is equal to on .
This indicates that the door has been opened. Because the skip_first option
was set to true , the first notification will not be delivered immediately.
However, every 30 minutes, a notification will be delivered until either
input_boolean.garage_door no longer has a state of on or until the alert is
acknowledged using the Home Assistant frontend.
For notifiers that require other parameters (such as twilio_sms which requires
you specify a target parameter when sending the notification), you can use the
group notification to wrap them for an alert.
Simply create a group notification type with a single notification member
(such as twilio_sms ) specifying the required parameters other than message
provided by the alert integration:
- platform : group name : john_phone_sms services : - action : twilio_sms data : target : !secret john_phone
alert : freshwater_temp_alert : name : " Warning: I have detected a problem with the freshwater tank temperature" entity_id : binary_sensor.freshwater_temperature_status state : " on" repeat : 5 can_acknowledge : true skip_first : false notifiers : - john_phone_sms
By design, the alert integration only handles very simple criteria for firing.
That is, it only checks if a single entity’s state is equal to a value. At some
point, it may be desirable to have an alert with a more complex criteria.
Possibly, when a battery percentage falls below a threshold. Maybe you want to
disable the alert on certain days. Maybe the alert firing should depend on more
than one input. For all of these situations, it is best to use the alert in
conjunction with a Template Binary Sensor . The following example does that.
template : - binary_sensor : - name : " Motion Battery is Low" state : " {{ state_attr('sensor.motion', 'battery') | float(default=0) < 15 }}" device_class : battery alert : motion_battery : name : Motion Battery is Low entity_id : binary_sensor.motion_battery_is_low repeat : 30 notifiers : - ryans_phone - kristens_phone
This example will begin firing as soon as the entity sensor.motion ’s battery
attribute falls below 15. It will continue to fire until the battery attribute
raises above 15 or the alert is acknowledged on the frontend.
It may be desirable to have the delays between alert notifications dynamically
change as the alert continues to fire. This can be done by setting the repeat
configuration key to a list of numbers rather than a single number.
Altering the first example would look like the following.
# Example configuration.yaml entry alert : garage_door : name : Garage is open entity_id : input_boolean.garage_door state : " on" # Optional, 'on' is the default value repeat : - 15 - 30 - 60 can_acknowledge : true # Optional, default is true skip_first : true # Optional, false is the default notifiers : - ryans_phone - kristens_phone
Now the first message will be sent after a 15 minute delay, the second will be
sent 30 minutes after that, and a 60 minute delay will fall between every
following notification.
For example, if the garage door opens at 2:00, a notification will be
sent at 2:15, 2:45, 3:45, 4:45, and so on, continuing every 60 minutes.
It may be desirable to have the alert notifications include information
about the state of the entity. Templates
can be used in the message or name of the alert to make it more relevant.
The following will show for a plant how to include the problem attribute
of the entity.
# Example configuration.yaml entry alert : office_plant : name : Plant in office needs help entity_id : plant.plant_office state : " problem" repeat : 30 can_acknowledge : true skip_first : true message : " Plant {{ states.plant.plant_office }} needs help ({{ state_attr('plant.plant_office', 'problem') }})" done_message : Plant in office is fine notifiers : - ryans_phone - kristens_phone
The resulting message could be Plant Officeplant needs help (moisture low) .
Some notifiers support more parameters (e.g., to set text color or action
buttons). These can be supplied via the data parameter:
# Example configuration.yaml entry alert : garage_door : name : " Garage is open" message : " The garage door is still open" done_message : " The garage door is closed" entity_id : input_boolean.garage_door state : " on" # Optional, 'on' is the default value repeat : - 15 - 30 - 60 can_acknowledge : true # Optional, default is true skip_first : true # Optional, false is the default data : inline_keyboard : - ' Close garage:/close_garage, Acknowledge:/garage_acknowledge' notifiers : - frank_telegram
This particular example relies on the inline_keyboard functionality of
Telegram, where the user is presented with buttons to execute certain actions.
Based on the example above you can make an automation to stop further messages,
but you will still receive the done message.
- alias : " Telegram callback to stop alerts for garage door" triggers : - trigger : event event_type : telegram_callback event_data : data : " /garage_acknowledge" actions : - action : alert.turn_off target : entity_id : alert.garage_door
Notifications sent to Home Assistant Companion apps support replacing and clearing notifications. To use these functions with alerts, set a tag in the message data, send clear_notification as the done_message , and use mobile_app_* as the notifier:
alert : garage_door : name : Garage is open done_message : clear_notification entity_id : input_boolean.garage_door state : " on" repeat : 30 can_acknowledge : true skip_first : true notifiers : - mobile_app_ryan - mobile_app_kristen data : tag : garage-door
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Alert integration was introduced in Home Assistant 0.38, and it's used by
2899 active installations.
Its IoT class is Local Push.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Categories
Automation
Back to top
