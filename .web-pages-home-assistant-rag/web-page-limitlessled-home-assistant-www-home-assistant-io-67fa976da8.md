# LimitlessLED - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/limitlessled
- Final URL: https://www.home-assistant.io/integrations/limitlessled
- Canonical URL: https://www.home-assistant.io/integrations/limitlessled/
- Fetched at: 2026-06-28T02:56:42Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up LimitlessLED within Home Assistant.

## Extracted Text

On this page
Setup
Night effect
Properties
Initialization & Synchronization
Related topics
The LimitlessLED integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] can control your LimitlessLED lights from within Home Assistant. The lights are also known as EasyBulb, AppLight, AppLamp, MiLight, LEDme, dekolight, or iLight.
LimitlessLED bulbs are controlled via groups, so you can only control an individual bulb via the bridge if it is in a group by itself.
Note: you can assign an rgbw , rgbww , white and dimmer group to the same group number, effectively allowing up to 16 groups (4 rgbww , 4 rgbw , 4 white and 4 dimmer ) per bridge.
An archive of the extensive API can be found here .
Before configuring Home Assistant, make sure you can control your bulbs or LEDs with the MiLight mobile application. Next, discover your bridge(s) IP address. You can do this via your router or a mobile application like Fing ( Android or iTunes ).
To add limitlessled to your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry light : - platform : limitlessled bridges : - host : 192.168.1.10 groups : - number : 1 name : Bedroom - number : 2 type : rgbw name : Bathroom - number : 3 type : rgbw name : Kitchen fade : true - number : 4 type : dimmer name : Livingroom - host : 192.168.1.11 groups : - number : 1 name : Living Room & Hall - number : 1 type : bridge-led name : Bridge Light
Configuration Variables
Looking for your configuration file?
bridges list Required
A list of bridges.
host string Required
IP address of the device, e.g., 192.168.1.32 .
version integer ( Optional , default: 6 )
Bridge version.
port integer ( Optional , default: 5987 )
Bridge port. For older bridges than v6 choose 8899 .
groups list Required
The list of available groups.
number integer Required
Group number ( 1 - 4 ). Corresponds to the group number on the remote. These numbers may overlap only if the type is different.
name string Required
Any name you’d like. Must be unique among all configured groups.
type string ( Optional , default: rgbw )
Type of group. Choose either rgbww , rgbw , white , bridge-led or dimmer . Use bridge-led to control the built-in LED of newer Wi-Fi bridges.
fade boolean ( Optional , default: false )
Fade behavior. If turned on (true), the group is faded out before being turned off. This makes for a more pleasing transition at the expense of wall switch usability since the light will turn back on at the lowest brightness if it is power cycled.
LimitlessLED has a night effect that can be used to dim the lights below brightness: 1 . This night mode is meant to temporarily turn the lights into a nightlight. This mode can be especially helpful when wall switches are also being used. For example, when a light is using the night effect one way to return it to its previous brightness level (other than using Home Assistant) is to switch the lights off and then back on from the wall switch.
Note that the brightness , color and temperature attributes cannot be used when using the night effect. You can turn on night effect by using the effect attribute of the normal light.turn_on action. Here is an example:
automation : - alias : " ..." triggers : # ... actions : - action : light.turn_on target : entity_id : - light.office - light.kitchen data : effect : night
Refer to the light documentation for general property usage, but keep in mind the following notes specific to LimitlessLED.
RGBWW (Only supported on v6 bridges)
Color : There are 25,856 color possibilities along the LimitlessLED color spectrum. For colors, hue and saturation can be used, but not lightness. If you select a color with lightness, Home Assistant will calculate the nearest valid LimitlessLED color. In white mode, the temperature can be set.
Temperature : There are 101 temperature steps.
Brightness : There are 101 brightness steps.
RGBW
Color : There are 256 color possibilities along the LimitlessLED color spectrum. Color properties like saturation and lightness cannot be used - only Hue can. The only exception is white (which may be warm or cold depending on the type of RGBW bulb). If you select a color with saturation or lightness, Home Assistant will calculate the nearest valid LimitlessLED color.
Brightness : Wi-Fi bridge v6 supports 101 brightness steps; older versions only 25.
White
When using a legacy Wi-Fi bridge (before v6), you can observe on the MiLight mobile application, you cannot select a specific brightness or temperature - you can only step each property up or down. There is no indication of which step you are on. This restriction, combined with the unreliable nature of LimitlessLED transmissions, means that setting white bulb properties is done on a best-effort basis. The only very reliable settings are the minimum and maximum of each property.
Temperature : Wi-Fi bridge v6 supports 101 temperature steps; older versions only 10.
Brightness : Wi-Fi bridge v6 supports 101 brightness steps; older versions only 10.
Dimmer (Only supported on v6 bridges)
This type is for a single color LED dimmer like the 1CH MiLight dimmer module or similar. This type is only supported by the version 6 Wi-Fi bridges.
Brightness : Wi-Fi bridge v6 supports 101 brightness steps.
Transitions
If a transition time is set, the group will transition between the current settings and the target settings for the duration specified. Transitions from or to white are not possible - the color will change immediately.
When starting Home Assistant, the last recorded state will be shown. This might no longer match the actual state of the bulbs.
If you control your LimitlessLED lights via the MiLight mobile application or other means while Home Assistant is running, Home Assistant cannot track those changes and you may observe obsolete information.
This lack of synchronization is due to a LimitlessLED limitation.
Because LimitlessLED lights may have an obsolete state, Home Assistant shows the power switch as two buttons rather than a toggle. This ensures that the power can be set with a single click even if the assumed state is wrong. You can change to use the power toggle with Customize :
homeassistant : customize_domain : light : assumed_state : false
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The LimitlessLED integration was introduced in Home Assistant pre 0.7, and it's used by
472 active installations.
Its IoT class is Assumed State.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Light
Back to top
