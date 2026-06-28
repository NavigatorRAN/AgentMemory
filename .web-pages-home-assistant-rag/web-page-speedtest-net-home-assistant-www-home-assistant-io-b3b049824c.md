---
source_url: "https://www.home-assistant.io/integrations/speedtestdotnet"
final_url: "https://www.home-assistant.io/integrations/speedtestdotnet"
canonical_url: "https://www.home-assistant.io/integrations/speedtestdotnet/"
source_handle: "web:www-home-assistant-io:b3b049824ced"
source_section: "integrations-speedtestdotnet"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "ac8f381bcb27117402d225124dcf8a82eee03c3a7a52807e150e0c06d6451dd0"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Speedtest.net - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/speedtestdotnet
- Final URL: https://www.home-assistant.io/integrations/speedtestdotnet
- Canonical URL: https://www.home-assistant.io/integrations/speedtestdotnet/
- Fetched at: 2026-06-28T03:18:28Z
- Content type: text/html; charset=UTF-8

## Description

How to integrate Speedtest.net within Home Assistant.

## Extracted Text

On this page
Configuration
Integration sensors
Examples
Using as a trigger in an automation
Notes
The Speedtest.net integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] uses the Speedtest.net web service to measure network bandwidth performance.
To add the Speedtest.net service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Speedtest.net .
Follow the instructions on screen to complete the setup.
Most Speedtest.net servers require TCP port 8080 outbound to function. Without this port open you may experience significant delays or no results at all. See note on their help page .
By default, a speed test will be run every hour. You can disable polling using system options and use the update_entity action to automate the speed test frequency.
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
The following sensors are added by the integration:
sensors:
Ping sensor: Reaction time in ms of your connection (how fast you get a response after you’ve sent out a request).
Download sensor: The download speed (Mbit/s).
Upload sensor: The upload speed (Mbit/s).
This integration uses speedtest-cli to gather network performance data from Speedtest.net.
Please be aware of the potential inconsistencies that this integration may display.
In this section you will find some real-life examples of how to use this integration.
# Example configuration.yaml entry automation : - alias : Turn On Green Light When Download Speed Is Good description : >- This automation turns on the Yeelight bulb with a green color when the download speed exceeds 10 megabits per second. It ensures that the light is an indicator of the health of your network connection. triggers : - trigger : template value_template : " {{ states('sensor.speedtest_download') | float >= 10 }}" actions : - action : light.turn_on target : entity_id : light.yeelight_bulb data : rgb_color : [ 0 , 100 , 0 ] - alias : Turn On Red Light When Download Speed Is Poor description : >- This automation turns on the Yeelight bulb with a red color when the download speed drops below 10 megabits per second. It ensures that the light is an indicator of the health of your network connection. triggers : - trigger : template value_template : " {{ states('sensor.speedtest_download') | float < 10 }}" actions : - action : light.turn_on target : entity_id : light.yeelight_bulb data : rgb_color : [ 255 , 0 , 0 ]
When running on Raspberry Pi the maximum speed is limited by the LAN adapter. The Raspberry Pi 3+ models come with a Gigabit LAN adapter which supports a maximum throughput of 300 Mbit/s.
Running this integration can have negative effects on the system’s performance as it requires a fair amount of memory.
If run frequently, this integration can use a considerable amount of data. Frequent updates should be avoided on bandwidth-capped connections.
While the speedtest is running your network capacity is fully utilized. This may have a negative effect on other devices using the network such as gaming consoles or streaming boxes.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Speedtest.net service was introduced in Home Assistant 0.13, and it's used by
6.3% of the active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@rohankapoorcom
@engrbm87
Categories
Sensor
System monitor
Back to top
