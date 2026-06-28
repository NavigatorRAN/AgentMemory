---
source_url: "https://www.home-assistant.io/integrations/lg_thinq"
final_url: "https://www.home-assistant.io/integrations/lg_thinq"
canonical_url: "https://www.home-assistant.io/integrations/lg_thinq/"
source_handle: "web:www-home-assistant-io:fbfd0f1de5a4"
source_section: "integrations-lg-thinq"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "8bc0fbb04e83f6841231b0f699abb6fe3f7c808389b9b4aeef7491a4e1b49129"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# LG ThinQ - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/lg_thinq
- Final URL: https://www.home-assistant.io/integrations/lg_thinq
- Canonical URL: https://www.home-assistant.io/integrations/lg_thinq/
- Fetched at: 2026-06-28T02:56:15Z
- Content type: text/html; charset=UTF-8

## Description

Setup for LG ThinQ Integration.

## Extracted Text

On this page
Prerequisites
Personal Access Token (PAT)
Configuration
Supported Devices
Appliance
Data updates
Energy consumption
Platforms
Binary sensor
Button
Climate
Event
Fan
Humidifier
Number
Select
Switch
Vacuum
Water heater
Sensor
Automation example
Notification, error event
Troubleshooting
Setup
Debugging / Issue report
The LG ThinQ integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to connect LG ThinQ devices to Home Assistant. The features of this integration include:
Control LG appliances as Home Assistant entities through the LG ThinQ Connect API.
This feature works via LG ThinQ cloud. Therefore, an internet connection is required.
A personal access token to use the LG ThinQ Connect API.
Access the personal access token page (requires an LG ThinQ account).
Select ADD NEW TOKEN .
Enter a new token name and select the following authorized scopes:
Permission to view all devices
Permission to view all device statuses
All device control rights
All device event subscription rights
All device push notification permissions
Permission to inquiry device energy consumption
Select CREATE TOKEN .
Once all the steps are completed, you will see that a PAT has been generated.
To add the LG ThinQ hub to your Home Assistant instance, use this My button:
LG ThinQ can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select LG ThinQ .
Follow the instructions on screen to complete the setup.
Enter the information to use LG ThinQ Connect API:
The Token Value obtained through the PAT issuance process. (Required)
The entry name.
Choose the region (country).
Support LG Appliances as follows:
Air Conditioner
Air Purifier
Air Purifier Fan
Ceiling Fan
Cooktop
Dehumidifier
Dishwasher
Dryer
Home Brew
Hood
Kimchi Refrigerator
Microwave Oven
Oven
Plant Cultivator
Refrigerator
Robot Cleaner
Stick Cleaner
Styler
System Boiler
Washcombo Main
Washcombo Mini
Washer
Washtower
Washtower Dryer
Washtower Washer
Water Heater
Water Purifier
Wine Cellar
Ventilator
Status: Events are sent when the device’s status is changed.
Status(legacy old model): Events are sent every 5 minutes because device status changes cannot be aggregated in real time.
Energy consumption: Aggregated usage data up to yesterday is updated every morning.
Support historical energy consumption sensors for individual devices
Energy last month (Wh): Energy usage last month.
Energy this month (Wh): Energy usage this month.
Energy yesterday (Wh): Energy usage yesterday.
LG ThinQ represents devices as a set of properties. And these are mapped to entities in Home Assistant.
A list of all Entity Platforms provided by LG ThinQ Integration:
A read-only property which has only two states that can be toggled is represented as a binary sensor platform.
Device Property Cooktop Remote start Dish Washer Chime sound
Clean indicator light
Door
Machine clean reminder
Remote start
Rinse refill needed Hood Power Oven Remote start Refrigerator Door
Eco friendly
Power saving mode
Sabbath Kimchi Refrigerator Fresh air filter Dryer
Washtower Washer Remote start Water Heater Power Wine Cellar Sabbath
A writable property which has only two states that can be toggled is represented as a binary sensor platform.
Device Property Action Dish Washer Operation Start / Pause Dryer
Washtower Washer Operation Start / Pause
The properties for controlling both the temperature and wind strength of the appliance are represented as a climate platform.
Device Property Air Conditioner Current temperature
Fan mode
Swing mode
Swing horizontal mode
HVAC mode
Preset mode
Temperature
Temperature cool
Temperature heat
Unit System Boiler Current temperature
Unit
A notification message pushed from the server is represented as an event platform. The Notification codes shows the full support range, and you can check the range of your device through the developer tools.
Device Property Notification codes Air Conditioner Notification water_is_full Air Purifier Notification lack_of_water, time_to_clean_filter, pollution_is_high, time_to_change_filter Air Purifier Fan Notification time_to_change_filter Dehumidifier Notification water_is_full Dish Washer Error
Notification cleaning_is_complete, error_during_cleaning, water_leak_has_occurred, rinse_is_not_enough, salt_refill_is_needed Humidifier Notification time_to_change_filter, lack_of_water Kimchi Refrigerator Notification door_is_open Microwave Oven Notification none Oven Notification preheating_is_complete, cooking_is_complete, time_to_clean, error_has_occurred Refrigerator Notification time_to_change_filter, time_to_change_water_filter, frozen_is_complete, door_is_open Robot Cleaner Error
Notification - Stick Cleaner Notification charging_is_complete, time_to_clean_filter Washer
Washtower Washer Error
Notification washing_is_complete, error_during_washing, drying_is_complete, drying_failed Styler Error
Notification styling_is_complete, error_has_occurred Wine Cellar Notification door_is_open
The properties for controlling the wind strength of the appliance are represented as a fan platform.
Device Property Ceiling Fan Power
Speed
The properties for controlling the target humidity of the appliance are represented as a humidifier platform.
Device Property Dehumidifier Power
Mode
Target humidity Humidifier Power
Target humidity
A read-write property which has a numeric value is represented as a number platform.
Device Property Air Conditioner Schedule turn-off
Schedule turn-on
Sleep timer Air Purifier Fan Sleep timer
Wind temperature Hood Fan
Light Humidifier Sleep timer
Target humidity Microwave Oven Fan
Light Oven Temperature Refrigerator Temperature Dryer
Washtower Washer Delayed start/end Water Heater Temperature Wine Cellar Light
Temperature Ventilator Sleep timer
A writable property which has a list of selectable values is represented as a select platform.
Device Property Air Conditioner Air purify
Air quality sensor Air Purifier Operating mode
Speed Air Purifier Fan Display brightness
Operating mode
Rotation
Speed Dehumidifier Speed
Operation Dish Washer Operation Humidifier Display brightness
Drying mode
Speed Oven Cook mode
Operation Refrigerator Fresh air filter Dryer
Washtower Washer Operation Water Heater Operating mode Wine Cellar Light
Operating mode Ventilator Speed
A read-write property which has only two states that can be toggled is represented as a switch platform.
Device Property Air Conditioner Power
Lighting
Energy saving
Air clean Air Purifier Power Air Purifier Fan Heating
Power
UVnano Dehumidifier Power Dish Washer Power Dryer
Washtower Washer Power Humidifier Auto mode
Heating
Mood light
Sleep mode Refrigerator Express mode
Express cool
Quick freeze System Boiler Power
Hot water Wine Cellar Ventilation Ventilator Power
The properties for controlling the clean operations of the appliance are represented as a vacuum platform.
Device Property Robot Cleaner Battery
Current status
Operation
The properties for controlling the operating mode and temperature are represented as a water_heater platform.
Device Property Water heater Mode
Current temperature
A read-only property which has states is represented as a sensor platform.
Device Property Air Conditioner Filter remaining
Humidity
Odor
Overall air quality
PM1
PM10
PM2.5
Schedule turn-off
Sleep timer Air Purifier Humidity
Personal mode
Filter remaining
Schedule turn-on Air Purifier Fan Humidity
Sleep timer
Schedule turn-on Cooktop Current status
Power level
Remaining time Dehumidifier Humidity
Operating mode Dish Washer Current cycle
Rinse aid dispenser level
Softening level
Delayed start
Remaining time
Total time Home Brew Brewing duration
Brewing period
First flavor
Second flavor
Homebrew recipe
First hop
Second hop
Recipe progress
Wort
Yeast Humidifier Humidity
Temperature Kimchi Refrigerator Fresh air filter
Temperature Microwave Oven Current status Oven Current status
Temperature Plant Cultivator Current status
Day growth temperature
Lighting duration
Lighting intensity
Lights on time
Night growth temperature
Wind speed Refrigerator Fresh air filter
Water filter used Robot Cleaner Current status
Running time Stick Cleaner Battery
Operating mode System Boiler Indoor temperature
Inlet temperature
Outlet temperature Water Purifier High-temp sterilization
Type
UVnano Dryer
Washtower Washer Current status
Delayed start/end
Total time
Cycles Ventilator Carbon dioxide
Guide: Automating on event
Important: guide’s step 3, 4
You can select the state change you want to act as trigger in step 4
alias : lack of water example description : Toggle switch when air purifier's lack_of_water triggers : - trigger : state entity_id : - event.purifier_notification actions : - condition : state entity_id : event.purifier_notification attribute : event_type state : lack_of_water - type : toggle device_id : xxxxxxxx entity_id : xxxxxxxx domain : switch
Aborted: The token is not valid
This error occurs when the Personal Access Token (PAT) is invalid or entered incorrectly. Please visit the Personal Access Token Page page to check if your token is valid.
Aborted: The country is not supported
Check your PAT’s valid country in the Choose the region / Country section.
Error: The number of API calls has been exceeded
This error occurs when there’s an abnormal number of API calls made using the PAT.
The LG ThinQ integration will work properly after some time.
The LG ThinQ integration will show additional information by enabling log configuration.
Enable debug logging .
If you change Enable to Disable , the log will be saved to the download folder.
When reporting an issue:
Provide screenshots of your device configuration (including device name, type, and entities).
Include the debug logs.
Describe the expected behavior and what’s not working.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The LG ThinQ hub was introduced in Home Assistant 2024.11, and it's used by
4.3% of the active installations.
Its IoT class is Cloud Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@LG-ThinQ-Integration
Categories
Hub
Back to top
