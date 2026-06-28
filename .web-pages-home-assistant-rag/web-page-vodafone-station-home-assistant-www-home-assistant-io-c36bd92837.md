---
source_url: "https://www.home-assistant.io/integrations/vodafone_station"
final_url: "https://www.home-assistant.io/integrations/vodafone_station"
canonical_url: "https://www.home-assistant.io/integrations/vodafone_station/"
source_handle: "web:www-home-assistant-io:c36bd92837af"
source_section: "integrations-vodafone-station"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "f319c22a84fe0dd6b37ee93ae902f58499d21b49d0626f3c7af949fe6809c7b8"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Vodafone Station - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/vodafone_station
- Final URL: https://www.home-assistant.io/integrations/vodafone_station
- Canonical URL: https://www.home-assistant.io/integrations/vodafone_station/
- Fetched at: 2026-06-28T03:27:05Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Vodafone Station routers into Home Assistant.

## Extracted Text

On this page
Supported devices
Tested models
Configuration
Options
Supported functionality
Examples
Automation: reconnect / get new IP every night
Automation: notify connected device not home
Automation: notify router CPU usage too high
Data updates
Additional info
Device tracker
Troubleshooting
Can’t set up the device
Removing the integration
To remove an integration instance from Home Assistant
The Vodafone Station integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control your Vodafone Station based router.
The integration provides information about your internet connection and the connected devices.
The integration supports models from the following brands: Sercomm, Technicolor, UltraHub.
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] was tested against the following models:
Homeware (custom OpenWrt):
Vodafone Ultra Hub Pro II (DGM4980VDF) - United Kingdom
Vodafone Vox30 WiFi Hub (THG3000) - United Kingdom
Sercomm:
Vodafone Power Station (SHG3000) - Italy
Vodafone Power Station WiFi 6 (SHG3060) - Italy
Vodafone WiFi 6 Station (RHG3006) - Italy
Vodafone Gigabox (SHG3000) - Ireland (supplied by Vodafone Ireland )
Vodafone H300S - Greece
Technicolor:
Vodafone Power Station (THG3000) - Germany
Vodafone WiFi 6 Station (CGA6444VF) - Germany
UltraHub:
Vodafone Ultra Hub 7 Fibre - FG4278VF
To add the Vodafone Station hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Vodafone Station .
Follow the instructions on screen to complete the setup.
host
The IP address of the Vodafone Station router.
username
The username of the Vodafone Station router.
password
The password of the Vodafone Station router.
To define options for Vodafone Station, follow these steps:
In Home Assistant, go to Settings > Devices & services .
If multiple instances of Vodafone Station are configured, choose the instance you want to configure.
On the card, select the cogwheel .
If the card does not have a cogwheel, the integration does not support options for this device.
Edit the options, then select Submit to save the changes.
consider home
Number of seconds that must elapse before considering a disconnected device “not at home”.
There is support for the following platform types within Home Assistant:
Button - restart router, dsl/fiber/internet key connections.
Device tracker - presence detection by looking at connected devices.
Image - generate QR code for Guest Wi-Fi.
Sensor - external IP address, uptime, firmware, resources and network monitors.
Switch - enable/disable main and guest Wi-Fi.
automation : - alias : " Reconnect Vodafone Station (Fiber)" triggers : - trigger : time at : " 05:00:00" actions : - action : button.press target : entity_id : button.vodafone_station_xxxx_reconnect_fiber
automation : - alias : " Apple TV disconnect" triggers : - platform : state entity_id : device_tracker.appletv to : " not_home" actions : - action : notify.send_message target : entity_id : notify.my_device data : message : " TV lost network connection"
automation : - alias : " Vodafone Station CPU high cpu usage" triggers : - platform : numeric_state entity_id : sensor.vodafone_station_xxxx_cpu_usage above : 80 actions : - action : notify.send_message target : entity_id : notify.my_device data : message : " Router CPU above 80%."
This integration polls Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] data from the device every 30 seconds by default.
Note : If you don’t want to automatically track newly detected devices, disable the integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] system option Enable new added entities .
Symptom: “User already logged-in”
When trying to set up the integration, the form shows the message “User already logged-in”.
Description
This means that there is already a logged session to the Vodafone Station router.
Resolution
To resolve this issue, log out from all active sessions, or, if the session was abruptly closed, wait for the router timeout (usually 60 seconds).
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Vodafone Station hub was introduced in Home Assistant 2023.9, and it's used by
174 active installations.
Its IoT class is Local Polling.
🏆 Platinum quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@paoloantinori
@chemelli74
Categories
Button
Image
Presence detection
Sensor
Switch
Back to top
