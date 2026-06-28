# FireServiceRota - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/fireservicerota
- Final URL: https://www.home-assistant.io/integrations/fireservicerota
- Canonical URL: https://www.home-assistant.io/integrations/fireservicerota/
- Fetched at: 2026-06-28T02:42:49Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to configure the FireServiceRota integration for Home Assistant.

## Extracted Text

On this page
Configuration
Entities
Incidents sensor
Duty binary sensor
Incident response switch
Advanced configuration
Example automation
Example dashboard
Screenshot
Debugging
FireServiceRota is a powerful and flexible availability, scheduling and dispatching system for firefighters.
It’s the international brand of the Dutch BrandweerRooster , which is in use by more than 200 fire stations in The Netherlands.
The FireServiceRota integration provides you real-time information about incidents (emergency calls) from your local fire station and the ability to send a response depending on your duty schedule.
You will need a FireServiceRota or BrandweerRooster account.
Caution
A word of caution: Do not solely rely on this integration for your emergency calls!
This integration provides the following platforms:
Sensor: Incoming emergency calls. Metadata contains among other data the location of the incident and a text-to-speech URL. The integration uses a WebSocket client connection with the service to ensure a minimum delay.
Binary sensor: Your current duty status (as scheduled via the FireServiceRota mobile app and/or website).
Switch: Enabled for 30 minutes after an emergency call. ‘on’ represents a confirmed response. Use this to automate your emergency call response and save valuable seconds.
On how to write automations using these platform read the ‘Advanced Configuration’ section below.
To add the FireServiceRota service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select FireServiceRota .
Follow the instructions on screen to complete the setup.
The following entity types are created:
This is the main entity of the integration containing the incident message as its value , it has several attributes which are described below.
Attribute Description trigger Type of trigger, new or update . state The state of the incident. created_at Date and time when incident was created. message_to_speech_url The URL of the mp3 file containing the spoken text of the incident. prio Priority of the incident, a1 , a2 , b1 or b2 . type Type of incident, e.g. incident_alert . responder_mode Modes of response, e.g. available_in_schedule_is_acknowledgment . can_respond_until Date and time until response is accepted. latitude The Latitude of the incident. longitude The Longitude of the incident. address_type Type of address, e.g. home . formatted_address Address in string format. task_ids ID(s) of appliance(s) or task(s).
This entity reflects the duty you have scheduled, the value can be on = on duty, off = no duty. When you have no duty the response switch is disabled which means you cannot respond to a call.
Attribute Description start_time Start date and time of duty schedule. end_time End date and time of duty schedule. available true or false . active true or false . assigned_function_ids Function id’s, e.g. 540 . skill_ids Skill id’s, e.g. 6, 8 . type Type, e.g. standby_duty . assigned function Assigned function, e.g. Chauffeur .
With this switch you can respond to an incident, either by manually controlling the switch via the GUI, or by using an automation action.
It gets reset to unknown value with every incident received. Switching it to on means you send a response acknowledgment, switching it back off sends a response rejected.
The following attributes are available:
Attribute Description user_name Your username. assigned_skill_ids Assigned skill ID’s. responded_at Time you responded. start_time Incident response start time. status Status of response, e.g., pending . reported_status Reported status, e.g., shown_up . arrived_at_station true or false . available_at_incident_creation true or false . active_duty_function_ids Active function ID’s, e.g., 540 .
With Automation you can configure one or more of the following useful actions:
Sound an alarm and/or switch on lights when an emergency incident is received.
Use text-to-speech to play incident details via a media player while getting dressed.
Respond with a response acknowledgment using a door-sensor when leaving the house or by pressing a button to let your teammates know you are underway.
Cast a FireServiceRota dashboard to a Chromecast device. (this requires a Nabu Casa subscription)
These are documented below.
automation : - alias : " Switch on a light when incident is received" triggers : - trigger : state entity_id : sensor.incidents actions : - action : light.turn_on target : entity_id : light.bedroom - alias : " Play TTS incident details when incident is received" triggers : - trigger : state entity_id : sensor.incidents attribute : message_to_speech_url conditions : - condition : not conditions : - condition : state entity_id : sensor.incidents attribute : message_to_speech_url state : None actions : - action : media_player.play_media data : entity_id : media_player.nest_hub_bedroom media_content_id : > {{ state_attr('sensor.incidents','message_to_speech_url') }} media_content_type : " audio/mp4" - alias : " Send response acknowledgement when a button is pressed" triggers : - trigger : state entity_id : switch.response_button actions : - action : homeassistant.turn_on target : entity_id : switch.incident_response - alias : " Cast FireServiceRota dashboard to Nest Hub" triggers : - trigger : homeassistant event : start actions : - action : cast.show_lovelace_view data : entity_id : media_player.nest_hub_bedroom view_path : fsr
panel : true views : - badges : [] cards : - entity : sensor.incidents type : entity - cards : - cards : - default_zoom : 15 entities : - entity : sensor.incidents hours_to_show : 0 type : map type : vertical-stack - cards : - entities : - entity : sensor.incidents hours_to_show : 1 refresh_interval : 0 type : history-graph type : vertical-stack type : horizontal-stack - content : | {{ states('sensor.incidents') }} title : Incident type : markdown - entities : - entity : binary_sensor.duty - entity : switch.incident_response type : entities path : fsr title : FireServiceRota type : horizontal-stack
This screenshot shows what a FireServiceRota dashboard can look like.
The FireServiceRota integration will log additional information about WebSocket incidents received, response and duty status gathered, and other messages when the log level is set to debug . Add the relevant lines below to the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] :
logger : default : info logs : homeassistant.components.fireservicerota : debug pyfireservicerota : debug
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The FireServiceRota service was introduced in Home Assistant 2020.12, and it's used by
59 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@cyberjunky
Categories
Binary sensor
Sensor
Switch
Back to top
