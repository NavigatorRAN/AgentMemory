---
source_url: "https://www.home-assistant.io/integrations/volvo"
final_url: "https://www.home-assistant.io/integrations/volvo"
canonical_url: "https://www.home-assistant.io/integrations/volvo/"
source_handle: "web:www-home-assistant-io:a00d725f1549"
source_section: "integrations-volvo"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "a111e237b672dd388333ee6fceb2b02a46e44b26179ac07c2bcecafd4c89f346"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Volvo - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/volvo
- Final URL: https://www.home-assistant.io/integrations/volvo
- Canonical URL: https://www.home-assistant.io/integrations/volvo/
- Fetched at: 2026-06-28T03:27:20Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on setting up Volvo within Home Assistant.

## Extracted Text

On this page
Use cases
Monitor safety and status of your vehicle
Manage charging and battery
Preheat cabin and battery
Supported vehicles
Prerequisites
Configuration
Supported functionality
All engine types
Battery-only and plug-in hybrid
Fuel-only and plug-in hybrid
Actions
Get image URL
Examples
Notify if doors are left open
Estimated charging finish time
Data updates
Known limitations
Troubleshooting
The charging_power_status entity shows fault as value or is unavailable
API availability
Removing the integration
To remove an integration instance from Home Assistant
Related links
The Volvo integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] is used to integrate your Volvo vehicle.
Keep an eye on doors and windows, and get immediate notifications if something changes. You can create automations that alert you when service is required, or when a door is left open.
Track battery state of charge, estimated electric range, and current charging status. Automate charging to start or stop based on battery level, departure time, or electricity rates, and monitor progress using the integration’s sensors.
Note: This integration does not provide direct control to start or stop charging. To actually start or stop charging, use the integration for your charger.
Preheat or precondition the cabin and battery before a trip to improve comfort and efficiency. Schedule preheating or preconditioning relative to your departure time or trigger it based on the outside temperature.
Car models starting from model year 2010.
Cars located in Europe, Middle East, Africa, US, Canada, and Latin America regions. Or view the full list of countries .
Important
Features available depend on model, year and location.
Head over to Volvo’s developer portal .
Make an account.
Go to the API applications page .
Create an API application and give it a meaningful name.
To avoid hitting request limits, create one API application per vehicle you want to add. Each API application has a maximum number of requests per day. The primary and secondary API keys shown in Volvo’s developer portal both belong to the same API application, and both count toward the same daily limit.
Note
Home Assistant will use account linking provided by Nabu Casa for authenticating with Volvo. This service is provided for free , does not require a Nabu Casa subscription, and is the preferred way of using this integration.
Read the “ Using custom application credentials ”-section if you have the cloud integration disabled.
Using custom application credentials
Custom Volvo application credentials have a limited grant period, which means you’ll need to re-authenticate with Volvo after each period.
The exact timing is mentioned on the developer portal in the Refresh the access token section.
Data updates will stop working once the grant expires until you re-authenticate.
For a better user experience, it’s recommended to use the default Nabu Casa account linking instead.
On Volvo’s API application page, click the Publish button underneath your API application.
Fill in all required fields in the screen that follows. Pay attention to:
Scopes : Make sure to select them all (you need to expand the sections).
Redirect URI(s) : Add https://my.home-assistant.io/redirect/oauth .
Click View summary and confirm .
Grab the client id and client secret from the confirmation page and add them to your application credentials .
For this to work, you’ll need to configure My Home Assistant to let it point to your local Home Assistant instance. Check the FAQ for more information about this feature.
To add the Volvo device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Volvo .
Follow the instructions on screen to complete the setup.
API key
Enter the API key obtained in the prerequisites steps.
VIN
If you have more than one car under this account, then you can select the Vehicle Identification Number of the vehicle you wish to add.
The Volvo integration provides the following entities.
Binary sensors
Brake fluid : Indicates if the brake fluid level is too low.
Brake light center : Warns of a failure in the center brake light.
Brake light left : Warns of a failure in the left brake light.
Brake light right : Warns of a failure in the right brake light.
Coolant level : Indicates if the engine coolant level is too low.
Daytime running light left : Warns of a failure in the left daytime running light.
Daytime running light right : Warns of a failure in the right daytime running light.
Door front left : Detects if the front left door is open or closed.
Door front right : Detects if the front right door is open or closed.
Door rear left : Detects if the rear left door is open or closed.
Door rear right : Detects if the rear right door is open or closed.
Engine status : Shows if the engine is currently running.
Fog light front : Warns of a failure in the front fog light.
Fog light rear : Warns of a failure in the rear fog light.
Hazard lights : Warns of a failure in the hazard lights.
High beam left : Warns of a failure in the left high beam.
High beam right : Warns of a failure in the right high beam.
Hood : Detects if the hood is open or closed.
Low beam left : Warns of a failure in the left low beam.
Low beam right : Warns of a failure in the right low beam.
Oil level : Indicates oil level warnings and service requirements.
Position light front left : Warns of a failure in the front left position light.
Position light front right : Warns of a failure in the front right position light.
Position light rear left : Warns of a failure in the rear left position light.
Position light rear right : Warns of a failure in the rear right position light.
Registration plate light : Warns of a failure in the registration plate light.
Reverse lights : Warns of a failure in the reverse lights.
Service : Indicates if service is required for the vehicle.
Side mark lights : Warns of a failure in the side mark lights.
Sunroof : Detects if the sunroof is open or closed.
Tailgate : Detects if the tailgate is open or closed.
Tank lid : Detects if the tank lid is open or closed.
Tire front left : Indicates pressure warnings for the front left tire.
Tire front right : Indicates pressure warnings for the front right tire.
Tire rear left : Indicates pressure warnings for the rear left tire.
Tire rear right : Indicates pressure warnings for the rear right tire.
Turn indication front left : Warns of a failure in the front left turn indicator.
Turn indication front right : Warns of a failure in the front right turn indicator.
Turn indication rear left : Warns of a failure in the rear left turn indicator.
Turn indication rear right : Warns of a failure in the rear right turn indicator.
Washer fluid : Indicates if the washer fluid level is too low.
Window front left : Detects if the front left window is open or closed.
Window front right : Detects if the front right window is open or closed.
Window rear left : Detects if the rear left window is open or closed.
Window rear right : Detects if the rear right window is open or closed.
Buttons
Start climatization : Starts the climate control system to pre-condition the vehicle’s interior temperature.
Stop climatization : Stops the climate control system.
Flash : Activates the vehicle’s lights to flash briefly.
Honk : Activates the vehicle’s horn for a short duration.
Flash & honk : Combines flashing lights and horn activation.
Lock reduced guard : Locks the vehicle with reduced guard.
The Honk and Flash controls have caused 12 V battery drain issues in the past.
Use them with care!
Device tracker
Go to Volvo’s developer portal to view the availability .
Location : The car’s current location.
Lock
Lock : Locks or unlocks the vehicle, and reports the current lock state of the vehicle.
Sensors
Car connection : Connectivity of the car.
Direction : In which direction the car is heading.
Distance to service : Remaining distance until the next service maintenance.
Odometer : Odometer.
Service : Indicates whether service is due and the reason.
Time to engine service : Remaining engine-hours until the next service maintenance.
Time to service : Remaining time until the next service maintenance.
Trip automatic average speed : Average speed on the automatic trip meter.
Trip automatic distance : Total distance on the automatic trip meter.
Trip manual average speed : Average speed on the manual trip meter.
Trip manual distance : Total distance on the manual trip meter.
Average energy consumption since charge : Average energy consumption since the last charge of the battery.
Battery : Current state of charge of the battery.
Battery capacity : Total capacity of the battery.
Distance to empty battery : Electric range.
Sensors for specific models
Go to Volvo’s developer portal to view the list of supported models .
Charging connection status : Charging connection status.
Charging limit : Charging limit configured in the car.
Charging power : Current charging power.
Charging power status : Indication if power is being provided.
Charging status : Indication if the car is charging or not.
Charging type : AC or DC.
Estimated charging time : Estimated charging time to reach the target battery charge level.
Trip automatic average energy consumption : Average energy consumption on the automatic trip meter.
Target battery charge level : Target battery charge level configured in the car.
Trip manual average energy consumption : Average energy consumption on the manual trip meter.
Start engine : Starts the engine for 15 minutes.
Stop engine : Stops the engine.
Distance to empty tank : Fuel range.
Fuel amount : Remaining fuel.
Trip automatic average fuel consumption : Average fuel consumption on the automatic trip meter.
Trip manual average fuel consumption : Average fuel consumption on the manual trip meter.
The action get_image_url retrieves the URL of your vehicle-specific images.
Get all URLs at once, or select one or more angles.
Entry
The entry ID to retrieve the vehicle images for.
Images
The image angles to retrieve. Leave empty to get all images.
Send a notification to your mobile phone if at least one door is open for 5 minutes.
alias : Notify me if doors are left open for 5 minutes description : " " triggers : - trigger : state entity_id : - binary_sensor.volvo_YOUR_MODEL_door_front_left - binary_sensor.volvo_YOUR_MODEL_door_front_right - binary_sensor.volvo_YOUR_MODEL_door_rear_left - binary_sensor.volvo_YOUR_MODEL_door_rear_right - binary_sensor.volvo_YOUR_MODEL_tailgate to : " on" for : hours : 0 minutes : 5 seconds : 0 conditions : [] actions : - data : data : url : /lovelace/volvo title : 🚘 Volvo message : You've left some doors open. Don't give thiefs a chance! action : notify.mobile_app_phone_john_doe mode : single
The Volvo API only provides an estimated charging time (in minutes). To calculate the finish time, you can create a Template sensor helper with the template below.
{% set charging_time = states('sensor.volvo_YOUR_MODEL_estimated_charging_time') | int(0) %}
{% if charging_time > 0 -%}
{% set new_time = now() + timedelta(minutes=charging_time) %}
{{ new_time }}
{%- else -%}
{{ this.state }}
{%- endif %}
Set the Device class to Timestamp and optionally choose your vehicle for Device .
The Volvo integration fetches data from the API at different intervals:
Every 30 minutes : car connectivity, diagnostics, tyres, and warnings.
Every 15 minutes : brakes, engine warnings, location, and odometer.
Every 2 minutes : energy data, engine status, fuel status, and statistics.
Every minute : doors, lock, and windows status.
If you decide to define a custom polling interval, beware that there is a maximum of 10,000 requests per day.
Every poll operation accounts for about a dozen calls (depends on model).
The official Volvo app has access to a more feature-rich API. As a result, this integration cannot provide live updates, display tire pressure values, start air purifying, schedule climatization, show climatization status, and so on.
Some models will report fault if there is no power from the charger (for example, because the charger was paused) while being connected.
This field is poorly documented in the API, and therefore, we need to learn the possible values along the way. If an unknown value is detected, the entity will become unavailable and a warning will be logged. Please open a ticket - if no one else has - with the value mentioned in the log.
Symptoms
Entities from the Volvo integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] can become unavailable when one or more Volvo API endpoints do not respond properly.
Resolution
The integration will automatically re-enable affected entities once the API becomes available again.
This integration follows standard integration removal.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
After deleting the integration, go to the API applications page on Volvo’s developer portal and delete the app you use for the Home Assistant integration.
Volvo developer portal
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Volvo device was introduced in Home Assistant 2025.8, and it's used by
2459 active installations.
Its IoT class is Cloud Polling.
🏆 Platinum quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@thomasddn
Categories
Binary sensor
Button
Sensor
Back to top
