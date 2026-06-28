---
source_url: "https://www.home-assistant.io/integrations/foscam"
final_url: "https://www.home-assistant.io/integrations/foscam"
canonical_url: "https://www.home-assistant.io/integrations/foscam/"
source_handle: "web:www-home-assistant-io:130ed4d57b6b"
source_section: "integrations-foscam"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "85ab3df4886eed1c1a71c9f47f6b7dc4b725198713e0448058b0bfbbca94fd15"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Foscam - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/foscam
- Final URL: https://www.home-assistant.io/integrations/foscam
- Canonical URL: https://www.home-assistant.io/integrations/foscam/
- Fetched at: 2026-06-28T02:43:59Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Foscam IP cameras within Home Assistant.

## Extracted Text

On this page
Configuration
Supported functionality
Entities
Extra CGI Commands
The Foscam integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to watch the live stream of your Foscam IP camera in Home Assistant.
To add the Foscam device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Foscam .
Follow the instructions on screen to complete the setup.
Note
There seems to be some issues within Foscam with lengthy passwords and passwords containing certain symbols. Be sure to check your camera’s documentation.
The Foscam integration provides the following entities.
Camera
Streams
Description : Most Foscam IP Cameras support two video streams, by default the Main stream is the high quality stream while the Sub stream is a lower quality stream. These streams can be configured in your camera preferences.
Available for machines : all.
Switch
Infrared
Description : Control the camera’s infrared illuminator.
Device indicator light
Description : Control the camera’s status indicator.
White light
Description : Control the camera’s white light illuminator.
Available for machines : Cameras equipped with white light illumination.
Remarks : Since there is currently no mechanism to determine device capabilities for conditionally displaying the white light switch, unsupported models will still show the switch — but in a disabled state. This will be refined in a future update.
Siren alarm
Description : Control the device’s alarm.
Image flip/mirror
Description : Toggle image flip/mirror on the device.
Sleep
Description : Toggle sleep mode, when enabled, the device enters sleep state.
HDR
Description : Toggle the camera’s HDR, when enabled, the image will reveal more detail in shadows and highlights.
WDR
Description : Toggle the camera’s WDR, when enabled, the image will reveal more detail in shadows and highlights.
Number
Device volume
Description : Adjust the volume of device alert sounds, such as alarms and power on/off tones.
Speak volume
Description : Adjust the device’s intercom volume.
Action foscam.ptz
Control the device’s PTZ functions
Description : If your Foscam camera supports PTZ , you will be able to pan or tilt your camera.
Data attribute Description entity_id String or list of strings that point at entity_id s of cameras. Use entity_id: all to target all. movement Direction of the movement. Allowed values: up , down , left , right , top_left , top_right , bottom_left , bottom_right travel_time (Optional) Travel time in seconds. Allowed values: float from 0 to 1. Default: 0.125
Available for machines : Devices with PTZ functionality.
Action foscam.ptz_preset
Direct the device to a specified preset position.
Description : If your Foscam camera supports PTZ presets, you will be able to move the camera to a predefined preset using the preset name.
Data attribute Description entity_id String or list of strings that point at entity_id s of cameras. Use entity_id: all to target all. preset_name The name of the preset to move to. Presets can be created from within the official Foscam apps.
Example card with controls
Example showing a Foscam camera with controls for Pan and Tilt.
Using the following card code you can achieve a card displaying the live video feed from a Foscam camera with controls for moving the camera at the bottom right corner.
type : picture-elements image : camera.bedroom camera_image : camera.bedroom camera_view : live elements : - type : icon icon : " mdi:arrow-up" style : background : " rgba(255, 255, 255, 0.5)" right : 25px bottom : 50px tap_action : action : perform-action perform_action : foscam.ptz target : entity_id : camera.bedroom data : movement : up - type : icon icon : " mdi:arrow-down" style : background : " rgba(255, 255, 255, 0.5)" right : 25px bottom : 0px tap_action : action : perform-action perform_action : foscam.ptz target : entity_id : camera.bedroom data : movement : down - type : icon icon : " mdi:arrow-left" style : background : " rgba(255, 255, 255, 0.5)" right : 50px bottom : 25px tap_action : action : perform-action perform_action : foscam.ptz target : entity_id : camera.bedroom data : movement : left - type : icon icon : " mdi:arrow-right" style : background : " rgba(255, 255, 255, 0.5)" right : 0px bottom : 25px tap_action : action : perform-action perform_action : foscam.ptz target : entity_id : camera.bedroom data : movement : right - type : icon icon : " mdi:arrow-top-left" style : background : " rgba(255, 255, 255, 0.5)" right : 50px bottom : 50px tap_action : action : perform-action perform_action : foscam.ptz target : entity_id : camera.bedroom data : movement : top_left - type : icon icon : " mdi:arrow-top-right" style : background : " rgba(255, 255, 255, 0.5)" right : 0px bottom : 50px tap_action : action : perform-action perform_action : foscam.ptz target : entity_id : camera.bedroom data : movement : top_right - type : icon icon : " mdi:arrow-bottom-left" style : background : " rgba(255, 255, 255, 0.5)" right : 50px bottom : 0px tap_action : action : perform-action perform_action : foscam.ptz target : entity_id : camera.bedroom data : movement : bottom_left - type : icon icon : " mdi:arrow-bottom-right" style : background : " rgba(255, 255, 255, 0.5)" right : 0px bottom : 0px tap_action : action : perform-action perform_action : foscam.ptz target : entity_id : camera.bedroom data : movement : bottom_right
Foscam Webcams which support CGI Commands can be controlled by Home Assistant ( Source ).
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Foscam device was introduced in Home Assistant 0.7.3, and it's used by
2081 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@Foscam-wangzhengyu
Categories
Back to top
