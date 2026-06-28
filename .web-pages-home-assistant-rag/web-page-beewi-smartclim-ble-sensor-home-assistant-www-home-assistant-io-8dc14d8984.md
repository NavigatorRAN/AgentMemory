---
source_url: "https://www.home-assistant.io/integrations/beewi_smartclim"
final_url: "https://www.home-assistant.io/integrations/beewi_smartclim"
canonical_url: "https://www.home-assistant.io/integrations/beewi_smartclim/"
source_handle: "web:www-home-assistant-io:8dc14d898495"
source_section: "integrations-beewi-smartclim"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "5aa3f498ef6755d9e5cb5553df5edf8b057572415a47c03b9d8db2aa333221d3"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# BeeWi SmartClim BLE sensor - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/beewi_smartclim
- Final URL: https://www.home-assistant.io/integrations/beewi_smartclim
- Canonical URL: https://www.home-assistant.io/integrations/beewi_smartclim/
- Fetched at: 2026-06-28T02:31:05Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate MBeeWi SmartClim BLE sensor with Home Assistant.

## Extracted Text

On this page
Installation
Configuration
Full example
Related topics
The BeeWi SmartClim integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows one to monitor room or external temperature and humidity. The BeeWi SmartClim BLE is a Bluetooth Low Energy sensor device that monitors temperature from a room or a garden from your smartphone by using an APP. Use this integration to track these metrics from any location thanks to Home Assistant, as well as to create some automation scripts based on your room’s temperature.
Depending on the operating system you’re running, you have to configure the proper Bluetooth backend on your system:
beewi_smartclim will work out of the box as long as the host supports Bluetooth (like the Raspberry Pi does).
Using Home Assistant Container installation : Works out of the box with --net=host and properly configured Bluetooth on the host.
Start a scan to determine the MAC addresses of the sensor:
$ sudo hcitool lescan
LE Scan ...
D0:5F:B8:51:9B:36 BeeWi SmartClim
[ ...]
Or if your distribution is using bluetoothctl:
$ bluetoothctl
[ bluetooth]# scan on
Discovery started
[ CHG] Controller XX:XX:XX:XX:XX:XX Discovering: yes [ NEW] Device D0:5F:B8:51:9B:36 BeeWi SmartClim
Check for BeeWi SmartClim or similar entries, those are your sensor.
To use your Mi Temperature and Humidity sensor in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry sensor : - platform : beewi_smartclim mac : " xx:xx:xx:xx:xx:xx"
Configuration Variables
Looking for your configuration file?
mac string Required
The MAC address of your sensor.
name string ( Optional )
The name displayed in the frontend.
A full configuration example could look like the one below:
# Example configuration.yaml entry sensor : - platform : beewi_smartclim mac : " xx:xx:xx:xx:xx:xx" name : Garden
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The BeeWi SmartClim BLE sensor integration was introduced in Home Assistant 0.99, and it's used by
0 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@alemuro
Categories
Sensor
Back to top
