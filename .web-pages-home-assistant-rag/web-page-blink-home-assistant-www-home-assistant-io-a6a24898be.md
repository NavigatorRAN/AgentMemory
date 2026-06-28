# Blink - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/blink
- Final URL: https://www.home-assistant.io/integrations/blink
- Canonical URL: https://www.home-assistant.io/integrations/blink/
- Fetched at: 2026-06-28T02:31:32Z
- Content type: text/html; charset=UTF-8

## Description

Instructions for how to integrate Blink camera/security system within Home Assistant.

## Extracted Text

On this page
Setup
Configuration
List of actions
Examples
Snap picture and save locally
Arm Blink when away
Disarm Blink when home
Save most recent video locally when motion detected
Save all recent clips locally on a schedule
The Blink integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you view camera images and motion events from Blink camera and security systems.
Important
This integration does NOT allow for live viewing of your Blink camera within Home Assistant.
You will need your Blink login information (username, which is usually your email address, and password) to use this module.
The preferred method for setting this up is by using the configuration flow. Go to the integrations page in your configuration and click on new integration -> Blink. When you are prompted for your pin, there are (currently) two possibilities:
You are sent an email asking for you to allow Home Assistant to access Blink. In this case, leave the pin field blank and hit Submit .
You are sent an email or SMS containing a 2FA pin. In this case, please enter the pin and hit Submit .
Your integration will then set up. Given that setup is asynchronous, you may see your sensors before they have finished extracting data from the Blink servers. After a few minutes (at most) this information should populate.
Once Home Assistant starts and you authenticate access, the blink integration will create the following platforms (note: Blink Mini cameras do not currently support any of the sensors, nor the battery status binary sensor):
An alarm_control_panel to arm/disarm the whole blink system (note, alarm_arm_home is not implemented and will not actually do anything, despite it being an option in the GUI).
A camera for each camera linked to your Blink sync module.
A sensor per camera for temperature and Wi-Fi strength.
A binary_sensor motion detection, camera armed status, and battery status.
A switch per camera to enable/disable motion detection
Since the cameras are battery operated, polling must be done with care so as to not drain the battery too quickly, or hammer Blink’s servers with too many API requests. If an alternate polling rate is desired, disable the “enable poll for updates” option in the Blink integration system options and poll with homeassistant.update_entity action. The cameras can be also manually updated via the trigger_camera action. As a note, all of the camera-specific sensors are only polled when a new image is requested from the camera. This means that relying on any of these sensors to provide timely and accurate data is not recommended.
Each camera reports two different states: one as sensor.blink_<camera_name>_status and the other as binary_sensor.blink_<camera_name>_motion_enabled . The motion_enabled property reports if the camera is ready to detect motion regardless if the system is actually armed .
The Blink integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Record ( blink.record )
Requests a Blink camera to record a new video clip.
Save recent clips ( blink.save_recent_clips )
Saves all recent video clips of a Blink camera to a local directory.
Save video ( blink.save_video )
Saves the last recorded video clip of a Blink camera to a local file.
Trigger camera ( blink.trigger_camera )
Requests a Blink camera to take a new image.
For an overview of every action across all integrations, see the actions reference .
In addition to these actions, the generic camera , alarm control panel , and Home Assistant Core actions are available. The camera.enable_motion_detection and camera.disable_motion_detection actions enable and disable motion detection for individual cameras. The alarm_control_panel.alarm_arm_away and alarm_control_panel.alarm_disarm actions arm and disarm the whole system. The homeassistant.update_entity action forces an update of the Blink system. Blink Mini cameras linked to an existing sync module cannot be armed or disarmed individually in Home Assistant.
The following are some examples showing how to correctly perform an action using Blink:
This example script shows how to take a picture with your camera, named My Camera in your Blink app (this is not necessarily the friendly name in Home Assistant). After snapping a picture, the image will then be saved to a local directory called /tmp/my_image.jpg . Note that this example uses actions found in the camera integration
alias : " Blink Snap Picture" sequence : - action : blink.trigger_camera target : entity_id : camera.blink_my_camera - action : camera.snapshot target : entity_id : camera.blink_my_camera data : filename : /tmp/my_image.jpg
This example automation will arm your blink sync module to detect motion on any of your blink cameras that have motion detection enabled. By default, Blink enables motion detection on all cameras so, unless you’ve changed anything in your app, you’re all set. If you want to manually enable motion detection for individual cameras, you can use the appropriate camera action but motion will only be captured if the sync module is armed.
Here, this example assumes your blink module is named My Sync Module and that you have device trackers set up for presence detection.
- alias : " Arm Blink When Away" triggers : - trigger : state entity_id : all to : " not_home" actions : - action : alarm_control_panel.alarm_arm_away target : entity_id : alarm_control_panel.blink_my_sync_module
Similar to the previous example, this automation will disarm blink when arriving home.
- alias : " Disarm Blink When Home" triggers : - trigger : state entity_id : all to : " home" actions : - action : alarm_control_panel.alarm_disarm target : entity_id : alarm_control_panel.blink_my_sync_module
When motion is detected, you can use the Blink Home Assistant integration to save the last recorded video locally, rather than relying on Blink’s servers to save your data.
The following example assumes your camera’s name (in the Blink app) is My Camera and your sync module name is My Sync Module . The file will be saved to /tmp/videos/blink_video_{YYYMMDD_HHmmSS}.mp4 where {YYYYMMDD_HHmmSS} will be a timestamp create via the use of templating .
- alias : " Save Blink Video on Motion" triggers : - trigger : state entity_id : binary_sensor.blink_my_camera_motion_detected to : " on" actions : - action : blink.save_video target : entity_id : camera.blink_my_camera data : filename : " /tmp/videos/blink_video_{{ now().strftime('%Y%m%d_%H%M%S') }}.mp4"
A list of all the recent video clips is updated at each refresh of the Blink system.
The video clips are available in a download list (per camera) for up to an hour,
and they can be downloaded at any time before the one-hour expiration time.
After a clip is downloaded it is removed from the list.
The following example demonstrates saving recent clips every three minutes.
It assumes your camera’s name (in the Blink app) is My Camera .
The file will be saved to /tmp/videos/YYYYMMDD_HHmmSS_MyCamera.mp4 .
The file name of the downloaded video file is not configurable.
- alias : " Save Recent Clips from My Camera" triggers : - trigger : time_pattern minutes : /3 actions : - action : blink.save_recent_clips target : entity_id : camera.my_camera data : file_path : /tmp/videos
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Blink hub was introduced in Home Assistant 0.40, and it's used by
1.9% of the active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@fronzbot
Categories
Alarm
Binary sensor
Camera
Hub
Sensor
Switch
Back to top
