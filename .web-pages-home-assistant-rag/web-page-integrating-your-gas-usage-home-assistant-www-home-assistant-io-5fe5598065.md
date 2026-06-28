# Integrating your gas usage - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/docs/energy/gas
- Final URL: https://www.home-assistant.io/docs/energy/gas
- Canonical URL: https://www.home-assistant.io/docs/energy/gas/
- Fetched at: 2026-06-28T02:22:00Z
- Content type: text/html; charset=UTF-8

## Description

Learn how to add information about your gas usage to Home Assistant home energy management.

## Extracted Text

On this page
Hardware
Connect to your meter
Some homes are connected to gas. Gas is being used to heat water, cook and heat up the home.
Home Assistant allows you to track your gas usage and easily compare it against your energy usage for the same period of time.
Home Assistant will need to know the amount of gas that is being consumed.
The best way to get this data is directly from your gas meter that sits between your house and the grid. In certain countries these meters contain standardized ways of reading out the information locally or provide this information via the electricity meter.
Connect using a P1 port
The P1 port is a standardized port on electricity meters in the Netherlands, Belgium and Luxembourg which also provides gas consumption information. A P1 reader can connect to this port and receive real-time information.
We have worked with creator Marcel Zuidwijk to develop SlimmeLezer+ . It’s an affordable P1 reader powered by ESPHome that will seamlessly integrate this information in Home Assistant. It is being sold on his website and the firmware is open source on GitHub .
Read the gas meter using an AI-on-the-edge-device
AI-on-the-edge-device is a project running on an ESP32-CAM and can be fully integrated into Home Assistant using the Home Assistant Discovery Functionality of MQTT. It digitalizes your gas/water/electricity meter display and provides its data in various ways.
Read the gas meter using a magnetometer
Diaphragm/bellows gas meters are the most common type of gas meter, seen in almost all residential installations, and their movement can frequently be observed with a magnetometer. The QMC5883L and HMC5883L are common and inexpensive options that ESPHome supports. A project that makes it easy to use these magnetometers and calibrate them is this water-gas-meter project on GitHub .
Reading the meter wirelessly via RTL-SDR
In the United States and Canada, many electricity, gas, and water meters use AMR (Automatic Meter Reading) or ERT (Encoder Receiver Transmitter) protocols to wirelessly broadcast their readings. You can receive these broadcasts using an inexpensive RTL-SDR USB dongle and decode them with rtlamr , an open-source receiver for these protocols.
The community project rtlamr2mqtt packages this into a Home Assistant add-on that automatically publishes your meter readings via MQTT discovery, making them available in Home Assistant without any physical connection to the meter.
This approach can work with many Itron, Badger, and other AMR-compatible meters commonly deployed by US and Canadian utilities, but compatibility varies by meter model and region, and some meters use encryption. Check the rtlamr wiki to confirm that your specific meter type is supported.
Read the gas meter using a reed switch
Some diaphragm gas meters include a rotating magnet that can be detected externally. If your meter exposes this magnetic pulse, a reed switch or magnetic sensor can be used to count rotations and calculate gas consumption.
Community DIY projects such as Zigbee Gas Counter for nRF52840 use this approach to build a battery-powered Zigbee gas counter that works with Zigbee2MQTT and Home Assistant. The device keeps an internal cumulative counter, which helps avoid data loss if Home Assistant or the Zigbee coordinator is temporarily unavailable.
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
