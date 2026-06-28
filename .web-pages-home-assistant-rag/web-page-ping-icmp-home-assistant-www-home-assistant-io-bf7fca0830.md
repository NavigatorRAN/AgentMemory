---
source_url: "https://www.home-assistant.io/integrations/ping"
final_url: "https://www.home-assistant.io/integrations/ping"
canonical_url: "https://www.home-assistant.io/integrations/ping/"
source_handle: "web:www-home-assistant-io:bf7fca083055"
source_section: "integrations-ping"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "dc5e555e9575965c11cc8b42d61bb1f41dacfd958afaefbd98658c2946b35691"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Ping (ICMP) - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/ping
- Final URL: https://www.home-assistant.io/integrations/ping
- Canonical URL: https://www.home-assistant.io/integrations/ping/
- Fetched at: 2026-06-28T03:08:14Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Ping (ICMP)-based into Home Assistant.

## Extracted Text

On this page
Configuration
Polling interval
Defining a custom polling interval
Integration options
Binary sensor
Sensors
Presence detection
There is currently support for the following device types within Home Assistant:
To add the Ping (ICMP) service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Ping (ICMP) .
Follow the instructions on screen to complete the setup.
By default, the integration will ping the device every 30 seconds.
If you wish to do a ping at a different interval, you can disable the automatic refresh in the integration’s system options (Enable polling for updates) and create your own automation with your desired frequency.
For more detailed steps on how to define a custom interval, follow the procedure below.
If you want to define a specific interval at which your device is being polled for data, you can disable the default polling interval and create your own polling automation.
To add the automation:
Go to Settings > Devices & services , and select your integration.
On the integration entry, select the .
Then, select System options and toggle the button to disable polling.
To define your custom polling interval, create an automation.
Go to Settings > Automations & scenes and create a new automation.
Define any trigger and condition you like.
Select Add action , then select Other actions .
Select Perform action , and from the list, select the homeassistant.update_entity action .
Add the entities you want to poll to the Entity field. The homeassistant.update_entity action only supports targeting by entity. Selecting an area, device, or label is not supported.
Save your new automation to poll for data.
It is possible to change some behaviors through the integration options.
To change the settings, go to Settings > Devices & services . Select the Ping integration, then select Configure .
Ping count : Number of echo requests to send to the target. The default is 5.
Consider home : Number of seconds that must elapse before considering a disconnected device “not at home”. The default is 180 seconds (3 minutes).
The ping binary sensor platform allows you to use ping to send ICMP echo requests. This way you can check if a given host is online and determine the round trip times from your Home Assistant instance to that system.
This sensor is enabled by default. The default polling interval is 30 seconds.
The integration exposes the different round trip times milliseconds as entities:
Round Trip Time Mean Deviation - the standard deviation
Round Trip Time Average - the average round trip time
Round Trip Time Minimum - the shortest round trip time
Round Trip Time Maximum - the longest round trip time
Jitter - the variation in round trip times
Packet loss - the percentage of missed ICMP replies
These entities are disabled by default and can be enabled in the UI if needed.
The ping device tracker platform offers presence detection by using ping to send ICMP echo requests. This can be useful when devices are running a firewall and are blocking UDP or TCP packets but responding to ICMP requests (like Android phones). This tracker doesn’t need to know the MAC address since the host can be on a different subnet. This makes this an option to detect hosts on a different subnet when nmap or other solutions don’t work since arp doesn’t work.
The device tracker is disabled by default and can be enabled in the UI.
Note
Please keep in mind that modern smart phones will usually turn off WiFi when they are idle. Simple trackers like this may not be reliable on their own.
See the person integration page for instructions on how to configure the people to be tracked.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Ping (ICMP) service was introduced in Home Assistant 0.43, and it's used by
7.1% of the active installations.
Its IoT class is Local Polling.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@jpbede
Categories
Network
Back to top
