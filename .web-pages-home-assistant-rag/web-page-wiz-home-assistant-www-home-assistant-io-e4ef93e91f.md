# WiZ - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/wiz
- Final URL: https://www.home-assistant.io/integrations/wiz
- Canonical URL: https://www.home-assistant.io/integrations/wiz/
- Fetched at: 2026-06-28T03:28:53Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on setting up WiZ within Home Assistant.

## Extracted Text

On this page
Configuration
Connect WiZ devices to your network
Enable local connectivity
Occupancy sensors
Power monitoring sensors
Effect speed
The WiZ integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control your WiZ lights and smart sockets.
The devices are set up through your Wi-Fi network and don’t need any additional bridge or gateway.
These devices have been sold under at least the following brands:
4Lite
AEG
Altair
Ansell
Atom Lighting
ATX LED
Brilliant
Designers Fountain
Evoluziona
Fischer & Honsel
Gauss
iDual
KSR
Laurie Lumiere
Lednify
Leyton
Liteline
Lutec
Philips Smart LED lights with WiZ Connected
Spex
SLV
Trenz
Trio
Wofi
The integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] can report the state of occupancy sensors that have been linked to a device.
To add the WiZ device to your Home Assistant instance, use this My button:
WiZ can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select WiZ .
Follow the instructions on screen to complete the setup.
To connect a WiZ device to your Wi-Fi network, please follow the instructions in the WiZ app (available for iOS and Android).
If you have further questions, please have a look at the WiZ Support Page .
The integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] needs to communicate locally with the WiZ device. This setting Allow local communication can be disabled or enabled in WiZ app.
This setting should be enabled by default.
Steps to enable:
Open the WiZ app on your phone.
Click on the settings menu in the upper-left corner.
Scroll down to the security settings.
Enable the switch Allow local communication .
The occupancy sensors will only be added once a motion event is detected. Home Assistant can detect the sensors if they turn on at least one device when the room is occupied, and turn off at least one device when the room is not occupied. Sensors that are not linked to a device cannot be detected.
When a device is linked to an occupancy sensor, by default, the sensor will be disabled for 30 minutes after manual control.
Devices linked to the occupancy sensor that was last controlled manually will show an unknown at startup. The state will be known the next time the light is controlled by the sensor.
A power monitoring sensor is available on devices with the following hardware modules:
ESP25_SOCKET_01
ESP20_SHDW_31R
ESP20_SHRGB_31R
ESP20_SHTW_31R
The speed of an effect can be controlled via a number entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] . The entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] will only be available when an effect has been set that allows the speed to be adjusted.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The WiZ device was introduced in Home Assistant 2022.3, and it's used by
4.2% of the active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@sbidy
@arturpragacz
Categories
Binary sensor
Fan
Light
Number
Sensor
Switch
Back to top
