---
source_url: "https://www.home-assistant.io/integrations/xiaomi"
final_url: "https://www.home-assistant.io/integrations/xiaomi"
canonical_url: "https://www.home-assistant.io/integrations/xiaomi/"
source_handle: "web:www-home-assistant-io:479ef2aba716"
source_section: "integrations-xiaomi"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "2350e997ca5502bf7222fef3b72e7b1b1b3a3c421e8c2169700a18ef316a69ac"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Xiaomi - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/xiaomi
- Final URL: https://www.home-assistant.io/integrations/xiaomi
- Canonical URL: https://www.home-assistant.io/integrations/xiaomi/
- Fetched at: 2026-06-28T03:29:31Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate a video feed (via FFmpeg) as a camera as well as a router within Home Assistant.

## Extracted Text

On this page
Camera
Prerequisites
Configuration
Image quality
Hostname template
Router
Compatibility test
Related topics
This section shows you how to integrate a Xiaomi router or a Xiaomi camera into Home Assistant.
The Xiaomi camera integration allows you to use Xiaomi cameras within Home Assistant.
To successfully implement this integration, the Home Assistant host should be capable of multiple simultaneous reads.
For every concurrent Home Assistant user, a connection will be made to the camera every 10 seconds. This should normally not be a problem.
Preparing the device
To integrate the camera with Home Assistant, it is necessary to install a custom firmware on the device.
To install the firmware, follow the steps in the model-specific documentation:
Yi 720p
Yi Home 17CN / 27US / 47US / 1080p Home / Dome / 1080p Dome
Recent Yi 1080p Home / 1080p Dome
Xiaofang 1080p Camera
Once installed, make sure you have enabled FTP.
Warning
Currently, version 0.1.4-beta2 of the custom firmware is the highest supported. Firmwares higher than this version use Pure-FTPd , which has a bug that prevents FFmpeg from correctly rendering video files.
Important
Raspbian users: Don’t forget to install ffmpeg support on your platform, otherwise, you’ll not see video.
Note
The live stream writing by the camera is not a supported format when Home Assistant reads through FTP for Yi 720p and Xiaofang Cameras, so this platform retrieves the video which was saved 1 minute earlier.
Tip
If you enabled RTSP server, you can connect to your camera via other Home Assistant camera platforms. However, this RTSP server disables the ability to use the supremely-useful Mi Home app. To maintain both Home Assistant compatibility and the native app, this platform retrieves videos via FTP.
To enable the camera, add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
camera : - platform : xiaomi name : Camera host : " 192.168.1.100" model : " yi" password : YOUR_PASSWORD
Configuration Variables
Looking for your configuration file?
name string Required
A human-friendly name for the camera.
host template Required
The IP address or hostname of the camera.
model string Required
The model of Xiaomi Camera, currently supporting yi and xiaofang.
password string Required
The password to the FTP server on the camera (from above), can be any string as the current firmware doesn’t allow setting ftp passwords.
path string ( Optional )
The path to the raw MP4 files.
Default:
/media/mmcblk0p1/record
username string ( Optional , default: root )
The user that can access the FTP server.
ffmpeg_arguments string ( Optional )
Extra options to pass to ffmpeg .
The default for path: will not work with all cameras. It may be needed that you add that key with the exact path for your device.
Any option supported by ffmpeg camera can be utilized via the ffmpeg_arguments configuration parameter.
One particularly useful adjustment deals with video size. Since Yi videos are fairly large (especially on the 1080p cameras), the following configuration will bring them down to a manageable size:
camera : - platform : xiaomi name : My Camera host : " 192.168.1.100" model : " xiaofang" password : YOUR_PASSWORD path : /home/camera/feed ffmpeg_arguments : " -vf scale=800:450"
The hostname/IP address can be provided either a value or from the existing entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] attributes.
camera : - platform : xiaomi name : Front Camera host : " {{ states.device_tracker.front_camera.attributes.ip }}" model : " yi" password : 1234 path : /tmp/sd/record
The Xiaomi router integration offers presence detection by looking at connected devices to a Xiaomi router.
To use an Xiaomi router in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry device_tracker : - platform : xiaomi host : YOUR_ROUTER_IP password : YOUR_ADMIN_PASSWORD
host string Required
The IP address of your router, e.g., 192.168.0.1 .
username string ( Optional , default: admin )
The admin username.
The password for the admin account.
See the device tracker integration page for instructions how to configure the people to be tracked.
To ensure that your router is compatible, navigate to http://YOUR_ROUTER_IP/api/misystem/devicelist .
You should see a listing of the device currently connected to your router.
However, some users report that even when the previous URL does not work, they have been able to integrate their Mi Router 3 in Home Assistant. E.g., some users with the Mi Router 3 and firmware version 2.10.46 Stable have integrated their routers successfully and an alternative URL to test integration with is http://YOUR_ROUTER_IP/cgi-bin/luci/api/misystem/devicelist . Navigating to this page should show the {"code":401,"msg":"Invalid token"} message.
Configuration.yaml file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Xiaomi integration was introduced in Home Assistant 0.72, and it's used by
128 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Presence detection
Back to top
