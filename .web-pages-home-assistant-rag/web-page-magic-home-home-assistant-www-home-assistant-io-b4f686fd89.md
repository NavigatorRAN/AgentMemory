---
source_url: "https://www.home-assistant.io/integrations/flux_led"
final_url: "https://www.home-assistant.io/integrations/flux_led"
canonical_url: "https://www.home-assistant.io/integrations/flux_led/"
source_handle: "web:www-home-assistant-io:b4f686fd89c7"
source_section: "integrations-flux-led"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "07ea688d2504485ff5c354999e80180ed94896b8ffac5b039e2a63d25d8fd011"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Magic Home - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/flux_led
- Final URL: https://www.home-assistant.io/integrations/flux_led
- Canonical URL: https://www.home-assistant.io/integrations/flux_led/
- Fetched at: 2026-06-28T02:43:38Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up Magic Home within Home Assistant.

## Extracted Text

On this page
Configuration
Supported models
Untested models
Unsupported Models
Troubleshooting
Effects
List of actions
The Magic Home integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] supports several brands of switches, bulbs, and controllers that use the same protocol. Chances are high that your bulb or controller (eg. WiFi LED CONTROLLER) will work with this integration if you can control the device with the Magic Home app or the Surp Life app.
This integration will provide local control over your LED lights/strips and can be configured to auto-scan your network for controllers or for you to manually configure individual lights by their IP address.
Example of bulbs:
MagicLight Smart Bulbs or Amazon
RGBCW Downlights
RGBCW Floodlights
Examples of controllers with strips:
MagicLight Strip Lights or Amazon
Examples of controllers:
Single color
RGB
RGBW
RGBCW
RGB/W/CW
Examples of addressable controllers:
Addressable v3
Examples of addressable controllers with strip:
Addressable v1
Addressable v2
Examples of sockets:
MagicLight Smart Plugs or Amazon
These devices have been sold under at least the following brands:
Aislan
Allkeys
Apobob
Arilux
Aubric
BERENNIS
BHGY
Brizled
Bunpeon
Chichin
Comoyda
dalattin
DALS RGBW / Armacost Lighting / MyLED
DARKPROOF
Daybetter
deerdance
DIAMOND
Diode Dynamics
Flux LED
FVTLED
GEV LIG
GEYUEYA Home
GIDEALED
GIDERWEL
GMK
Goldwin
Hakkatronics
HaoDeng
Heissner
HDDFL
illume RGBW
Illumination FX
INDARUN
iNextStation
Koopower
Lallumer
LEDENET
LiteWRX
Lytworx
Magic Ambient
Magic Home
Magic Hue
Magic Light
Miheal
Mowelai
Nexlux
OBSESS
Offdarks
PH LED
PHOPOLLO
Pin Stadium Pinball Lights
POV Lamp
PROTEAM Europe Pool Lights
Rimikon
SMFX
Sumaote
Superhome
SurpLife
SuperlightingLED
Svipear
Tommox
Vanance
Yetaida
YHW
Zengge
Zombber
To add the Magic Home integration to your Home Assistant instance, use this My button:
Magic Home can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Magic Home .
Follow the instructions on screen to complete the setup.
After the devices have been added they can be configured with different effects listed below. These settings can be accessed by navigating to the integration settings in Settings -> Integrations and selecting the “Magic Home” configuration for the bulb or controller.
Custom Effect
A list of RGB colors can be entered to create an effect. The effect speed can be adjusted using the slider underneath.
Custom Effect Type
This determines the transition between each color.
The following models have been tested.
Model Description Microphone Notes 0x01 Legacy RGB Controller no Original protocol 0x03 Legacy CCT Controller no Original protocol 0x04 UFO Controller RGBW no 0x06 Controller RGBW no 0x07 Controller RGBCW no 0x08 Controller RGB with MIC yes 0x09 Ceiling Light CCT no 0x0E Floor Lamp RGBCW no 0x10 Christmas Light no 0x16 Magnetic Light CCT no 0x17 Magnetic Light Dimmable no 0x1A Christmas Light no 0x1C Table Light CCT no 0x1E Ceiling Light RGBCW no 0x21 Bulb Dimmable no 0x25 Controller RGB/WW/CW no Supports RGB, RGBW, RGBWW, CW, DIM 0x33 Controller RGB no 0x35 Bulb RGBCW no 0x41 Controller Dimmable no 0x44 Bulb RGBW no 0x52 Bulb CCT no 0x54 Downlight RGBW no 0x62 Controller CCT no 0x93 Switch 1 Channel no 0x97 Socket no 0xA1 Addressable v1 no Supports UCS1903, SM16703, WS2811, WS2812B, SK6812, INK1003, WS2801, LB1914 0xA2 Addressable v2 yes Supports UCS1903, SM16703, WS2811, WS2811B, SK6812, INK1003, WS2801, WS2815, APA102, TM1914, UCS2904B 0xA3 Addressable v3 yes Supports WS2812B, SM16703, SM16704, WS2811, UCS1903, SK6812, SK6812RGBW (WS2814), INK1003, UCS2904B 0xA4 Addressable v4 no Supports WS2812B, SM16703, SM16704, WS2811, UCS1903, SK6812, SK6812RGBW (WS2814), INK1003, UCS2904B 0xA6 Addressable v6 yes Supports WS2812B, SM16703, SM16704, WS2811, UCS1903, SK6812, SK6812RGBW (WS2814), INK1003, UCS2904B 0xA7 Addressable v7 yes Supports WS2812B, SM16703, SM16704, WS2811, UCS1903, SK6812, SK6812RGBW (WS2814), INK1003, UCS2904B 0xE1 Ceiling Light CCT no 0xE2 Ceiling Light Assist no Auxiliary Switch not supported
The following models have not been tested but may work.
Model Description Microphone Notes 0x02 Legacy Dimmable Controller no Original protocol, discontinued
The following models are confirmed to be unsupported.
Model Description Microphone Notes 0x18 Plant Grow Light no 0x19 Socket with 2 USB no 0x1B Aroma Fragrance Lamp no 0x1D Fill Light no 0x94 Switch 1c Watt no 0x95 Switch 2 Channel no 0x96 Switch 4 Channel no 0xD1 Digital Time Lamp no
If a strip controller device will not stay on wifi or goes offline during adjusting colors and effects, upgrading to a power supply with a higher amperage usually resolves any stability issues.
The Magic Home light offers several effects which are not included in other lighting packages. These can be selected from the front-end, or sent in the effect field of the light.turn_on command.
Effect Name Description colorloop Smoothly transitions through the rainbow. colorjump Jumps through seven different rainbow colors. colorstrobe Strobes each rainbow color in a loop. red_fade , green_fade , blue_fade , yellow_fade , cyan_fade , purple_fade , white_fade Fades between the color as indicated in the effect name and black. rg_cross_fade Fades between red and green. rb_cross_fade Fades between red and blue. gb_cross_fade Fades between green and blue. red_strobe , green_strobe , blue_strobe , yellow_strobe , cyan_strobe , purple_strobe , white_strobe Strobes the color indicated by the effect name. random Chooses a random color by selecting random values for R, G, and B.
The Magic Home integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Set custom effect ( flux_led.set_custom_effect )
Sets a custom light effect on a Magic Home light.
Set music mode ( flux_led.set_music_mode )
Configures music mode on Magic Home lights with a built-in microphone.
Set zones ( flux_led.set_zones )
Sets strip zones for Addressable v3 controllers.
For an overview of every action across all integrations, see the actions reference .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Magic Home integration was introduced in Home Assistant 0.25, and it's used by
1.7% of the active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@icemanch
Categories
Button
Light
Number
Select
Sensor
Switch
Back to top
