---
source_url: "https://www.home-assistant.io/integrations/greeneye_monitor"
final_url: "https://www.home-assistant.io/integrations/greeneye_monitor"
canonical_url: "https://www.home-assistant.io/integrations/greeneye_monitor/"
source_handle: "web:www-home-assistant-io:64e6577fd672"
source_section: "integrations-greeneye-monitor"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "1f245c7fe870bcf72ed1d95da7fa4816e23f35e1451490c93088611d0dcbe0ee"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# GreenEye Monitor (GEM) - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/greeneye_monitor
- Final URL: https://www.home-assistant.io/integrations/greeneye_monitor
- Canonical URL: https://www.home-assistant.io/integrations/greeneye_monitor/
- Fetched at: 2026-06-28T02:47:29Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate your GreenEye Monitor within Home Assistant.

## Extracted Text

On this page
Related topics
The GreenEye Monitor (GEM) integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] for Home Assistant allows you to create sensors for the various data channels of the GEM. Each current transformer (CT) channel, pulse counter, and temperature sensor appears in Home Assistant as a sensor, and can be used in automations.
Configure your GEM(s) to produce binary-format packets (for example, “Bin32 NET” for a 32-channel GEM with some channels configured for net metering) and send them to an unused port on your Home Assistant machine. (These settings are in the “Packet Send” and “Network” pages of the GEM UI.) Then specify that port and information about your monitor(s) and the data channels you wish to monitor in your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry greeneye_monitor : port : 8000 monitors : - serial_number : " YOUR_SERIAL_NUMBER" channels : - number : 1 name : total_power - number : 2 name : solar_panels_power net_metering : true pulse_counters : - number : 1 name : sprinklers_water_usage counted_quantity : " gal" counted_quantity_per_pulse : 1 time_unit : " min" temperature_sensors : temperature_unit : " C" sensors : - number : 1 name : back_porch_temperature voltage : - number : 1 name : house_volts
By default, GEM will send updates every 5 seconds. That’s a lot of data, and the databases used by the recorder integration for history don’t do well with that much data, so it is recommended to configure the influxdb integration and exclude the GEM sensors from recorder .
Configuration Variables
Looking for your configuration file?
port string Required
The port on which Home Assistant should listen for packets from your GEM. Must match the port set in the “Network” tab of the GEM setup UI.
monitors list ( Optional )
The list of monitors that should appear in Home Assistant. Data from other monitors will be ignored.
serial_number string Required
Your 8-digit GEM serial number, as it appears in the UI.
channels list ( Optional )
The list of channels that should appear in Home Assistant for this monitor. Data from other channels will be ignored.
number integer Required
The channel number as it appears in the GEM UI.
name string Required
The name that should be used for this channel’s sensor in Home Assistant.
net_metering boolean ( Optional , default: false )
Set to true if the channel is configured for net metering in the GEM, otherwise false .
voltage ( Optional )
Configuration for voltage sensor
A channel number that exists in the GEM. There is only one voltage sensor on current models of the GEM.
The name that should be used for the voltage sensor in Home Assistant.
temperature_sensors ( Optional )
Configuration for temperature sensors
temperature_unit string Required
The unit of measure to use for the temperature (F or C)
sensors list Required
The list of temperature sensors that should appear in Home Assistant for this monitor. Data from other sensors will be ignored.
The sensor number as it appears in the GEM UI.
The name that should be used for this sensor in Home Assistant.
pulse_counters list ( Optional )
The list of pulse counters that should appear in Home Assistant for this monitor. Data from other pulse counters will be ignored.
The pulse counter’s number as it appears in the GEM UI.
The name that should be used for this pulse counter in Home Assistant.
counted_quantity string Required
The unit being counted by this pulse counter (e.g., gal, L)
counted_quantity_per_pulse float ( Optional , default: 1.0 )
The number of the counted quantity represented by each pulse.
time_unit string ( Optional , default: s )
The time unit to use when computing rates (s, min, or h)
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The GreenEye Monitor (GEM) integration was introduced in Home Assistant 0.82, and it's used by
1 active installations.
Its IoT class is Local Push.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@jkeljo
Categories
Energy
Hub
Sensor
Back to top
