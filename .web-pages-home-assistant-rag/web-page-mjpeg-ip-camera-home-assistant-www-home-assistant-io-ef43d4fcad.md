# MJPEG IP Camera - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/mjpeg
- Final URL: https://www.home-assistant.io/integrations/mjpeg
- Canonical URL: https://www.home-assistant.io/integrations/mjpeg/
- Fetched at: 2026-06-28T03:00:26Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate IP cameras within Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Examples of MJPEG and still image URLs
The MJPEG IP Camera integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to integrate IP cameras which are
capable to stream their video with MJPEG (Motion JPEG) into Home Assistant.
To use this integration, you will need to at least have the video streaming
URL for your camera. If you don’t know it, you could try to look it up
in the iSpy Camera Connection Database .
To add the MJPEG IP Camera integration to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select MJPEG IP Camera .
Follow the instructions on screen to complete the setup.
MJPEG URL
The URL your camera serves the video on, e.g., http://192.168.1.21:2112/
Still Image URL
The URL for thumbnail picture (if the camera support that).
Username
The username for accessing your camera.
Password
The password for accessing your camera.
Verify SSL
Validate the SSL certificate for this camera.
This integration support both basic and digest authentication, which one to
use is automatically detected when using a username and password.
Blue Iris Cameras / Blue Iris Server:
MJPEG URL: http://IP:PORT/mjpg/CAMERASHORTNAME/video.mjpeg
Still Image URL: http://IP:PORT/image/CAMERASHORTNAME
DCS-930L Wireless N Network Camera from D-Link:
MJPEG URL: http://IP/video/mjpg.cgi
Still Image URL: http://IP/image.jpg
DCS-933L Wireless N Network Camera from D-Link:
MJPEG URL: http://IP:PORT/video/mjpg.cgi
Still Image URL: http://IP:PORT/image/jpeg.cgi
OctoPrint (OctoPi):
MJPEG URL: http://IP/webcam/?action=stream
Still Image URL: http://IP/webcam/?action=snapshot
Legacy Foscam / wanscam
MJPEG URL: http://IP:PORT/videostream.cgi (add ?resultion=32 for 640x480 or ?resultion=32 for 320x240)
Still Image URL: http://IP:PORT/snapshot.cgi
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The MJPEG IP Camera integration was introduced in Home Assistant pre 0.7, and it's used by
1.4% of the active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Camera
Back to top
