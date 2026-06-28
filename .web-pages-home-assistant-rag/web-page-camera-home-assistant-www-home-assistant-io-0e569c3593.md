---
source_url: "https://www.home-assistant.io/integrations/camera"
final_url: "https://www.home-assistant.io/integrations/camera"
canonical_url: "https://www.home-assistant.io/integrations/camera/"
source_handle: "web:www-home-assistant-io:0e569c359369"
source_section: "integrations-camera"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "27dbe1cfde9ea078a4efe2182613639d49effd04bace2d1b2348d5c84126bd42"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Camera - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/camera
- Final URL: https://www.home-assistant.io/integrations/camera
- Canonical URL: https://www.home-assistant.io/integrations/camera/
- Fetched at: 2026-06-28T02:33:13Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate cameras within Home Assistant.

## Extracted Text

On this page
Streaming video
The state of a camera
List of actions
Test if it works
The Camera integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to use IP cameras with Home Assistant.
Note
Building block integration
This camera is a building block integration that cannot be added to your Home Assistant directly but is used and provided by other integrations.
A building block integration differs from the typical integration that connects to a device or service. Instead, other integrations that do integrate a device or service into Home Assistant use this camera building block to provide entities, services, and other functionality that you can use in your automations or dashboards.
If one of your integrations features this building block, this page documents the functionality the camera building block offers.
If your camera supports it, and the stream integration is set up, you will be able to stream your cameras in the frontend and on supported media players.
The Preload stream option will start the camera feed on Home Assistant startup and continue to keep the stream alive. This will result in reduced latency when opening the stream in the frontend, as well as when using the play_stream action or Google Assistant integration. It does, however, utilize more resources on your machine, so it is recommended to check CPU usage if you plan to use this feature.
Example showing the Preload Stream option in the camera dialog.
A camera can have the following states. Not all camera integrations support all states.
Streaming : The camera transmits a live play-back of the video data it is recording.
Recording : The camera is currently capturing video content.
Idle : The camera is not currently capturing video content.
Unavailable : The entity is currently unavailable.
Unknown : The state is not yet known.
The Camera integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Disable camera motion detection ( camera.disable_motion_detection )
Disables the motion detection of a camera.
Enable camera motion detection ( camera.enable_motion_detection )
Enables the motion detection of a camera.
Play camera stream ( camera.play_stream )
Plays a camera stream on a supported media player.
Record camera feed ( camera.record )
Creates a recording of a live camera feed.
Take camera snapshot ( camera.snapshot )
Takes a snapshot from a camera.
Turn off camera ( camera.turn_off )
Turns off a camera.
Turn on camera ( camera.turn_on )
Turns on a camera.
For an overview of every action across all integrations, see the actions reference .
A way to test if you have set up your camera platform correctly, is to use Actions from the Developer tools . Choose your action from the dropdown menu Action , enter something like the sample below into the data field, and select Perform action .
entity_id : camera.living_room_camera
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Camera entity was introduced in Home Assistant 0.7.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Categories
Camera
Media source
Back to top
