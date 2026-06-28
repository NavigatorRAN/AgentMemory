# VIVOTEK - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/vivotek
- Final URL: https://www.home-assistant.io/integrations/vivotek
- Canonical URL: https://www.home-assistant.io/integrations/vivotek/
- Fetched at: 2026-06-28T03:26:54Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate VIVOTEK cameras within Home Assistant.

## Extracted Text

On this page
Configuration
Actions
The VIVOTEK integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to integrate a VIVOTEK IP camera into Home Assistant.
Home Assistant will serve the images via its server, making it possible to view your IP cameras while outside of your network. The endpoint is /api/camera_proxy/camera.[name] .
To add the VIVOTEK device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select VIVOTEK .
Follow the instructions on screen to complete the setup.
ip_address
The IP address of your camera, e.g., 192.168.1.2 .
port
The port number.
name
The name of your camera.
username
The username for accessing your camera.
password
The password for accessing your camera.
authentication
Type for authenticating the requests with basic or digest .
security_level
The security level of the user accessing your camera. This could be admin or viewer .
ssl
Enable or disable SSL. Set to false to use an HTTP-only camera.
verify_ssl
Enable or disable SSL certificate verification. Set to false to use an HTTP-only camera, or you have a self-signed SSL certificate and haven’t installed the CA certificate to enable verification.
framerate
The number of frames-per-second (FPS) of the stream. Can cause heavy traffic on the network and/or heavy load on the camera.
stream_path
This parameter allows you to override the stream path. The default is live.sdp .
Once loaded, the camera platform will expose actions that can be called to perform various actions.
Available actions: enable_motion_detection , disable_motion_detection , snapshot , and play_stream .
Action: Play stream
The play_stream action plays a live stream from a camera to selected media player(s). Requires stream integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] to be set up.
Data attribute Optional Description entity_id no Name of entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] to fetch stream from, e.g., camera.front_door_camera . media_player no Name of media player to play stream on, e.g., media_player.living_room_tv . format yes Stream format supported by stream integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] and selected media_player . Default: hls
For example, the following action in an automation would send an hls live stream to your chromecast.
actions : - action : camera.play_stream target : entity_id : camera.yourcamera data : media_player : media_player.chromecast
Action enable_motion_detection
Enable motion detection in a camera. Currently, this will enable the first event configured on the camera.
Data attribute Optional Description entity_id yes Name(s) of entities to enable motion detection, e.g., camera.front_door_camera . Action disable_motion_detection
Disable the motion detection in a camera. Currently, this will disable the first event configured on the camera.
Data attribute Optional Description entity_id yes Name(s) of entities to disable motion detection, e.g., camera.front_door_camera . Action snapshot
Take a snapshot from a camera.
Data attribute Optional Description entity_id no Name(s) of entities to create a snapshot from, e.g., camera.front_door_camera . filename no Template of a file name. Variable is entity_id , e.g., /tmp/snapshot_{{ entity_id }} .
The path part of filename must be an entry in the allowlist_external_dirs in your homeassistant: section of your configuration.yaml file.
For example, the following action is an automation that would take a snapshot from “front_door_camera” and save it to /tmp with a timestamped filename.
actions : - action : camera.snapshot target : entity_id : camera.front_door_camera data : filename : ' /tmp/yourcamera_{{ now().strftime("%Y%m%d-%H%M%S") }}.jpg'
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The VIVOTEK device was introduced in Home Assistant 0.99, and it's used by
77 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@HarlemSquirrel
Categories
Camera
Back to top
