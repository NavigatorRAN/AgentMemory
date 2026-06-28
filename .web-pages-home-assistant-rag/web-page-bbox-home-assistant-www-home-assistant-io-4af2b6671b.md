---
source_url: "https://www.home-assistant.io/integrations/bbox"
final_url: "https://www.home-assistant.io/integrations/bbox"
canonical_url: "https://www.home-assistant.io/integrations/bbox/"
source_handle: "web:www-home-assistant-io:4af2b6671b1a"
source_section: "integrations-bbox"
collection: "home-assistant-docs"
doc_type: "code-documentation"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "486020b2f7bc02c1e2be4ea8e9abf88487ce5ab7fe872493aee167c9b3fbb604"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "code-docs"
---

# Bbox - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/bbox
- Final URL: https://www.home-assistant.io/integrations/bbox
- Canonical URL: https://www.home-assistant.io/integrations/bbox/
- Fetched at: 2026-06-28T02:31:03Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Bouygues Bbox routers into Home Assistant.

## Extracted Text

On this page
Presence detection
Configuration
Sensor
Related topics
The Bbox integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] uses the Bbox Modem Router from the French Internet provider Bouygues Telecom. Sensors are mainly bandwidth measures.
There is currently support for the following device types within Home Assistant:
Presence Detection
Note
Due to third party limitation, the sensors will only be available if Home Assistant and the Bbox are on the same local area network. You can check this by going to 192.168.1.254 with your web browser.
The bbox integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] offers presence detection by looking at connected devices to a Bbox based router from Bouygues , which is one of the main Internet provider in France.
Bbox is a generic name for different hardware routers. The integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] has been tested with the following devices:
Sagem F@st 5330b
To use an Bbox router in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry device_tracker : - platform : bbox
Configuration Variables
Looking for your configuration file?
host string ( Optional , default: 192.168.1.254 )
IP address of your Bbox device.
Important
For now and due to third party limitation, the Bbox must be on the same local network as the Home Assistant installation.
See the device tracker integration page for instructions how to configure the people to be tracked.
To add Bbox sensors to your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
# Example configuration.yaml entry sensor : - platform : bbox monitored_variables : - down_max_bandwidth - up_max_bandwidth - current_down_bandwidth - current_up_bandwidth - uptime - number_of_reboots
name string ( Optional , default: Bbox )
Name to display in the frontend.
monitored_variables list Required
Sensors to display in the frontend.
down_max_bandwidth
Maximum bandwidth available for download.
up_max_bandwidth
Maximum bandwidth available for upload.
current_down_bandwidth
Instant measure of the current used bandwidth for download.
current_up_bandwidth
Instant measure of the current used bandwidth for upload.
uptime
Uptime since the last boot.
number_of_reboots
Number of reboot since the initial configuration of the router.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Bbox integration was introduced in Home Assistant 0.31, and it's used by
1 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Network
Back to top
