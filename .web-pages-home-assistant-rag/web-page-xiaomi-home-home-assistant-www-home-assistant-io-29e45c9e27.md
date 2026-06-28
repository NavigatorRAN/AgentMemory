# Xiaomi Home - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/xiaomi_miio
- Final URL: https://www.home-assistant.io/integrations/xiaomi_miio
- Canonical URL: https://www.home-assistant.io/integrations/xiaomi_miio/
- Fetched at: 2026-06-28T03:29:39Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Xiaomi devices using the Xiaomi Home integration within Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Troubleshooting
Xiaomi Gateway
Supported Xiaomi gateway models
Gateway features
Supported subdevices
Recognized subdevices (not yet implemented)
Xiaomi device tracker (Xiaomi Mi WiFi Repeater 2)
Xiaomi Air Purifier, Air Humidifier and Standing Fan
Air Purifier Pro (zhimi.airpurifier.v6)
Air Purifier Pro V7 (zhimi.airpurifier.v7)
Air Purifier MA2 (zhimi.airpurifier.ma2)
Air Purifier 2S (zhimi.airpurifier.mc1)
Air Purifier 3/3H (2019) (zhimi.airpurifier.ma4, zhimi.airpurifier.mb3)
Air Purifier Pro H, Pro H EU (zhimi.airpurifier.va1, zhimi.airpurifier.vb2)
Air Purifier 3C (zhimi.airpurifier.mb4, zhimi.airp.mb4a)
Air Purifier ZA1 (zhimi.airpurifier.za1)
Air Purifier V3 (zhimi.airpurifier.v3)
Air Purifier 4/4 PRO (zhimi.airp.mb5, zhimi.airp.vb4)
Air Fresh A1 (dmaker.airfresh.a1)
Air Fresh VA2
Air Fresh VA4
Air Fresh T2017 (dmaker.airfresh.t2017)
Air Humidifier (zhimi.humidifier.v1)
Air Humidifier CA (zhimi.humidifier.ca1)
Air Humidifier CA (zhimi.humidifier.ca4)
Air Humidifier CB (zhimi.humidifier.cb1)
Air Humidifier JSQ/JSQ1/MJJSQ (deerma.humidifier.jsq, deerma.humidifier.jsq1, deerma.humidifier.mjjsq)
Standing Fan 1X (dmaker.fan.p5)
Standing Fan (zhimi.fan.za1, zhimi.fan.za3, zhimi.fan.za4, zhimi.fan.sa1)
DC Pedestal Fan (zhimi.fan.v2, zhimi.fan.v3)
Standing Fan 1C (dmaker.fan.1c)
Tower Fan/Standing Fan 2/Standing Fan Pro (dmaker.fan.p9, dmaker.fan.p10, dmaker.fan.p11, dmaker.fan.p18)
Standing Fan 3 (zhimi.fan.za5)
Actions
Xiaomi Air Quality Monitor
Xiaomi IR Remote
Setup
Configuring the Platform
Full Configuration
Add command as entity button to a dashboard
Use named commands to create UI buttons
Command Types
Raw
Pronto Hex Code
remote.send_command
Xiaomi Mi Robot Vacuum
Buttons
Sensors
Attributes
Example on how to clean a specific room
Example on how to reset maintenance hours (brushes, filter, sensors)
Retrieving Zoned Cleaning Coordinates
Using FloleVac (Android)
Using RoboRock Control Center (requires Valetudo firmware)
Retrieving Room numbers
Xiaomi Philips Light
Features
Philips LED Ball Lamp, Philips Zhirui LED Candle Lamp and Philips Zhirui Downlight
Philips LED Ceiling Lamp
Philips Eyecare Smart Lamp 2
Philips Zhirui Desk Lamp
Philips Moonlight Bedside Lamp
Xiaomi Smart WiFi Socket and Smart Power Strip
Xiaomi Smart WiFi Socket
Xiaomi Chuangmi Plug V1
Xiaomi Smart Power Strip
Xiaomi Air Conditioning Companion V3
List of actions
Retrieving the Access Token
Xiaomi Cloud Tokens Extractor
Xiaomi Home app (Xiaomi Aqara Gateway, Android & iOS)
Using Get Mi Home Devices Token App
Alternative methods
Android (not rooted)
Linux and Rooted Android
iOS
Bluestacks
Miio command line tool
The Xiaomi Home integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] supports the following devices:
Most Xiaomi Home devices support configuration using the Home Assistant UI,
except for the Xiaomi device tracker
and Xiaomi IR Remote . Please read the linked sections for those devices for more information.
Devices need to be set up using the Mi Home app and not vendor-specific apps (for example, Roborock).
Note
For more complex network setups (for example, VLANs), reference the following documentation for additional information.
To add the Xiaomi Home hub to your Home Assistant instance, use this My button:
Xiaomi Home can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Xiaomi Home .
Follow the instructions on screen to complete the setup.
It is recommended to supply your Xiaomi Home credentials during configuration
to automatically connect to your devices. You need to specify the server region
you used in the Xiaomi Home App (where you initially set up the device). There are
6 servers: cn , de , i2 , ru , sg and us ; please see
this page for
the server to use for each country.
The most common problems are:
Xiaomi Home devices do not communicate across subnets/VLANs due to the source address of the UDP packet not belonging to the subnet of the device itself, more information and solutions .
Roborock vacuums need to be connected to the Xiaomi Home app, not the Roborock app, more information .
Blocking the network access to the device is known to cause intermittent connection issues due to the device’s internal software hanging and a watchdog restarting the internal software, more information .
The Xiaomi Home integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control the gateway and its connected subdevices.
The following list shows the Gateway name, the model number, the Zigbee ID, and whether the model is supported or not in Home Assistant.
Chinese version
Model: DGNWG02LM
Zigbee ID: lumi.gateway.v3
Supported: Yes
European version
Model: ZHWG11LM-763 / DGNWQ05LM
Zigbee ID: lumi.gateway.mieu01
Supported: Yes (Xiaomi Home credentials needed)
Aqara hub
Model: ZHWG11LM
Zigbee ID: lumi.gateway.aqhm01
Mijia Zigbee 3.0
Model: ZNDMWG03LM
Zigbee ID: lumi.gateway.mgl03
Aqara AC Companion
Model: KTBL01LM
Zigbee ID: lumi.acpartner.v1
Supported: Untested
Mi AC Companion
Model: KTBL02LM
Zigbee ID: lumi.acpartner.v2
Model: KTBL11LM
Zigbee ID: lumi.acpartner.v3
Some gateways (lumi.gateway.mieu01) do not support getting the connected subdevices locally. For those gateways, Xiaomi Home credentials can be specified during the config flow and the “Use Xiaomi Home service to get connected subdevices” can be enabled in the options flow (after setting up the integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] , click Configuration in the sidebar, then click Integrations and then click Options on the already set up Xiaomi Home integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] ). The connected subdevices will then be retrieved from Xiaomi Home (internet), control and status updates of those subdevices will then further take place over local network connection. A re-authentication flow may be triggered when no account credentials are provided yet and are needed for that particular gateway model.
Gateway alarm control (Turn on/off; see status armed_away , disarmed , arming )
Gateway light control (Turn on/off; change brightness; change color; see status)
Gateway illuminance sensor readout (illuminance value in lux)
Not yet implemented features (but possible):
Gateway internet radio (only chinese stations)
Gateway ringtones/sounds
These subdevices are fully implemented in Home Assistant:
Weather sensor (WSDCGQ01LM)
Zigbee ID: lumi.sensor_ht
Features: readout temperature and humidity
Weather sensor (WSDCGQ11LM)
Zigbee ID: lumi.weather.v1
Features: readout temperature , humidity and pressure
Wall switch single (QBKG11LM)
Zigbee ID: lumi.ctrl_ln1
Features: load_power, status, turn_on, turn_off, toggle
Zigbee ID: lumi.ctrl_ln1.aq1
Wall switch no neutral (QBKG04LM)
Zigbee ID: lumi.ctrl_neutral1.v1
Features: status, turn_on, turn_off, toggle
Wall switch double (QBKG12LM)
Zigbee ID: lumi.ctrl_ln2
Zigbee ID: lumi.ctrl_ln2.aq1
Wall switch double no neutral (QBKG03LM)
Zigbee ID: lumi.ctrl_neutral2
D1 wall switch triple (QBKG26LM)
Zigbee ID: lumi.switch.n3acn3
D1 wall switch triple no neutral (QBKG25LM)
Zigbee ID: lumi.switch.l3acn3
Wall outlet (QBCZ11LM)
Zigbee ID: lumi.ctrl_86plug.v1
Zigbee ID: lumi.ctrl_86plug.aq1
Plug (ZNCZ02LM)
Zigbee ID: lumi.plug
Relay (LLKZMK11LM)
Zigbee ID: lumi.relay.c2acn01
Smart bulb E27 (ZNLDP12LM)
Zigbee ID: lumi.light.aqcn02
Features: on/off, brightness, color temperature
IKEA smart bulb E27 white (LED1545G12)
Zigbee ID: ikea.light.led1545g12
IKEA smart bulb E27 white (LED1546G12)
Zigbee ID: ikea.light.led1546g12
IKEA smart bulb E12 white (LED1536G5)
Zigbee ID: ikea.light.led1536g5
IKEA smart bulb GU10 white (LED1537R6)
Zigbee ID: ikea.light.led1537r6
IKEA smart bulb E27 white (LED1623G12)
Zigbee ID: ikea.light.led1623g12
IKEA smart bulb GU10 white (LED1650R5)
Zigbee ID: ikea.light.led1650r5
IKEA smart bulb E12 white (LED1649C5)
Zigbee ID: ikea.light.led1649c5
These subdevices are recognized by the python-miio code but are still being worked on (not yet implemented).
The list shows the device name, the model number, and the Zigbee ID.
Button (WXKG01LM): lumi.sensor_switch
Button (WXKG11LM 2015): lumi.sensor_switch.aq2
Button (WXKG12LM): lumi.sensor_switch.aq3
Button (WXKG11LM 2018): lumi.remote.b1acn01
Cube (MFKZQ01LM): lumi.sensor_cube.v1
Cube (MFKZQ01LM): lumi.sensor_cube.aqgl01
Motion sensor (RTCGQ01LM): lumi.sensor_motion
Motion sensor (RTCGQ11LM): lumi.sensor_motion.aq2
Door sensor (MCCGQ01LM): lumi.sensor_magnet
Door sensor (MCCGQ11LM): lumi.sensor_magnet.aq2
Vibration sensor (DJT11LM): lumi.vibration.aq1
Honeywell smoke detector (JTYJ-GD-01LM/BW): lumi.sensor_smoke
Honeywell natural gas detector (JTQJ-BF-01LM/BW): lumi.sensor_natgas
Water leak sensor (SJCGQ11LM): lumi.sensor_wleak.aq1
Remote switch single (WXKG03LM 2016): lumi.sensor_86sw1.v1
Remote switch single (WXKG03LM 2018): lumi.remote.b186acn01
D1 remote switch single (WXKG06LM): lumi.remote.b186acn02
Remote switch double (WXKG02LM 2016): lumi.sensor_86sw2.v1
Remote switch double (WXKG02LM 2018): lumi.remote.b286acn01
D1 remote switch double (WXKG07LM): lumi.remote.b286acn02
Curtain (ZNCLDJ11LM): lumi.curtain
Curtain (ZNGZDJ11LM): lumi.curtain.aq2
Curtain B1 (ZNCLDJ12LM): lumi.curtain.hagl04
Door lock S1 (ZNMS11LM): lumi.lock.aq1
Door lock S2 (ZNMS12LM): lumi.lock.acn02
Door lock S2 pro (ZNMS13LM): lumi.lock.acn03
Vima cylinder lock (A6121): lumi.lock.v1
Thermostat S2 (KTWKQ03ES): lumi.airrtc.tcpecn02
The device tracker platform is observing your Xiaomi Mi WiFi Repeater 2 and reporting all associated WiFi clients.
Please follow the instructions on Retrieving the Access Token to get the API token.
To add a Xiaomi Mi WiFi Repeater device tracker to your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
device_tracker : - platform : xiaomi_miio host : 192.168.130.73 token : YOUR_TOKEN
Configuration Variables
Looking for your configuration file?
host string Required
The IP address of your Xiaomi device.
token string Required
The API token of your Xiaomi device.
The Air Purifiers, Air Humidifiers and Standing Fans use multiple platforms to allow you to set the control modes and settings of the device.
Supported devices:
The list includes device name, model number (if available), and model.
Air Purifier : zhimi.airpurifier.v1
Air Purifier 2 (FJY4006CN): zhimi.airpurifier.v2
Air Purifier V3 : zhimi.airpurifier.v3
Air Purifier V5 : zhimi.airpurifier.v5
Air Purifier Pro : zhimi.airpurifier.v6
Air Purifier Pro V7 : zhimi.airpurifier.v7
Air Purifier 2 (mini) : zhimi.airpurifier.m1
Air Purifier (mini) : zhimi.airpurifier.m2
Air Purifier MA1 : zhimi.airpurifier.ma1
Air Purifier MA2 : zhimi.airpurifier.ma2
Air Purifier 2S : zhimi.airpurifier.mc1
Air Purifier Super : zhimi.airpurifier.sa1
Air Purifier Super 2 : zhimi.airpurifier.sa2
Air Purifier 3 (2019) (AC-M6-SC) : zhimi.airpurifier.ma4
Air Purifier 3H (2019) : zhimi.airpurifier.mb3
Air Purifier Pro H : zhimi.airpurifier.va1
Air Purifier Pro H EU : zhimi.airpurifier.vb2
Air Purifier 3C : zhimi.airpurifier.mb4
Air Purifier 3C : zhimi.airp.mb4a
Air Purifier ZA1 : zhimi.airpurifier.za1
Air Purifier 4 (AC-M16-SC) : zhimi.airp.mb5
Air Purifier 4 PRO (AC-M15-SC) : zhimi.airp.vb4
Air Fresh A1 (MJXFJ-150-A1) : dmaker.airfresh.a1
Air Fresh VA2 : zhimi.airfresh.va2
Air Fresh VA4 : zhimi.airfresh.va4
Air Fresh T2017 (MJXFJ-300-G1) : dmaker.airfresh.t2017
Air Humidifier : zhimi.humidifier.v1
Air Humidifier CA1 : zhimi.humidifier.ca1
Air Humidifier CA4 : zhimi.humidifier.ca4
Air Humidifier CB1 : zhimi.humidifier.cb1
Air Humidifier JSQ : deerma.humidifier.jsq
Air Humidifier JSQ1 : deerma.humidifier.jsq1
Air Humidifier MJJSQ : deerma.humidifier.mjjsq
Standing Fan 1X : dmaker.fan.p5
Inverter Pedestal Fan : zhimi.fan.za1
Standing Fan 2 : zhimi.fan.za3
Standing Fan 2S : zhimi.fan.za4
Standing Fan : zhimi.fan.sa1
DC Pedestal Fan : zhimi.fan.v2
DC Pedestal Fan : zhimi.fan.v3
Standing Fan 1C : dmaker.fan.1c
Tower Fan : dmaker.fan.p9
Standing Fan 2 : dmaker.fan.p10
Standing Fan Pro : dmaker.fan.p11
Standing Fan 2 : dmaker.fan.p18
Standing Fan 3 : zhimi.fan.za5
Power (on, off)
Operation modes (Auto, Silent, Favorite, Idle)
Attributes (fan platform)
model
mode
sleep_time
sleep_mode_learn_count
extra_features
turbo_mode_supported
use_time
button_pressed
sleep_mode
Number entities
Number Description Favorite Level Set the favorite level
Sensor entities
Filter Lifetime Remaining : The remaining life of the filter. Enabled by default.
Filter Use : Filter usage time in hours. Enabled by default.
Humidity : The current humidity measured. Enabled by default.
Motor Speed : The current motor speed measured in rpm. Enabled by default.
PM2.5 : The current particulate matter 2.5 measured. Enabled by default.
Purify Volume : The volume of purified air in cubic meter. Disabled by default.
Temperature : The current temperature measured. Enabled by default.
Use Time : The accumulative number of seconds the device has been in use. Disabled by default.
Switch entities
Switch Description Buzzer Turn on/off the buzzer Child Lock Turn on/off the child lock Learn Mode Turn on/off the learn mode LED Turn on/off the LED
Operation modes (Auto, Silent, Favorite)
auto_detect
Number Description Favorite Level Set the favorite level Volume Set the volume
Filter Life Remaining : The remaining lifetime of the filter. Enabled by default.
Illuminance : The current illuminance measured. Enabled by default.
Second Motor Speed : The current second motor speed measured in rpm. Enabled by default.
Switch Description Child Lock Turn on/off the child lock Learn Mode Turn on/off the learn mode LED Turn on/off the LED
Filter Lifetime Remaining : The remaining lifetime of the filter. Enabled by default.
preset_modes
preset_mode
friendly_name
supported_features
Illuminance : The current illuminance measured on top of the device (0-200 lux). Enabled by default.
This model uses newer MiOT communication protocol.
Operation modes (Auto, Silent, Favorite, Fan)
Number Description Fan Level Set the fan level Favorite Level Set the favorite level
Select entities
Select Description LED Brightness Controls the brightness of the LEDs (bright, dim, off)
Switch Description Buzzer Turn on/off the buzzer Child Lock Turn on/off the child lock
Number Description Favorite Motor Speed Set the favorite motor speed LED Brightness Set the LED brightness
TVOC : The current concentration of Total Organic Volatile Components. Enabled by default.
Select Description LED Brightness Controls the brightness of the Display (bright, dim, off)
Operation modes (Auto, Silent, Favorite, Idle, Medium, High, Strong)
Switch Description Buzzer Turn on/off the buzzer Child Lock Turn on/off the child lock LED Turn on/off the LED
These models use newer MiOT communication protocol.
Filter Lifetime Remaining : The remaining lifetime of the filter in %. Enabled by default.
Filter Time Left : The remaining lifetime of the filter in days. Enabled by default.
PM10 : The current particulate matter 10 measured (4 PRO only). Enabled by default.
Switch Description Buzzer Turn on/off the buzzer Child Lock Turn on/off the child lock Ionizer Turn on/off the negative ion generator
Operation modes (Auto, Sleep, Favorite)
Binary sensor entities
Binary sensor Description Auxiliary Heat Status Indicates if the heater is actually on
Button entities
Button Description Reset Dust Filter Resets filter lifetimetime and usage of the dust filter
Sensor Description Carbon Dioxide The current carbon dioxide in ppm Dust filter lifetime remaining The remaining lifetime of the filter Dust filter lifetime remaining days The remaining lifetime of the filter in day PM2.5 The current particulate matter 2.5 Temperature The current outside temperature Control Speed The current motor speed in rpm Favorite Speed The favorite motor speed in rpm
Switch Description Buzzer Turn on/off buzzer Child Lock Turn on/off child lock Display Turn on/off display Auxiliary Heat Turn on/off heater
Operation modes (Auto, Silent, Interval, Low, Middle, Strong)
Sensor entities|
Carbon Dioxide : The current carbon dioxide measured in ppm. Enabled by default.
Switch Description Buzzer Turn on/off buzzer Child Lock Turn on/off child lock LED Turn on/off led
Sensor Description Enabled by default Carbon Dioxide The current carbon dioxide measured in ppm True Filter Lifetime Remaining The remaining lifetime of the filter True Filter Use Filter usage time in hours True Humidity The current humidity measured True PM2.5 The current particulate matter 2.5 measured True Temperature The current temperature measured True Use Time The accumulative number of seconds the device has been in use False
Switch Description Buzzer Turn on/off buzzer Child Lock Turn on/off child lock LED Turn on/off led Auxiliary Heat Turn on/off heater
Auxiliary Heat Status : Indicates if the heater is actually on
Reset Dust Filter : Resets filter lifetime and usage of the dust filter
Reset Upper Filter : Resets filter lifetime and usage of the upper filter
Auxiliary Heat Level : Controls the level of the heater (Low, Medium, High)
Display Orientation : Controls the orientation of the display (Forward, Left, Right)
Carbon Dioxide : The current carbon dioxide in ppm
Dust filter lifetime remaining : The remaining lifetime of the dust filter
Dust filter lifetime remaining days : The remaining lifetime of the dust filter in days
Upper filter lifetime remaining : The remaining lifetime of the upper filter
Upper filter lifetime remaining days : The remaining lifetime of the upper filter in days
PM2.5 : The current particulate matter 2.5
Temperature : The current outside temperature
Control Speed : The current motor speed in rpm
Favorite Speed : The favorite motor speed in rpm
On, Off
Operation modes (Silent, Medium, High, Strong)
Target humidity (30, 40, 50, 60, 70, 80)
Attributes (humidifier platform)
Attribute Description available_modes A list with the operation modes available humidity The current target humidity max_humidity The maximum settable target humidity min_humidity The minimum settable target humidity mode The current operation mode selected
Binary sensor Description Water Tank Indicates whether the water tank is connected or not
Water Level : The current water level percentage measured. Enabled by default.
Operation modes (Silent, Medium, High, Auto)
Switch Description Buzzer Turn on/off the buzzer Child Lock Turn on/off the child lock Dry Mode Turn on/off the dry mode
Operation modes (Auto, Low, Medium, High)
Target humidity (30 - 80)
Number Description Motor Speed Set the motor speed
Actual Speed : The current motor speed measured in rpm. Enabled by default.
Switch Description Buzzer Turn on/off the buzzer Child Lock Turn on/off the child lock Clean Mode Turn on/off the clean mode Dry Mode Turn on/off the dry mode
Clean mode and Motor speed can only be set when the device is turned on.
Operation modes (low, medium, high, humidity)
Binary sensor Description Water Tank Indicates whether the water tank is connected or not Water Tank Empty Indicates whether the water tank is empty or not
Switch Description Buzzer Turn on/off the buzzer LED Turn on/off the LED
Operation modes (Normal, Nature)
Oscillation (on, off)
Number Description Delay Off Countdown Set the delay off countdown in minutes Oscillation Angle Set the oscillation angle in degrees
Switch Description Buzzer Turn on/off buzzer Child Lock Turn on/off child lock
Sensor Description Battery The current battery level in percentage Humidity The current humidity measured Temperature The current temperature measured
Number Description Delay Off Countdown Set the delay off countdown in minutes
Switch Description Buzzer Turn on/off the Buzzer Child Lock Turn on/off the Child Lock LED Turn on/off the LED
Binary sensor Description Power Supply Indicates whether the power supply is connected or not
Number Description Delay Off Countdown Set the delay off countdown in minutes LED Brightness Set the LED brightness Oscillation Angle Set the oscillation angle in degrees
Sensor Description Humidity The current humidity measured Temperature The current temperature measured
Switch Description Buzzer Turn on/off the Buzzer Child Lock Turn on/off the Child Lock Ionizer Turn on/off the Ionizer
These devices support the standard humidifier and fan actions, such as humidifier.set_humidity , humidifier.set_mode , fan.set_percentage , and fan.set_preset_mode . To act on a specific device, target its entity.
The integration also adds Xiaomi-specific actions for air purifiers, such as Fan reset filter and Fan set extra features . For the full list, see Actions .
The xiaomi_miio Air Quality Monitor is observing your Xiaomi Mi Air Quality Monitor (PM2.5) and reporting the air quality index and other values.
Currently, the supported features are:
Air Quality Index (AQI)
Particulate matter 2.5
power
charging
battery
time_stat
carbon_dioxide_equivalent
total_volatile_organic_compounds
temperature
humidity
The remote platform allows you to send IR commands from your Xiaomi IR Remote (ChuangmiIr).
Please follow the instructions on Retrieving the Access Token to get the API token to use in the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
To add a Xiaomi IR Remote to your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
remote : - platform : xiaomi_miio host : 192.168.42.42 token : YOUR_TOKEN
The IP of your remote.
The API token of your remote.
name string ( Optional )
The name of your remote.
slot integer ( Optional , default: 1 )
The slot used to save learned command.
timeout integer ( Optional , default: 30 )
Timeout for learning a new command.
commands map ( Optional )
A list of commands
command list Required
A list of commands as raw (learned command) or pronto hex code .
remote : - platform : xiaomi_miio name : " bathroom remote" host : 192.168.42.42 token : YOUR_TOKEN slot : 1 timeout : 30 commands : activate_towel_heater : command : - raw:base64:[optional_frequency] read_bad_poem : command : - raw:base64:[optional_frequency] - pronto:pronto_hex:[optional_repeat]
type : entity-button tap_action : action : call-service action : remote.send_command data : command : activate_towel_heater entity_id : remote.xiaomi_miio_ir hold_action : action : more-info show_icon : true show_name : true entity : remote.xiaomi_miio_ir icon : " mdi:radiator" name : Activate Towel Heater
script : towel_heater : sequence : - action : remote.send_command target : entity_id : " remote.bathroom_remote" data : command : - " activate_towel_heater" please_cover_your_ears : sequence : - action : remote.send_command target : entity_id : " remote.bathroom_remote" data : command : - " read_bad_poem"
The Xiaomi IR Remote Platform currently supports two different formats for IR codes.
A raw command is a command learned from the Remote learn command action.
A raw command is defined as in the following example:
raw:Z6UFANEAAAAjAQAAAwkAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQIAE =
with an optional last parameter of frequency:
raw:Z6UFANEAAAAjAQAAAwkAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQIAE = :38400
A pronto hex code is a hex code often supplied by the device manufacturer.
A pronto hex code is defined as in the following example:
pronto:0000 006C 0022 0002 015B 00AD 0016 0016 0016 0016 0016 0016 0016 0016 0016 0016 0016 0016 0016 0016 0016 0016 0016 0041 0016 0041 0016 0041 0016 0041 0016 0041 0016 0041 0016 0041 0016 0016 0016 0016 0016 0041 0016 0016 0016 0041 0016 0016 0016 0016 0016 0016 0016 0016 0016 0041 0016 0016 0016 0041 0016 0016 0016 0041 0016 0041 0016 0041 0016 0041 0016 0623 015B 0057 0016 0E6E
with an optional last parameter of repeats (required by some devices):
pronto:0000 006C 0022 0002 015B 00AD 0016 0016 0016 0016 0016 0016 0016 0016 0016 0016 0016 0016 0016 0016 0016 0016 0016 0041 0016 0041 0016 0041 0016 0041 0016 0041 0016 0041 0016 0041 0016 0016 0016 0016 0016 0041 0016 0016 0016 0041 0016 0016 0016 0016 0016 0016 0016 0016 0016 0041 0016 0016 0016 0041 0016 0016 0016 0041 0016 0041 0016 0041 0016 0041 0016 0623 015B 0057 0016 0E6E:2
Note there are at least 4 versions of the Xiaomi IR Remote (ChuangmiIr) which can be recognized by their default hostname:
chuangmi.ir.v2
chuangmi.remote.h102a03
chuangmi.remote.v2
chuangmi.remote.h102c01
For now, pronto hex codes only work on the first version ( chuangmi.ir.v2 ).
The Xiaomi IR Remote registers a generic remote.send_command action, along with Xiaomi-specific actions for learning commands and controlling the remote’s LED.
Allows sending either named commands using an identifier or sending commands as one of the two types defined in Command Types .
To learn a new command, use the Remote learn command action. After learning, the base64 string is shown as a notification in Overview, where you can copy it. Commands learned to the same slot can still be sent using remote.send_command even if they are overwritten.
For the full list of actions this integration adds, see Actions .
The xiaomi_miio vacuum platform allows you to control the state of your Xiaomi Mi Robot Vacuum .
Currently supported actions are:
start
pause
stop
return_to_base
locate
clean_spot
set_fan_speed
Fan speeds: Silent , Standard , Medium , Turbo and Gentle (exclusively for mopping).
xiaomi_clean_zone
xiaomi_clean_segment
xiaomi_goto
remote_control_* (of your robot)
In addition to all of the actions provided by the vacuum integration ( start , pause , stop , return_to_base , locate , set_fan_speed , and send_command ), this integration adds Xiaomi-specific actions to clean zones and segments, send the robot to a coordinate, and remote control the robot. For the full list, see Actions .
Button Description Reset Main Brush Resets main brush remaining lifespan Reset Side Brush Resets side brush remaining lifespan Reset Filter Resets filter remaining lifespan Reset Sensor Dirty Resets sensor dirtiness (remaining time before needs to be cleaned)
DnD Start*
The timestamp when the next DnD (Do not disturb) period will start
DnD End*
The timestamp when the current or next DnD (Do not disturb) period will end
Total duration*
The total cleaning duration in seconds
Total Clean Area*
The total cleaning area in square meters
Total Clean Count*
The total amount of times a clean cycle has been ran
Total Dust Collection Count*
The total amount of dust that has been collected
Filter Left*
How long the filter can be used in seconds
Main Brush Left*
How long the main brush can be used in seconds
Sensor Dirty Left*
How long the sensor can be used in seconds
Current Clean Time
The current cleaning time of the vacuum. If the vacuum is not cleaning, this sensor will have the same value as the “Last Clean Duration” sensor.
Current Clean Area
The current area that has been cleaned. If the vacuum is not cleaning, this sensor will have the same value as the “Last Clean Area” sensor.
Last Clean Area*
The last cleaned area in square meters
Last Clean Duration\*
The last clean duration in seconds
Last Clean End
The last clean end time as a timestamp
Last Clean Start
The last clean start time as a timestamp
Mop Attached**
If the mop is attached
Water Box Attached**
If the watter box is attached
Water Shortage\*\*
If the water box is low on water
* Needs to be manually enabled once the integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] has been added.
** Only enabled if the vacuum has a mop.
The vacuums from the xiaomi platform does not expose additional attributes other the ones provided by the vacuum integration ,
Example script using vacuum.send_command to clean a specific room:
vacuum_kitchen : alias : " Clean the kitchen" sequence : - action : vacuum.send_command target : entity_id : vacuum.xiaomi_vacuum_cleaner data : command : app_segment_clean params : [ 18 ]
Where params specify room numbers, for multiple rooms, params can be specified like [17,18] . Instructions on how to find the valid room numbers and determine what rooms they map to, read the section Retrieving room numbers .
The vacuum entity stores attribute values for when brushes, filters and sensors need to be
cleaned or replaced ( main_brush_left , side_brush_left , filter_left and
sensor_dirty_left ). The values are measured in hours. Once the parts are cleaned
or replaced you can then reset those values on the vacuum. Here is an example script using
vacuum.send_command to reset the hours for the main brush:
reset_main_brush_left : alias : " Reset hours for main brush replacement" sequence : - action : vacuum.send_Command target : entity_id : vacuum.xiaomi_vacuum_cleaner data : command : reset_consumable params : [ " main_brush_work_time" ]
Allowed params for the reset_consumable command:
['main_brush_work_time']
['side_brush_work_time']
['filter_work_time']
['sensor_dirty_time']
Download FloleVac
Log in with your Xiaomi credentials
Open Map (make sure you’re on the same network as your vacuum cleaner)
Select “Zone cleanup” and draw a box around the zone you’d like to clean
Long press “Cleanup” and the zone coordinates will be copied to your clipboard
RRCC supports both rooted and non-rooted Vacuums and acts as a mostly fully featured replacement for Mi Home that works locally without the cloud. If you have installed the rooted firmware Valetudo you can SSH into your Vacuum and enable MQTT plus use map functions with no cloud requirement.
Using the map editor you can acquire the coordinates required for zoned clean up. Here is an example script for zoned clean up:
vacuum_kitchen : alias : " vacuum kitchen" sequence : - action : vacuum.send_command target : entity_id : " vacuum.xiaomi_vacuum_cleaner" data : command : app_zoned_clean params : [[ 23084 , 26282 , 27628 , 29727 , 1 ]]
Valid room numbers can be retrieved using miio command-line tool:
miiocli roborockvacuum --ip <ip of the vacuum> --token <your vacuum token> get_room_mapping
It will return the full mapping of room numbers to user-defined names as a list of (number,name) tuples.
Alternatively, one can just test the clean_segment action with a number and see which room it cleans.
It seems to be the case that Numbers 1..15 are used to number the initial segmentation done by the vacuum cleaner itself. Numbers 16 and upwards numbers rooms from the users manual editing.
The Xiaomi Home light platform allows you to control the state of your Xiaomi Philips LED Ball Lamp, Xiaomi Philips Zhirui LED Bulb E14 Candle Lamp, Xiaomi Philips Zhirui Downlight, Xiaomi Philips LED Ceiling Lamp, Xiaomi Philips Eyecare Lamp 2, Xiaomi Philips Moonlight Bedside Lamp and Philips Zhirui Desk Lamp.
Supported models: philips.light.bulb , philips.light.candle , philips.light.candle2 , philips.light.downlight
Brightness
Color temperature (175…333 mireds)
Scene (1, 2, 3, 4)
Delayed turn off (Resolution in seconds)
scene
delayed_turn_off
Supported models: philips.light.ceiling , philips.light.zyceiling
Color temperature (175…370 mireds)
Night light mode (on, off)
night_light_mode
automatic_color_temperature
Supported models: philips.light.sread1
Eyecare light (on, off)
Ambient light (on, off)
Brightness (of each light)
Eye fatigue reminder / notification (on, off)
Eyecare mode (on, off)
reminder
eyecare_mode
Supported models: philips.light.mono1
Supported models: philips.light.moonlight
Color
Color temperature (153…588 mireds)
Scene (1, 2, 3, 4, 5, 6)
sleep_assistant
sleep_off_time
total_assistant_sleep_time
brand_sleep
brand
This integration adds actions to set a fixed scene, schedule a delayed turn off, and, on the Philips Eyecare Smart Lamp 2, toggle the reminder, night light, and eyecare modes. For the full list, see Actions .
The Xiaomi Home switch platform allows you to control the state of your Xiaomi Smart WiFi Socket aka Plug, Xiaomi Smart Power Strip and Xiaomi Chuangmi Plug V1.
Supported models: chuangmi.plug.m1 , chuangmi.plug.m3 , chuangmi.plug.v2 , chuangmi.plug.hmi205 , chuangmi.plug.hmi206
Temperature
Supported models: chuangmi.plug.v1 , chuangmi.plug.v3 , chuangmi.plug.hmi208
USB (on, off)
Supported models: qmi.powerstrip.v1 , zimi.powerstrip.v2
Wifi LED (on, off)
Power Price (0…999)
Power Mode (green, normal) (Power Strip V1 only)
Current
Load power
Wifi LED
Mode (Power Strip V1 only)
Supported models: lumi.acpartner.v3 (the socket of the acpartner.v1 and v2 isn’t switchable!)
This integration adds actions to toggle the Wi-Fi LED and, on supported power strips, set the power mode and power price. For the full list, see Actions .
The Xiaomi Home integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Fan reset filter ( xiaomi_miio.fan_reset_filter )
Resets the filter lifetime and usage of a Xiaomi air purifier.
Fan set extra features ( xiaomi_miio.fan_set_extra_features )
Sets a storage register that unlocks extra features in the Mi Home app.
Light eyecare mode off ( xiaomi_miio.light_eyecare_mode_off )
Turns off eyecare mode on a Xiaomi Philips Eyecare Smart Lamp 2.
Light eyecare mode on ( xiaomi_miio.light_eyecare_mode_on )
Turns on eyecare mode on a Xiaomi Philips Eyecare Smart Lamp 2.
Light night light mode off ( xiaomi_miio.light_night_light_mode_off )
Turns off night light mode on a Xiaomi Philips Eyecare Smart Lamp 2.
Light night light mode on ( xiaomi_miio.light_night_light_mode_on )
Turns on night light mode on a Xiaomi Philips Eyecare Smart Lamp 2.
Light reminder off ( xiaomi_miio.light_reminder_off )
Disables the eye fatigue reminder on a Xiaomi Philips Eyecare Smart Lamp 2.
Light reminder on ( xiaomi_miio.light_reminder_on )
Enables the eye fatigue reminder on a Xiaomi Philips Eyecare Smart Lamp 2.
Light set delayed turn off ( xiaomi_miio.light_set_delayed_turn_off )
Schedules a Xiaomi Philips light to turn off after a delay.
Light set scene ( xiaomi_miio.light_set_scene )
Sets a fixed scene on a Xiaomi Philips light.
Remote learn command ( xiaomi_miio.remote_learn_command )
Learns an IR command with a Xiaomi IR remote.
Remote set LED off ( xiaomi_miio.remote_set_led_off )
Turns off the blue LED of a Xiaomi IR remote.
Remote set LED on ( xiaomi_miio.remote_set_led_on )
Turns on the blue LED of a Xiaomi IR remote.
Switch set power mode ( xiaomi_miio.switch_set_power_mode )
Sets the power mode of a Xiaomi power strip.
Switch set power price ( xiaomi_miio.switch_set_power_price )
Sets the power price stored on a Xiaomi power strip.
Switch set Wi-Fi LED off ( xiaomi_miio.switch_set_wifi_led_off )
Turns off the Wi-Fi LED of a Xiaomi smart plug or power strip.
Switch set Wi-Fi LED on ( xiaomi_miio.switch_set_wifi_led_on )
Turns on the Wi-Fi LED of a Xiaomi smart plug or power strip.
Vacuum clean segment ( xiaomi_miio.vacuum_clean_segment )
Starts a Xiaomi robot vacuum cleaning one or more segments or rooms.
Vacuum clean zone ( xiaomi_miio.vacuum_clean_zone )
Starts a Xiaomi robot vacuum cleaning one or more rectangular zones.
Vacuum go to ( xiaomi_miio.vacuum_goto )
Sends a Xiaomi robot vacuum to a specific coordinate on its map.
Vacuum remote control move ( xiaomi_miio.vacuum_remote_control_move )
Steers a Xiaomi robot vacuum while it is in remote control mode.
Vacuum remote control move step ( xiaomi_miio.vacuum_remote_control_move_step )
Makes a Xiaomi robot vacuum perform a single remote control move.
Vacuum remote control start ( xiaomi_miio.vacuum_remote_control_start )
Puts a Xiaomi robot vacuum into remote control mode.
Vacuum remote control stop ( xiaomi_miio.vacuum_remote_control_stop )
Takes a Xiaomi robot vacuum out of remote control mode.
For an overview of every action across all integrations, see the actions reference .
Not recommended, please specify the Xiaomi account credentials during the config flow for easier setup.
However when setting up a device manually the token can be retrieved in one of the following ways.
One of Home Assistant users wrote a tokens extractor tool, which is currently the easiest way to retrieve tokens for all devices assigned to Xiaomi account.
In the repository there’s executable for convenient use on Windows or Python script to be run on any platform. If you do not wish to run executable, then you can run it using the source code:
Install requirements:
pip3 install pycryptodome pybase64 requests
Run script
python3 token_extractor.py
Provide email address or username for Xiaomi’s account, password, and country of the account (most used: CN - China Mainland, DE - Germany, and so on)
Script will print out all devices connected to the account with their IP address and tokens for use in Home Assistant.
Install the Xiaomi Home app.
Sign In/make an account.
Make sure you set your region to: Mainland China (Seems to be the longest line with Chinese characters) under settings -> Region (language can later be set on English).
Select your Gateway in Xiaomi Home app.
Then the 3 dots at the top right of the screen.
Then click on about.
Tap the version number (Plug-in version 2.77.1 as of January 2020, iOS has a white space instead of version number) at the bottom of the screen repeatedly.
You should now see 2 extra options listed in English (iOS still in Chinese), this means you enabled developer mode. [if not, try all steps again!].
Android: under “Hub info” there is quite some text in JSON format, this includes the “token” that you need.
iOS: Most options are still in Chinese, you need the fourth item from the top.
Note: If you have multiple devices needing a token, such as a Xiaomi Mi Robot Vacuum and a Xiaomi IR Remote, the above method may not work. The Xiaomi Home app will display a token, though it isn’t the correct one. The alternative method using “Mi Home v5.4.49” will provide the correct token.
If you are on a Windows or macOS device, you can use the Get MiHome devices token App to retrieve the token. Click the link, download the file that corresponds to your OS, enter your login details and it will retrieve the access token.
If using an Android device to retrieve the Access Token only v5.4.49 of Mi Home is confirmed working (December 2019). Use v5.4.49 of Mi Home locate a text file under the Smarthome/logs folder where the 32 character token is stored. There will likely be several text files in this directory, search all of them for the word ‘token’ and you should find it there. Be advised that the latest version of Mi Home does not store the token in clear text.
The iPhone app still stores the token in the SQLite db as of v4.23.4 (Nov 17, 2019).
After resetting the Wi-Fi settings of the Xiaomi robot vacuum, a new Access Token will be generated and therefore these instructions need to be followed again.
These instructions are written for the Mi Home app - not for the new RoboRock app.
This token (32 hexadecimal characters) is required for the Xiaomi Mi Robot Vacuum, Mi Robot 2 (Roborock) Vacuum, Xiaomi Philips Lights and Xiaomi IR Remote.
If using an Android device to retrieve the Access Token only v5.4.49 of Mi Home is confirmed working (December 2019).
To begin, set up your Robovac with the latest version of Mi Home on your primary Android device as you normally would.
If your Robovac is already set up, you must reset its WiFi settings for it to get a new token.
Using v5.4.49 of Mi Home locate a text file under the Smarthome/logs folder where the 32 character token is stored.
There will likely be several text files in this directory, search all of them for the word ‘token’ and you should find it there. Be advised that the latest version of Mi Home does not store the token in clear text.
Ensure successful operation using the latest Mi Home app and give the Vacuum a static IP in your router or however you do that on your LAN.
Install version v5.4.54 of Mi Home on your rooted Android device and login (you can’t have two version of Mi Home installed at the same time).
Ensure you are using the same server every time
Ensure successful operation using 5.4.54 (locate is a nice simple test)
Using adb we will now extract the token from the rooted phone
Use adb shell to connect to your device and become root (if using Magisck root do adb shell -> su -> whoami to ensure root access.
Then run grep -R ‘“token”’ /data/data/com.xiaomi.smarthome and grab the token
Configure the robot with the Mi Home app. Make sure to select the correct region, as Xiaomi uses different product names for different geographical areas. Note that the new RoboRock app is currently not supported for this method.
Using iTunes, create an unencrypted backup of your iPhone. Since macOS 10.15 there is no iTunes app. Use Finder instead - after connecting your iOS device you should see it in left menu of Finder window.
Install iBackup Viewer , open it, and open your backup.
Open the “Raw Data” module.
Navigate to com.xiaomi.mihome .
Search for a file that looks like this: 123456789_mihome.sqlite (Note: _mihome.sqlite is not the correct file. Most likely, you will find this file in the Documents folder.)
Save this file to your filesystem.
Install DB Browser for SQLite .
Open DB Browser and load the .sqlite file you saved from your backup.
Click on the Execute SQL tab.
Input and run this query (use appropriate SELECT query for your device, such as Vacuum, Powerstrip, or Plug):
-- Execute to retrieve token for Vacuum SELECT ZTOKEN FROM ZDEVICE WHERE ZMODEL LIKE "%vacuum%" -- Execute to retrieve token for Smart Powerstrip SELECT ZTOKEN FROM ZDEVICE WHERE ZMODEL LIKE "%powerstrip%" -- Execute to retrieve token for Smart Plug SELECT ZTOKEN FROM ZDEVICE WHERE ZMODEL LIKE "%plug%"
Copy the returned 96-digit hexadecimal string to your clipboard.
Open Terminal and execute this command:
echo '0: <YOUR HEXADECIMAL STRING>' | xxd -r -p | openssl enc -d -aes-128-ecb -nopad -nosalt -K 00000000000000000000000000000000
Use the resulting 32-digit string as your token. (On your mac in front of the terminal session)
Configure the robot with the Mi-Home app. Make sure to select the correct region, as Xiaomi uses different product names for different geographical areas. Note that the new RoboRock app is currently not supported for this method.
Install BlueStacks .
Set up Mi Home version 5.4.49 in BlueStacks and log in to synchronize devices.
Open Filemanager in the More Apps menu.
Use Explore on the left and navigate to sdcard/SmartHome/logs/plug_DeviceManager .
Click on Export to Windows in the lower left corner and select any or all files to export to you local disk.
Search for "token":"<yourTokenHere>" .
Use of Miio should be done before the Vacuum is connected to Xiaomi Home. If you already connected to the app you will need to delete it and then join the ad-hoc Wi-Fi network the Vacuum creates. If the vacuum is already paired it’s likely this method will only return ??? as your token.
Discovering devices on the current network:
npx miio discover
This will list devices that are connected to the same network as your computer. Let it run for a while so it has a chance to reach all devices, as it might take a minute or two for all devices to answer.
The commands outputs each device on this format:
Device ID: 48765421
Model info: zhimi.airpurifier.m1
Address: 192.168.100.9
Token: token-as-hex-here via auto-token
Support: At least basic
The information output is:
Device ID - The unique identifier of the device, does not change if the device is reset.
Model ID - The model id if it could be determined, this indicates what type of device it is.
Address - The IP that the device has on the network.
Token - The token of the device or ??? if it could not be automatically determined.
Alternate method to get all yours devices tokens in one run. Please follow this instruction .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Xiaomi Home hub was introduced in Home Assistant 0.51, and it's used by
2.4% of the active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@rytilahti
@syssi
@starkillerOG
Categories
Alarm
Fan
Health
Hub
Light
Presence detection
Remote
Vacuum
Back to top
