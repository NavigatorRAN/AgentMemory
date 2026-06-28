# FFmpeg - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/ffmpeg
- Final URL: https://www.home-assistant.io/integrations/ffmpeg
- Canonical URL: https://www.home-assistant.io/integrations/ffmpeg/
- Fetched at: 2026-06-28T02:42:14Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate FFmpeg within Home Assistant.

## Extracted Text

On this page
Configuration
Troubleshooting
The FFmpeg integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows other Home Assistant integrations to process
video and audio streams.
This integration supports all FFmpeg versions since 3.0.0. If you run
the Home Assistant Operating System or use the Home Assistant Container,
this is already pre-installed for you. In all other cases, make sure
you have FFmpeg installed on your system.
To set it up, add the following information to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
ffmpeg :
Configuration Variables
Looking for your configuration file?
ffmpeg_bin string ( Optional , default: ffmpeg )
The name or path to the ffmpeg binary.
In most cases, ffmpeg automatically detects all needed options to read
a video or audio stream or file. But it is possible in rare cases that you
will need to set options to help ffmpeg out.
First, check that your stream is playable by ffmpeg outside of Home Assistant
with (use option -an or -vn to disable video or audio stream):
ffmpeg -i INPUT -an -f null -
Now you should be able to see what is going wrong. The following list contains some common problems and solutions:
[rtsp @ ...] UDP timeout, retrying with TCP : You need to set an RTSP transport in the configuration with: input: -rtsp_transport tcp -i INPUT
[rtsp @ ...] Could not find codec parameters for stream 0 (Video: ..., none): unspecified size : FFmpeg needs more data or time for autodetection (the default is 5 seconds). You can set the analyzeduration and/or probesize options to experiment with giving FFmpeg more leeway. If you find the needed value, you can set it with: input: -analyzeduration xy -probesize xy -i INPUT . More information about this can be found here .
USB cameras
For INPUT a valid source is needed. A USB camera is an easy way to test your video setup. To get all available USB cameras connected to the system, e.g., use the v4l2 tools on a Linux machine.
$ v4l2-ctl --list-devices
UVC Camera ( 046d:0825 ) ( usb-0000:00:14.0-1 ) :
/dev/video1
Integrated Camera ( usb-0000:00:14.0-10 ) :
/dev/video0
Record a test video with your USB device /dev/video1 :
$ ffmpeg -i /dev/video1 -codec :v libx264 -qp 0 lossless.mp4
[ ...]
Input #0, video4linux2,v4l2, from '/dev/video1':
Duration: N/A, start: 43556.376974, bitrate: 147456 kb/s
Stream #0:0: Video: rawvideo (YUY2 / 0x32595559), yuyv422, 640x480, 147456 kb/s, 30 fps, 30 tbr, 1000k tbn, 1000k tbc [ ...]
Output #0, mp4, to 'lossless.mp4':
Metadata:
encoder : Lavf57.41.100
Stream #0:0: Video: h264 (libx264) ([33][0][0][0] / 0x0021), yuv422p, 640x480, q=-1--1, 30 fps, 15360 tbn, 30 tbc
encoder : Lavc57.48.101 libx264
Side data:
cpb: bitrate max/min/avg: 0/0/0 buffer size: 0 vbv_delay: -1
Stream mapping:
Stream #0:0 -> #0:0 (rawvideo (native) -> h264 (libx264))
Press [ q] to stop, [ ?] for help
frame = 223 fps = 40 q = -1 .0 Lsize = 16709kB time = 00:00:07.40 bitrate = 18497.5kbits/s dup = 58 drop = 0 speed = 1.32x
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The FFmpeg system was introduced in Home Assistant 0.29, and it's used by
3.2% of the active installations.
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Image processing
Back to top
