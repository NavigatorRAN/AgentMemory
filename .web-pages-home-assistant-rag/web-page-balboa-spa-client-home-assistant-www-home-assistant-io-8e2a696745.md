# Balboa Spa Client - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/balboa
- Final URL: https://www.home-assistant.io/integrations/balboa
- Canonical URL: https://www.home-assistant.io/integrations/balboa/
- Fetched at: 2026-06-28T02:30:51Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Balboa Spa WiFi within Home Assistant.

## Extracted Text

On this page
Compatible hardware
Configuration
Options
Known limitations
Debugging integration
The Balboa Spa Client integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] adds support for Balboa Spa WiFi Modules to be used within Home Assistant.
There is currently support for the following device types within Home Assistant:
Binary sensor (Filter cycles and circulation pumps)
Climate
Event (Last known fault, if any)
Fan (Pumps/Jets)
Light
Select (Low/high temperature range)
Switch (Enable/disable filter cycle 2)
Time (Set filter cycle start/end times)
Balboa Spa Client integration support local control of hot tub spas equipped with a Balboa BP system and a bwa™ Wi-Fi Module (50350).
Balboa Spa Client integration is not compatible with ControlMySpa™ cloud API used by Balboa ControlMySpa Gateway Ultra (59303).
To add the Balboa Spa Client device to your Home Assistant instance, use this My button:
Balboa Spa Client can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Balboa Spa Client .
Follow the instructions on screen to complete the setup.
host
Hostname or IP address of your Balboa Spa Wifi Device, for example 192.168.1.58 .
To define options for Balboa Spa Client, follow these steps:
In Home Assistant, go to Settings > Devices & services .
If multiple instances of Balboa Spa Client are configured, choose the instance you want to configure.
On the card, select the cogwheel .
If the card does not have a cogwheel, the integration does not support options for this device.
Edit the options, then select Submit to save the changes.
sync_time
Sync the Spa’s internal clock with Home Assistant daily
The WiFi Module is a direct connection to the control panel of the spa. Certain combinations of settings are not possible due to limitations of the spa.
Turning on certain pumps, depending on the spa configuration, may cause other pumps to come online as well.
The spa WiFi Module will need to be configured initially by the phone app to authenticate and get an IP on your network.
The WiFi Module will automatically disconnect from Home Assistant periodically, and then be automatically reconnected. The disconnect is built-in to the hardware.
If you have problems with Balboa or the integration you can add debug prints to the log.
logger : default : info logs : pybalboa : debug homeassistant.components.balboa : debug
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Balboa Spa Client device was introduced in Home Assistant 2021.12, and it's used by
486 active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@garbled1
@natekspencer
Categories
Binary sensor
Fan
Select
Back to top
