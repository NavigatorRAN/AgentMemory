# Netatmo - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/netatmo
- Final URL: https://www.home-assistant.io/integrations/netatmo
- Canonical URL: https://www.home-assistant.io/integrations/netatmo/
- Fetched at: 2026-06-28T03:02:38Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Netatmo integration into Home Assistant.

## Extracted Text

On this page
Configuration
Extra configuration of the integration
Binary sensor
Button
Camera
Climate
Cover
Fan
Light
Sensor
Switch
List of actions
Webhook Events
Development / Testing with your own client ID
Troubleshooting
Receiving events
The Netatmo integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] is the main integration to integrate all Netatmo related platforms.
There is currently support for the following device types within Home Assistant:
To add the Netatmo hub to your Home Assistant instance, use this My button:
Netatmo can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Netatmo .
Follow the instructions on screen to complete the setup.
Configuration of Netatmo public weather stations is offered from the front end. Enter the Netatmo integration and press the “CONFIGURE”, then set “Area name” for new area.
In the dialog, it is possible to create, edit and remove public weather sensors. For each area a unique name has to be set along with an area to be covered and whether to display average, maximum or minimum values.
To edit an existing area, enter its name and follow the dialog.
By default, the opening entity device class (e.g. door , window ) shows up as best match to Netatmo configuration. You can manually change its icon (e.g. mdi:cupboard for furniture ) to better match the real appliance when no matching device class in Home Assistant.
The binary sensor platform shows connectivity entities for the Netatmo Smart Home Weather Station .
It also exposes Netatmo Smart Door and Window Sensors as opening binary sensors (open/closed) and provides additional connectivity entity.
The netatmo button sensor platform provides support for moving compatible shutters to a preferred position.
Not all covers support this functionality, and we cannot automatically determine the capability, so these entities are disabled by default.
The netatmo camera platform is consuming the information provided by a Netatmo Smart Indoor , Outdoor and Netatmo Smart Video Doorbell camera. This integration allows you to view the current live stream created by the camera (exception: video doorbell).
The doorbell is currently not supported with the Home Assistant Cloud link mode (configured in the integration). Please use a Netatmo dev account . Note that: if you have already created the Netatmo integration, you must remove it and configure it with the Netatmo dev account as explained in the previous link. Then you will see a Smart Doorbell device with a camera sensor.
The netatmo thermostat platform is consuming the information provided by a Netatmo Smart Thermostat , Smart Modulating Thermostat and Netatmo Smart Radiator Valve . This integration allows you to view the current temperature and control the setpoint.
The netatmo cover platform provides support for Bubendorff shutters.
The netatmo fan plaform provides support for Legrand centralized ventilation control.
The netatmo light platform is consuming information provided by a Netatmo Smart Outdoor camera and requires an active webhook. This integration allows you to turn on/off the flood lights.
It further provides support for Legrand/BTicino dimmers.
The netatmo sensor platform is consuming the information provided by a Netatmo Smart Home Weather Station a
Netatmo Smart Indoor Air Quality Monitor device or Netatmo Public Weather Stations .
The netatmo switch platform provides support for Legrand/BTicino switches and power plugs.
The Netatmo integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Clear temperature setting ( netatmo.clear_temperature_setting )
Clears a manual temperature setting on a Netatmo climate device.
Register webhook ( netatmo.register_webhook )
Manually registers the Netatmo webhook with the Netatmo backend.
Set camera light mode ( netatmo.set_camera_light )
Sets the light mode of a Netatmo Outdoor camera.
Set person away ( netatmo.set_person_away )
Marks a person as away for a Netatmo Indoor camera.
Set persons at home ( netatmo.set_persons_home )
Marks a list of people as at home for a Netatmo Indoor camera.
Set preset mode with end date & time ( netatmo.set_preset_mode_with_end_datetime )
Sets a preset mode for a Netatmo climate device until a chosen date and time.
Set heating schedule ( netatmo.set_schedule )
Activates a heating schedule for a Netatmo climate device.
Set temperature with end date & time ( netatmo.set_temperature_with_end_datetime )
Sets a target temperature for a Netatmo climate device until a chosen date and time.
Set temperature with time period ( netatmo.set_temperature_with_time_period )
Sets a target temperature for a Netatmo climate device for a chosen length of time.
Unregister webhook ( netatmo.unregister_webhook )
Manually unregisters the Netatmo webhook from the Netatmo backend.
For an overview of every action across all integrations, see the actions reference .
The Netatmo backend sends instant events to Home Assistant by using webhooks which unlocks improved responsiveness of most devices with the exception of Netatmo Smart Home Weather Station ,
Netatmo Smart Indoor Air Quality Monitor or Netatmo Public Weather Stations .
Warning
Netatmo webhook events have known issues with Home Assistant Cloud Link.
It is therefore recommended to use an individual development account .
To be able to receive events from Netatmo , your Home Assistant instance needs to be accessible from the web over port 443 . To achieve this you can either use your Nabu Casa account or for example Duck DNS ( Home Assistant instructions ). You also need to have the external URL configured in the Home Assistant configuration .
Events coming in from Netatmo will be available as an event in Home Assistant and are fired as netatmo_event , along with their data. You can use these events to trigger automations.
You can find the available event types at the official Netatmo API documentation .
Example:
# Example automation for webhooks based Netatmo events - alias : " Netatmo event example" description : " Count all events pushed by the Netatmo API" triggers : - trigger : event event_type : netatmo_event actions : - action : counter.increment entity_id : counter.event_counter
# Example automation for Netatmo Welcome - alias : " Motion at home" description : " Motion detected at home" triggers : - trigger : event event_type : netatmo_event event_data : type : movement actions : - action : persistent_notification.create data : message : > {{ trigger.event.data["data"]["message"] }} at {{ trigger.event.data["data"]["home_name"] }} title : " Netatmo event"
# Example automation for Netatmo Presence - alias : " Motion at home" description : " Motion detected at home" triggers : - trigger : event event_type : netatmo_event event_data : type : human # other possible types: animal, vehicle actions : - action : persistent_notification.create data : message : > {{ trigger.event.data["data"]["message"] }} at {{ trigger.event.data["data"]["home_name"] }} title : Netatmo event
# Example automation - alias : " Door or window open or movement" description : " Notifies which door or window is open or was moved" triggers : - trigger : event event_type : netatmo_event event_data : type : tag_open - trigger : event event_type : netatmo_event event_data : type : tag_big_move - trigger : event event_type : netatmo_event event_data : type : tag_small_move actions : - action : persistent_notification.create data : message : > {{ trigger.event.data["data"]["message"] }} title : " Netatmo event"
To enable the Netatmo integration with your own development credentials, you have
to declare a new application in the Netatmo Developer Page .
Sign in using your username and password from your regular Netatmo account.
Important
In your Netatmo Application configuration, do not enter a ‘redirect URI’ or a ‘webhook URI’. The ‘webhook URI’ is automatically registered by this integration based on the external URL configured in the Home Assistant configuration .
See Application Credentials for instructions on how to configure your Client ID and Client Secret , then enable Netatmo through the integrations page.
Menu: Settings > Devices & services .
Click on the + sign to add an integration and click on Netatmo .
After completing the configuration flow, the Netatmo integration will be available.
During the process you have to choose the new Application Credentials name.
To confirm your Home Assistant instance is receiving events via webhooks, you can listen to netatmo_event in Settings > Developer tools > Events .
If the lights show as unavailable the issue usually is that webhook is banned by Netatmo. To solve that unregister the webhook, go to the Netatmo Developer Page to unban your webhook and then register the webhook.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Netatmo hub was introduced in Home Assistant 0.20, and it's used by
4.3% of the active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@cgtobi
Categories
Environment
Hub
Media source
Weather
Back to top
