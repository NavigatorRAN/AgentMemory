---
source_url: "https://www.home-assistant.io/integrations/yi"
final_url: "https://www.home-assistant.io/integrations/yi"
canonical_url: "https://www.home-assistant.io/integrations/yi/"
source_handle: "web:www-home-assistant-io:bad3e1ca0c75"
source_section: "integrations-yi"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "ee170d55c60ae2bcec99d8587b9ca922929a3c9156561d2804e06a8e8954979f"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Yi Home Cameras - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/yi
- Final URL: https://www.home-assistant.io/integrations/yi
- Canonical URL: https://www.home-assistant.io/integrations/yi/
- Fetched at: 2026-06-28T03:30:25Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate a video feed (via FFmpeg) as a camera within Home Assistant.

## Extracted Text

On this page
Preparing the device
Installing alternative firmware
Changing the FTP password
Configuring the platform
Image quality
The Yi Home Cameras integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to use Yi Home Cameras within Home Assistant. Specifically, this platform supports the line of Yi Home Cameras that are based on the Hi3518e Chipset. This includes:
Yi Home 17CN / 27US / 47US
Yi 1080p Home
Yi Dome
Yi 1080p Dome
To successfully implement this platform, the Home Assistant host should be capable of multiple simultaneous reads. For every concurrent Home Assistant user, a connection will be made to the camera every 10 seconds. This should normally not be a problem.
To integrate the camera with Home Assistant, it is necessary to install a custom firmware on the device. Instructions for doing so can be found via the yi-hack-v3 GitHub project .
If you have a 2019/2020 version camera use yi-hack-MStar GitHub project or yi-hack-Allwinner GitHub project . In this case configure the cam as ONVIF and read the wiki for further details.
Once installed, please ensure that you have enabled FTP and Telnet on your device.
Important
Currently, version 0.1.4-beta2 of the custom firmware is the highest supported without having to make additional modifications. Firmwares higher than this version use Pure-FTPd , which has a bug that prevents FFmpeg from correctly rendering video files. To use higher firmware versions you must also follow this workaround to revert back to ftpd.
Tip
If you use a version higher than 0.1.4-beta2, you can simply solve the FTP issue by creating a symlink to /tmp in the /home/yi-hack-v4 directory (the directory name can be different depending on the version which you use). For example, access the Yi camera via SSH and type command: ln -s /tmp tmp .
Raspbian users: don’t forget to install FFmpeg support on your platform, otherwise, you’ll not see video.
Some alternative Yi firmwares enable an experimental RTSP server, which will allow you to connect to your camera via other Home Assistant camera platforms. However, this RTSP server disables the ability to use the supremely-useful Yi Home app. To maintain both Home Assistant compatibility and the native app, this platform retrieves videos via FTP.
Once the custom firmware is installed, a password must be added to the FTP
server. To do so:
Telnet into your camera: telnet <IP ADDRESS> .
Enter root as the username and <blank> as the password.
Type passwd and hit <Enter> .
Enter your new password twice.
Log out of Telnet.
To enable the platform, add the following lines to your configuration.yaml file:
camera : - platform : yi name : Camera host : " 192.168.1.100" password : my_password_123
Configuration Variables
Looking for your configuration file?
name string Required
A human-friendly name for the camera.
host string Required
The IP address or hostname of the camera.
password string Required
The password for the FTP server running on the camera. Can be any string as the current firmware doesn’t allow setting FTP passwords.
path string ( Optional )
The path to the raw MP4 files.
Default:
/media/mmcblk0p1/record
username string ( Optional , default: root )
The user that can access the FTP server.
ffmpeg_arguments string ( Optional )
Extra options to pass to ffmpeg (e.g., image quality or video filter options).
Any option supported by ffmpeg camera can be utilized via the ffmpeg_arguments configuration parameter.
One particularly useful adjustment deals with video size. Since Yi videos are fairly large (especially on the 1080p cameras), the following configuration will bring them down to a manageable size:
camera : - platform : yi name : My Camera host : " 192.168.1.100" password : my_password_123 path : /home/camera/feed ffmpeg_arguments : " -vf scale=800:450"
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Yi Home Cameras device was introduced in Home Assistant 0.56, and it's used by
105 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@bachya
Categories
Camera
Back to top
