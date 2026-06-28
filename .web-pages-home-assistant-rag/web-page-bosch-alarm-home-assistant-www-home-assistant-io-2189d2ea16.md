---
source_url: "https://www.home-assistant.io/integrations/bosch_alarm"
final_url: "https://www.home-assistant.io/integrations/bosch_alarm"
canonical_url: "https://www.home-assistant.io/integrations/bosch_alarm/"
source_handle: "web:www-home-assistant-io:2189d2ea1600"
source_section: "integrations-bosch-alarm"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "7404f528ab5f5dc2c786365b35471fb3648b7f712550de272702504ec4c6f5dd"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Bosch Alarm - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/bosch_alarm
- Final URL: https://www.home-assistant.io/integrations/bosch_alarm
- Canonical URL: https://www.home-assistant.io/integrations/bosch_alarm/
- Fetched at: 2026-06-28T02:32:04Z
- Content type: text/html; charset=UTF-8

## Description

Integrate Bosch Alarms.

## Extracted Text

On this page
Configuration
Supported devices
Provided entities
Alarm Control Panel
Binary Sensor
Sensor
Switch
List of actions
Authentication
Data updates
Examples
Turning on lights when walking into a room
Reconfiguration
Troubleshooting
Issues with Bosch Solution 2000/3000/4000 panels
Issues with the Bosch B/G Series (B3512/B4512/B5512/B8512/B9512)
Known limitations
Removing the integration
To remove an integration instance from Home Assistant
The Bosch Alarm Panel integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to connect your Bosch Alarm Panel to Home Assistant to control and monitor your Bosch Alarm Panel.
To add the Bosch Alarm device to your Home Assistant instance, use this My button:
Bosch Alarm can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Bosch Alarm .
Follow the instructions on screen to complete the setup.
Host
The IP address of your panel. You can find it in your router, or within A-Link Plus / RPS.
Port
The port used by your panel. This is usually 7700 unless it was changed when the panel was configured.
Password
The automation code set up for your panel. This can be found within A-Link Plus or RPS. Used by the AMAX, B and G series panels.
User code
The user code for the user that this integration will communicate with the panel with. This is usually the code you would use when arming or disarming the panel via a code pad. Used by the Solution series panels.
Installer code
The installer code for your panel. This can be found within A-Link Plus. Used by the AMAX series panels.
Important
Since the Mode 2 automation user has “superuser” privileges, it bypasses the regularly configured alarm pin: you will not be prompted for a User code when arming/disarming through the integration.
Solution 2000/3000/4000
B Series: B3512/B4512/B5512/B6512
G Series: B8512G/B9512G
AMAX 2100/3000/4000
D7412GV4/D9412GV4 1
The following entities An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] are provided:
This integration adds an Alarm Control Panel device for each configured area, with the ability to issue arm/disarm commands.
This entity reports state, such as disarmed or armed_away .
A binary sensor is added for each point configured on your alarm.
Two binary sensors are added for each area to indicate whether it can be armed away or armed home.
A sensor is provided per area that lists how many points are currently in a faulted state.
A sensor is provided for each of the following alarm types that displays the health of that alarm
Fire
Gas
Burglary
The state for the sensor can be one of the following:
No issues
Trouble
These signals indicate a malfunction or failure within the system. These signals often point to something that, if left unresolved, could lead to a complete system failure. For example, a broken wire or a failed smoke detector could trigger a trouble signal. These signals generally require prompt action to ensure the system continues to work as intended.
Supervisory
These signals relate to system components that require attention but are not in immediate danger of failing. They are typically non-urgent and indicate that something within the system needs maintenance or is functioning suboptimally. These signals might include a closed valve or a fire extinguisher that’s out of service.
Alarm
The alarm is currently triggered.
A switch is added for each output configured on the panel. Note that for some panels, only outputs with the type set to remote output can be controlled via Mode 2 API.
Three switches are added per door, which allow for locking, securing, or momentarily unlocking the door.
The Bosch Alarm integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Set date & time ( bosch_alarm.set_date_time )
Sets the date and time on a Bosch alarm panel.
For an overview of every action across all integrations, see the actions reference .
The primary means of authentication for the Mode 2 API is the Automation passcode. It needs to be at least 10 characters long, and it is different from the User code – a shorter numeric pin used to arm/disarm the panel.
The integration will prompt for the required passcodes, which depend on the panel type.
Panel Code Solution User 2 B Series Automation G Series Automation AMAX Both
The Bosch Alarm integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] fetches data from the device every 30 seconds.
Newer devices and firmware revisions have the possibility to push data instead of needing to rely on polling Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] .
At startup, the integration checks whether your panel supports push data updates and falls back to polling Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] if not.
automation : - alias : " Turn on light when walking into room" triggers : - platform : state entity_id : - binary_sensor.bosch_solution_3000_bedroom to : " on" actions : - action : light.turn_on target : entity_id : light.bedroom_light
This integration supports reconfiguration, so it is possible to change the configuration such as the IP Address after it is configured.
We have found that some panels end up with a configuration on them that is incompatible with the integration.
When this happens, you will get a connection error when attempting to communicate with the panel, even if the credentials are correct.
If you continue to have connection errors even after rebooting your panel, then you have an issue with your configuration.
The easiest way to solve this is to follow the full reset and restore procedure outline below.
Resetting the configuration and restoring the integration
Update firmware (Recommended).
Download and install the latest firmware for the control panel and IP module from the Bosch Security website.
Back up the existing configuration.
Connect to the panel via A-Link Plus.
Perform an upload of the panel configuration.
Save the configuration to your computer.
Default the control panel.
Press the default/reset button on the panel.
Use installer code 1234.
Set:
Location 0081 = 3 (Enables IP module mode)
Location 4456 = 4 (Enables RSC+ communication)
Set date and time using master code 25806# .
Initial Home Assistant test.
Wait 2 to 5 minutes after resetting the panel.
Set up the integration on the panel using its IP address.
Home Assistant should connect using default configuration and show panel status.
Restore your original configuration.
Reconnect to the panel using A-Link Plus.
Modify zones, outputs, and user codes to match the original setup.
Save and download the updated config to the panel.
Wait 2 to 5 minutes.
Reconnect to Home Assistant.
Open Home Assistant.
The integration should now detect the updated configuration.
All relevant entities (zones, partitions, outputs) should appear automatically.
Restarting a panels network stack
We have found that the Solution panels have a bug where they can get into a state where the network module stops letting us use the Mode 2 API.
If your configuration information is correct, but you are still unable to connect to your panel, then you are likely encountering this bug.
This can be resolved by restarting the network modules, which can be done with the following steps.
Resetting network module 1
Using the codepad, enter your master code, followed by the [9][4][1] and [#] keys.
Resetting network module 2
Using the codepad, enter your master code, followed by the [9][4][2] and [#] keys.
The following procedure can be used to configure the panel correctly so that it will work with the integration.
Panel configuration procedure
Update Firmware (Recommended).
Use RPS to update the control panel and B426 (IP module if used) to the latest firmware.
Download firmware from the Bosch Security website.
Set IP Address.
Configure the panel’s IP settings using RPS or via the codepad.
Use DHCP for initial setup (optional), or assign a static IP.
Configure the automation device.
In RPS:
Set Automation Device to Mode 2 (Bosch Standard Protocol).
Set your automation passcode (used for Home Assistant authentication).
Wait for changes to apply.
Wait 2 to 5 minutes for the panel to reboot and apply settings.
Connect to Home Assistant.
Set up the integration using the panel’s IP address.
Enter the automation passcode in the Home Assistant configuration.
Home Assistant should connect and display panel status, zones, and partitions.
TLS issues
Some older firmwares for these panels use outdated certificates that are no longer trusted by Home Assistant. If you have issues connecting and see a TLS error in your logs, update the firmware on your panel.
The integration does not allow you to configure the panel; you can instead do this via the panel’s configuration utility.
Some older firmware versions for the Solution / AMAX series panels only support a single connection at a time. If you try to have a cloud connection and use the integration on these panels simultaneously, the panel’s network stack can lock up, and the integration will stop working.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Firmware 2.0+ ↩
The user needs to have the “master code functions” authority if you wish to interact with history events. ↩
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Bosch Alarm device was introduced in Home Assistant 2025.4, and it's used by
106 active installations.
Its IoT class is Local Push.
🏆 Platinum quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@mag1024
@sanjay900
Categories
Back to top
