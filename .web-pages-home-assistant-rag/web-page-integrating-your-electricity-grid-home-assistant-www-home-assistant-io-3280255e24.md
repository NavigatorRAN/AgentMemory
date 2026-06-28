# Integrating your electricity grid - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/docs/energy/electricity-grid
- Final URL: https://www.home-assistant.io/docs/energy/electricity-grid
- Canonical URL: https://www.home-assistant.io/docs/energy/electricity-grid/
- Fetched at: 2026-06-28T02:21:56Z
- Content type: text/html; charset=UTF-8

## Description

Learn how to add information about your electricity grid to Home Assistant home energy management.

## Extracted Text

On this page
Tariffs
Hardware
Connect to your meter
Using a CT clamp sensor
Data provided by your energy provider
Manual integration
Troubleshooting
Energy management is all about knowing how much energy you’re consuming, where it’s coming from and where it’s going.
Almost all houses are connected to the electricity grid which provides the energy your home will need. The energy usage is being tracked by your energy meter and is billed to you by your energy provider. Energy prices can differ based on a schedule or change according to market price.
It has become popular for energy utilities to split the price of energy based on time of the day; this is done in order to incentivise consumers to shift their power needs towards times where the grid has lower loads. These periods of time are commonly referred to as Peak and Off-Peak. They match periods when everyone is consuming energy (Peak) and periods when energy is abundant, but no one is using it (Off-Peak). Therefore, Peak energy is more expensive than Off Peak energy.
If you want to split energy usage into multiple tariffs, read this .
Home Assistant will need to know the amount of energy flowing through your meter. This data can be tracked in various ways.
The best way to get this data is directly from your electricity meter that sits between your house and the grid. In certain countries these meters contain standardized ways of reading out the information locally.
Connect using a P1 port
The P1 port is a standardized port in the Netherlands, Belgium and Luxembourg. A P1 reader can connect to this port and receive real-time information.
We have worked with creator Marcel Zuidwijk to develop SlimmeLezer+ . It’s an affordable P1 reader powered by ESPHome that will seamlessly integrate this information in Home Assistant. It is being sold on his website and the firmware is open source on GitHub .
Connect via Zigbee Energy Profile
The Zigbee Energy Profile is a wireless energy standard to provide real-time information about electricity usage. This standard is available in some meters in the US, UK, Canada, and Australia. This is not “normal” Zigbee as implemented by Home Assistant but requires special certified hardware and often requires that the Zigbee connection be provisioned by your utility. As such, your utility, assuming they support this at all, will have a list of currently supported hardware.
The Rainforest Automation Eagle is one such device that implements this which supports a local API and is compatible with Home Assistant.
Reading the meter via a pulse counter
Many meters, including older ones, have an LED that will flash whenever energy passes through it. For example, each flash is a 1/1000th kWh. By monitoring the time between flashes it’s possible to determine the energy consumption.
We have developed Home Assistant Glow , an open source solution powered by ESPHome’s pulse meter sensor . You put it on top of the activity LED of your electricity meter and it will bring your consumption into Home Assistant.
Reading the meter via IEC62056-21
The IEC62056-21 is a common protocol not only for electric meters. It uses an infrared port to read data.
Aquaticus has created an ESPHome component for reading this data. PiggyMeter is a complete project that allows easy installation.
Using (Smart Message Language) interface
In countries like Germany, SML (Smart Message Language) is used typically. ESPHome’s SML (Smart Message Language) is one way to integrate it. If you prefer to integrate it via MQTT, sml2mqtt is another open source option.
Read the meter using an AI-on-the-edge-device
AI-on-the-edge-device is a project running on an ESP32-CAM and can be fully integrated into Home Assistant using the Home Assistant discovery functionality of MQTT. It digitalizes your gas/water/electricity meter display and provides its data in various ways.
Reading the meter wirelessly via RTL-SDR
In the United States and Canada, many electricity, gas, and water meters use AMR (Automatic Meter Reading) or ERT (Encoder Receiver Transmitter) protocols to wirelessly broadcast their readings. You can receive these broadcasts using an inexpensive RTL-SDR USB dongle and decode them with rtlamr , an open-source receiver for these protocols.
The community project rtlamr2mqtt packages this into a Home Assistant add-on that automatically publishes your meter readings via MQTT discovery, making them available in Home Assistant without any physical connection to the meter.
This approach can work with many Itron, Badger, and other AMR-compatible meters commonly deployed by US and Canadian utilities, but compatibility varies by meter model and region, and some meters use encryption. Check the rtlamr wiki to confirm that your specific meter type is supported.
Current transformer (CT) clamp sensors measure your energy usage by looking at the current passing through an electrical wire. This makes it possible to calculate the energy usage. In Home Assistant we have support for off-the-shelf CT clamp sensors or you can build your own.
The off-the-shelf solution that we advise is the Shelly EM . The device has a local API, updates are pushed to Home Assistant and it has a high quality integration .
You can build your own using ESPHome’s CT Clamp Current sensor or energy meter sensors like the ATM90E32 . For the DIY route, check out this video by digiblur to get started.
Using a Raspberry Pi, you can use a CT clamp HAT from LeChacal called RPICT hats . They can be stacked to expand the number of lines to monitor. They also provide Active, Apparent, and Reactive power and power factor for single-phase and three-phase installations. They integrate with Home Assistant using MQTT.
Attention! Installing CT clamp sensor devices requires opening your electrical cabinet. This work should be done by someone familiar with electrical wiring and may require a licensed professional in some regions. Your qualified installer will know how to do this.
Disclaimer: Some links in this section are affiliate links.
Some energy providers will provide you real-time information about your usage and have this data integrated into Home Assistant.
If you manually integrate your sensors, for example, using the MQTT or Template integrations: Make sure you set and provide the device_class , state_class , and unit_of_measurement for those sensors.
If you are unable to select your energy or power sensor in the grid consumption drop-down, make sure that its value is being recorded in the Recorder settings.
Energy integrations
Disclaimer: Some links on this page are affiliate links helping support the Home Assistant project.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View given feedback
Documentation
Overview
|
FAQ
Glossary
Automations
Dashboards
Voice assistants
Organization
Home energy management
Electricity grid
Solar panels
Home batteries
Gas usage
Water usage
Individual devices
Templating
Common tasks
Configuration
Authentication
Tools and helpers
iOS and Android apps
Official hardware
Home Assistant Green
Home Assistant Connect ZBT-1
Home Assistant Connect ZBT-2
Home Assistant Connect ZWA-2
Home Assistant Yellow
Home Assistant Voice Preview Edition
Back to top
