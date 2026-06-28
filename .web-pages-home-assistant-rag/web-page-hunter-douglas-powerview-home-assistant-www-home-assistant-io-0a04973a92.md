# Hunter Douglas PowerView - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/hunterdouglas_powerview
- Final URL: https://www.home-assistant.io/integrations/hunterdouglas_powerview
- Canonical URL: https://www.home-assistant.io/integrations/hunterdouglas_powerview/
- Fetched at: 2026-06-28T02:50:35Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up Hunter Douglas PowerView scenes within Home Assistant.

## Extracted Text

On this page
Configuration
Hub capabilities
Generation 1 + 2
Generation 3
Shades
Capabilities Information
Bottom Up
Top Down
Top Down Bottom Up(TDBU)
Tilt when closed
Tilt Anywhere
Dual Shade Overlapped
Buttons
Calibrate
Identify
Favorite
Selection Entities
Power Source
Number entities
Velocity
Example Automations
Calling a Powerview Scene
Force Update Shade Position
The Hunter Douglas PowerView integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to integrate your Hunter Douglas PowerView devices in Home Assistant. The product is also known by the brand name Luxaflex Powerview in Europe and Australia as explained on their website , however this integration should work for both brands.
There is currently support for the following device types within Home Assistant:
Button
Cover
Number
Scene
Select
Sensor
To add the Hunter Douglas PowerView hub to your Home Assistant instance, use this My button:
Hunter Douglas PowerView can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Hunter Douglas PowerView .
Follow the instructions on screen to complete the setup.
Generation 1 and 2 hubs work better with Home Assistant when all calls are made directly via the Powerview application or Home Assistant itself.
Generation 1 and 2 Pebble remotes use proprietary Bluetooth Low Energy (PLE) and do not report shade position changes back to the hub.
This will result in the shade positioning displayed within Home Assistant being incorrect.
Note
Calling the update entity action ( homeassistant.update_entity ) on a shade entity will trigger the hub to awaken a shade and report its current position.
An example automation is available below for mains powered shades. While the automation will work for battery-powered shades, it will quickly drain the batteries for these devices.
Generation 3 introduced RF Radio Pebble Remotes.
Generation 3 shades report position changes back to the hub automatically. They should appear correctly in Home Assistant without requiring any additional automations or considerations for positioning.
Your shades may still make work even if not listed. If you encounter issues, please raise a feature request on the community forum.
Name (Type) Capabilities AC Roller (49) Bottom Up Banded Shades (52) Bottom Up Bottom Up (5) Bottom Up Curtain, Left Stack (69) Vertical Curtain, Right Stack (70) Vertical Curtain, Split Stack (71) Vertical Facette (43) Bottom Up TiltOnClosed 90° Designer Roller (1) Bottom Up Duette (6) Bottom Up Duette, Top Down Bottom Up (8) Top Down Bottom Up Duette and Applause SkyLift (10) Bottom Up Duette Architella, Top Down Bottom Up (9) Top Down Bottom Up Duette DuoLite, Top Down Bottom Up (9) Top Down Bottom Up Duolite Lift (79) Dual Shade Overlapped M25T Roller Blind (42) Bottom Up Palm Beach Shutters (66) Tilt Only 180° Pirouette (18) Bottom Up TiltOnClosed 90° Pleated, Top Down Bottom Up (47) Top Down Bottom Up Provenance Woven Wood (19) Bottom Up Roman (4) Bottom Up Silhouette (23) Bottom Up TiltOnClosed 90° Silhouette Duolite (38) Dual Shade Overlapped Tilt 90° Skyline Panel, Left Stack (26) Vertical Skyline Panel, Right Stack (27) Vertical Skyline Panel, Split Stack (28) Vertical Top Down (7) Top Down Twist (44) Bottom Up TiltOnClosed 180° Venetian, Tilt Anywhere (51) Bottom Up TiltAnywhere 180° Venetian, Tilt Anywhere (62) Bottom Up TiltAnywhere 180° Vertical Slats, Left Stack (54) Vertical TiltAnywhere 180° Vertical Slats, Right Stack (55) Vertical TiltAnywhere 180° Vertical Slats, Split Stack (56) Vertical TiltAnywhere 180° Vignette (31) Bottom Up Vignette (32) Bottom Up Vignette (84) Bottom Up Vignette Duolite (65) Dual Shade Overlapped
These shades offer only the simple up/down movement of your conventional shades.
These shades offer a unique movement that is inverse to your conventional shade, where the shade is fixed to the floor and lowered from the roof.
TDBU shades consist of two rails controlled by two motors designated by Top and Bottom with fabric in between.
The Top and Bottom can move independently to cover different parts of the window but cannot pass the other.
Two different entities that will be created for each blind: Top and Bottom.
Top entity
‘Up/Open’ will move the Top rail to the bottom of the window and set the Bottom rail to its closed position.
‘Down/Close’ will move the Top rail to the top of the window and set the Bottom rail to its closed position.
‘Position’ is the position in which the Top rail can move from the top of the window (0) to the bottom (100).
The position of a Top rail cannot pass that of a Bottom rail. If you set an impossible position, the position will fall back to the closest possible value to that requested.
Bottom entity
‘Up/Open’ will move the Bottom rail to the top of the window and set the Top rail to its closed position.
‘Down/Close’ will move the Bottom rail to the bottom of the window and set the Top rail to its closed position.
‘Position’ is the position in which the Bottom rail can move from the bottom of the window (0) to the top (100).
The position of a Bottom rail cannot pass that of a Top rail. If you set an impossible position, the position will fall back to the closest possible value to that requested.
Shades with Tilt when closed functionality only allow a shade to tilt when it is closed and will automatically close the vanes when the shade is moved from it’s closed position.
These shades can tilt in any position and do not require the shade to be open or closed to adjust the tilt position.
These shades consist of two pieces of fabric attached to a single rail. The front shade is sheer, with the rear being opaque, and neither panel can move independently from the other.
Three different entities that will be created for each blind: Front, Rear and Combined.
Front entity
‘Up/Open’ will move the front shade to the ceiling
‘Down/Close’ will move the front shade to the floor
As the positioning of the front requires the rear opaque to be fully opened any move will force the rear shade to be opened
Rear entity
‘Up/Open’ will move the rear shade to the ceiling
‘Down/Close’ will move the rear shade to the floor
As the positioning of the rear requires the front sheer to be fully closed any move will force the front shade to be closed
Combined entity
‘Up/Open’ will move the front and rear shades to the ceiling
‘Down/Close’ will move the front and rear shades to the floor
This entity combines movement for two entities in one
0-50 represents the rear shade
51-100 represents the front shade
Tilt functionality will also be present on this entity for shades that support tilt
When Tilted the front sheer needs to be fully closed, this will happen automatically
Important
Gen 1 and Gen 2 Only.
Initiate a calibration of the shade position. Calibration is a common requirement with Duette-type shades with a string drop that lowers and raises the blind and less so with roller types.
Identify will ‘jog’ the shade position as a diagnostic tool to ensure the shade you are trying to move is both the intended shade and communicating correctly.
Move the shade to the favorite position as programmed physically on the device. This will perform the same move as the heart on the pebble remote.
Set the type for connected power source. Available options are Hardwired Power Supply, Battery Wand and Rechargeable Battery
Gen 3 Only.
Velocity controls the speed of the shade. The default speed from Hunter Douglas is 0; setting this higher will increase the speed of the shade.
alias : " Blinds closed at night" triggers : - trigger : time at : " 18:00:00" actions : - action : scene.turn_on target : entity_id : scene.10877
This automation is not recommended for battery-powered shades.
alias : " Force Update" description : " Update the position of defined shades" triggers : - trigger : time_pattern hours : 1 actions : - action : homeassistant.update_entity target : entity_id : - cover.family_right - cover.family_left - cover.kitchen_roller
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Hunter Douglas PowerView hub was introduced in Home Assistant 0.15, and it's used by
1347 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@bdraco
@kingy444
@trullock
Categories
Back to top
