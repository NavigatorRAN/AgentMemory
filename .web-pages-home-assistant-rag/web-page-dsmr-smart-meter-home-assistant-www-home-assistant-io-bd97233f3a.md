# DSMR Smart Meter - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/dsmr
- Final URL: https://www.home-assistant.io/integrations/dsmr
- Canonical URL: https://www.home-assistant.io/integrations/dsmr/
- Fetched at: 2026-06-28T02:38:15Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate DSMR smart meter within Home Assistant.

## Extracted Text

On this page
Configuration
Options
Supported meters
M-Bus support
Connecting to the meter
Technical overview
A sensor platform for Belgian, Dutch, Luxembourg and Swedish Smart Meters which comply to DSMR (Dutch Smart Meter Requirements), also known as ‘Slimme meter’ or ‘P1 poort’. Swedish meters with a ‘HAN port’ are not supported by this integration.
Currently support DSMR V2.2, V3, V4, V5, Belgian V5 variant, Luxembourg V5 variant (Smarty), Swedish V5 variant and the EasyMeter Q3D (Germany) through the dsmr_parser module by Nigel Dokter.
For official information about DSMR refer to: DSMR Document
For official information about the P1 port refer to: P1 Companion Standard
For unofficial hardware connection examples refer to: Domoticx
For official information about the Swedish variant refer to: Swedish specification .
For official information about the E.ON Hungary variant refer to: E.ON Hungary P1 port specification
Supports P1 cables integrated in a RFXtrx device .
For Belgian meters, choose DSMR version 5B
For Dutch meters, choose DSMR version 2.2 , 4 , or 5
For Luxembourg meters, choose DSMR version 5L
For Swedish meters, choose DSMR version 5S
For EasyMeter Q3D, choose DSMR version Q3D
For E-ON Hungary meters (and for most of other Hungarian meters), choose DSMR version 5EONHU
To configure options for DSMR integration go to Settings > Devices & services and press Options on the DSMR card.
Time between updates
Typically the smart meter sends new data every 5-10 seconds. This value defines the minimum time between entity updates in seconds. Setting this value to 0 will update entities each time data is received from the smart meter.
Important
Reducing the default time between updates will increase the amount of events generated and can potentially flood the system with events.
This integration is known to work for:
Iskra ME382 / MT382 (DSMR 2.2)
ISKRA AM550 (DSMR 5.0)
Landis+Gyr E350 (DSMR 4)
Landis+Gyr E360 (DSMR 5)*
Landis+Gyr ZCF110 / ZM F110 (DSMR 4.2)
Kaifa E0026
Kaifa MA304C (DSMR 4.2)
Kamstrup 382JxC (DSMR 2.2)
Sagemcom XS210 ESMR5
Sagemcom T211
Sagemcom MA304
Ziv E0058 ESMR5
EasyMeter Q3D
Remarks:
* The E360 requires a special P1 cable, various webstores sell these specific to the E360.
A smart meter can have multiple subdevices, also known as M-Bus devices.
For the DSMR version 5B, support was added for water and gas M-Bus devices. This means you can have up to 4 subdevices on your DSMR meter.
While previously only 1 gas meter was supported, there is now support for multiple gas and water meters.
Connection can be done directly to the meter via a USB to serial connector, or through a serial to network proxy.
It is also possible to connect to a RFXtrx device with an integrated P1 cables .
USB serial converters:
Cheap (Banggood/ebay) Generic PL2303
SOS Solutions
AliExpress
Docker users have to allow Docker access to the USB to serial converter by adding --device /dev/ttyUSB21:/dev/ttyUSB21 to the run command:
$ docker run --device /dev/ttyUSB0:/dev/ttyUSB0 -d --name="home-assistant" -v /home/USERNAME/hass:/config -v /etc/localtime:/etc/localtime:ro --net=host {{ site.installation.container }}
Serial to network proxies:
ser2net
Smart Meter bridge
WIZnet WIZ110SR
esp8266 SmartMeter (Poluket) (create for DSMR5 / ESMR5 Meter)
Smart Gateways NL
DIY solutions (ESP8266 based):
esp8266_p1meter (daniel-jong) (parse on ESP8266 publish to MQTT)
DSMR reader for ESPHome (mmakaay)
p1-esp8266 (DavyLandman) (turn ESP8266 into a serial forwarder)
Simple DSMR P1 Meter (maximevince)
To add the DSMR Smart Meter hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select DSMR Smart Meter .
Follow the instructions on screen to complete the setup.
Optional configuration example for ser2net 3.x.x:
# Example /etc/ser2net.conf for proxying USB/serial connections to DSMRv4 smart meters
2001:raw:600:/dev/ttyUSB0:115200 NONE 1STOPBIT 8DATABITS XONXOFF LOCAL -RTSCTS
or
# Example /etc/ser2net.conf for proxying USB/serial connections to DSMRv2.2 smart meters
2001:raw:600:/dev/ttyUSB0:9600 EVEN 1STOPBIT 7DATABITS XONXOFF LOCAL -RTSCTS
Optional configuration example for ser2net 4.x.x:
# Example /etc/ser2net.yaml for proxying USB/serial connections to DSMRv4 smart meters
connection: &con0096
accepter: tcp,2001
enable : on
options:
banner: * banner
kickolduser: true
telnet-brk-on-sync: true
connector: serialdev,
/dev/ttyUSB0,
115200n81,local
Optional configuration example for Smart Meter Bridge:
serial_port : " /dev/ttyUSB0" dsmr_version : " 4" server : port : 9988
DSMR is a standard to which Dutch smartmeters must comply. It specifies that the smartmeter must send out a ‘telegram’ every 10 seconds (every second for DSMR 5.0 devices) over a serial port.
The contents of this telegram differ between version but they generally consist of lines with ‘obis’ (Object Identification System, a numerical ID for a value) followed with the value and unit.
Smart meters in Belgium, Luxembourg and Sweden provided telegrams with largely the same contents.
This module sets up an asynchronous reading loop using the dsmr_parser module which waits for a complete telegram, parser it and puts it on an async queue as a dictionary of obis /object mapping. The numeric value and unit of each value can be read from the objects attributes. Because the obis are know for each DSMR version the Entities for this integration are create during bootstrap.
Another loop (DSMR class) is set up which reads the telegram queue, stores/caches the latest telegram and notifies the Entities that the telegram has been updated.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The DSMR Smart Meter hub was introduced in Home Assistant 0.34, and it's used by
1.1% of the active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@Robbie1221
Categories
Energy
Back to top
