---
source_url: "https://www.home-assistant.io/integrations/ezviz"
final_url: "https://www.home-assistant.io/integrations/ezviz"
canonical_url: "https://www.home-assistant.io/integrations/ezviz/"
source_handle: "web:www-home-assistant-io:2f00d0be77f1"
source_section: "integrations-ezviz"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "e05c0adc6c7f37182831754cdc1440724800c4edb18f290e4a5a4dd78fdfce35"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# EZVIZ - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/ezviz
- Final URL: https://www.home-assistant.io/integrations/ezviz
- Canonical URL: https://www.home-assistant.io/integrations/ezviz/
- Fetched at: 2026-06-28T02:41:47Z
- Content type: text/html; charset=UTF-8

## Description

Integrate EZVIZ camera within Home Assistant.

## Extracted Text

On this page
Configuration
Integration entity options
Action ezviz.alarm_sound
Action ezviz.ptz
Action ezviz.set_alarm_detection_sensibility
Action ezviz.sound_alarm
Action ezviz.wake_device
Action camera.enable_motion_detection
Action camera.disable_motion_detection
Alarm control panel entity
OTA update
Motion detection sensitivity
Siren
PTZ
Warning sound
Battery work mode
Light entity
Image entity
Troubleshooting
Related topics
The EZVIZ integration uses the ezvizlife.com API to interact with the devices.
It also exposes an RTSP stream, by using the local camera IPs (so the device hosting Home Assistant has to be able to access the local IP of the cameras).
As there is no official documentation for the API, the integration retrieves data from the API used in the EZVIZ mobile app, hosted here .
The password for each camera is usually written near the QR code. This could be underneath the device or in the user manual. It is usually referred to as the camera “verification code”.
The local RTSP server on your camera needs to be enabled. To do that:
Open the EZVIZ mobile app.
Select the profile icon.
Navigate to Settings > LAN Live View > Start Scanning .
Select your camera.
Select the gear-like icon in the top-right corner > Local Server Settings > enable RTSP .
To add the EZVIZ integration to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select EZVIZ .
Follow the instructions on screen to complete the setup.
Your cameras will now show under integration options as “discovered devices”. Please complete the setup for each camera to see the video stream within Home Assistant.
You can also change the camera options should you need to access a high or low res stream. Generally, though it will just work without any modification to options.
Request Timeout (seconds) :
This option determines the duration Home Assistant waits for data from the EZVIZ API before giving up. This timeout is specified in seconds. If the API response takes longer than the specified timeout, Home Assistant will stop waiting and assume the request has failed. Adjust this value according to your network conditions and the responsiveness of the EZVIZ API. A higher timeout may be necessary for slower connections.
Example: If you set the Request Timeout to 30 seconds (default option), Home Assistant will wait up to 30 seconds for a response from the EZVIZ API before timing out.
This only works on the main EZVIZ cloud entity.
Arguments passed to ffmpeg for cameras :
This option allows you to define additional parameters for capturing footage from your EZVIZ cameras. While camera resolution and codec settings are typically configured in the “Ezviz Studio” desktop application, you can use this option to select the desired stream or substream for capturing the footage.
To choose the appropriate stream or substream, specify the corresponding channel path in the Arguments passed to ffmpeg for cameras field. The channel path identifies the specific stream or substream of the camera.
Example: If you want to use the camera’s substream, you can specify the channel path as /Streaming/Channels/102 . Alternatively, if you prefer the main stream, use /Streaming/Channels/101 . You can also configure multiple stream/substream options based on your camera’s capabilities and resource requirements.
Cameras typically default to the main stream if this is invalid or not specified.
This only works on the camera entities.
If your EZVIZ camera supports warning sounds, you can use this action to set the intensity.
Data attribute Description entity_id String or list of strings that point at entity_id s of cameras. Use entity_id: all to target all. level Set the sound level to 0 for Soft, 1 for Intensive or 2 to disable
If your EZVIZ camera supports PTZ , you will be able to pan or tilt your camera.
Data attribute Description entity_id String or list of strings that point at entity_id s of cameras. Use entity_id: all to target all. direction Direction of the movement. Allowed values: up , down , left , right speed (Optional) Speed to in which to move the camera. Allowed values: int from 1 to 9. Default: 5
If your EZVIZ camera supports motion detection, you will be able to set the sensitivity level using this action.
Data attribute Description entity_id String or list of strings that point at entity_id s of cameras. Use entity_id: all to target all. level Sensibility level (1-6) for type 0 (Normal camera) or (1-100) for type 3 (PIR sensor camera). type_value Type of detection. Options : 0 - Camera or 3 - PIR Sensor Camera.
If your EZVIZ camera has a built-in siren, you can use this action to make a noise.
Data attribute Description entity_id String or list of strings that point at entity_id s of cameras. Use entity_id: all to target all. enable Sound the alarm by setting this to 1 or stop the siren by setting this to 0.
If you have “sleep” mode enabled on your camera, you can use this action to wake it. Especially useful for battery cameras.
Data attribute Description entity_id String or list of strings that point at entity_id s of cameras. Use entity_id: all to target all.
To enable/disable motion detection, use the Home Assistant built in actions.
The Alarm control panel entity in the EZVIZ platform allows users to manage and control the armed status of all their EZVIZ devices. With this entity, users can choose between three options: Arm Away , Arm Sleep , and Disarm .
Trigger device OTA firmware update process for latest stable version.
The motion detection sensitivity can be adjusted using the “Detection sensitivity” Number entity. It’s important to note that this entity fetches information from the device and will not update if your battery-powered camera is in sleep mode, as this measure is implemented to preserve battery life and prevent excessive drainage.
The Siren entity allows you to activate the Alarm function on the device. In most cameras, the Alarm function incorporates a strobe light and/or an audible siren that is designed to deter potential intruders.
Once triggered, the siren will automatically deactivate after 60 seconds (EZVIZ does this, not done via integration). Alternatively, you can manually deactivate the siren by using the entity.
PTZ up/down/left/right buttons are available on supported PTZ cameras for pan and tilt control.
If your camera supports motion detection warning sounds, you can use this entity to select the level.
For battery powered cameras, you can use this entity to select the battery work mode to optimize your battery consumption.
Battery work mode Description Plugged in The camera will keep recording. The camera should be plugged in. High performance One video clip is longer but saves less power. Power save One video clip is shorter and saves more power. Super power saving Sleep mode is on. Active live view can wake up the camera. Custom The camera will use the schedules registered in the app.
A light entity will be added to cameras + light combos. You can turn it on/off and set the brightness.
The image entity represents the last detected event from a camera and visually represents the event within Home Assistant.
authentication failed : The authentication requires an EZVIZ account with two-step verification disabled. Google, Facebook, TikTok, or other Oauth-based accounts will not work.
Controlling the camera from the dashboard
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The EZVIZ integration was introduced in Home Assistant 0.107, and it's used by
1.5% of the active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@RenierM26
Categories
Camera
Update
Back to top
