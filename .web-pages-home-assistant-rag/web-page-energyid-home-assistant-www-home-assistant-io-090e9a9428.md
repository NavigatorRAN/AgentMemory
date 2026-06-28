---
source_url: "https://www.home-assistant.io/integrations/energyid"
final_url: "https://www.home-assistant.io/integrations/energyid"
canonical_url: "https://www.home-assistant.io/integrations/energyid/"
source_handle: "web:www-home-assistant-io:090e9a9428e1"
source_section: "integrations-energyid"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "c5a7e347bf17b87764b4a29a6a4415d186909b3aa93a912ccf9de31b7cfbb837"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# EnergyID - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/energyid
- Final URL: https://www.home-assistant.io/integrations/energyid
- Canonical URL: https://www.home-assistant.io/integrations/energyid/
- Fetched at: 2026-06-28T02:40:26Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate EnergyID into Home Assistant to send your sensor data to the EnergyID platform.

## Extracted Text

On this page
Prerequisites
Configuration
Initial setup steps
Managing sensor mappings
Data updates
Use cases
Troubleshooting
Data not appearing in EnergyID
The EnergyID integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] connects your Home Assistant to EnergyID —a cloud platform for energy monitoring and optimization. This integration uploads your Home Assistant sensor data and provides advanced analytics and performance tracking for solar, battery, energy consumption, and more.
An active account on EnergyID .
A Provisioning Key and Provisioning Secret generated from your EnergyID portal. These credentials allow Home Assistant to securely connect to your account.
For detailed instructions, refer to the official EnergyID Home Assistant documentation .
To add the EnergyID service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select EnergyID .
Follow the instructions on screen to complete the setup.
During the setup, you will be prompted for the following information:
Provisioning Key
The Provisioning Key obtained from your EnergyID portal.
Provisioning Secret
The Provisioning Secret associated with your key, obtained from your EnergyID portal.
After adding the integration, you will first be asked to enter your Provisioning Key and Secret .
If this is the first time you are connecting this Home Assistant instance, you will be directed to the EnergyID website to claim your device. This step links your Home Assistant instance to a specific record (e.g., your house) in your EnergyID account.
Once claimed, the setup will automatically complete.
After the initial setup, you can manage which Home Assistant sensors send data to EnergyID.
Find the EnergyID integration and select Configure .
From here, you can add new sensor mappings. When adding a mapping, you will be asked for the following:
Home Assistant sensor
Select the sensor entity from your Home Assistant instance whose data you want to send. The list is automatically filtered to suggest suitable numeric sensors.
When you select a sensor, its object_id (the part of the entity ID after the dot) will be used as the EnergyID Metric Key . For example, mapping sensor.total_active_power will send data to EnergyID with the key total_active_power .
The EnergyID integration uses a push-based mechanism with batching:
It listens for state The state holds the information of interest of an entity, for example, if a light is on or off. Each entity has exactly one state and the state only holds one value at a time. However, entities can store attributes related to that state such as brightness, color, or a unit of measurement. [Learn more] changes on your mapped sensors.
When a sensor’s value changes, the new value and timestamp are queued.
The queued data is automatically sent to EnergyID in batches. The upload interval is determined by the policy received from EnergyID (typically every 60 seconds).
This is more efficient than traditional polling Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] , as it only sends data when there are new updates.
Send anything in Home Assistant to EnergyID for long term storage/graphing and detailed analysis.
Use EnergyID’s features to compare your energy usage against anonymized data from similar households and generate detailed reports.
Many more advantages of EnergyID and a brief intro can be found.
If you’re experiencing issues with your EnergyID integration, please try these general troubleshooting steps:
Verify that the linked entities from your Home Assistant are actually being updated and are not just stationary or stale. Not all entities send out changes frequently.
Make sure that your entities are correctly mapped in the integration settings.
Try reloading the EnergyID integration or even try reloading the integration of the entity which is not updating data in EnergyID
Be sure to check Home Assistant logs for any errors or issues, or turn on debugging for the integration to receive more info on its workings. Settings > System > Logs
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The EnergyID service was introduced in Home Assistant 2025.12, and it's used by
108 active installations.
Its IoT class is Cloud Push.
🥈 Silver quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@JrtPec
@Molier
Categories
Energy
Back to top
