---
source_url: "https://www.home-assistant.io/integrations/prana"
final_url: "https://www.home-assistant.io/integrations/prana"
canonical_url: "https://www.home-assistant.io/integrations/prana/"
source_handle: "web:www-home-assistant-io:2e033af3fef9"
source_section: "integrations-prana"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "c2afb3143c4ce046318323c7ac8461379d4ef8177ff289f1ac067fa75d0029c1"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Prana - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/prana
- Final URL: https://www.home-assistant.io/integrations/prana
- Canonical URL: https://www.home-assistant.io/integrations/prana/
- Fetched at: 2026-06-28T03:09:02Z
- Content type: text/html; charset=UTF-8

## Description

Integration to control Prana recuperators.

## Extracted Text

On this page
Supported devices
Unsupported devices
Prerequisites
Configuration
Supported functionality
Entities
Data updates
Known limitations
Troubleshooting
Device is not discovered
Entities show as unavailable
Community notes
Removing the integration
To remove an integration instance from Home Assistant
Related links
The Prana recuperators integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you control your Prana recuperator. You can manage motors and their operating modes, and monitor a range of sensors provided by the device.
Use case: If you have a Prana recuperator and want to automate ventilation, monitor filter status, or integrate the recuperator with other Home Assistant automations, this integration helps you do that.
Devices with Wi‑Fi control and firmware version 49 or newer
Models without a local network interface
Devices with firmware version 48 or below
Connect the Prana recuperator to the same local network as Home Assistant.
To add the Prana device to your Home Assistant instance, use this My button:
Prana can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Prana .
Follow the instructions on screen to complete the setup.
The integration exposes the following entities.
Fans
The integration provides fan entities to control the recuperator’s speed and airflow.
Supply
Description : Controls the fresh air intake speed independently.
Extract
Description : Controls the exhaust air speed independently.
Note
When Bound mode is active, the Supply and Extract fans operate in sync. Adjusting the speed of one fan will automatically update the other to the same value, ensuring balanced airflow.
All fan entities support speed control (0-100%) and the following presets:
Night : Sets the device to silent, minimum speed operation.
Boost : Sets the device to maximum speed.
Switches
Auto
Description : Enable automatic control based on sensor readings.
Auto+
Description : Enhanced automatic mode with quieter operation limits.
Winter
Description : Winter mode to prevent icing and manage defrosting.
Heater
Description : Turn on the mini-heating element (if equipped).
Bound
Description : Synchronizes supply and extract fans. When enabled, you control the Bound fan. When disabled, you control Supply and Extract fans separately.
Numbers
The integration provides number entities to configure device settings.
Display brightness
Description : Adjusts the brightness of the device’s display panel. The value can be set on a scale from 0 to 6, where 0 turns the display off and 6 is the maximum brightness.
Sensors
The integration provides sensors to monitor air quality and environmental conditions.
Air quality and environmental sensors:
CO2
Description : Carbon dioxide concentration in the room.
Unit : ppm (parts per million)
VOC
Description : Volatile Organic Compounds level (indoor air pollution).
Humidity
Description : Relative humidity level inside the room.
Unit : % (relative humidity)
Air pressure
Description : Current atmospheric pressure.
Unit : mmHg (millimeters of mercury)
Inside temperature
Description : Temperature of the air extracted from the room.
Unit : °C
Inside temperature 2
Description : Temperature of the incoming air after it has been warmed by the heat exchanger.
Outside temperature
Description : Fresh outdoor air temperature before entering the unit.
Outside temperature 2
Description : Temperature of the exhaust air after it has passed through the heat exchanger.
Some sensors may not appear in Home Assistant if your specific Prana model does not have the corresponding sensors.
The integration uses local polling. By default, Home Assistant polls the device every 10 seconds. If the device stops responding, entities are marked as unavailable until communication is restored.
No official support for some older Prana models.
Some indicators or device-specific details may only be available in the manufacturer’s app.
This integration does not provide cloud or remote control.
Make sure Home Assistant and the Prana device are on the same local network.
Restart the device and Home Assistant.
Check whether mDNS/LLMNR is allowed by your router.
Check the device network connection.
Ensure the device is powered on and reachable; entities become available automatically when communication is restored.
For fans, remember that supply and extract fans become unavailable when Bound mode is active (and vice versa). This is expected behavior.
If you have a model that does not work as expected, add a note in the repository or community and include the model and firmware version.
This integration follows standard integration removal in Home Assistant.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
After you remove the integration from Home Assistant, we recommend checking the device settings in the Prana Online 2.0 app.
Prana
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Prana device was introduced in Home Assistant 2026.2, and it's used by
113 active installations.
Its IoT class is Local Polling.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@prana-dev-official
Back to top
