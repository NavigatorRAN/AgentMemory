---
source_url: "https://www.home-assistant.io/integrations/bluetooth_le_tracker"
final_url: "https://www.home-assistant.io/integrations/bluetooth_le_tracker"
canonical_url: "https://www.home-assistant.io/integrations/bluetooth_le_tracker/"
source_handle: "web:www-home-assistant-io:978655de8e60"
source_section: "integrations-bluetooth-le-tracker"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "5f61fb9e615668e6498c741b39820faee7ceccb878d0f20466a1a9b0cbb5b919"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Bluetooth LE Tracker - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/bluetooth_le_tracker
- Final URL: https://www.home-assistant.io/integrations/bluetooth_le_tracker
- Canonical URL: https://www.home-assistant.io/integrations/bluetooth_le_tracker/
- Fetched at: 2026-06-28T02:31:59Z
- Content type: text/html; charset=UTF-8

## Description

Instructions for integrating bluetooth low-energy tracking within Home Assistant.

## Extracted Text

On this page
Setup
Configuration
Related topics
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] discovers new devices on boot and in regular intervals and tracks Bluetooth low-energy devices periodically based on interval_seconds value. It is not required to pair the devices with each other.
Devices discovered are stored with ‘BLE_’ as the prefix for device mac addresses in known_devices.yaml .
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] requires the Bluetooth integration to be enabled and functional.
To use the Bluetooth tracker in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry device_tracker : - platform : bluetooth_le_tracker
Configuration Variables
Looking for your configuration file?
track_new_devices boolean ( Optional , default: false )
If new discovered devices are tracked by default.
track_battery boolean ( Optional , default: false )
Whether the integration should try to read the battery status for tracked devices.
track_battery_interval time ( Optional , default: 24:00:00 )
Minimum interval between battery status checks for tracked devices. The battery status is checked at most once per interval. Ignored if track_battery is false . Accepts a time period, for example, "01:00:00" for one hour, or a mapping nested under track_battery_interval , for example track_battery_interval: followed by days: 1 on the next indented line.
interval_seconds integer ( Optional , default: 12 )
Seconds between each scan for new devices.
As some BT LE devices change their MAC address regularly, a new device is only discovered when it has been seen 5 times.
Some BTLE devices, such as fitness trackers, are only visible to the devices that they are paired with. In this case, the BTLE tracker won’t see this device.
Enabling the battery tracking might slightly decrease the duration of the battery, but since this is only done at most once a day, this shouldn’t be noticeable. Not all devices offer battery status information; if the information is not available, the integration will only try once at startup.
For additional configuration variables check the Device tracker page .
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Bluetooth LE Tracker integration was introduced in Home Assistant 0.27, and it's used by
1035 active installations.
Its IoT class is Local Push.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Presence detection
Back to top
