# BSB-LAN - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/bsblan
- Final URL: https://www.home-assistant.io/integrations/bsblan
- Canonical URL: https://www.home-assistant.io/integrations/bsblan/
- Fetched at: 2026-06-28T02:32:38Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate BSBLan device into Home Assistant.

## Extracted Text

On this page
Configuration
Supported functionality
Device structure
Buttons
Climate
Water heater
Sensors
List of actions
Examples
Setting a weekday and weekend schedule
Seasonal schedule automation
The BSB-LAN integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] integrates BSB-LAN devices into Home Assistant.
BSBLan is a device that is made by Frederik Holst and with the help of many other contributors. The board v3 is designed for an Arduino Due with an Ethernet-Shield for web-based controlling of heating systems such as Elco Thision , Brötje and similar systems. Also available is an ESP32 version of the board.
It can interface with the heating system over Boiler-System-Bus, Local Process Bus, and PPS . For more information on which systems it supports, take a look at their documentation .
To add the BSB-LAN device to your Home Assistant instance, use this My button:
BSB-LAN can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select BSB-LAN .
Follow the instructions on screen to complete the setup.
For authentication, HTTP authentication using a username and password or using a passkey is supported. Use either one.
If your heating system exposes more than one heating circuit, Home Assistant discovers the available circuits automatically during setup. The integration creates one main BSB-LAN device for shared entities, and adds each detected heating circuit as its own sub-device so you can control each zone independently.
If your heating system changes later, for example after you enable an extra circuit in the controller, run the integration’s reconfigure flow to let Home Assistant discover the updated circuit list.
Depending on your system and the available heating circuits, the following entities are available:
Button
Diagnostics
Sensor
The integration groups entities by device in Home Assistant:
The main BSB-LAN device contains shared entities, like the Sync time button and temperature sensors.
Each detected heating circuit appears as a sub-device under the main BSB-LAN device.
If your system supports domestic hot water, it can also appear as its own sub-device.
Sync time : Synchronizes the BSB-LAN device time with the current Home Assistant time. Use it when your device’s time drifts or doesn’t match Home Assistant’s time.
The Sync time button appears under the Configuration section of the device page, not on your dashboards by default. You can also trigger the same synchronization programmatically using the bsblan.sync_time action, such as in a daily automation.
Home Assistant creates one climate entity for each detected heating circuit.
These appear in Home Assistant as Heating circuit 1 , Heating circuit 2 , and Heating circuit 3 , depending on what your system exposes.
Each heating circuit is grouped under its own sub-device on the BSB-LAN device page.
If your heating system exposes domestic hot water controls, Home Assistant creates a water heater entity for it.
The water heater entity is grouped under its own sub-device on the BSB-LAN device page.
The following sensors are available, depending on your heating system:
Inside temperature
Outside temperature
Total Energy (disabled by default)
To use the Total Energy sensor, enable the entity in Home Assistant.
Note
The Total Energy sensor is not real-time. It updates in 1 kWh steps, so the value changes only after another 1 kWh has been used.
The BSB-LAN integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Set hot water schedule ( bsblan.set_hot_water_schedule )
Sets the hot water heating schedule for a BSB-LAN device.
Sync time ( bsblan.sync_time )
Synchronizes the Home Assistant time to a BSB-LAN device.
For an overview of every action across all integrations, see the actions reference .
The following examples show how to use the BSB-LAN integration actions in Home Assistant automations.
This example sets different schedules for weekdays and weekends. Each day can have multiple time slots.
action : bsblan.set_hot_water_schedule target : device_id : abc123device456 data : monday_slots : - start_time : " 06:00:00" end_time : " 08:00:00" - start_time : " 17:00:00" end_time : " 21:00:00" tuesday_slots : - start_time : " 06:00:00" end_time : " 08:00:00" - start_time : " 17:00:00" end_time : " 21:00:00" wednesday_slots : - start_time : " 06:00:00" end_time : " 08:00:00" - start_time : " 17:00:00" end_time : " 21:00:00" thursday_slots : - start_time : " 06:00:00" end_time : " 08:00:00" - start_time : " 17:00:00" end_time : " 21:00:00" friday_slots : - start_time : " 06:00:00" end_time : " 08:00:00" - start_time : " 17:00:00" end_time : " 21:00:00" saturday_slots : - start_time : " 08:00:00" end_time : " 22:00:00" sunday_slots : - start_time : " 08:00:00" end_time : " 22:00:00"
This example automatically adjusts the hot water schedule based on the season.
automation : - alias : " Set hot water schedule - winter" triggers : - trigger : state entity_id : sensor.season to : winter actions : - action : bsblan.set_hot_water_schedule target : device_id : " {{ device_id('water_heater.bsblan_hot_water') }}" data : monday_slots : - start_time : " 05:00:00" end_time : " 08:30:00" - start_time : " 16:00:00" end_time : " 23:00:00" tuesday_slots : - start_time : " 05:00:00" end_time : " 08:30:00" - start_time : " 16:00:00" end_time : " 23:00:00" wednesday_slots : - start_time : " 05:00:00" end_time : " 08:30:00" - start_time : " 16:00:00" end_time : " 23:00:00" thursday_slots : - start_time : " 05:00:00" end_time : " 08:30:00" - start_time : " 16:00:00" end_time : " 23:00:00" friday_slots : - start_time : " 05:00:00" end_time : " 08:30:00" - start_time : " 16:00:00" end_time : " 23:00:00" saturday_slots : - start_time : " 07:00:00" end_time : " 23:00:00" sunday_slots : - start_time : " 07:00:00" end_time : " 23:00:00" - alias : " Set hot water schedule - summer" triggers : - trigger : state entity_id : sensor.season to : summer actions : - action : bsblan.set_hot_water_schedule target : device_id : " {{ device_id('water_heater.bsblan_hot_water') }}" data : monday_slots : - start_time : " 06:00:00" end_time : " 07:00:00" - start_time : " 18:00:00" end_time : " 20:00:00" tuesday_slots : - start_time : " 06:00:00" end_time : " 07:00:00" - start_time : " 18:00:00" end_time : " 20:00:00" wednesday_slots : - start_time : " 06:00:00" end_time : " 07:00:00" - start_time : " 18:00:00" end_time : " 20:00:00" thursday_slots : - start_time : " 06:00:00" end_time : " 07:00:00" - start_time : " 18:00:00" end_time : " 20:00:00" friday_slots : - start_time : " 06:00:00" end_time : " 07:00:00" - start_time : " 18:00:00" end_time : " 20:00:00" saturday_slots : - start_time : " 08:00:00" end_time : " 21:00:00" sunday_slots : - start_time : " 08:00:00" end_time : " 21:00:00"
For more documentation of the BSBLan device, check the manual .
To see a more detailed listing of the reported systems which are successfully used with BSB-LAN, please follow the corresponding link:
Supported heating systems
The integration is tested with the stable firmware version 5.0.16-20250525002819 . A newer firmware version may not work because the API could have changed. For autodiscovery, use the latest release: release 5.0 .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The BSB-LAN device was introduced in Home Assistant 0.110, and it's used by
215 active installations.
Its IoT class is Local Polling.
🥈 Silver quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@liudger
Categories
Back to top
