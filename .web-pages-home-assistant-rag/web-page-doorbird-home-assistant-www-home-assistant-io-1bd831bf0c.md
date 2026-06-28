# DoorBird - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/doorbird
- Final URL: https://www.home-assistant.io/integrations/doorbird
- Canonical URL: https://www.home-assistant.io/integrations/doorbird/
- Fetched at: 2026-06-28T02:37:51Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate your DoorBird video doorbell with Home Assistant.

## Extracted Text

On this page
Setup
Configuration
Events
Clearing registered events
Event data
Schedules
Automation example
Camera
Button
Event
The DoorBird integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to integrate your DoorBird device in Home Assistant.
There is currently support for the following device types within Home Assistant:
Camera - View live and historical event based images.
Button - Enable control of relays and camera low-light/night vision (IR) and resetting favorites.
Event - Monitor doorbell ring and motion events.
It is recommended to set up a new & dedicated account on your DoorBird App/web portal for use with Home Assistant. The instructions in this document refer specifically to the DoorBird iOS/Android app. Still, most actions can also be performed using the web-based DoorBird - WebAdmin portal and logging in on your DoorBird admin account.
To set up a new account for Home Assistant, open the DoorBird App by selecting Settings (cog icon) > Administration > LOGIN (using your DoorBird App Administration details). Under the USER section, choose Add . This new user account requires specific permissions enabled (depending on what functionality you want). Permissions can be found under Permissions . The following permissions are recommended (or amend depending on your requirements:
“Watch Always” (live view)
“History” (last motion)
“Motion” (last motion)
“API-Operator” (this needed to be enabled as a minimum)
To add the DoorBird device to your Home Assistant instance, use this My button:
DoorBird can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select DoorBird .
Follow the instructions on screen to complete the setup.
Events can be defined for each configured DoorBird device independently. These events will be registered on the device and can be attached to a schedule via the DoorBird app.
For new installs, a doorbell and motion event will automatically be created and configured. If you do not need any additional events, you can skip configuring schedules.
See Schedules section below for details on how to configure schedules.
Event names will be prefixed by doorbird_devicename . For example, the sample event doorbell for the device ‘Driveway Gate’ will be seen in Home Assistant as doorbird_devicename_doorbell . This is to prevent conflicts with other events.
See Automation Example section below for details on how to use the event names in an automation.
Important
Events other than doorbell and motion will not be received in Home Assistant until a schedule is defined via the DoorBird app.
Events can be cleared from DoorBird devices by pressing the Reset favorites button.
Clearing device events will require configuration steps above to be taken again. It could also affect other third-party applications you may use with your DoorBird device. It will not break the official mobile app in any way, so mobile push notifications will still work.
Each event will include live image and video URLs for the DoorBird device that triggered the event. These URLs can be found on the event data and are helpful in automation actions. For example, you could use html5_viewer_url on a notification to be linked directly to the live view of the device that triggered the automation.
The following keys are available on event_data :
timestamp
live_video_url
live_image_url
rtsp_live_video_url
html5_viewer_url
Note
The URLs on the event will be based on the configuration used to connect to your DoorBird device. The ability to connect from outside your network will depend on your configuration.
Once events have been registered on the DoorBird device, they must be attached to a schedule using the official DoorBird app on Android or iOS or the DoorBird - WebAdmin portal. Currently, there are schedules available for doorbell, motion, relay, and RFID events (on supported DoorBird devices). Essentially, you can enable an HTTP(S) call from your DoorBird device to the Home Assistant DoorBird API by configuring an action/event (by enabling a schedule).
The schedules can be found by navigating to the following area of the DoorBird app (Android or iOS):
Settings (cog icon) > Administration > LOGIN (using your App Administration details) > (under EXPERT SETTINGS ) Schedule for doorbell.
Push notification
Trigger Relay ("Relay 1" or "Relay 2")
HTTP(S) Calls (button, motion/movement, RFID)
Click on the dropdown button in the top left and choose your specific “Schedule for actions” (listed above). Depending on your selection, you may have to click on the center title to see the sub-categories menu.
On the desired event, you should be able to specify blocks of time for when you would like the event to be sent to Home Assistant. If you want the event to always send, the square in the upper right can be used to populate the entire schedule. Events will be fired to Home Assistant for blocks of time that are blue.
Note: Remember to complete the schedule assignment steps above for each event type you registered. If you are configuring HTTP Call(s) schedules for registered RFID tags, you will have to enable/configure the schedule for each RFID tag.
The example automation below shows how to turn on a light when somebody presses the DoorBird call button:
- alias : " Doorbird Ring" triggers : - trigger : state entity_id : event.doorbird_driveway_gate_somebody_pressed_the_button actions : - action : light.turn_on target : entity_id : light.side_entry_porch
You can also create automation actions based on the DoorBird RFID scanner being successfully triggered (configured per RFID tag) and motion events.
The doorbird implementation allows you to view the live video, the last doorbell ring image, and the last motion sensor image from your DoorBird device in Home Assistant.
The doorbird button platform allows you to power connected relays and trigger the low-light/dark Infra-Red (IR) array on your DoorBird video doorbell device.
An event entity will be created for each doorbell or motion event with a configured HTTP(s) call in the schedule .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The DoorBird device was introduced in Home Assistant 0.54, and it's used by
2153 active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@oblogic7
@bdraco
@flacjacket
Categories
Doorbell
Back to top
