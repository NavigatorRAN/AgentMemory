# Yeelight - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/yeelight
- Final URL: https://www.home-assistant.io/integrations/yeelight
- Canonical URL: https://www.home-assistant.io/integrations/yeelight/
- Fetched at: 2026-06-28T03:30:18Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up Yeelight Wifi devices within Home Assistant.

## Extracted Text

On this page
Configuration
Custom effects
Full configuration
Music mode
Initial setup
Supported models
List of actions
Troubleshooting
Device Discovery
The Yeelight integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control your Yeelight Wi-Fi bulbs with Home Assistant.
There is support for the following device types within Home Assistant:
Light - The Yeelight platform for supporting lights.
Binary sensor - The Yeelight platform for supporting binary sensors. Currently, only nightlight mode sensor for ceiling lights.
To add the Yeelight device to your Home Assistant instance, use this My button:
Yeelight can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Yeelight .
Follow the instructions on screen to complete the setup.
Custom effects can only be set up through YAML configuration. To turn on the effect you can use light.turn_on action.
Possible transitions are RGBTransition , HSVTransition , TemperatureTransition , SleepTransition .
Where the array values are as per the following:
RGBTransition: [red, green, blue, duration, brightness] with red/green/blue being a number between 0 and 255, the duration being in milliseconds (with a minimum of 50) and the final brightness to transition to 1-100 (%).
HSVTransition: [hue, saturation, duration, brightness] with hue being a number between 0 and 359, saturation 0 -100, the duration in milliseconds (with a minimum of 50) and the final brightness 1-100 (%).
TemperatureTransition: [temp, duration, brightness] with temp being the final color temperature between 1700 and 6500, the duration in milliseconds (with a minimum of 50) and the final brightness to transition to 1-100 (%).
SleepTransition: [duration] with duration being a number for the effect time in milliseconds (with a minimum of 50).
More info about transitions and their expected parameters can be found in python-yeelight documentation .
yeelight : custom_effects : - name : ' Fire Flicker' flow_params : count : 0 transitions : - TemperatureTransition : [ 1900 , 1000 , 80 ] - TemperatureTransition : [ 1900 , 2000 , 60 ] - SleepTransition : [ 1000 ]
This example shows how you can use the optional configuration options.
# Example configuration.yaml entry yeelight : devices : 192.168.1.25 : name : Living Room transition : 1000 use_music_mode : true save_on_change : true custom_effects : - name : ' Fire Flicker' flow_params : count : 0 transitions : - TemperatureTransition : [ 1900 , 1000 , 80 ] - TemperatureTransition : [ 1900 , 2000 , 60 ] - SleepTransition : [ 1000 ]
Configuration Variables
Looking for your configuration file?
devices map ( Optional )
List of Yeelight devices.
host map Required
Hostname or IP address of the bulb.
name string ( Optional )
A friendly name for the device.
transition integer ( Optional , default: 350 )
Smooth transitions over time (in ms).
use_music_mode boolean ( Optional , default: false )
Enable music mode.
save_on_change boolean ( Optional , default: false )
Saves the bulb state in its nonvolatile memory when changed from Home Assistant.
nightlight_switch_type string ( Optional )
Adds another entity, to control nightlight mode (for models that supports it). Currently, only light is supported. It will create 2 light entities, one for normal light mode and second for nightlight mode. They are mutually exclusive.
model string ( Optional )
Yeelight model. Possible values are mono1 , color1 , color2 , strip1 , bslamp1 , ceiling1 , ceiling2 , ceiling3 , ceiling4 , ceiling10 , ceiling13 . The setting is used to enable model specific features f.e. a particular color temperature range.
custom_effects map ( Optional )
List of custom effects to add. Check examples below.
name string Required
Name of effect.
flow_params map Required
Flow params for effect.
count integer ( Optional , default: 0 )
The number of times to run this flow (0 to run forever).
action string ( Optional , default: recover )
The action to take after the flow stops. Can be ‘recover’, ‘stay’, ‘off’.
transitions list Required
List of transitions, for that effect, check example .
Per default, the bulb limits the number of requests per minute to 60, a limitation that can be bypassed by enabling the music mode. In music mode, the bulb is commanded to connect back to a socket provided by the integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] and it tries to keep the connection open, which may not be wanted in all use-cases.
Also note that bulbs in music mode will not update their state to “unavailable” if they are disconnected, which can cause delays in Home Assistant. Bulbs in music mode may also not react to commands from Home Assistant the first time if the connection is dropped. If you experience this issue, turn the light off and back on again in the frontend and everything will return to normal.
Important
Before trying to control your light through Home Assistant, you have to set up your bulb using the Yeelight app. ( Android , IOS ).
In the bulb property, you have to enable “LAN Control” (previously called “Developer mode”). LAN Control may only be available with the latest firmware installed on your bulb. Firmware can be updated in the application after connecting the bulb.
Determine your bulb IP (using router, software, ping…).
Currently, there is no official way to change LAN mode. However, some methods might be found here:
Desktop app
CLI using the python-miio library: 1 , 2
Note
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] is tested to work with the following models. If you have a different model and it is working, please let us know.
Model ID Model number Product name mono YLTD03YL Yeelight Serene Eye-Friendly Desk Lamp mono1 YLDP01YL LED Bulb (White) ? YLDP05YL LED Bulb (White) - 2nd generation color1 YLDP02YL LED Bulb (Color) color1 YLDP03YL LED Bulb (Color) - E26 color2 YLDP06YL LED Bulb (Color) - 2nd generation color4 YLDP13YL LED Bulb 1S (Color) color4 YLDP04YL LED Bulb 1S (Color) color6 YLDP13AYL LED Bulb 1S (Color) colorb YLDP005 LED Bulb (Color) colorc YLDP004-A GU10 W1 (Color) strip1 YLDD01YL Lightstrip (Color) strip1 YLDD02YL Lightstrip (Color) ? YLDD04YL Lightstrip (Color) strip6 YLDD05YL Lightstrip (Color) bslamp1 MJCTD01YL Xiaomi Mijia Bedside Lamp - Wi-Fi Version! bslamp1 MJCTD02YL Xiaomi Mijia Bedside Lamp II RGBW MJDP02YL Mi LED smart Lamp - white and color Wi-Fi Version lamp MJTD02YL Xiaomi Mijia Desk Lamp Pro lamp1 MJTD01YL Xiaomi Mijia Smart LED Desk Lamp (autodiscovery isn’t possible because the device doesn’t support mDNS due to the small amount of RAM) lamp9 YLCT03YL Yeelight Staria Bedside Lamp Pro lamp15 YLTD003 Yeelight LED Screen Light Bar Pro ceiling1 YLXD01YL Yeelight Ceiling Light ceiling2 YLXD03YL Yeelight Ceiling Light - Youth Version ? YLXD62YI Yeelight Ceiling Light (Jiaoyue 260) ?, may be ceiling3 YLXD04YL Yeelight Ceiling Light (Jiaoyue 450) ceiling3 YLXD05YL Yeelight Ceiling Light (Jiaoyue 480) ceiling4 YLXD02YL Yeelight Ceiling Light (Jiaoyue 650) ceiling10 YLDL01YL Yeelight Meteorite Pendant Light ceiling13 YLXD01YL Yeelight LED Ceiling Light ceil26 YLXD76YL Yeelight Ceiling Light - Updated HomeKit 23w ?, may be ceilb YLXD013-B Yeelight Arwen Ceiling Light 450C ?, may be ceilb YLXD013-C Yeelight Arwen Ceiling Light 550C ceilb YLXD013 Yeelight Arwen Ceiling Light 450S
The Yeelight integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Set auto delay off scene ( yeelight.set_auto_delay_off_scene )
Turns a Yeelight light on at a set brightness and schedules it to turn off after a delay.
Set color flow scene ( yeelight.set_color_flow_scene )
Starts a color flow on a Yeelight light using the scene API call.
Set color scene ( yeelight.set_color_scene )
Sets a Yeelight light to a specific RGB color and brightness.
Set color temperature scene ( yeelight.set_color_temp_scene )
Sets a Yeelight light to a specific color temperature and brightness.
Set HSV scene ( yeelight.set_hsv_scene )
Sets a Yeelight light to a specific hue, saturation, and brightness.
Set mode ( yeelight.set_mode )
Sets the operation mode of a Yeelight light.
Set music mode ( yeelight.set_music_mode )
Enables or disables music mode on a Yeelight light.
Start flow ( yeelight.start_flow )
Starts a color flow on a Yeelight light using a list of transitions.
For an overview of every action across all integrations, see the actions reference .
The Yeelight devices use non-standard search parameters for SSDP so devices are not visible in the SSDP/UPnP Browser .
If you want to check what devices are in your network, you can use the async-upnp-client library , and then run the following command:
upnp-client search \ --target 239.255.255.250 \ --target_port 1982 \ --bind 0.0.0.0 \ --search_target wifi_bulb
You can also look at the Zeroconf Browser or the DHCP Browser , which correctly detect Yeelight devices.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Yeelight device was introduced in Home Assistant 0.32, and it's used by
2.3% of the active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@zewelor
@shenxn
@starkillerOG
@alexyao2015
Categories
Light
Back to top
