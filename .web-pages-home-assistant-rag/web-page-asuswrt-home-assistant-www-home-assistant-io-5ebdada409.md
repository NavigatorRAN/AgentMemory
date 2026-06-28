---
source_url: "https://www.home-assistant.io/integrations/asuswrt"
final_url: "https://www.home-assistant.io/integrations/asuswrt"
canonical_url: "https://www.home-assistant.io/integrations/asuswrt/"
source_handle: "web:www-home-assistant-io:5ebdada409d0"
source_section: "integrations-asuswrt"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "b6ebb1493be9bbeae2a6bde184b981d728a4e0ad2bc16b3020f5e23696ab684a"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# ASUSWRT - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/asuswrt
- Final URL: https://www.home-assistant.io/integrations/asuswrt
- Canonical URL: https://www.home-assistant.io/integrations/asuswrt/
- Fetched at: 2026-06-28T02:29:34Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate ASUSWRT into Home Assistant.

## Extracted Text

On this page
Configuration
Sensors configuration
Options
Padavan custom firmware (The rt-n56u project)
The ASUSWRT integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] can connect Home Assistant to a ASUS router that runs on ASUSWRT firmware.
There is currently support for the following device types within Home Assistant:
Presence Detection - The ASUSWRT platform offers presence detection by looking at connected devices to a ASUSWRT based router.
Sensor - The ASUSWRT sensors platform allows you to get information from your ASUS router within Home Assistant.
To add the ASUSWRT hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select ASUSWRT .
Follow the instructions on screen to complete the setup.
Important
You need to enable telnet on your router if you choose to use protocol: telnet .
These sensors are automatically created and associated to the router device:
Connected devices sensor
Download sensor (unit_of_measurement: Gigabyte - Daily accumulation )
Download Speed sensor (unit_of_measurement: Mbit/s)
Upload sensor (unit_of_measurement: Gigabyte - Daily accumulation )
Upload Speed sensor (unit_of_measurement: Mbit/s)
Load average sensors (1min, 5min, 15min)
Temperature sensors (2 GHz, 5 GHz, 6 GHz, CPU). Only temperature sensors available on your router will be created.
If the integration is configured to use the http(s) protocol, also the following sensors will be available:
CPU usage sensors (percentage for total and single core)
Memory usage sensor (percentage)
Free memory sensor (Megabyte)
Memory used sensor (Megabyte)
Last boot sensor (Timestamp)
Uptime sensor (HH:MM:SS)
By default, the integration will create enabled Device Tracker entities for devices that HA already knows about via some other integration. The ASUSWRT integration will create disabled device_tracker entities for other devices on the network, and the user can enable them manually in the Home Assistant GUI: go to Settings > Devices & services > Entities. Filter on Integrations = ASUSWRT. Filter on Status = Disabled. Now you should see the disabled device_tracker entities and you can enable them one at a time as desired.
To define options for ASUSWRT, follow these steps:
In Home Assistant, go to Settings > Devices & services .
If multiple instances of ASUSWRT are configured, choose the instance you want to configure.
On the card, select the cogwheel .
If the card does not have a cogwheel, the integration does not support options for this device.
Edit the options, then select Submit to save the changes.
Consider home
Number of seconds that must elapse before considering a disconnected device not at home .
Track unknown
Enable this option to track also devices that do not have a name. Name will be replaced by mac address.
Interface
The interface that you want statistics from (e.g. eth0,eth1 etc).
Dnsmasq
The location in the router of the dnsmasq.leases file.
Require IP
If devices must have IP (this option is available only for access point mode).
Note
If you don’t want to automatically track new detected device, disable the integration system option Enable new added entities
The rt-n56u project does not store dnsmasq.leases which is used to track devices at /var/lib/misc/ as asuswrt do. However this integration can still be used for the rt-n56u project by changing the dnsmasq location using the dnsmasq variable to dnsmasq: '/tmp'
Also, to get the statistics for the WAN port, specify interface: 'eth3' as this is the interface used in the rt-n56u project
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The ASUSWRT hub was introduced in Home Assistant 0.83, and it's used by
1% of the active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@kennedyshead
@ollo69
@Vaskivskyi
Categories
Hub
Presence detection
Sensor
Back to top
