# Waze Travel Time - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/waze_travel_time
- Final URL: https://www.home-assistant.io/integrations/waze_travel_time
- Canonical URL: https://www.home-assistant.io/integrations/waze_travel_time/
- Fetched at: 2026-06-28T03:27:56Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to add Waze Travel Time to Home Assistant.

## Extracted Text

On this page
Configuration
List of actions
Defining a custom polling interval
Example using dynamic destination
Various configurations that are supported
Using the live map in an iFrame
The Waze Travel Time integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides travel time from the Waze .
To add the Waze Travel Time service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Waze Travel Time .
Follow the instructions on screen to complete the setup.
Notes:
If a unit system is not specified, the integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] will use the unit system configured on your Home Assistant instance.
Origin and Destination can be the address or the GPS coordinates of the location. For coordinates, use the following format: 52.5200, 13.4050 . Make sure the coordinates are separated by a comma. They must not include letters. You can also enter an entity id which provides this information in its state, an entity id with latitude and longitude attributes, or zone friendly name (case sensitive).
The incl_filter / excl_filter allow you to force the integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] to use a particular route or avoid a particular route in its travel time calculation. These inputs must be an exact match to the street name including casing, spaces, and special characters. Use the waze_travel_time.get_travel_times action to get the exact street names for each route.
When using the Avoid Toll Roads? , Avoid Subscription Roads? and Avoid Ferries? options, be aware that Waze will sometimes still route you over toll roads or ferries if a valid vignette/subscription is assumed. Default behavior is that Waze will route you over roads having subscription options. It is therefor best is to set both Avoid Toll Roads? and Avoid Subscription Roads? or Avoid Ferries? if needed and experiment to ensure the desired outcome.
When Origin or Destination is an address, Waze resolves it to coordinates. If the address matches multiple locations, Waze selects the result closest to the base_coordinates . By default, this is your home location.
By default, Waze is polled every five minutes for the travel time. See below for how to poll using custom intervals.
The Waze Travel Time integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Get travel times ( waze_travel_time.get_travel_times )
Retrieves route alternatives and travel times between two locations.
For an overview of every action across all integrations, see the actions reference .
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
Using the flexible option to set a sensor value to the Destination , you can set up a single Waze integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] that will calculate travel time to multiple optional locations on demand.
In the following example, the Input Select is converted into an address which is used to modify the destination for the Waze route calculation from the device_tracker.myphone location. It takes a few minutes for the value to update due to the interval of Waze data fetching.
input_select : destination : name : destination options : - Home - Work - Parents template : - sensor : - name : " Destination address" state : >- {%- if is_state("input_select.destination", "Home") -%} 725 5th Ave, New York, NY 10022, USA {%- elif is_state("input_select.destination", "Work") -%} 767 5th Ave, New York, NY 10153, USA {%- elif is_state("input_select.destination", "Parents") -%} 178 Broadway, Brooklyn, NY 11211, USA {%- else -%} Unknown {%- endif %}
Tracking entity to entity
In this example, we use a device_tracker entity ID as the origin and the sensor created above as the destination.
Name: “Me to some destination”
Origin: device_tracker.myphone
Destination: sensor.dest_address
Region: “US”
Tracking entity to zone friendly name
In this example we are using the entity ID of a zone as the origin and the friendly name of a zone as the destination.
Name: “Home to Eddie’s house”
Origin: zone.home
Destination: “Eddies House”
Tracking entity in imperial units
Name: “Somewhere in New York”
Origin: person.paulus
Destination: “725 5th Ave, New York, NY 10022, USA”
Units: “imperial”
Vehicle Type: “motorcycle”
Avoiding toll, subscription
Name: “Westerscheldetunnel”
Origin: “51.330436, 3.802043”
Destination: “51.445677, 3.749929”
Region: “EU”
Avoid Toll Roads: True
Avoid Subscription Roads: True
If you plan to use Waze’s live map
in a dashboard iframe , then use
https://embed.waze.com/iframe and not the live map URL itself.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Waze Travel Time service was introduced in Home Assistant 0.67, and it's used by
2% of the active installations.
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
