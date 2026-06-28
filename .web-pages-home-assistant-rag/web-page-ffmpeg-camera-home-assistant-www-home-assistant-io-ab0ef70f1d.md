# FFmpeg Camera - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/camera.ffmpeg
- Final URL: https://www.home-assistant.io/integrations/camera.ffmpeg
- Canonical URL: https://www.home-assistant.io/integrations/camera.ffmpeg/
- Fetched at: 2026-06-28T02:33:15Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate a video feed via FFmpeg as a camera within Home Assistant.

## Extracted Text

On this page
Configuration
Image quality
The FFmpeg Camera integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to use any video feed as a camera in Home Assistant via FFmpeg . This video source must support multiple simultaneous reads, because for every concurrent Home Assistant user, a connection will be made to the source every 10 seconds. Normally this should not be a problem.
To enable your FFmpeg feed in your installation you must first configure the FFmpeg integration , then add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry camera : - platform : ffmpeg input : FFMPEG_SUPPORTED_INPUT
Configuration Variables
Looking for your configuration file?
input string Required
An FFmpeg-compatible input file, stream, or feed.
name string ( Optional )
Override the name of your camera.
extra_arguments string ( Optional , default: -pred 1 )
Extra options to pass to ffmpeg , such as image quality or video filter options.
You can control the image quality with extra_arguments -q:v 2-32 or with lossless option -pred 1 . Default is lossless.
If you are running into trouble with this sensor, please refer to the Troubleshooting section .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The FFmpeg Camera integration was introduced in Home Assistant 0.26, and it's used by
3.2% of the active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Camera
Back to top
