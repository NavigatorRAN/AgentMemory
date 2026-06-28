# SwitchBot Cloud - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/switchbot_cloud
- Final URL: https://www.home-assistant.io/integrations/switchbot_cloud
- Canonical URL: https://www.home-assistant.io/integrations/switchbot_cloud/
- Fetched at: 2026-06-28T03:19:59Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up SwitchBot Devices.

## Extracted Text

On this page
Prerequisites
Configuration
Supported devices
Plugs and switches
Cover
Lights
Locks
Sensors
Hubs
Humidifiers
Vacuums
Fans
Water heater
Image
Supported functionality
Water Heater
Important considerations
Webhook support
The SwitchBot Cloud integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control SwitchBot devices connected through the SwitchBot hub.
To use this integration, you will need at least a SwitchBot Hub and a SwitchBot account to get a token and secret key from the SwitchBot mobile app in Profiles > Preferences > About > Developer Options . If you don’t see developer options, tap the version number 10 times. See also SwitchBot’s blog for more information specific to the app.
Device names configured in the SwitchBot app are transferred into Home Assistant.
To add the SwitchBot Cloud hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select SwitchBot Cloud .
Follow the instructions on screen to complete the setup.
Bot (WoHand)
Relay Switch 2PM
Relay Switch 1
Relay Switch 1PM
Plug Mini (WoPlug)
Plug Mini (HomeKit Enabled)
Plug Mini (EU)
Plug (Wi-Fi only, only available in Japan)
Curtain (WoCurtain) (version 1 & 2)
Curtain 3 (WoCtn3)
Blind Tilt (WoBlindTilt)
Roller Shade
Garage Door Opener
LED Strip Light 3
Floor Lamp
Color Bulb (WoBulb)
Light Strip (WoStrip)
RGBICWW Floor Lamp
RGBICWW Strip Light
Ceiling Light / Ceiling Light Pro (Japan only)
RGBIC Neon Rope Light
RGBIC Neon Wire Rope Light
Candle Warmer Lamp
Lock (WoLock)
Lock Pro (WoLockPro)
Lock Pro Wifi
Lock Lite
Lock Ultra
Lock Vision
Lock Vision Pro
Meter
Meter Plus
Indoor/Outdoor Meter (WoIOSensorTH)
Meter Pro
Meter Pro CO2 Monitor
Contact Sensor
Motion Sensor
Water Leak Detector
Climate Panel
Presence Sensor
Weather Station
Hub 2 (WoHub2) (currently only supports retrieving sensor data, does not yet support device control)
Hub 3 (currently only supports retrieving sensor data, does not yet support device control)
IR appliances exposed through the different hubs:
ON/OFF for all appliance types except for Others
Change temperature and mode for Air Conditioner
Humidifier (WoHumi)
Evaporative Humidifier
K10+
K10+ Pro
K10+ Pro Combo
K11+
K20+ Pro
S20
S10
S1
S1 Plus
Circulator Fan
Standing Fan
Air Purifier
Air Purifier Table
Smart Radiator Thermostat
AI Art Frame
Bot
Features:
acted as a Switch in switchMode and customizeMode , as a Button in pressMode
turn on or off
press
get battery level
Plug Mini
get power consumption readings
displayed as two switches with the following properties or actions individually,
get power
get voltage
get current
get daily used electricity or power consumption
Plug
Curtain
open/close/pause
set position
get position
get calibration state
Curtain 3
Blind Tilt
close up/close down
open/close
get temperature
get humidity
Indoor/Outdoor Meter
get carbon dioxide
get motion detection state
get light state
get open state
get light level
get leak state
light detect
motion detect
change brightness
change color temperature
change color
Color Bulb
LED Strip Light
Ceiling Light / Ceiling Light Pro
RGBICWW Floor Lamp / RGBICWW Strip Light
RGBIC Neon Rope Light / RGBIC Neon Wire Rope Light
Lock
Lock or unlock
open or closed state
calibration state
Lock Pro
Some of the hubs can be served as a bridge while the sensor data can be retrieved. Hub 2 displays temperature and humidity through a sensor cable. Without a digital display, Hub Mini Matter Enabled can also read from a sensor cable.
Hub 2
Hub 3
Humidifier entities are added for Humidifier and Evaporative Humidifier.
Humidifier
turn on
turn off
set mode
set humidity
Note: Not all modes support unless you bind the temperature and humidity sensor.
Battery Circulator Fan/Circulator Fan/Standing Fan
set speed, only applicable for [direct mode]
get battery, only applicable for [Battery Circulator Fan / Standing Fan]
get states
Vacuum entities are added for K10+, K10+ Pro, K10+ Pro Combo, K11+, K20+ Pro, S10, S20.
start/clean
pause
set cleaning mode
return to base
get battery
set temperature
switch picture
display current picture
Note
Each sensor will request a status update from the SwitchBot Cloud API once every 10 minutes (600 seconds). The SwitchBot Cloud API limits users to 10,000 requests per day.
Warning
For IR Appliances, the state is inferred from previous commands in Home Assistant and might not reflect reality if you use other ways to control the device.
For vacuums, the states are updated from SwitchBot’s cloud.
Only ONE webhook URL seems to be accepted by the SwitchBot’s cloud. So, if you want several applications notified, you need to use a “proxy” to re-dispatch the message to the other applications.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The SwitchBot Cloud hub was introduced in Home Assistant 2023.10, and it's used by
1.9% of the active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@SeraphicRav
@laurence-presland
@Gigatrappeur
@XiaoLing-git
Categories
Binary Sensor
Button
Fan
Hub
Light
Remote
Sensor
Switch
Vacuum
Back to top
