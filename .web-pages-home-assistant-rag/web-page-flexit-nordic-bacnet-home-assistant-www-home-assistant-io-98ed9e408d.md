---
source_url: "https://www.home-assistant.io/integrations/flexit_bacnet"
final_url: "https://www.home-assistant.io/integrations/flexit_bacnet"
canonical_url: "https://www.home-assistant.io/integrations/flexit_bacnet/"
source_handle: "web:www-home-assistant-io:98ed9e408dc4"
source_section: "integrations-flexit-bacnet"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "bf88b545a1c3c343bb3a92aee779b540a96c7539c91834167b7c3bdd29e7a4c0"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Flexit Nordic (BACnet) - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/flexit_bacnet
- Final URL: https://www.home-assistant.io/integrations/flexit_bacnet
- Canonical URL: https://www.home-assistant.io/integrations/flexit_bacnet/
- Fetched at: 2026-06-28T02:43:13Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Flexit air handling unit into Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Platforms
Climate
Sensor
Binary sensor
Number
Switch
A note about shutting down the device
Data updates
Removing the integration
To remove an integration instance from Home Assistant
Integrates Flexit Nordic series air handling unit into Home Assistant.
Your Flexit device should be equipped with an ethernet port, and no additional modules should be required. This integration communicates with the BACnet protocol over Ethernet.
To configure the integration, you need to obtain the IP address and Device ID for the unit.
Open the Flexit Go app on your mobile.
On the main screen, select the Find product button.
Select your device and select Connect .
Enter the installer code (default: 1000) and select Login .
Go to More > Installer > Communication > BACnet settings .
Note down the IP address and Device ID .
To add the Flexit Nordic (BACnet) device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Flexit Nordic (BACnet) .
Follow the instructions on screen to complete the setup.
IP address
The IP address of your Flexit Nordic device.
Device ID
The Device ID of your Flexit Nordic device. This is usually 2.
This integration supports the following platforms.
The integration adds an entity for climate with controls for preset ventilation modes and fan mode. It also has state for temperatures.
The integration adds entities for sensors with different readings from the device. There is currently support for the following sensors:
Outside air temperature
Supply air temperature
Exhaust air temperature
Extract air temperature
Room temperature
Fireplace ventilation remaining duration
Rapid ventilation remaining duration
Supply air fan control signal
Supply air fan
Exhaust air fan control signal
Exhaust air fan
Electric heater power
Air filter operating time
Heat exchanger efficiency
Heat exchanger speed
The integration adds an entity for a binary sensor called Air filter polluted which tells if it’s time to change the filters in the unit.
The integration adds entities for setting setpoints for the fan in the respective mode:
Away
Home
Fireplace
High
Cooker hood
The integration adds entities for setting remaining time in minutes for:
Fireplace mode runtime (in minutes)
The integration adds the following switches:
Electric heater that controls the heating element in the unit.
Fireplace mode that enables or disables the Fireplace mode.
Flexit recommends that the function to turn off the unit is not made accessible in the interface for an ordinary user. It will therefore be removed from the integration in the future.
The consequences of shutting down the unit can be costly and extensive. For example, there can be condensation issues in freezing temperatures, and rotary heat exchangers can freeze.
If you need to shut down the unit, make sure to take all necessary precautions, such as securing the system with frost protection dampers.
Furthermore, Flexit recommends unplugging the unit from the power socket before replacing a filter. To prevent damage, always initiate a controlled shutdown from the control panel (or, in the future, from an action in Home Assistant) before unplugging the device.
The integration polls Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] data from the Flexit device every 60 seconds by default. This interval is not configurable.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Flexit Nordic (BACnet) device was introduced in Home Assistant 2024.1, and it's used by
181 active installations.
Its IoT class is Local Polling.
🥈 Silver quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@lellky
@piotrbulinski
Categories
Back to top
