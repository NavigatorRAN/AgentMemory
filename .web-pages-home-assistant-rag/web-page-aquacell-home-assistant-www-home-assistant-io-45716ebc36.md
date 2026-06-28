---
source_url: "https://www.home-assistant.io/integrations/aquacell"
final_url: "https://www.home-assistant.io/integrations/aquacell"
canonical_url: "https://www.home-assistant.io/integrations/aquacell/"
source_handle: "web:www-home-assistant-io:45716ebc3622"
source_section: "integrations-aquacell"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "fa2639054acf8be70ebed227e861d8105e8a1b17f197a07223eb74a832e54553"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# AquaCell - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/aquacell
- Final URL: https://www.home-assistant.io/integrations/aquacell
- Canonical URL: https://www.home-assistant.io/integrations/aquacell/
- Fetched at: 2026-06-28T02:28:55Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate AquaCell with Home Assistant.

## Extracted Text

On this page
Supported devices
Prerequisites
Configuration
Sensors
Use cases
Examples
Send notification when salt is running out
Data updates
Known limitations
Troubleshooting
Removing the integration
To remove an integration instance from Home Assistant
AquaCell is a water-softening device made by Culligan . The AquaCell integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to monitor your AquaCell device in Home Assistant.
You will need your Aquacell account information as used in the AquaCell app.
This integration also supports other Culligan brands of water softener, such as Harvey and TwinTec (made by Harvey) softeners.
This integration only works for softener models which have an i-Lid and are configured through the ‘Mijn AquaCell’ or ‘myHarvey’ mobile app.
These models are also recognizable by the required curved salt blocks.
AquaCell
HarveyArc Water Softener
TwinTec Cobalt
The Mijn AquaCell app can be found on the Apple App Store or on Google Play .
The myHarvey app can be found on the Apple App Store or on Google Play .
The softener needs to be set up with the official app before being able to integrate it in Home Assistant.
To add the AquaCell device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select AquaCell .
Follow the instructions on screen to complete the setup.
Email address
The email address used to log in to the mobile app used to monitor the softener.
Password
The password used to log in to the mobile app used to monitor the softener.
This integration provides sensors Sensors return information about a thing, for instance the level of water in a tank. [Learn more] for the following information from the softener device:
Percentage of salt remaining.
Time remaining until 0% salt level is reached.
i-Lid battery level.
Wi-Fi signal strength.
Last update time. The time the softener last reported data to the cloud.
The integration provides sensors to monitor the salt level of the softener. You can use this information to create automations, for example, to notify you when the salt level is low and a refill is needed.
You can also easily plot the history of the salt level sensors over time, which can give you more insight into usage.
The following examples show how to use this integration in Home Assistant automations.
The following example sends a notification to your mobile device when the salt is running out on either side.
automation : - alias : " Notify when salt is running low" triggers : - trigger : numeric_state entity_id : - sensor.my_softener_salt_left_side_percentage - sensor.my_softener_salt_right_side_percentage below : 10 actions : - action : notify.send_message target : entity_id : notify.my_device data : title : " Softener is almost out of salt" message : > Place new salt blocks in the softener.
The device does not update frequently, the integration is polling Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] new data every day from the cloud.
There are no known limitations for this integration.
There are no commonly known issues with this integration.
This integration follows standard integration removal, no extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The AquaCell device was introduced in Home Assistant 2024.7, and it's used by
193 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@Jordi1990
Categories
Sensor
Back to top
