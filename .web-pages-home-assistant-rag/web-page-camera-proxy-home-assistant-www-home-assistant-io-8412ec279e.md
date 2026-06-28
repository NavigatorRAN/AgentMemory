---
source_url: "https://www.home-assistant.io/integrations/proxy"
final_url: "https://www.home-assistant.io/integrations/proxy"
canonical_url: "https://www.home-assistant.io/integrations/proxy/"
source_handle: "web:www-home-assistant-io:8412ec279e78"
source_section: "integrations-proxy"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "a1196b3ed8661847e122eaa5a6f222ab7bec798cd6cd0685e114fe33d3833ea5"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Camera Proxy - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/proxy
- Final URL: https://www.home-assistant.io/integrations/proxy
- Canonical URL: https://www.home-assistant.io/integrations/proxy/
- Fetched at: 2026-06-28T03:09:33Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate a camera proxy within Home Assistant.

## Extracted Text

On this page
Configuration
Examples
Related topics
The Camera Proxy integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to pass another camera’s output through post-processing routines and generate a new camera with the post-processed output.
The current post-processing supports resizing and/or cropping the image/MJPEG as well as limiting the maximum refresh rate.
The current proxy capabilities are intended to reduce the camera bandwidth for slower internet connections.
To enable this camera in your installation, you must first have an existing working camera configured in Home Assistant. Next, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry camera : - platform : proxy entity_id : camera.<existingcamera> max_stream_width : 360 max_image_width : 720
Configuration Variables
Looking for your configuration file?
entity_id string Required
The ID of another Home Assistant camera to post-process.
name string ( Optional )
This parameter allows you to override the name of your camera.
mode string ( Optional , default: resize )
The operating mode, either resize or crop .
max_image_width integer ( Optional )
The maximum width of single images taken from the camera (aspect ratio will be maintained on resize processing).
max_image_height integer ( Optional )
The maximum height of single images taken from the camera, only used for crop operations. If not provided, the original height is assumed by default.
max_stream_width integer ( Optional )
The maximum width of the MJPEG stream from the camera (aspect ratio will be maintained on resize processing).
max_stream_height integer ( Optional )
The maximum height of the MJPEG stream from the camera, only used for crop operations. If not provided, the original height is assumed by default.
image_top integer ( Optional , default: 0 )
The top (y) coordinate to be used as a starting point for crop operations.
image_left integer ( Optional , default: 0 )
The left (x) coordinate to be used as a starting point for crop operations.
image_quality integer ( Optional , default: 75 )
The quality level used for resulting JPEG for snapshots.
stream_quality integer ( Optional , default: 75 )
The quality level used for resulting MJPEG streams.
image_refresh_rate float ( Optional )
The minimum time in seconds between generating successive image snapshots.
force_resize boolean ( Optional , default: false )
Resize the image even if the resulting image would take up more bandwidth than the original.
cache_images boolean ( Optional , default: false )
Preserve the last image and re-send in the case the camera is not responding.
Example of using two Camera proxies along with a Foscam camera:
camera : - platform : foscam ip : 192.168.1.10 username : foscam_camera password : camera_password name : mycamera - platform : proxy entity_id : camera.mycamera max_stream_width : 360 max_image_width : 480 image_refresh_rate : 5.0 - platform : proxy entity_id : camera.mycamera name : My cropped camera mode : crop max_image_width : 480 max_image_height : 320 max_stream_width : 480 max_stream_height : 320 image_left : 100
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Camera Proxy integration was introduced in Home Assistant 0.65, and it's used by
443 active installations.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Camera
Back to top
