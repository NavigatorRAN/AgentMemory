---
source_url: "https://www.home-assistant.io/integrations/starlink"
final_url: "https://www.home-assistant.io/integrations/starlink"
canonical_url: "https://www.home-assistant.io/integrations/starlink/"
source_handle: "web:www-home-assistant-io:334b6f214b55"
source_section: "integrations-starlink"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "cb9043b36cda6f33feb7d5fbd7ca7f65b3d8205fdda19d62771e4dbed6a76812"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Starlink - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/starlink
- Final URL: https://www.home-assistant.io/integrations/starlink
- Canonical URL: https://www.home-assistant.io/integrations/starlink/
- Fetched at: 2026-06-28T03:18:49Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Starlink into Home Assistant.

## Extracted Text

On this page
Configuration
Sensors
Binary sensors
Buttons
Switches
Device trackers
Times
The Starlink integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to integrate your Starlink into Home Assistant.
Important: If your Starlink is in bypass mode, you will need to open a route to it so that the local API can be accessed. Otherwise this integration will not work.
To add the Starlink device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Starlink .
Follow the instructions on screen to complete the setup.
Ping - The ping that Starlink has measured, in ms
Ping drop rate - The percentage of failed ping requests (aka “dropped”). This is the inverse of “Uptime” in the Starlink app.
Azimuth - The direction Dishy is facing in degrees
Elevation - Dishy’s current elevation in degrees
Last restart - The time Starlink was last turned on
Uplink throughput - The amount of data being uploaded through user terminal
Downlink throughput - The amount of data being downloaded through user terminal
Upload - Total number of bytes uploaded through user terminal
Download - Total number of bytes downloaded through user terminal
Power - Last measured power, in W
Energy - Energy consumption, in kWh
Connected - Whether Starlink is connected to the Internet
Update available - Whether there is an update pending install
Roaming mode - Whether Starlink is “roaming”. Roaming is an optional upgrade that allows you to use your Starlink outside of your home address (also known as “portability mode”)
Diagnostic sensors
Obstructed - Whether Dishy is currently obstructed
Heating - Whether Dishy is currently heating. This may be due to cold temperatures, or an attempt to thaw snow and ice
Sleep - Whether Starlink is “sleeping”, as per the schedule defined in the Starlink app
Mast near vertical - Whether Dishy is mounted straight
Motors stuck - Whether Dishy is unable to move
Slow ethernet - Whether the Ethernet link is at max (gigabit) speed
Thermal throttle - Whether Starlink has reduced performance to avoid overheating
Unexpected location - Whether Starlink has detected operation outside of its designated area
Restart - Restart your user terminal
Stowed - Controls whether Dishy is stowed
Sleep schedule - Controls whether Starlink will enter a power-saving sleep mode at a predefined schedule
Device location - Tracks the latitude, longitude, and altitude of Dishy. You need to allow location access on the local network via the Starlink app for this to work. This is disabled by default in the Starlink app and is thus disabled by default in Home Assistant.
Sleep start - The time at which Starlink will enter sleep mode, if “Sleep Schedule” is enabled
Sleep end - The time at which Starlink will exit sleep mode, if “Sleep Schedule” is enabled
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Starlink device was introduced in Home Assistant 2023.2, and it's used by
2663 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Binary sensor
Button
Device tracker
Network
Sensor
Switch
Time
Back to top
