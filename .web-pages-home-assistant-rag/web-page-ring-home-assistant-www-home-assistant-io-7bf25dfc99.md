---
source_url: "https://www.home-assistant.io/integrations/ring"
final_url: "https://www.home-assistant.io/integrations/ring"
canonical_url: "https://www.home-assistant.io/integrations/ring/"
source_handle: "web:www-home-assistant-io:7bf25dfc998d"
source_section: "integrations-ring"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "5ba9bd2d81a0bdee544aefb2d7a697a05d4ff99861b96296819e240accf9943b"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Ring - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/ring
- Final URL: https://www.home-assistant.io/integrations/ring
- Canonical URL: https://www.home-assistant.io/integrations/ring/
- Fetched at: 2026-06-28T03:12:31Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on integrating Ring.com devices with Home Assistant.

## Extracted Text

On this page
How you can use this integration
Prerequisites
Configuration
Supported devices
Supported functionality
Binary sensor
Button
Camera
Event
Sensor
Siren
Switch
Light
Number
Data updates
Known limitations
Two-way audio
Last recording
Multiple alerts
Troubleshooting
Realtime event stability
Examples
Automation ideas
Setting up doorbell alerts
Saving the videos captured by your Ring Door Bell
Removing the integration
To remove an integration instance from Home Assistant
The Ring integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control your Ring.com doorbell, stick up cam, chime, and intercom devices in Home Assistant.
The Ring integration lets you do many things, such as switching devices on and off based on schedules or events, viewing live camera feeds, and controlling device configurations manually or via automations.
You need to provision your newly purchased devices via the Ring application, which will require creating a Ring account at Ring.com or via the official application.
After that, you will use your Ring account credentials to log on to the Ring cloud in Home Assistant.
To add the Ring hub to your Home Assistant instance, use this My button:
Ring can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Ring .
Follow the instructions on screen to complete the setup.
Username
Your Ring account username.
Password
Your Ring account password.
2fa
Account verification code via the method selected in your Ring account settings.
There is currently support for the following device types within Home Assistant:
Doorbells : Doorbell, Doorbell 2, Doorbell 3, Doorbell 3 Plus, Doorbell 4, Doorbell Pro, Doorbell Pro 2, Doorbell Elite, Doorbell Wired, Battery Doorbell, Doorbell (2nd Gen), Peephole Cam
Stickup cams : Floodlight Cam, Floodlight Cam Pro, Floodlight Cam Plus, Indoor Cam, Indoor Cam (2nd Gen), Spotlight Cam Battery, Spotlight Cam Wired, Spotlight Cam Plus, Spotlight Cam Pro, Stick Up Cam, Stick Up Battery, Stick Up Wired, Stick Up Cam (3rd Gen)
Chimes : Chime, Chime Pro
Intercoms : Intercom
The binary sensor switches off and on when motion, doorbell rings, and intercom unlock events occur.
The binary sensor is being replaced with the event entity, and you should migrate any automations to the event entity by release 2025.4.0.
Once you have enabled the Ring integration , you can start using the button platform. Currently, it supports intercom to open the door.
Once you have enabled the Ring integration , you can start using the camera platform.
Currently, it supports doorbells and stickup cameras.
Two camera entities are provided: live_view and last_recording .
last_recording is disabled by default.
Important
Downloading and playing Ring video from the last_recording camera will require a Ring Protect plan.
The event entity captures events like doorbell rings, motion alerts, and intercom unlocking.
Once you have enabled the Ring integration , you can start using the sensor platform. Currently, it supports battery level and Wi-Fi signal.
The volume sensors are being replaced with the number entity, which allows setting the volume. You should migrate any automations using the volume sensors to the number entity by release 2025.4.0.
Adds a siren entity for every camera that supports a siren. Note the siren will only turn on for 30 seconds before automatically turning off.
Adds a siren entity for chimes to play the test sound.
Once you have enabled the Ring integration , you can start using the switch platform.
Motion detection - Switches motion detection on and off for cameras.
In-home chime - Switches on and off a mechanical or digital chime connected to a ring doorbell.
Once you have enabled the Ring integration , you can start using the light platform. This will add a light for every camera that supports a light (such as a floodlight).
Once you have enabled the Ring integration , you can start using the number platform.
Currently, it supports showing and setting the volume of the doorbell/chime ring, intercom voice volume, and intercom microphone volume.
The Ring cloud API is polled Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] for data updates every 60 seconds. When you make changes through Home Assistant (for example by switching motion detection on), the device’s state is updated immediately rather than waiting for the next poll Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] .
The Ring integration does not connect locally to devices, all communication goes via the cloud.
Two-way audio in camera live view is not currently supported.
To view the last recording entity you will need a Ring subscription.
Some device models send two alerts for a single doorbell ring event.
The integration will provide a workaround for this in a future release.
Home Assistant requires outbound TCP access to port 5228 to connect to Ring’s real-time event service.
Ensure your firewall and network configuration allow this connection.
Below are steps to follow if realtime events are not working.
Step 1
Issues with Ring alerts may be caused by having too many authenticated devices on your Ring account. Before version 2023.12.0, the Home Assistant Ring integration would register a new entry in Authorized Client Devices in the Control Center at ring.com on every restart.
When cleaning up devices:
Only delete entries that start with ring-doorbell:HomeAssistant or Python .
Do NOT delete entries for your phones or other Ring apps.
If there are too many devices to delete individually, you can use the Remove all devices option, but you’ll need to re-authorize all your devices afterward.
Step 2
If you’re still experiencing issues after Step 1, try generating a new unique ID for the Home Assistant Ring integration instance.
To do this, select the three dots menu on the integration entry and select the Reconfigure option.
Do not try this step before clearing down all the excess Authorized Client Devices as per Step 1, or it will simply invalidate the reconfigured entry.
Step 3
If alerts are still not working after Steps 1 and 2, try toggling the Motion Warning setting:
Go to ring.com and sign in.
Select your device.
Navigate to Device Settings .
Find the Motion Warning toggle.
Turn it off and wait for 30 seconds.
Turn it back on.
This has successfully restored alerts for many users.
Turn on motion detection for internal cameras when you leave home (with geofencing) and turn off when you get home.
Start a live feed on a device when the doorbell rings.
Turn up the volume on a digital chime when you are in the garden.
You can set an automation up in the Home Assistant UI.
Find the correct event entity under Entity triggers .
For From choose the setting Any state (ignoring attribute changes) .
Then add a Send notification action under Notifications .
This will result in yaml similar to the following:
alias : Doorbell alerts description : " " triggers : - trigger : state entity_id : - event.front_door_ding from : null conditions : [] actions : - device_id : internalhadeviceid domain : mobile_app type : notify message : Front door ding title : Front door ding mode : single
You can save locally the latest video captured by your Ring Door Bell using the downloader along with either an automation or python_script .
First, enable the downloader integration in your configuration by adding the following to your configuration.yaml .
downloader : download_dir : downloads
Then you can use the following automation, with the entities from your system, which will save the video file under <config>/downloads/<camera_name>/<camera_name>.mp4 :
automation : alias : " Save the video when the doorbell is pushed" triggers : - trigger : state entity_id : event.front_doorbell_ding from : null actions : - delay : hours : 0 minutes : 5 seconds : 0 milliseconds : 0 - action : downloader.download_file data : overwrite : true url : " {{ state_attr('camera.front_door_last_recording', 'video_url') }}" subdir : " {{state_attr('camera.front_door_last_recording', 'friendly_name')}}" filename : " {{state_attr('camera.front_door_last_recording', 'friendly_name')}}.mp4"
You may consider some modifications in the subdirectory and the filename to suit your needs. For example, you can add the date and the time and extension to the downloaded file:
data : url : " {{ state_attr('camera.front_door_last_recording', 'video_url') }}" subdir : " {{ state_attr('camera.front_door_last_recording', 'friendly_name') }}/{{ now().strftime('%Y.%m') }}" filename : " {{ now().strftime('%Y-%m-%d-at-%H-%M-%S') }}.mp4"
the above modification will save the video file under <config>/downloads/<camera_name>/YYYY-MM/YYYY-MM-DD-at-HH-MM-SS.mp4 . You can change the date according to your localization format.
If you want to use python_script , enable it your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file first:
python_script :
You can then use the following python_script to save the video file:
# obtain ring doorbell camera object
# replace the camera.front_door by your camera entity
ring_cam = hass . states . get ( " camera.front_door_last_recording " ) subdir_name = f " ring_ { ring_cam . attributes . get ( ' friendly_name ' ) } " # get video URL
data = { " url " : ring_cam . attributes . get ( " video_url " ), " subdir " : subdir_name , " filename " : ring_cam . attributes . get ( " friendly_name " ), } # call downloader integration to save the video
hass . services . call ( " downloader " , " download_file " , data )
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Ring hub was introduced in Home Assistant 0.42, and it's used by
6.3% of the active installations.
Its IoT class is Cloud Polling.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@sdb9696
Categories
Doorbell
Back to top
