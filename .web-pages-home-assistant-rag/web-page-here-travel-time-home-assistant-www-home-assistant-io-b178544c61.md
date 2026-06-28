# HERE Travel Time - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/here_travel_time
- Final URL: https://www.home-assistant.io/integrations/here_travel_time
- Canonical URL: https://www.home-assistant.io/integrations/here_travel_time/
- Fetched at: 2026-06-28T02:48:40Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to add HERE travel time to Home Assistant.

## Extracted Text

On this page
Setup
Configuration
Options
Dynamic configuration
Updating sensors on-demand using Automation
Defining a custom polling interval
The HERE Travel Time integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides travel time from the HERE Routing API .
You need to register for an API key by following the instructions in the API Developer Guide .
HERE offers a Base Plan which includes 5000 free transactions per month. If you are not updating sensors on demand , you can track 1 route without exceeding the limit.
More information can be found on the pricing page
To add the HERE Travel Time service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select HERE Travel Time .
Follow the instructions on screen to complete the setup.
Notes:
Origin and Destination can be the address or the GPS coordinates of the location. For a dynamic configuration you can also enter an entity id which provides this information in its state, an entity id with latitude and longitude attributes, or zone friendly name (case sensitive).
To define options for HERE Travel Time, follow these steps:
In Home Assistant, go to Settings > Devices & services .
If multiple instances of HERE Travel Time are configured, choose the instance you want to configure.
On the card, select the cogwheel .
If the card does not have a cogwheel, the integration does not support options for this device.
Edit the options, then select Submit to save the changes.
Tracking can be set up to track entities of type device_tracker , zone , sensor , input_select , input_text and person . If an entity is placed in the origin or destination then each time the platform updates, it will use the latest location of that entity. This means it will directly use its location if possible or try to resolve entity values until it finds a valid set of coordinates. You can put several destinations as options of an input_select and define that as the destination.
# Example entry for configuration.yaml input_select : here_destination_preset : options : - zone.home - zone.office - zone.somewheredefault
device_tracker
If the state is a zone, then the zone location will be used
If the state is not a zone, it will look for the longitude and latitude attributes
person
zone
Uses the longitude and latitude attributes
sensor
If the state is a zone, then will use the zone location
If the state is a name of another entity it will recursively resolve entity states until if finds a valid set of coordinates
input_select
input_text
You can also use the homeassistant.update_entity action to update the sensor on-demand. For example, if you want to update sensor.morning_commute every 2 minutes on weekday mornings, you can use the following automation:
automation : - alias : " Commute - Update morning commute sensor" initial_state : " on" triggers : - trigger : time_pattern minutes : " /2" conditions : - condition : time after : " 08:00:00" before : " 11:00:00" - condition : time weekday : - mon - tue - wed - thu - fri actions : - action : homeassistant.update_entity target : entity_id : sensor.morning_commute
For more detailed steps on how to define a custom polling interval, follow the procedure below.
If you want to define a specific interval at which your device is being polled for data, you can disable the default polling interval and create your own polling automation.
To add the automation:
Go to Settings > Devices & services , and select your integration.
On the integration entry, select the .
Then, select System options and toggle the button to disable polling.
To define your custom polling interval, create an automation.
Go to Settings > Automations & scenes and create a new automation.
Define any trigger and condition you like.
Select Add action , then select Other actions .
Select Perform action , and from the list, select the homeassistant.update_entity action .
Add the entities you want to poll to the Entity field. The homeassistant.update_entity action only supports targeting by entity. Selecting an area, device, or label is not supported.
Save your new automation to poll for data.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The HERE Travel Time service was introduced in Home Assistant 0.100, and it's used by
268 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@eifinger
Categories
Transport
Back to top
