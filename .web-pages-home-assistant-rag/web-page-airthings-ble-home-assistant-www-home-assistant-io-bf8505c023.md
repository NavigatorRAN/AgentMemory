---
source_url: "https://www.home-assistant.io/integrations/airthings_ble"
final_url: "https://www.home-assistant.io/integrations/airthings_ble"
canonical_url: "https://www.home-assistant.io/integrations/airthings_ble/"
source_handle: "web:www-home-assistant-io:bf8505c023e8"
source_section: "integrations-airthings-ble"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "2edb80e4c2630fe289bfda34106538af0f8a7ebd28523b0948eceffc096fd882"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Airthings BLE - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/airthings_ble
- Final URL: https://www.home-assistant.io/integrations/airthings_ble
- Canonical URL: https://www.home-assistant.io/integrations/airthings_ble/
- Fetched at: 2026-06-28T02:26:47Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up Airthings Devices over Bluetooth LE.

## Extracted Text

On this page
Configuration
Supported devices
Sensors
Removing the integration
To remove an integration instance from Home Assistant
Integrates Airthings BLE sensors Sensors return information about a thing, for instance the level of water in a tank. [Learn more] into Home Assistant.
Airthings provide different devices A device is a model representing a physical or logical unit that contains entities. for measuring the air quality. Initially focusing on radon gas sensors, each device provides several different sensors to monitor typical contaminants whose presence contributes to bad air quality in the home.
Requires Airthings hardware and a compatible Bluetooth dongle.
To add the Airthings BLE device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Airthings BLE .
Follow the instructions on screen to complete the setup.
The Airthings BLE integration will automatically discover devices once the Bluetooth integration is enabled and functional. This will include the device name and its serial number.
There are two ways of retrieving the 10-digit serial number of an Airthings device:
At the back of the device, located under the magnetic backplate.
Airthings app: Device settings -> Device info -> Serial Number
This integration uses the last 6 digits of the serial number.
Wave gen. 1
Wave Radon
Wave Mini
Wave Plus
Wave Enhance
Corentium Home 2
Sensor entities added to Home Assistant, depending on the device model:
Humidity
Illuminance
Pressure (relative depending on home elevation)
Radon 1-day and longterm average, as well as levels
Temperature
VOC
Co2
Battery
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Airthings BLE device was introduced in Home Assistant 2022.11, and it's used by
2336 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@vincegio
@LaStrada
Categories
Environment
Health
Sensor
Back to top
