# Tessie - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/tessie
- Final URL: https://www.home-assistant.io/integrations/tessie
- Canonical URL: https://www.home-assistant.io/integrations/tessie/
- Fetched at: 2026-06-28T03:21:44Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Tessie within Home Assistant.

## Extracted Text

On this page
How you can use this integration
Vehicle control
Energy product monitoring and control
Supported devices
Vehicles
Energy products
Prerequisites
Configuration
Data updates
Troubleshooting
Vehicle entities
Binary sensor
Button
Climate
Cover
Device tracker
Lock
Media Player
Number
Select
Sensor
Switch
Update
Energy entities
Energy dashboard
Examples
Precondition vehicle before departure
Start charging during off-peak hours
Stop charging when battery reaches target
Open garage door when arriving home
Notify when charging is complete
Actions return errors
Command signing
Missing scopes or permissions
Data not updating
Known limitations
Diagnostics
Removing the integration
To remove an integration instance from Home Assistant
The Tessie integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] exposes various commands and sensors from the Tesla vehicles and energy products connected to your Tessie subscription.
This integration provides comprehensive control and monitoring of your Tesla vehicles and energy products through Home Assistant:
Monitor battery level, range, charging status, and location
Control climate (heating, cooling, seat heaters, steering wheel heater)
Lock/unlock doors and control windows, trunk, frunk, and charge port
Start/stop charging and set charge limits
Enable Sentry mode, valet mode, and defrost mode
Flash lights, honk horn, and trigger HomeLink
Track vehicle location and navigation destination
Install software updates
Monitor battery power, grid power, solar power, and load consumption
View energy reserves and state of charge
Control backup reserve and operating modes
Manage charging from grid and storm watch settings
Monitor grid services and virtual power plant (VPP) participation
This integration supports all Tesla vehicle models and energy products:
Model 3
Model Y
Model S
Model X
Cybertruck
Powerwall 2/3
Powerwall+
Solar Inverters
You must have an active Tessie subscription, generate a Tessie Access Token and grant Tessie access to your Tesla vehicle by generating a Tesla Virtual Key .
To add the Tessie hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Tessie .
Follow the instructions on screen to complete the setup.
The integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] polls Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] vehicle data every 10 seconds using cached responses from Tessie.
For energy sites, live and site information is refreshed every 30 seconds, and energy history is refreshed every 60 seconds.
Once the integration is set up, all connected Tesla vehicles and energy products will be automatically added to Home Assistant. Note that reconfiguration through the UI is not currently supported. If you need to change your API token or reconnect your account, you will need to remove and re-add the integration.
The integration will create binary sensor entities for a variety of metrics related to your vehicles:
Charge state
Battery charging
Battery heater
Preconditioning enabled
Scheduled charging enabled
Trip charging enabled
Climate state
Auto seat climate left
Auto seat climate right
Auto steering Wheel climate
Overheat protection enabled
Overheat protection running
Vehicle state
Dashcam recording
Front driver window
Front passenger door
Front passenger window
Rear driver door
Rear driver window
Rear passenger door
Rear passenger window
Tire pressure warning front left
Tire pressure warning front right
Tire pressure warning rear left
Tire pressure warning rear right
User present
The integration will create button entities to control various aspects of the vehicle:
Flash lights
HomeLink
Honk horn
Keyless driving
Play fart
Wake
The integration will create a climate entity to control the vehicle’s climate control system. This entity can:
Change the driver’s set temperature
Change to one of the three keep modes: Keep, Dog, and Camp
Turn on and off
The passenger set temperature is shown as a sensor but cannot be changed by Tessie.
The integration will create a cover entity to control various aspects of your vehicles:
Open/Close trunk
Open/Close charge port
Open frunk
Vent/Close windows
Vent/Close sunroof
The integration will create device tracker entities for the vehicle’s current location and navigation destination.
The integration will create lock entities to lock and unlock the vehicle, and to control:
Charge cable
Speed limit
The integration will create media player entities to show what each vehicle is currently playing.
The integration will create number entities to control:
Charge current
Charge limit
The integration will create a select entity to control each of the seat heaters. It allows you to set each seat heater to Off, Low, Medium, or High.
For vehicles equipped with cooled (ventilated) seats, a select entity will also be added to control each cooled seat.
Heated seats:
Front left
Front right
Rear center (if installed)
Rear left (if installed)
Rear right (if installed)
Third row left (if installed)
Third row right (if installed)
Cooled seats:
The integration will create sensor entities for a variety of metrics related to your vehicles:
Battery health state
Battery module temperature max
Battery module temperature min
Battery pack current
Battery pack voltage
Lifetime energy used
Phantom drain
Battery level
Battery range
Battery range estimate (disabled)
Battery range ideal (disabled)
Charge cable (disabled)
Charge energy added
Charge port latch (disabled)
Charge rate
Charger current
Charger power
Charger voltage
Energy remaining
Driver temperature setting
Inside temperature
Outside temperature
Passenger temperature setting
Drive state
Destination
Distance to arrival
Power
Shift state
Speed
State of charge at arrival
Time to arrival
Traffic delay
Odometer
Online
Tire pressure front left
Tire pressure front right
Tire pressure rear left
Tire pressure rear right
The integration will create switch entities to control various aspects of your vehicles:
Charge
Defrost mode
Sentry mode
Steering wheel heater
Valet mode
The integration will show vehicle software updates and their installation progress. Updates can only be installed from Home Assistant after they have finished downloading.
Backup capable
Grid services enabled
Grid services active
Grid status
Storm watch active
Backup reserve
Off grid reserve
Allow export
Operation mode
Battery power
Energy left
Generator power
Grid power
Grid services power
Island status
Load power
Percentage charged
Solar power
Total pack energy
Version
Vehicle
VPP backup reserve
Fault state code
State code
Energy history
Battery charged from generator (disabled)
Battery charged from grid (disabled)
Battery charged from solar (disabled)
Battery discharged (disabled)
Energy consumed from battery (disabled)
Energy consumed from generator (disabled)
Energy consumed from grid (disabled)
Energy consumed from solar (disabled)
Generator exported (disabled)
Grid exported from battery (disabled)
Grid exported from generator (disabled)
Grid exported from solar (disabled)
Grid imported
Grid services exported (disabled)
Grid services imported (disabled)
Solar exported (disabled)
Total battery charged
Total battery discharged
Total grid exported
Total home usage
Total solar generated
Allow charging from grid
Storm watch
The energy history sensors provide cumulative energy values (kWh) that can be used directly on the energy dashboard .
Alternatively, energy flows can be calculated from Battery power and Grid power sensors using a Template Sensor to separate the positive and negative values into positive import and export values.
The Load power , Solar power , and the templated sensors can then use a Riemann Sum to convert their instant power (kW) values into cumulative energy values (kWh),
which then can be used within the energy dashboard.
Here are some common automation examples using the Tessie integration:
This automation preconditions your Tesla 15 minutes before a scheduled departure time:
automation : - alias : " Precondition Tesla before work" triggers : - trigger : time at : " 07:45:00" conditions : - condition : time weekday : - mon - tue - wed - thu - fri actions : - action : climate.turn_on target : entity_id : climate.my_tesla data : temperature : 21
This automation starts charging when electricity rates are lowest:
automation : - alias : " Charge Tesla during off-peak hours" triggers : - trigger : time at : " 23:00:00" conditions : - condition : numeric_state entity_id : sensor.my_tesla_battery_level below : 80 - condition : state entity_id : binary_sensor.my_tesla_battery_charging state : " off" actions : - action : switch.turn_on target : entity_id : switch.my_tesla_charge
This automation stops charging when the desired charge level is reached:
automation : - alias : " Stop Tesla charging at 80%" triggers : - trigger : numeric_state entity_id : sensor.my_tesla_battery_level above : 79 conditions : - condition : state entity_id : binary_sensor.my_tesla_battery_charging state : " on" actions : - action : switch.turn_off target : entity_id : switch.my_tesla_charge
This automation opens your garage door when your Tesla arrives home:
automation : - alias : " Open garage when Tesla arrives" triggers : - trigger : zone entity_id : device_tracker.my_tesla_location zone : zone.home event : enter actions : - action : cover.open_cover target : entity_id : cover.garage_door
This automation sends a notification when your vehicle has finished charging:
automation : - alias : " Notify when Tesla charging complete" triggers : - trigger : state entity_id : binary_sensor.my_tesla_battery_charging from : " on" to : " off" conditions : - condition : numeric_state entity_id : sensor.my_tesla_battery_level above : 79 actions : - action : notify.send_message target : entity_id : notify.my_device data : message : " Tesla charging is complete at {{ states('sensor.my_tesla_battery_level') }}%"
If a vehicle action returns an error in Home Assistant, you should first try to perform the same action in the Tessie app. The app will guide you through the steps to fix common issues like command signing or scopes.
Most Tesla vehicles manufactured in 2021 or later require command signing for security. Command signing ensures that commands sent to your vehicle are cryptographically signed and verified.
To enable command signing:
Open the Tessie app on your mobile device.
Navigate to your vehicle settings.
Follow the prompts to set up a Tesla Virtual Key .
This installs Tessie’s unique encryption fingerprint on your vehicle.
Once configured, all commands from Tessie (including those sent through Home Assistant) will be signed with Tessie’s private key. The vehicle verifies each command before execution, preventing unauthorized access even if your API token is compromised.
Command signing is compatible with:
Model 3 and Model Y (all years)
Model S and Model X (2021 or newer)
Tessie requires specific Tesla account permissions to function properly. If certain features aren’t working, you may need to verify your account has granted the necessary scopes:
Vehicle Information - Required to retrieve vehicle data (such as battery level or climate status)
Vehicle Location - Required to track vehicle location
Vehicle Commands - Required to control the vehicle (such as lock/unlock or climate)
Vehicle Charging Management - Required to control charging
Energy Product Information - Required to retrieve energy product data
Energy Product Commands - Required to control energy products (Powerwall, Solar)
To verify or update permissions:
Log in to your Tessie account
Check your Tesla account connection settings
Re-authenticate if necessary to grant missing permissions
If you’re still experiencing issues, try removing and re-adding the integration in Home Assistant.
If vehicle data is not updating as expected, this may be related to your Tessie field configuration. Certain vehicle fields may not update frequently depending on your subscription tier and field settings. You can adjust these settings in your Tessie account settings .
Energy product data should update regularly without restrictions.
Passenger temperature control : The passenger set temperature is shown as a sensor but cannot be changed through Tessie or Home Assistant. Only the driver’s temperature can be controlled.
Field update frequency : Some vehicle data fields may not update frequently depending on your Tessie subscription tier and field configuration settings.
No reconfiguration : The integration cannot be reconfigured through the UI. To change your API token or settings, you must remove and re-add the integration.
Software updates : Vehicle software updates can only be installed from Home Assistant after they have finished downloading to the vehicle.
The Tessie integration supports diagnostic data collection to help troubleshoot issues. If you’re experiencing problems with the integration, you can download diagnostic information to include when reporting issues.
The diagnostic data contains a complete copy of all API data received from Tessie for your devices. This information can be helpful for developers when investigating issues.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Tessie hub was introduced in Home Assistant 2024.1, and it's used by
1712 active installations.
Its IoT class is Cloud Polling.
🥈 Silver quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@Bre77
Categories
Binary Sensor
Car
Device Tracker
Back to top
