---
source_url: "https://www.home-assistant.io/integrations/comelit"
final_url: "https://www.home-assistant.io/integrations/comelit"
canonical_url: "https://www.home-assistant.io/integrations/comelit/"
source_handle: "web:www-home-assistant-io:9e74cb5b5277"
source_section: "integrations-comelit"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "46d3e04c6e988626e20b685d7c1a0c1bb846b9a83d24dae5ebdf0de0c0237085"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Comelit SimpleHome - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/comelit
- Final URL: https://www.home-assistant.io/integrations/comelit
- Canonical URL: https://www.home-assistant.io/integrations/comelit/
- Fetched at: 2026-06-28T02:34:37Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Comelit SimpleHome home automation devices into Home Assistant.

## Extracted Text

On this page
Supported devices
Configuration
Examples
Automation: Activate the alarm when you leave home
Automation: Close the covers at sunset if you are not at home
Data updates
Supported functionality
Comelit Serial Bridge
Comelit VEDO System
Troubleshooting
Can’t set up the device
Can’t update data
Removing the integration
To remove an integration instance from Home Assistant
The Comelit SimpleHome integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control your Comelit home automation devices .
The integration provides information on connected devices and enables control of the alarm system.
There is support for the following devices within Home Assistant:
To add the Comelit SimpleHome hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Comelit SimpleHome .
Follow the instructions on screen to complete the setup.
host
The IP address of the Comelit SmartHome device.
port
The TCP port of the Comelit SmartHome device. The default is port 80 (standard for HTTP).
pin
The PIN of the Comelit SmartHome device.
type
The type of Comelit SmartHome device.
bridge
Comelit Serial Bridge.
vedo
Comelit VEDO System.
automation : - alias : " Arm alarm away" id : " arm_alarm_away" triggers : - platform : state entity_id : person.simone to : " not_home" actions : - action : alarm_control_panel.alarm_arm_away target : entity_id : alarm_control_panel.home data : code : " 12345"
automation : - alias : Close covers at sunset id : " covers_close_sunset" trigger : - platform : sun event : sunset condition : conditions : - alias : " condition alias (not home)" condition : state entity_id : group.person_family state : " not_home" actions : entity_id : - cover.group_home_covers action : cover.close_cover
This integration polls Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] data from the device every 5 seconds by default.
The Comelit SimpleHome integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following entities:
Climate
Cover
Dehumidifier
Humidifier
Light
Sensor - power consumption
Switch - irrigation and sockets (other)
Alarm control panel - per area
Binary sensor - per zone presence detection
Sensor - per zone status
Symptom: “Cannot connect”
When trying to set up the integration, the form shows the message “Cannot connect”.
Description
This means that the IP address or the port specified is wrong.
Resolution
To resolve this issue, verify the device’s IP address and port by navigating to them in a web browser.
Symptom: Device storage error
During data refresh, the device may fail to provide the expected data and logs the error above.
In most cases, the device web UI shows some or all pages as blank.
This usually indicates that the SD card is failing and can no longer be read reliably.
One of the most commonly affected files is DATA\BPAGES.BIN .
To resolve this issue, replace the SD card.
If a backup is not available, restore the configuration and firmware using Comelit SimpleProg .
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Comelit SimpleHome hub was introduced in Home Assistant 2023.9, and it's used by
34 active installations.
Its IoT class is Local Polling.
🏆 Platinum quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@chemelli74
Categories
Alarm
Sensor
Switch
Back to top
