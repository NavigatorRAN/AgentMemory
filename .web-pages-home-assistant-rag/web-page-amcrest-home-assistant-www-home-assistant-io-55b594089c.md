# Amcrest - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/amcrest
- Final URL: https://www.home-assistant.io/integrations/amcrest
- Canonical URL: https://www.home-assistant.io/integrations/amcrest/
- Fetched at: 2026-06-28T02:27:47Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Amcrest (or Dahua) IP cameras within Home Assistant.

## Extracted Text

On this page
Configuration
Streaming vs polled binary sensors
Events
Actions
Action: Enable audio / disable audio
Action: Enable motion recording / disable motion recording
Action: Enable recording / disable recording
Action: Go to preset
Action: Set color BW
Action: Start tour / stop tour
Action: PTZ control
Notes
Example card with controls
Advanced configuration
Example automation to detect button presses on AD110 and AD410 doorbells
Related topics
The Amcrest integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to integrate your Amcrest or Dahua IP camera or doorbell in Home Assistant.
There is currently support for the following device A device is a model representing a physical or logical unit that contains entities. types within Home Assistant:
Binary sensor
Camera
Sensor
To enable your camera in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry amcrest : - host : IP_ADDRESS_CAMERA username : YOUR_USERNAME password : YOUR_PASSWORD
Configuration Variables
Looking for your configuration file?
host string Required
The IP address or hostname of your camera. If using a hostname, make sure the DNS works as expected.
username string Required
The username for accessing your camera. Most Amcrest devices use “admin” for the username, even if you’ve configured another username in their app.
password string Required
The password for accessing your camera.
name string ( Optional , default: Amcrest Camera )
This parameter allows you to override the name of your camera. In the case of multi-camera setups, this is highly recommended as camera id number will be randomly changed at each reboot if a name is not allocated.
port integer ( Optional , default: 80 )
The port that the camera is running on.
resolution string ( Optional , default: high )
This parameter allows you to specify the camera resolution. For a high resolution (1080/720p), specify the option high . For VGA resolution (640x480p), specify the option low .
stream_source string ( Optional , default: snapshot )
The data source for the live stream. mjpeg will use the camera’s native MJPEG stream, whereas snapshot will use the camera’s snapshot API to create a stream from still images. You can also set the rtsp option to generate the streaming via RTSP protocol.
ffmpeg_arguments string ( Optional , default: -pred 1 )
Extra options to pass to FFmpeg, e.g., image quality or video filter options.
authentication string ( Optional , default: basic )
Defines which authentication method to use only when stream_source is mjpeg . Currently, aiohttp only support basic .
scan_interval integer ( Optional , default: 10 )
Defines the update interval of the sensor in seconds.
binary_sensors list ( Optional , default: None )
Conditions to display in the frontend. The following conditions can be monitored:
audio_detected
Return on when audio is detected, off when not. To use this feature you must enable it in your cameras interface under Settings > Events > Audio Detection. Uses streaming method (see below ).
audio_detected_polled
Return on when audio is detected, off when not. To use this feature you must enable it in your cameras interface under Settings > Events > Audio Detection. Uses polled method (see below ).
motion_detected
Return on when a motion is detected, off when not. Motion detection is enabled by default for most cameras, if this functionality is not working check that it is enabled in Settings > Events > Video Detection. Uses streaming method (see below ).
motion_detected_polled
Return on when a motion is detected, off when not. Motion detection is enabled by default for most cameras, if this functionality is not working check that it is enabled in Settings > Events > Video Detection. Uses polled method (see below ).
crossline_detected
Return on when a tripwire tripping is detected, off when not. Uses streaming method (see below ).
crossline_detected_polled
Return on when a tripwire is tripping is detected, off when not. Uses polled method (see below ).
online
Return on when camera is available (that is, responding to commands), off when not.
sensors list ( Optional , default: None )
sdcard
Return the SD card usage by reporting the total and used space.
ptz_preset
Return the number of PTZ preset positions configured for the given camera.
switches list ( Optional , default: None )
Switches to control certain aspects of the cameras.
privacy_mode
Controls the camera’s Privacy Mode feature, if supported.
control_light boolean ( Optional , default: true )
Automatically control the camera’s indicator light, turning it on if the audio or video streams are enabled, and turning it off if both streams are disabled.
Note: Amcrest cameras with newer firmware can no longer
stream high definition video with MJPEG encoding. You may need to use low
resolution stream or the snapshot stream source instead. If the quality seems
too poor, lower the Frame Rate (FPS) and max out the Bit Rate settings in
your camera’s configuration manager. If you defined the stream_source to
mjpeg , make sure your camera supports Basic HTTP authentication.
Newer Amcrest firmware may not work, then rtsp is recommended instead.
Note: If you set the stream_source option to rtsp ,
make sure to follow the steps mentioned at FFmpeg
documentation to install the ffmpeg .
Some binary sensors provide two choices for method of operation: streaming or polled. Streaming is more responsive and causes less network traffic because the camera will tell Home Assistant when the sensor’s state has changed. Polled mode queries the camera periodically (every five seconds) to check the state of the sensor. Therefore streaming is the better option. However, some camera models and versions of camera firmware do not seem to implement the streaming method properly. Therefore the polled mode is also available. It is recommended to use the streaming mode (e.g., motion_detected ) first, and if that doesn’t work (e.g., results in constant errors), then try the polled mode instead (e.g., motion_detected_polled .)
Once loaded, the Amcrest integration will generate (Home Assistant) events Every time something happens in Home Assistant, an event is fired. There are different types of events, such as state change events, when an action was triggered, or the time changed. All entities produce state change events. Every time a state changes, a state change event is produced. Events can be used to trigger automations or scripts. For example, you can trigger an automation when a light is turned on, then a speaker turns on in that room. Events can also be used to trigger actions in the frontend. For example, you can trigger an action when a button is pressed. [Learn more] when it receives event notifications in the stream sent by the camera. This is only possible if the camera model and firmware implement the streaming method (see above ). The event type is amcrest and the data is as follows:
{ "camera" : "<name of the camera that triggered the event>" , "event" : "<amcrest-specific code of the event>" , "payload" : { <json-encoded content sent by the device through the streaming protocol> } }
The event code is sent by Amcrest or Dahua devices in the payload as a “Code” member. To ease event matching in automations, this code is replicated in a more top-level event member in data .
Once loaded, the amcrest integration will expose actions Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] that can be called to perform various actions. The entity_id action attribute can specify one or more specific cameras, or all can be used to specify all configured Amcrest cameras.
Available actions Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] :
enable_audio , disable_audio ,
enable_motion_recording , disable_motion_recording ,
enable_recording , disable_recording ,
goto_preset , set_color_bw ,
start_tour , stop_tour , and
ptz_control
The amcrest.enable_audio and amcrest.disable_audio actions Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] allow you to enable or disable the camera’s audio stream.
Data attribute Optional Description entity_id no The entity ID of the camera to control. May be a list of multiple entity IDs. To target all cameras, set entity ID to all .
The amcrest.enable_motion_recording and amcrest.disable_motion_recording actions Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] allow you to enable or disable the camera to record a clip to its configured storage location when motion is detected.
The amcrest.enable_recording and amcrest.disable_recording actions allow you to enable or disable the camera to continuously record to its configured storage location.
The amcrest.goto_preset action allows you to move the camera to one of the PTZ locations configured within the camera.
Data attribute Optional Description entity_id no The entity ID of the camera to control. May be a list of multiple entity IDs. To target all cameras, set entity ID to all . preset no Preset number, starting from 1.
The amcrest.set_color_bw action allows you to set the color mode of the camera.
Data attribute Optional Description entity_id no The entity ID of the camera to control. May be a list of multiple entity IDs. To target all cameras, set entity ID to all . color_bw no One of auto , bw or color .
The amcrest.start_tour and amcrest.stop_tour actions allow you to start or stop the camera’s PTZ tour function.
The amcrest.ptz_control action allows you to pan, tilt or zoom your camera if your Amcrest or Dahua camera supports PTZ .
Data attribute Optional Description entity_id no The entity ID of the camera to control. May be a list of multiple entity IDs. To target all cameras, set entity ID to all . movement no Direction of the movement. Allowed values: zoom_in , zoom_out , up , down , left , right , right_up , right_down , left_up , left_down travel_time yes Travel time in fractional seconds. Allowed values: 0 to 1 . Default: 0.2 .
PTZ zoom capability does not control VariFocal lens adjustments.
There can be several seconds of lag before the video (snapshot or live) reflects the camera movement.
Example showing an Amcrest IP2M-841 PT camera with controls for Pan and Tilt.
Using the following picture-elements card code, you can display a live video feed from an Amcrest camera with controls for moving or zooming the camera.
type : picture-elements entity : camera.lakehouse camera_image : camera.lakehouse camera_view : live # or auto for snapshot view elements : - type : icon icon : " mdi:arrow-up" style : background : " rgba(255, 255, 255, 0.25)" right : 25px bottom : 50px tap_action : action : perform-action perform_action : amcrest.ptz_control service_data : entity_id : camera.lakehouse movement : up - type : icon icon : " mdi:arrow-down" style : background : " rgba(255, 255, 255, 0.25)" right : 25px bottom : 0px tap_action : action : perform-action perform_action : amcrest.ptz_control service_data : entity_id : camera.lakehouse movement : down - type : icon icon : " mdi:arrow-left" style : background : " rgba(255, 255, 255, 0.25)" right : 50px bottom : 25px tap_action : action : perform-action perform_action : amcrest.ptz_control service_data : entity_id : camera.lakehouse movement : left - type : icon icon : " mdi:arrow-right" style : background : " rgba(255, 255, 255, 0.25)" right : 0px bottom : 25px tap_action : action : perform-action perform_action : amcrest.ptz_control service_data : entity_id : camera.lakehouse movement : right - type : icon icon : " mdi:arrow-top-left" style : background : " rgba(255, 255, 255, 0.25)" right : 50px bottom : 50px tap_action : action : perform-action perform_action : amcrest.ptz_control service_data : entity_id : camera.lakehouse movement : left_up - type : icon icon : " mdi:arrow-top-right" style : background : " rgba(255, 255, 255, 0.25)" right : 0px bottom : 50px tap_action : action : perform-action perform_action : amcrest.ptz_control service_data : entity_id : camera.lakehouse movement : right_up - type : icon icon : " mdi:arrow-bottom-left" style : background : " rgba(255, 255, 255, 0.25)" right : 50px bottom : 0px tap_action : action : perform-action perform_action : amcrest.ptz_control service_data : entity_id : camera.lakehouse movement : left_down - type : icon icon : " mdi:arrow-bottom-right" style : background : " rgba(255, 255, 255, 0.25)" right : 0px bottom : 0px tap_action : action : perform-action perform_action : amcrest.ptz_control service_data : entity_id : camera.lakehouse movement : right_down - type : icon icon : " mdi:magnify" style : background : " rgba(255, 255, 255, 0.25)" bottom : 25px right : 25px tap_action : action : perform-action perform_action : amcrest.ptz_control service_data : entity_id : camera.lakehouse movement : zoom_in hold_action : action : perform-action perform_action : amcrest.ptz_control data : entity_id : camera.lakehouse movement : zoom_out
You can also use this more advanced configuration example:
# Example configuration.yaml entry amcrest : - host : IP_ADDRESS_CAMERA_1 username : YOUR_USERNAME password : YOUR_PASSWORD binary_sensors : - motion_detected - crossline_detected - online sensors : - sdcard # Add second camera - host : IP_ADDRESS_CAMERA_2 username : YOUR_USERNAME password : YOUR_PASSWORD name : Amcrest Camera 2 resolution : low stream_source : snapshot sensors : - ptz_preset
Using this trigger A trigger is a set of values or conditions of a platform that are defined to cause an automation to run. [Learn more] in an automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] will allow you to detect the press of the doorbell call button and create automations based upon it.
# Example automations.yaml entry alias : " Doorbell Pressed" description : " Trigger when Amcrest Button Press Event Fires" triggers : - trigger : event event_type : amcrest event_data : event : " CallNoAnswered" payload : action : " Start" actions : - type : flash entity_id : light.living_room domain : light
To check if your Amcrest camera is supported/tested, visit the supportability matrix link from the python-amcrest project.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Amcrest integration was introduced in Home Assistant 0.49, and it's used by
1401 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@flacjacket
Categories
Hub
Back to top
