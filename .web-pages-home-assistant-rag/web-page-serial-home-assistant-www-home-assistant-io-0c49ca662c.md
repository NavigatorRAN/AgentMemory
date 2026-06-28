# Serial - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/serial
- Final URL: https://www.home-assistant.io/integrations/serial
- Canonical URL: https://www.home-assistant.io/integrations/serial/
- Fetched at: 2026-06-28T03:15:11Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate data from serial connected sensors into Home Assistant.

## Extracted Text

On this page
Configuration
value_template for Template sensor
TMP36
Examples
Arduino
Devices returning multiple sensors as a text string
Digispark USB Development Board
The Serial integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] is using the data provided by a device connected to the serial port of the system where Home Assistant is running. With ser2net and socat would it also work for sensors connected to a remote system.
To check what kind of data is arriving at your serial port, use a command-line tool like minicom or picocom on Linux, on a macOS you can use screen or on Windows putty .
sudo minicom -D /dev/ttyACM0
To set up a serial sensor to your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry sensor : - platform : serial serial_port : /dev/ttyACM0
Configuration Variables
Looking for your configuration file?
serial_port string Required
Local serial port where the sensor is connected and access is granted.
name string ( Optional )
Friendly name to use for the frontend. Default to “Serial sensor”.
baudrate integer ( Optional , default: 9600 Bps )
Baudrate of the serial port.
bytesize integer ( Optional , default: 8 )
Number of data bits. Possible values: 5=FIVEBITS , 6=SIXBITS , 7=SEVENBITS , 8=EIGHTBITS .
parity string ( Optional , default: N )
Enable parity checking. Possible values: N=PARITY_NONE , E=PARITY_EVEN , O=PARITY_ODD , M=PARITY_MARK , S=PARITY_SPACE .
stopbits float ( Optional , default: 1 )
Number of stop bits. Possible values: 1=STOPBITS_ONE , 1.5=STOPBITS_ONE_POINT_FIVE , 2=STOPBITS_TWO .
xonxoff boolean ( Optional , default: false )
Enable software flow control.
rtscts boolean ( Optional , default: false )
Enable hardware (RTS/CTS) flow control.
dsrdtr boolean ( Optional , default: false )
Enable hardware (DSR/DTR) flow control.
value_template template ( Optional )
Defines a template to extract a value from the serial line.
" {{ (((states('sensor.serial_sensor') | float * 5 / 1024 ) - 0.5) * 100) | round(1) }}"
For controllers of the Arduino family, a possible sketch to read the temperature and the humidity could look like the sample below.The returned data is in JSON format and can be split into the individual sensor values using a template .
#include <ArduinoJson.h> void setup () { Serial . begin ( 115200 ); } void loop () { StaticJsonDocument < 100 > jsonBuffer ; jsonBuffer [ "temperature" ] = analogRead ( A0 ); jsonBuffer [ "humidity" ] = analogRead ( A1 ); serializeJson ( jsonBuffer , Serial ); Serial . println (); delay ( 1000 ); }
For devices that return multiple sensors as a concatenated string of values with a delimiter (that is, the returned string is not JSON formatted) you can make several template sensors, all using the same serial response. For example, a stream from the Sparkfun USB Weather Board includes temperature, humidity and barometric pressure within it returned text string. Sample returned data:
$ , 24 . 1 , 50 , 12 . 9 , 1029 . 83 , 0 . 0 , 0 . 00 , * $ , 24 . 3 , 51 , 12 . 8 , 1029 . 76 , 0 . 0 , 0 . 00 , *
To parse this into individual sensors, split using the comma delimiter and then create a template sensor for each item of interest.
# Example configuration.yaml entry sensor : - platform : serial serial_port : /dev/ttyUSB0 baudrate : 9600 template : sensor : - name : Temperature unit_of_measurement : " °C" state : " {{ states('sensor.serial_sensor').split(',')[1] | float(default=0) }}" - name : Humidity unit_of_measurement : " %" state : " {{ states('sensor.serial_sensor').split(',')[2] | float(default=0) }}" - name : Barometer unit_of_measurement : " mbar" state : " {{ states('sensor.serial_sensor').split(',')[4] | float(default=0) }}"
This blog post describes the setup with a Digispark USB Development Board.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Serial integration was introduced in Home Assistant 0.56, and it's used by
285 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@fabaff
Categories
Sensor
Back to top
