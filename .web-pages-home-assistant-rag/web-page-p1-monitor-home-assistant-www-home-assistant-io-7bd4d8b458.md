---
source_url: "https://www.home-assistant.io/integrations/p1_monitor"
final_url: "https://www.home-assistant.io/integrations/p1_monitor"
canonical_url: "https://www.home-assistant.io/integrations/p1_monitor/"
source_handle: "web:www-home-assistant-io:7bd4d8b45815"
source_section: "integrations-p1-monitor"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "8351fe1d0ecee58c99b79fe048cbe39c59f4e86cbba6febf73a90a04ab7fe305"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# P1 Monitor - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/p1_monitor
- Final URL: https://www.home-assistant.io/integrations/p1_monitor
- Canonical URL: https://www.home-assistant.io/integrations/p1_monitor/
- Fetched at: 2026-06-28T03:07:09Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate P1 Monitor within Home Assistant.

## Extracted Text

On this page
Configuration
Data updates
Sensors
SmartMeter
Phases
WaterMeter
Settings
Removing the integration
To remove an integration instance from Home Assistant
The P1 Monitor integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to gather data from your P1 Monitor device and use it in Home Assistant.
P1 Monitor is a piece of software that can be installed on a Raspberry Pi or other Linux-based system. It reads the data from your smart meter via the serial port (P1), such as your energy consumption, but also that of gas or a water meter.
Note
If you’re not using P1 Monitor software, you’re likely looking for the DSMR Smart Meter integration, which connects directly to DSMR-compatible smart meters.
To add the P1 Monitor device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select P1 Monitor .
Follow the instructions on screen to complete the setup.
Host
The IP address or hostname of your P1 Monitor instance.
Port
The port number of your P1 Monitor instance. The default port is 80 .
The integration will poll your P1 Monitor instance every 5 seconds to update the data in Home Assistant.
The P1 Monitor platform mainly provides sensors that you can use in your energy dashboard .
Read out what your meter readings are for energy consumption/yield, see what your current power consumption is and in which tariff period you are currently.
Gas Consumption (m3)
Power Consumption / Production (W)
Energy Consumption Low/High (kWh)
Energy Production Low/High (kWh)
Energy Tariff Period (low / high)
By default, the gas consumption entity is disabled. To use it, you need to enable it.
See per phase what your voltage, current and power consumption/production is.
Voltage phases L1/2/3 (V)
Current Phases L1/2/3 (A)
Power consumed phases L1/2/3 (W)
Power Produced phases L1/2/3 (W)
Important
You need to run at least version 1.1.0 of P1 Monitor, to use a water meter.
See how much water you consume per day, in total and the number of counted pulses.
Water Consumption - day (liters)
Water Consumption - total (m3)
Pulse Count
You can use the rates set in P1 Monitor for your calculations in Home Assistant.
Gas Consumption Price
Energy Consumption Price Low/High
Energy Production Price Low/High
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The P1 Monitor device was introduced in Home Assistant 2021.9, and it's used by
344 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@klaasnicolaas
Categories
Energy
Back to top
