---
source_url: "https://www.home-assistant.io/integrations/fronius"
final_url: "https://www.home-assistant.io/integrations/fronius"
canonical_url: "https://www.home-assistant.io/integrations/fronius/"
source_handle: "web:www-home-assistant-io:77e878e2f994"
source_section: "integrations-fronius"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "352cfa64b6bc6aa2b54286b4514af1948182e431f04f5edd1ccab7fe6b8e248f"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Fronius - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/fronius
- Final URL: https://www.home-assistant.io/integrations/fronius
- Canonical URL: https://www.home-assistant.io/integrations/fronius/
- Fetched at: 2026-06-28T02:44:34Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to connect your Fronius SolarAPI devices to Home Assistant.

## Extracted Text

On this page
Supported devices
Prerequisites
Configuration
Monitored data
Energy dashboard
Feed in path meter
Consumption path meter
Example automation
Note
Known limitations
Troubleshooting
Can’t set up the device
Some devices are missing after setup or restart of Home Assistant
Some entities are missing after setup
Removing the integration
To remove an integration instance from Home Assistant
The Fronius integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] polls a Fronius solar inverter or datalogger for details of a Fronius SolarNet setup and integrate it in your Home Assistant installation.
The integration supports all inverters with integrated Datamanager or external “Datalogger Web” providing the Fronius SolarAPI (JSON) interface of version v0 or v1 . This includes among others:
Agilo
Eco
Galvo
Gen24
IG Plus
Primo
Symo
Symo Hybrid
Tauro
Verto (Plus)
Devices connected to those inverters or dataloggers are supported as well.
Energy meter (Fronius Smart Meter or S0 meter connected to the inverter)
Ohmpilot
Storage
You should either set a static IP or assign a static DHCP lease for the Fronius device, or alternatively access it through the local DNS name if your network is configured accordingly.
For Gen24 devices (delivered with Firmware >= 1.14.1) make sure to activate “Solar API” in the inverters web interface. For older devices, Solar API should be enabled by default.
To add the Fronius hub to your Home Assistant instance, use this My button:
Fronius can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Fronius .
Follow the instructions on screen to complete the setup.
Host
The host name or the IP address of the device.
Each device adds a set of sensors to Home Assistant.
SolarNet device
Logger information
General information about the Fronius Datalogger. Not available on “Gen24” devices.
Updated every hour.
Serial number, software and hardware platforms
Current price of energy consumed and returned to grid and the CO₂ factor as set in the Dataloggers settings
Power flow
Cumulative data of the SolarNet system.
Updated every 10 seconds.
Energy produced on the current day, year and total produced energy
Power fed to the grid (if positive) or consumed from the grid (if negative)
Power load as a generator (if positive) or consumer (if negative)
Battery charging power (if positive) or discharging power (if negative) and information about backup or standby mode
Photovoltaic production
Current relative self-consumption of produced energy
Current relative autonomy
Inverter
The energy produced on the current day, year (not for Gen24 devices), and total produced energy, power, current, voltage, frequency, and status for an individual inverter.
Updated every minute.
Meter
Detailed information about power, current, and voltage, if supported, split among the phases.
Detailed information about energy, power, and temperature of your Ohmpilots.
Detailed information about current, voltage, state, cycle count, capacity and more about installed batteries.
When an endpoint is not responding correctly the update interval will increase to 10 minutes (3 minutes for power flow) until valid data is received again. This reduces the number of requests to Fronius devices using night mode (shutdown when no PV power is produced).
Recommended energy dashboard configuration:
For “Solar production” :
If no battery is connected to an inverter: Add each inverters Energy total entity.
If a battery is connected to an inverter: Use Riemann sum over SolarNet Power photovoltaics entity.
“Battery systems” energy values aren’t supported directly by the Solar API. Use Riemann sum to integrate SolarNet Power battery charge and SolarNet Power battery discharge into energy values (kWh).
For “Devices” use the Ohmpilots Energy consumed entity.
The energy meter integrated with Fronius devices can be installed (and configured) in two different installation positions: “feed in path” (grid interconnection point) or “consumption path” .
Recommended energy dashboard configuration for meter location in feed in path:
For “Grid consumption” use the meters Energy real consumed entity.
For “Return to grid” use the meters Energy real produced entity.
Recommended energy dashboard configuration for meter location in consumption path:
Use Riemann sum to integrate SolarNet Power grid import and SolarNet Power grid export entities into energy values (Wh or kWh).
Use these energy entities for Grid consumption and Return to grid in the energy dashboard configuration.
The following automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] toggles a switch when the solar production crosses certain thresholds:
description : " Turn on switch when PV power is above 1000 W and turn it off below 50 W." mode : single triggers : - trigger : state entity_id : - sensor.solarnet_power_photovoltaics conditions : [] actions : - choose : - conditions : - condition : numeric_state entity_id : sensor.solarnet_power_photovoltaics above : 1000 sequence : - action : switch.turn_on metadata : {} data : {} target : entity_id : switch.swtest - conditions : - condition : numeric_state entity_id : sensor.solarnet_power_photovoltaics below : 50 sequence : - action : switch.turn_off metadata : {} data : {} target : entity_id : switch.swtest
Fronius often provides firmware updates for the datamanager interfaces and the devices in their system, it’s recommended to check and apply them regularly. This integration relies on functionality present in rather recent firmware.
The Solar API used by this integration is read-only. It does not provide any means to control the Fronius devices. Most Fronius devices however do support Modbus TCP directly, so the Modbus integration could be leveraged to control the devices from Home Assistant. Details about Modbus Registers can be found in the devices documentation or at the Fronius website .
Make sure the device is not in a power-saving mode when currently not producing energy.
Make sure the device is connected to the network and is reachable from the Home Assistant instance.
Check the device’s settings to ensure that the Solar API is enabled.
Make sure inverters are not in a power-saving mode when currently not producing energy - or wait until they start producing energy.
Some data, like photovoltaic production, is only provided by the Fronius device when non-zero.
When the integration is added at night, there might be no entities added providing photovoltaic related data. Entities will be added on sunrise, when the Fronius devices begin to provide more data.
This integration can be removed by following these steps:
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Fronius hub was introduced in Home Assistant 0.96, and it's used by
1.8% of the active installations.
Its IoT class is Local Polling.
🏆 Platinum quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@farmio
Categories
Energy
Sensor
Back to top
