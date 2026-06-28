---
source_url: "https://www.home-assistant.io/integrations/peblar"
final_url: "https://www.home-assistant.io/integrations/peblar"
canonical_url: "https://www.home-assistant.io/integrations/peblar/"
source_handle: "web:www-home-assistant-io:421698335ca6"
source_section: "integrations-peblar"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "6a33e9902dbd7585e4cf0ce27623bbef72b45d47dd4b1a190d68e06fe1f16b46"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Peblar - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/peblar
- Final URL: https://www.home-assistant.io/integrations/peblar
- Canonical URL: https://www.home-assistant.io/integrations/peblar/
- Fetched at: 2026-06-28T03:07:32Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Peblar Rocksolid EV Charger with Home Assistant.

## Extracted Text

On this page
Use cases
Supported devices
Prerequisites
Configuration
Configuration parameters
Supported functionality
Binary sensors
Buttons
Numbers
Selects
Sensors
Switches
Updates
Data updates
Actions
Examples
Notify when a software update is available
Notify when an issue is detected
Known limitations
Troubleshooting
Removing the integration
To remove an integration instance from Home Assistant
The Peblar integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] integrates the Peblar Rocksolid EV Charger into your smart home ecosystem. It enables real-time monitoring of charging status, tracking energy consumption, controlling charging behavior, and integrating EV charging data into the Home Assistant energy dashboard.
The Peblar integration connects your EV charger to Home Assistant, providing comprehensive data and control capabilities. Here’s how you can benefit from this integration in your smart home:
Monitor your EV charging in real time - Track charging status, current power draw, and session energy consumption directly from your dashboard.
Optimize your home energy management - Add your charger to the Home Assistant energy dashboard to integrate EV charging into your overall energy monitoring system.
Create smart charging automations such as:
Receiving notifications when your vehicle completes charging
Automatically adjusting charging modes based on solar production forecasts
Getting alerts when the charger detects errors or issues
Scheduling charging during off-peak electricity hours
Optimizing charging based on electricity prices and your travel schedule
Stay up to date with software - Receive notifications when firmware or customization updates are available for your Peblar charger.
Control charging remotely - Start, stop, or adjust charging parameters from anywhere using the Home Assistant app.
The following Peblar Rocksolid EV chargers are supported by this integration:
Peblar Home
Peblar Home Plus
Peblar Business
Before setting up the Peblar integration, make sure:
Your Peblar charger is connected to your home network
You know the hostname or IP address of the charger on your network
You have the password used to access the charger’s local web interface
To add the Peblar device to your Home Assistant instance, use this My button:
Peblar can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Peblar .
Follow the instructions on screen to complete the setup.
Host
The hostname or IP address of your Peblar charger on your home network.
Password
The password used to log in to the Peblar device’s local web interface.
The above configuration can also be adjusted later via Settings > Devices & services , click and select Reconfigure .
Below is a complete overview of the entities this integration provides.
The binary sensors provided are used to indicate the health status of the
charger. The following binary sensors are available:
Active error : Indicates if the charger has detected an error. If this sensor is on ( state The state holds the information of interest of an entity, for example, if a light is on or off. Each entity has exactly one state and the state only holds one value at a time. However, entities can store attributes related to that state such as brightness, color, or a unit of measurement. [Learn more] : on ) an error has been detected, otherwise, it is off ( state The state holds the information of interest of an entity, for example, if a light is on or off. Each entity has exactly one state and the state only holds one value at a time. However, entities can store attributes related to that state such as brightness, color, or a unit of measurement. [Learn more] : off ).
Active warning : Indicates if the charger has raised a warning. If this sensor is on ( state The state holds the information of interest of an entity, for example, if a light is on or off. Each entity has exactly one state and the state only holds one value at a time. However, entities can store attributes related to that state such as brightness, color, or a unit of measurement. [Learn more] : on ) a warning has been raised, otherwise, it is off ( state The state holds the information of interest of an entity, for example, if a light is on or off. Each entity has exactly one state and the state only holds one value at a time. However, entities can store attributes related to that state such as brightness, color, or a unit of measurement. [Learn more] : off ).
If any of these binary sensors are on, you should check the charger’s local
web interface for more information about the error or warning.
Important
These binary sensors are disabled by default. If you want to use them, you need
to enable them first. See the enabling or disabling entities
documentation for information on how to do this.
The buttons provided by this integration can be used to trigger an action on
the charger. The following buttons are available:
Identify : This button can be used to identify the charger. This can be useful if you have multiple chargers and want to identify which one is which. Once pressed, the LED on the charger will start blinking for a few seconds.
Restart : This button can be used to restart the charger. This can be useful if the charger is not responding as expected.
These buttons are disabled by default. If you want to use them, you need
This integration provides a single number entity: Charge limit .
Using this entity, you can set the maximum current the charger can provide to your electric vehicle. The value of this entity is in amperes (A).
The minimum value for this entity is 6A, and the maximum value is depending on your charger’s configuration. The value can be set in increments of 1A.
This integration provides a single select entity: Smart charging .
It reflects the same smart charging state as is shown on the charger’s local web interface, and allows you to control the charging behavior of the charger.
The following options are available:
Default ( state The state holds the information of interest of an entity, for example, if a light is on or off. Each entity has exactly one state and the state only holds one value at a time. However, entities can store attributes related to that state such as brightness, color, or a unit of measurement. [Learn more] : default ): The charger will charge the electric vehicle as soon as it is connected.
Fast solar ( state The state holds the information of interest of an entity, for example, if a light is on or off. Each entity has exactly one state and the state only holds one value at a time. However, entities can store attributes related to that state such as brightness, color, or a unit of measurement. [Learn more] : fast_solar ): The charger will fast charge the electric vehicle with the overproduction of solar energy, but will also use grid power if the solar production is not sufficient.
Smart solar ( state The state holds the information of interest of an entity, for example, if a light is on or off. Each entity has exactly one state and the state only holds one value at a time. However, entities can store attributes related to that state such as brightness, color, or a unit of measurement. [Learn more] : smart_solar ): The charger will charge the electric vehicle with the overproduction of solar energy, but will also use grid power if the solar production is not sufficient.
Pure solar ( state The state holds the information of interest of an entity, for example, if a light is on or off. Each entity has exactly one state and the state only holds one value at a time. However, entities can store attributes related to that state such as brightness, color, or a unit of measurement. [Learn more] : pure_solar ): The charger will only charge the electric vehicle with the overproduction of solar energy.
Scheduled ( state The state holds the information of interest of an entity, for example, if a light is on or off. Each entity has exactly one state and the state only holds one value at a time. However, entities can store attributes related to that state such as brightness, color, or a unit of measurement. [Learn more] : scheduled ): The charger will charge the electric vehicle according to the schedule configured on the charger.
The Peblar integration provides a lot of sensors to Home Assistant.
Tip
The ability to add your charger to the Home Assistant energy dashboard is
arguably the most useful feature of this integration. It is therefore
recommended to add your Peblar charger to the Home Assistant energy dashboard,
by adding the Lifetime energy sensor to the energy dashboard configuration
as a device.
Current : The present current (in amperes) the charger is consuming to charge your electric vehicle. This is a combined value for all your phases. Additionally, three phase-specific sensors are available if your charging is using multiple phases:
Current Phase 1 **: The current (in amperes) the charger is consuming on phase 1.
Current Phase 2 **: The current (in amperes) the charger is consuming on phase 2.
Current Phase 3 **: The current (in amperes) the charger is consuming on phase 3.
Lifetime energy : The total energy (in kilowatt-hours) consumed by the charger since it was installed. This is the recommended sensor to use in the Home Assistant energy dashboard.
Limit source : The source/origin of the current charging limit that is in effect. The source can be one of the following:
Charging cable ( state The state holds the information of interest of an entity, for example, if a light is on or off. Each entity has exactly one state and the state only holds one value at a time. However, entities can store attributes related to that state such as brightness, color, or a unit of measurement. [Learn more] : charging_cable ): The current limit is the maximum current the charging cable can handle.
Current limiter ( state The state holds the information of interest of an entity, for example, if a light is on or off. Each entity has exactly one state and the state only holds one value at a time. However, entities can store attributes related to that state such as brightness, color, or a unit of measurement. [Learn more] : current_limiter ): The current limit is set by the current limiter.
Dynamic load balancing ( state The state holds the information of interest of an entity, for example, if a light is on or off. Each entity has exactly one state and the state only holds one value at a time. However, entities can store attributes related to that state such as brightness, color, or a unit of measurement. [Learn more] : dynamic_load_balancing ): The current limit is set by the dynamic load balancing feature.
External power limit ( state The state holds the information of interest of an entity, for example, if a light is on or off. Each entity has exactly one state and the state only holds one value at a time. However, entities can store attributes related to that state such as brightness, color, or a unit of measurement. [Learn more] : external_power_limit ): The current limit is set by an external power limiter.
Group load balancing ( state The state holds the information of interest of an entity, for example, if a light is on or off. Each entity has exactly one state and the state only holds one value at a time. However, entities can store attributes related to that state such as brightness, color, or a unit of measurement. [Learn more] : group_load_balancing ): The current limit is set by the group load balancing feature, which is a feature that allows multiple chargers to share the available power.
Hardware limitation ( state The state holds the information of interest of an entity, for example, if a light is on or off. Each entity has exactly one state and the state only holds one value at a time. However, entities can store attributes related to that state such as brightness, color, or a unit of measurement. [Learn more] : hardware_limitation ): The current limit is limited by the hardware of the charger that can’t provide more current.
High temperature ( state The state holds the information of interest of an entity, for example, if a light is on or off. Each entity has exactly one state and the state only holds one value at a time. However, entities can store attributes related to that state such as brightness, color, or a unit of measurement. [Learn more] : high_temperature ): The current limit is limited due to high temperatures.
Household power limit ( state The state holds the information of interest of an entity, for example, if a light is on or off. Each entity has exactly one state and the state only holds one value at a time. However, entities can store attributes related to that state such as brightness, color, or a unit of measurement. [Learn more] : household_power_limit ): The current limit is set by the household power limit feature, which is a feature that allows the charger to limit the current to prevent overloading the household power.
Installer limitation ( state The state holds the information of interest of an entity, for example, if a light is on or off. Each entity has exactly one state and the state only holds one value at a time. However, entities can store attributes related to that state such as brightness, color, or a unit of measurement. [Learn more] : installer_limitation ): The current limit is set by the installer, for example, to prevent overloading the fuse of the house.
Local Modbus API ( state The state holds the information of interest of an entity, for example, if a light is on or off. Each entity has exactly one state and the state only holds one value at a time. However, entities can store attributes related to that state such as brightness, color, or a unit of measurement. [Learn more] : local_modbus_api ): The current limit is set by software using the local Modbus API.
Local REST API ( state The state holds the information of interest of an entity, for example, if a light is on or off. Each entity has exactly one state and the state only holds one value at a time. However, entities can store attributes related to that state such as brightness, color, or a unit of measurement. [Learn more] : local_rest_api ): The current limit is set by software using the local REST API. Home Assistant uses this API to set the current limit, so if you see this state, it means the current limit is likely set through Home Assistant.
OCPP smart charging ( state The state holds the information of interest of an entity, for example, if a light is on or off. Each entity has exactly one state and the state only holds one value at a time. However, entities can store attributes related to that state such as brightness, color, or a unit of measurement. [Learn more] : ocpp_smart_charging ): The current limit is set by the OCPP smart charging feature.
Overcurrent protection ( state The state holds the information of interest of an entity, for example, if a light is on or off. Each entity has exactly one state and the state only holds one value at a time. However, entities can store attributes related to that state such as brightness, color, or a unit of measurement. [Learn more] : overcurrent_protection ): The current limit is limited due to overcurrent protection.
Phase imbalance ( state The state holds the information of interest of an entity, for example, if a light is on or off. Each entity has exactly one state and the state only holds one value at a time. However, entities can store attributes related to that state such as brightness, color, or a unit of measurement. [Learn more] : phase_imbalance ): The current limit is limited due to phase imbalance in the electrical installation.
Power factor ( state The state holds the information of interest of an entity, for example, if a light is on or off. Each entity has exactly one state and the state only holds one value at a time. However, entities can store attributes related to that state such as brightness, color, or a unit of measurement. [Learn more] : power_factor ): The current limit is limited due to a low power factor in the electrical installation.
Solar charging ( state The state holds the information of interest of an entity, for example, if a light is on or off. Each entity has exactly one state and the state only holds one value at a time. However, entities can store attributes related to that state such as brightness, color, or a unit of measurement. [Learn more] : solar_charging ): The current limit is set by the solar charging feature of the charger. This means the charger is awaiting an overproduction of solar energy to start charging.
Power : The power consumption (in Watts) the charger is using to charge
your electric vehicle. This is a combined value for all your phases.
Additionally, three phase-specific sensors are available if your charging is
using multiple phases:
Power Phase 1 **: The power consumption (in watts) on phase 1.
Power Phase 2 **: The power consumption (in watts) on phase 2.
Power Phase 3 **: The power consumption (in watts) on phase 3.
Session energy : The total energy (in kilowatt-hours) consumed by the charger during the current charging session. This sensor resets when a new charging session starts. While possible, it is not recommended to use this sensor in the Home Assistant energy dashboard. Use the Lifetime energy sensor instead.
State : The current state of the charger. The state can be one of the following:
Charging ( state The state holds the information of interest of an entity, for example, if a light is on or off. Each entity has exactly one state and the state only holds one value at a time. However, entities can store attributes related to that state such as brightness, color, or a unit of measurement. [Learn more] : charging ): The charger is currently charging the electric vehicle.
Error ( state The state holds the information of interest of an entity, for example, if a light is on or off. Each entity has exactly one state and the state only holds one value at a time. However, entities can store attributes related to that state such as brightness, color, or a unit of measurement. [Learn more] : error ): The charger has detected an error and is currently not charging the electric vehicle.
Fault ( state The state holds the information of interest of an entity, for example, if a light is on or off. Each entity has exactly one state and the state only holds one value at a time. However, entities can store attributes related to that state such as brightness, color, or a unit of measurement. [Learn more] : fault ): The charger has detected a fault and is currently not charging the electric vehicle.
No EV connected ( state The state holds the information of interest of an entity, for example, if a light is on or off. Each entity has exactly one state and the state only holds one value at a time. However, entities can store attributes related to that state such as brightness, color, or a unit of measurement. [Learn more] : no_ev_connected ): The charger is currently not connected to an electric vehicle.
Suspended ( state The state holds the information of interest of an entity, for example, if a light is on or off. Each entity has exactly one state and the state only holds one value at a time. However, entities can store attributes related to that state such as brightness, color, or a unit of measurement. [Learn more] : suspended ): The charger is currently not charging the electric vehicle, but is ready to start charging when needed.
Invalid ( state The state holds the information of interest of an entity, for example, if a light is on or off. Each entity has exactly one state and the state only holds one value at a time. However, entities can store attributes related to that state such as brightness, color, or a unit of measurement. [Learn more] : invalid ): The charger is in an invalid state.
Uptime **: The total time the charger has been running since the last restart. This sensor is reset when the charger is restarted.
Voltage : The voltage the charger is using to charge. Only available if your charger is connected to a single-phase power source.
Voltage Phase 1 **: The voltage on phase 1. Only available if your charger is connected to at least a two-phase power source.
Voltage Phase 2 **: The voltage on phase 2. Only available if your charger is connected to at least a two-phase power source.
Voltage Phase 3 **: The voltage on phase 3. Only available if your charger is connected to a three-phase power source.
The sensors marked with ** are disabled by default. If you want to use them,
you need to enable them first. See the enabling or disabling entities
This integration provides two switch entities:
Charge : This switch allows you to start or stop/pause the charging of your electric vehicle. This can be helpful if you want to temporarily stop charging your electric vehicle, for example, to avoid charging during expensive peak hours.
Force single phase : This switch can be used to force the charger to use a single phase for charging your electric vehicle. This can be useful if you want to limit your current draw from the charger to a single phase, for example, to prevent overloading your electrical installation.
Note
The Force single phase switch is only available if your charger is connected to multiple phases. If your charger is connected to a single-phase power source, this switch will not be created.
The Peblar integration provides two update entities for the Peblar charger:
Firmware : Indicates if there is a firmware update available for the charger. The firmware can be thought of as the operating system of the charger.
Customization : Indicates if there is a customization update available for the charger. The customization can be thought of as the user interface of the charger that you see when you log in to the charger’s local web interface.
Software updates cannot be installed through Home Assistant. You need to log in to the charger’s local web interface to install the updates.
This integration uses local polling Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] , meaning it checks for changes to all entities by regularly communicating with the Peblar charger on your home network.
The integration uses three different polling frequencies:
Every 10 seconds : Updates all sensors and binary sensors, providing you
with the latest insights into your electric vehicle’s charging status.
Every 5 minutes : Checks for configuration changes to the charger,
affecting all configuration entities such as smart charging mode and
current limit.
Every 2 hours : Checks for updates to the charger itself, ensuring
you’re aware of any available updates for your Peblar charger.
Although this integration uses local polling, any configuration changes you make to the
Peblar charger from Home Assistant will appear on the charger almost
instantly.
This integration does not provide additional actions. All actions available
for this integration are provided by their respective entities.
The following examples show how to use the Peblar integration in Home
Assistant automations. These examples are just a starting point, and you can
use them as inspiration to create your own automations.
Feel free to contribute more examples to this documentation ❤️. Have you created a useful automation with your Peblar charger? Consider contributing it to help other users get the most from their integration!
The following example sends a notification to your mobile device when a software update becomes available for your Peblar charger.
automation : - alias : " Peblar software update available" triggers : - trigger : state entity_id : update.peblar_firmware from : " off" to : " on" actions : - action : notify.send_message target : entity_id : notify.my_device data : title : " Peblar charger update available!" message : > There is a software update available for your Peblar charger. Please log in to the charger's local web interface to install the update.
The following example automation will send out a notification when the charger
detects an error or raises a warning.
automation : - alias : " Peblar issue detected" triggers : - trigger : state entity_id : - binary_sensor.peblar_active_error - binary_sensor.peblar_active_warning from : " off" to : " on" - trigger : state entity_id : sensor.peblar_state to : - " error" - " fault" actions : - action : notify.send_message target : entity_id : notify.my_device data : title : " Peblar charger issue detected!" message : > An issue with your Peblar charger has been detected. Please check the charger's local web interface for more information.
Not all functionality of the Peblar charger is available through this integration. The following limitations are known:
The Peblar APIs currently don’t communicate when the charger is awaiting authentication (for example, using an RFID card) before it can start charging. As a result, you will see a suspended charging status in Home Assistant when the charger is actually awaiting authentication.
Home Assistant uses and manages the charger’s REST API. This means that the use of this integration will enable the REST API on the charger automatically. It is possible to use the REST API directly in parallel with this integration.
Peblar is also sold as white-label products, such as CoolBlue BlueBuilt , Eneco Connectric® and Shell Recharge . This integration has been tested only with Peblar branded products, and it’s unknown whether it works with these white-label versions.
If you’re experiencing issues with your Peblar charger integration, try these general troubleshooting steps:
Make sure your Peblar charger is powered on and properly connected to your home network.
Verify that you can access the charger’s local web interface directly using the same hostname or IP address configured in Home Assistant.
If the integration shows as unavailable, try restarting both your Peblar charger and Home Assistant.
This integration follows standard integration removal. No extra steps are
required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Peblar device was introduced in Home Assistant 2025.1, and it's used by
560 active installations.
Its IoT class is Local Polling.
🏆 Platinum quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@frenck
Categories
Car
Energy
Update
Back to top
