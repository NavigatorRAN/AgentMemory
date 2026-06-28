# Nibe Heat Pump - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/nibe_heatpump
- Final URL: https://www.home-assistant.io/integrations/nibe_heatpump
- Canonical URL: https://www.home-assistant.io/integrations/nibe_heatpump/
- Fetched at: 2026-06-28T03:03:13Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate a Nibe Heat Pump into Home Assistant.

## Extracted Text

On this page
Configuration
Connection Methods
UDP Gateway using NibeGw
Modbus Connection
The Nibe Heat Pump integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control and monitor Nibe Heat Pumps in Home Assistant.
Supported devices:
F1145/F1245
F1155/F1255
S1155/S1255
F1345
F1355
S2125
S320/S325
S330/S332
F370
F470
F730
S735
F750
S1156
S1255
S1256
SMO40
SMOS40
VVM225/VVM320/VVM325
VVM310/VVM500
To add the Nibe Heat Pump device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Nibe Heat Pump .
Follow the instructions on screen to complete the setup.
To communicate with the pump there are a few different connection methods available depending on hardware. At the moment the following methods are supported.
ESPHome
Arduino
Raspberry Pi / Linux
TCP/IP
RCU
The heat pump exposes an RS485 interface for communication with extensions. This can be used to speak to the pump by emulating the Nibe MODBUS40 accessory.
Since the pump will go into an error state if the accessory is not responding, dedicated hardware running a gateway software is the preferable choice.
This can be built using a Raspberry Pi with an RS485 hat, an Arduino with RS485 support or an ESP32 with RS485 converters.
An ESPHome base hardware solution also works well, and integrate nicely into Home Assistant.
Homepage
An Arduino-based solution has been tested by OpenHAB community with Arduino uno + RS485 and Ethernet shields. The ProDiNo NetBoards are also supported. A ProDiNo has an Ethernet and RS-485 port on the board.
Documentation from OpenHAB
Source code in OpenHAB Contrib
A standard Linux application for running the Nibe Gateway software is also available.
Home Assistant support connecting to Nibe heat pumps over Modbus over either TCP or RCU like connections. When connecting to the pump inside a Home Assistant, the Modbus connection string must be specified.
The newer S-series pump exposes a built-in TCP Modbus server that can be used to communicate with the pump. To enable support for this integration, the pump must be connected to your local network and network (5.2 - Network settings) and Modbus (7.5.9 - Modbus TCP/IP) must be enabled. More details on the Modbus support in the pump can be found in Nibe document M12676EN .
tcp://[IP OR HOSTNAME]
tcp://[IP OR HOSTNAME]:502
If your system is equipped with a MODBUS40 accessory, this can be used to control your pump. To connect Home Assistant to the MODBUS40 accessory, a RS485 USB dongle is needed, which can be locally connected to your Home Assistant system, or on a separate computer exposed via ser2net
serial://[DEVICE PATH] for direct local connection
rfc2217://[IP OR HOSTNAME]:[PORT] for a ser2net type proxy
Note
Support for RCU-based communication is currently untested.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Nibe Heat Pump device was introduced in Home Assistant 2022.10, and it's used by
929 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@elupus
Categories
Climate
Back to top
