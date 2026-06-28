---
source_url: "https://www.home-assistant.io/integrations/motion_blinds"
final_url: "https://www.home-assistant.io/integrations/motion_blinds"
canonical_url: "https://www.home-assistant.io/integrations/motion_blinds/"
source_handle: "web:www-home-assistant-io:1d8622553deb"
source_section: "integrations-motion-blinds"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "1b7ee5349ac30e6383c706c6331f27154296969e805a615f1abd55ff16d72fbb"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Motionblinds - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/motion_blinds
- Final URL: https://www.home-assistant.io/integrations/motion_blinds
- Canonical URL: https://www.home-assistant.io/integrations/motion_blinds/
- Fetched at: 2026-06-28T03:01:12Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Motionblinds from Coulisse B.V. into Home Assistant.

## Extracted Text

On this page
Configuration
Retrieving the API Key
Motionblinds app
Brel Home app
Bloc Blinds app
3 Day Blinds app
Blindsgalore AMP app
Connector app
Avosdim app
Favorite position
Top Down Bottom Up (TDBU) blinds
Top entity
Bottom entity
Combined entity
TDBU notes
List of actions
Troubleshooting
Range of the gateway
Allowing UDP multicast communication
Bypassing UDP multicast
The Motionblinds integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control Motionblinds from Coulisse B.V. .
Additionally the following brands have been reported to also work with this integration:
Acomax
AMP Motorization
Avosdim
Bliss Automation - Alta Window Fashions
Bloc Blinds
Brel Home
3 Day Blinds
Decorquip Dream
Diaz
Dooya
Gaviota
Havana Shade
Heicko
Hurrican Shutters Wholesale
Inspired Shades
iSmartWindow
Kaiser Nienhaus
Krispol
Linx
Madeco
Martec
Motionblinds
Raven Rock MFG
ScreenAway
Smart Rollo (SIRO)
Smartblinds
Smart Home
Ublockout
Uprise Smart Shades
This integration allows for both directly controlling blinds that support wifi-connection and controlling Uni- and Bi-direction blinds that connect to a 433MHz WiFi bridge.
The following bridges are reported to work with this integration:
CM-20 Motionblinds bridge
CMD-01 Motionblinds mini-bridge
DD7002B Connector bridge
D1554 Connector mini-bridge
DD7002B Brel-Home box
D1554 Brel Home USB plug
Brel HUB-03
Acomax FX-I 620 Bridge Maxi
Linx Hub
Linx Hub Mini
Linx Hub USB
SIRO Connect SI7002
SIRO Connect SI7005
Heicko Smart Stick 1ST
DD7006A Smart Home bridge
Dreamhub Pro 191726
Dreamhub mini 191717
Kaiser Nienhaus Smart Stick
Box maison connectée 005313 AvosDim
To add the Motionblinds hub to your Home Assistant instance, use this My button:
Motionblinds can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Motionblinds .
Follow the instructions on screen to complete the setup.
The 16 character API key needed to set up the Home Assistant integration needs to be retrieved by first connecting the blind/bridge to the official app of its respective brand.
In that app the key can often be found by clicking multiple times on specific places on the “About” page.
The Motionblinds API uses a 16 character key that can be retrieved from the official “Motionblinds” app for IOS or Android .
Open the app, click the 3 dots in the top right corner, go to “settings”, go to “Motion APP About”, Please quickly tap this “Motion APP About” page 5 times, a popup will appear that gives you the key.
“-” characters need to be included in the key when providing it to Home Assistant. The key needs to be similar to 12ab345c-d67e-8f
In the Brel Home app on iOS go to the me page (home screen 4th tab), on the bottom of this page multi-tap on the “version x.x.x(xxxx)” gray info and a pop-up with the key will be shown.
In the Brel Home app on Android go to the me page (home screen 4th tab), tap 5 times on the right side of the photo place and a pop-up with the key will be shown.
In the official Bloc Blinds app go to settings (three bars > gear icon), go to the About page, Tap five time on the bloc blinds icon in the middle and a pop-up with the key will be shown.
In the 3 Day Blinds app go to the home screen, go to settings (three bars in the upper left corner > gear icon), select About from the bottom, quickly tap the 3 Day Blinds icon in the center of the screen 5 times and a pop-up with the key will be shown.
In the Blindsgalore AMP app go to the home screen, go to settings (three bars in the upper left corner), tap your profile picture, select About from the bottom, quickly tap the AMP icon in the center of the screen 5 times and a pop-up with the key will be shown.
To get the API key ( iOS app , Android app ), follow these steps:
In the left sidebar of the app, open the Settings (gear icon).
Select the About page of the Connector app.
Tap the screen 5 times while being on the About page.
This opens a window with the API key.
In the Avosdim mobile app, go to Settings (three bars in the upper-left corner > gear icon), select About at the bottom, quickly tap the connected shutter icon in the center of the screen 5 times, and a pop-up with the key will appear.
A Go to favorite position button entity allows you to move the blind to its favorite position. For this entity to show up, you first need to set the blind’s favorite position in the mobile app, using a remote or physical buttons on the blind. Refer to the manual of your specific blind for instructions.
The Set current position as favorite button entity allows you to change the favorite position. For this to work, the blind first needs to be put in programming mode by shortly pressing the reset button on the blind. It will start stepping (moving a small bit up-down repeatedly). You can then use the Set current position as favorite entity. After you are done, shortly press the reset button again to exit the programming mode.
TDBU blinds consist of two bars controlled by two motors designated by Top and Bottom with fabric in between.
The Top and Bottom can move independently of each other to cover different parts of the window.
Controlling the two bars can be done through three different entities that will be created: Top, Bottom and Combined.
‘Up/Open’ will move the Top bar to the top of the window (absolute position 100).
‘Down/Close’ will move the Top bar to the position of the Bottom bar, therefore, making the part of the window that is covered as small as possible, but the two bars will be at the position of the Bottom bar (not at the top of the window). When the bars are moved completely together, the Top bar will not accept another “Down” command. First the Top bar needs to be moved up, even if the Bottom bar already moved further down.
‘Position’ is the relative position in which the Top bar can move, so from the top of the window (100) to the position of the Bottom bar (0), note that the position will therefore change if the Bottom bar is moved, since the space in which the Top bar is allowed to move changes.
‘Absolute position’ is the position of the Top bar with respect to the window, so 0 = bottom of the window and 100 = top of the window. Note that not all absolute positions are reachable at all moments due to the Bottom bar.
‘Width’ is the percentage of the window covered by fabric (the space between the Top and Bottom bars).
‘Up/Open’ will move the Bottom bar to the position of the Top bar. When the bars are moved completely together, the Bottom bar will not accept another “Up” command. First the Bottom bar needs to be moved down, even if the Top bar already moved further up.
‘Down/Close’ will move the Top bar to the bottom of the window (absolute position 0).
‘Position’ is the relative position in which the Bottom bar can move, so from the position of the Top bar (100) to the bottom of the window (0), note that the position will therefore change if the Top bar is moved, since the space in which the Bottom bar is allowed to move changes.
‘Absolute position’ is the position of the Bottom bar with respect to the window, so 0 = bottom of the window and 100 = top of the window. Note that not all absolute positions are reachable at all moments due to the Top bar.
‘Up/Open’ will move both the Top and Bottom bars to the top of the window, effectively covering as little as possible of the window (Width will be 0 %).
‘Down/Close’ will move the Top bar to the top of the window and the Bottom bar to the bottom of the window, effectively covering the whole window (Width will be 100 %).
‘Position’ is the relative position of the center between the Bottom and Top bars in which the center can move, so basically, such that the area covered by the Bottom and Top bar can be moved without changing its size, such that the Top bar can go to the top of the window and the Bottom bar to the bottom of the window.
‘Absolute position’ is the position of the center between the Bottom and Top bars with respect to the window, so 0 = bottom of the window and 100 = top of the window. Note that not all absolute positions are reachable at all moments due to the width.
Because the relative position is used by default in Home Assistant, scenes will not work properly with TDBU blinds (depending on the current position of the Top en Bottom, a certain position (70) will correspond to a different position with respect to the window).
Therefore it is recommended to use scripts or automations with the TDBU Combined entity that use the motion_blinds.set_absolute_position with specifying both the absolute_position and width .
That will ensure the same absolute position with respect to the window is achieved without letting the Bottom or Top bar move to an absolute_position that is not allowed.
When the motion_blinds.set_absolute_position action is used with values that would move the Bottom or Top bar to positions that will make them collide, nothing will happen. An error will be logged telling that that position is not allowed and the TDBU blind will not move.
Therefore it is always safe to use any of the actions in Home Assistant with the TDBU blinds.
The Motionblinds integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Set absolute position ( motion_blinds.set_absolute_position )
Moves a Motionblinds cover to an exact position.
For an overview of every action across all integrations, see the actions reference .
When the gateway is placed too far from the blinds, sometimes the blinds do react to commands from the gateway, but the gateway is not able to receive messages from the blinds. In those cases, the position of the blinds will not be reported correctly (both in Home Assistant and in the mobile app of the blinds). This can cause problems with specifically Top Down Bottom Up (TDBU) blinds since, for TDBUs, the requested position is checked to guard for collisions between the top and bottom motor; therefore, not all positions are allowed based on the current position of both motors. If the gateway does not receive the current position correctly, some commands may be wrongfully rejected to prevent collisions.
Please try placing the gateway closer to the blinds if you experience issues.
Home Assistant uses the following UDP multicast addresses/ports for communication with the gateway:
Motion hub receive UDP multicast 238.0.0.18:32100
Motion hub sending UDP multicast 238.0.0.18:32101
This communication needs to be allowed on your local network. If the blinds are unavailable and you see error messages like:
Timeout of 5.0 sec occurred on 5 attempts while waiting on multicast push from update request, communication between gateway and blind might be bad.
Please make sure the motion gateway and the device running Home Assistant are on the same VLAN and multicasting is enabled/allowed by your router.
If using separate VLANs, make sure the 238.0.0.18:32100 and 238.0.0.18:32101 ports are open for communication between those VLANs (not tested or confirmed to work).
For some routers “IGMP snooping” on the used wireless interface needs to be disabled to let the IGMP/multicast messages through.
For Ubiquiti routers/access points the “Enable multicast enhancement (IGMPv3)” should be disabled.
If UDP Multicast does not work in your setup (due to network limitations), this integration can be used in local polling mode.
Go to Settings -> Integrations -> on the already set up Motionblinds integration click “configure” –> disable the “Wait for multicast push on update” option (disabled by default).
The default update interval of the Motionblinds integration is every 10 minutes. When UDP multicast pushes do not work, this polling interval can be a bit high.
To increase the polling interval:
Go to Settings -> Integrations -> on the already set up Motionblinds integration click more options (three dots) and select “System options” -> disable “polling for updates”.
Now create an automation with as trigger a time pattern and select your desired polling time.
As the action select Perform action and select Update entity , select one of the Motionblinds covers as entity.
You only have to create one automation with only one Motionblinds cover as entity, the rest will update at the same time.
Example YAML automation for custom polling interval (every minute):
alias : " Motionblinds polling automation" triggers : - trigger : time_pattern minutes : " /1" actions : - action : homeassistant.update_entity target : entity_id : cover.motion_shade
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Motionblinds hub was introduced in Home Assistant 2020.12, and it's used by
2102 active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@starkillerOG
Categories
Cover
Back to top
