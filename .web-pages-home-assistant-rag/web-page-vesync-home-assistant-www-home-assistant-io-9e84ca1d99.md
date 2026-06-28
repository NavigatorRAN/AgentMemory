---
source_url: "https://www.home-assistant.io/integrations/vesync"
final_url: "https://www.home-assistant.io/integrations/vesync"
canonical_url: "https://www.home-assistant.io/integrations/vesync/"
source_handle: "web:www-home-assistant-io:9e84ca1d998b"
source_section: "integrations-vesync"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "4fbdac004bf2777d1ca1764881e6ff91e2720f061a2507d54320fac6f2b93d14"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# VeSync - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/vesync
- Final URL: https://www.home-assistant.io/integrations/vesync
- Canonical URL: https://www.home-assistant.io/integrations/vesync/
- Fetched at: 2026-06-28T03:26:35Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up VeSync devices with Home Assistant.

## Extracted Text

On this page
Supported devices
Bulbs
Wall switches
Outlet plugs
Fans
Humidifiers
Air Fryers
Prerequisite
Configuration
Removing the integration
To remove an integration instance from Home Assistant
List of actions
Power & energy sensors
Fan & air quality sensors
Fan exposed attributes
Humidifier
Binary Sensors
Extracting attribute data
The VeSync integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] enables you to control a wide variety of Levoit devices connected to the VeSync App. Currently this integration supports most bulbs, fans, air purifiers, switches, outlets, humidifers and select air fryers.
The devices must be added to the VeSync App before this integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] can discover them.
The following platforms are supported:
binary sensor
fan
humidifier
light
number
sensor
switch
update
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] supports devices controllable by the VeSync App. The following devices are supported by this integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] . This list may not be exhaustive as devices have multiple model numbers within this.
Etekcity WiFi Dimmable LED Bulb (ESL100)
Etekcity WiFi Dimmable and Tunable White LED Bulb (ESL100CW)
Etekcity In Wall Smart Switch (EWSL01-USA)
Etekcity Wifi Dimmer Switch (ESD16)
Etekcity Wifi Dimmer Switch (ESWD16)
Etekcity 7 Amp US outlet - ESW01-USA (Round)
Etekcity 10 Amp US outlet - ESW10-USA (Round)
Etekcity 10 Amp EU outlet - ESW10-EU (Round)
Etekcity 15 Amp US outlet - ESW15-USA (Rectangular)
Etekcity 2 Plug Outdoor Outlet - ESO15-TB
Core 200S: Smart True HEPA Air Purifier
Core 300S: Smart True HEPA Air Purifier
Core 400S: Smart True HEPA Air Purifier
Core 600S: Smart True HEPA Air Purifier
EverestAir: Smart Air Purifier
Vital 100S Smart True HEPA Air Purifier (LAP-V102S-WUS)
Vital 200S Smart True HEPA Air Purifier (LAP-V201S-WUS)
LEVOIT Smart Wifi Air Purifier (LV-PUR131S)
LEVOIT Smart Tower Fan (LTF-F422S-WUS)
Classic200S: Classic 200S Smart Ultrasonic Cool Mist Humidifier
Classic300S: Classic 300S Ultrasonic Smart Humidifier
OasisMist 1000S Smart Ultrasonic Cool Mist Tower Humidifier (LUH-M101S-WUS)
Superior6000S: Superior 6000S Smart Evaporative Humidifier
Cosori 3.7 and 5.8 Quart Air Fryer
Before you can use this integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] , all devices must be registered with the
VeSync App. Once registration is complete, continue with the steps described in
the configuration section below.
To add the VeSync hub to your Home Assistant instance, use this My button:
VeSync can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select VeSync .
Follow the instructions on screen to complete the setup.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
The VeSync integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Update devices ( vesync.update_devices )
Polls the VeSync server to find and add any new devices.
For an overview of every action across all integrations, see the actions reference .
Many VeSync outlets support power & energy monitoring. This data is exposed as sensor entities alongside the outlet
itself. Note that prior versions of the integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] exposed these as state attributes on the outlet switch entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] .
Sensor Description Example sensor.<outlet name>_current_power The present power consumption of the switch in watts 7.89 sensor.<outlet name>_energy_use_today The kilowatt hours used by the switch during the previous 24 hours 0.12 sensor.<outlet name>_voltage The present voltage of the switch in Volts as a diagnostic sensor 120.32 sensor.<outlet name>_energy_use_weekly Total energy usage for week starting from Monday 12:01AM in kWh 14.74 sensor.<outlet name>_energy_use_monthly Total energy usage for month starting from 12:01AM on the first in kWh 52.30 sensor.<outlet name>_energy_use_yearly Total energy usage for year start from 12:01AM on Jan 1 in kWh 105.25
All VeSync air purifiers expose the remaining filter lifetime, and some also expose air quality measurements.
Sensor Description Example filter_life Remaining percentage of the filter. (LV-PUR131S, Core200S/300s/400s/600s/EverestAir) 142 air_quality The current air quality reading. (LV-PUR131S, Core300s/400s/600s) excellent pm2_5 The current air quality reading. (Core300s/400s/600s/EverestAir) 8 Switch Description Example display Display On or Off On
VeSync air purifiers will expose the following details depending on the features supported by the model:
Attribute Description Example mode The current mode the device is in. (LV-PUR131S, Core200S/300s/400s) manual speed The current speed setting of the device. (LV-PUR131S, Core200S/300s/400s) high speed_list The available list of speeds supported by the device. (LV-PUR131S) high oscillating If the fan is currently oscillating True active_time The number of seconds since the device has been in a non-off mode. (LV-PUR131S) 1598 screen_status The current status of the screen. (LV-PUR131S) on night_light The current status of the night light (Core200S/Core400s) off child_lock The current status of the child lock (Core200S/300s/400s) off Select Description Example night_light_level Night light brightness level (Values: off, dim, on). off
Sensors and settings exposed by VeSync humidifiers.
Sensor Description Example humidity Current humidity (in %) 35 Number Description Example mist_level Mist level intensity (Range: 1-9, Step: 1). Only available in manual mode. 1 Select Description Example night_light_level Night light brightness level (Values: off, dim, bright). off Switch Description Example display Display On or Off On ‘auto_off_config’ Auto turn off when humidity target exceeded, resume when below target On
Binary Sensor Description Example water_lacks Indicates whether the device needs a water refill false water_tank_lifted Water tank is lifted false
Sensors and settings exposed by VeSync Air Fryers.
Sensor Description Example cook_status Current status of the fryer cooking current_temp Current internal temperature of the fryer, Unknown when off. 150C cook_set_temp The target cooking temperature 165C cook_set_time The number of minutes for cooking 15 remaining_time The numbers of minutes left in cooking or preheating 8 preheat_set_time The number of minutes for pre heating 10
To get the attributes readings from supported devices, such as voltage from outlets or fan attributes, you’ll have to create a template sensor .
In the example below, change all of the vesync_switch ‘s to match your device’s entity ID.
Adapted from the TP-Link integration .
template : - sensor : - name : " Vesync voltage" state : " {{ state_attr('switch.vesync_switch', 'voltage') | float(default=0) }}" unit_of_measurement : " V"
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The VeSync hub was introduced in Home Assistant 0.66, and it's used by
2.2% of the active installations.
Its IoT class is Cloud Polling.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@markperdue
@webdjoe
@thegardenmonkey
@cdnninja
@iprak
@sapuseven
Categories
Fan
Light
Number
Switch
Update
Back to top
