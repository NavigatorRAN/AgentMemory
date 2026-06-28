---
source_url: "https://www.home-assistant.io/integrations/ffmpeg_motion"
final_url: "https://www.home-assistant.io/integrations/ffmpeg_motion"
canonical_url: "https://www.home-assistant.io/integrations/ffmpeg_motion/"
source_handle: "web:www-home-assistant-io:7afbcad1600f"
source_section: "integrations-ffmpeg-motion"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "a5cb12a08122fabf8387be7f6db4b2b9711071d782901b1f5e2fdf3e9e749448"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# FFmpeg Motion - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/ffmpeg_motion
- Final URL: https://www.home-assistant.io/integrations/ffmpeg_motion
- Canonical URL: https://www.home-assistant.io/integrations/ffmpeg_motion/
- Fetched at: 2026-06-28T02:42:17Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate an FFmpeg-based motion binary sensor

## Extracted Text

On this page
Motion
Configuration
Tips
Related topics
The FFmpeg Motion integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to use any video feed with FFmpeg for motion sensors in Home Assistant.
Note
If the ffmpeg process is broken, the sensor will be unavailable. To control the FFmpeg process of the sensor, use the ffmpeg.start , ffmpeg.stop , and ffmpeg.restart actions.
FFmpeg doesn’t have a motion detection filter, but can use a scene filter to detect a new scene/motion. You can set how much needs to change to detect motion with the option ‘changes’, the percent value of change between frames. If you want a really small value for ‘changes’, you can also add a denoise filter.
To add FFmpeg with motion detection to your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry binary_sensor : - platform : ffmpeg_motion input : FFMPEG_SUPPORTED_INPUT
Configuration Variables
Looking for your configuration file?
input string Required
An FFmpeg-compatible input file, stream, or feed.
name string ( Optional )
Override the name of your camera for the frontend.
initial_state boolean ( Optional , default: true )
Start ffmpeg with Home Assistant.
changes integer ( Optional , default: 10 )
How much needs to change between two frames to detect it as motion, value in percentage (a lower value is more sensitive).
reset integer ( Optional , default: 20 )
The time to reset the state after no new motion is detected.
repeat integer ( Optional , default: 0 )
How many events need to be detected in repeat_time to trigger a motion, 0 repeats means deactivated.
repeat_time integer ( Optional , default: 0 )
The span of time repeat events need to occur in before triggering a motion, 0 seconds means deactivated.
extra_arguments string ( Optional )
Extra options to pass to ffmpeg , e.g., video denoise filtering.
To experiment with values (changes/100 is the scene value in ffmpeg ):
ffmpeg -i YOUR_INPUT -an -filter :v select = gt ( scene \, 0.1 ) -f framemd5 -
If you are running into trouble with this sensor, please refer to the troubleshooting section .
Use motion only in a custom area with crop filter :
extra_arguments : -filter:v "crop=100:100:12:34"
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The FFmpeg Motion integration was introduced in Home Assistant 0.27, and it's used by
319 active installations.
Its IoT class is Calculated.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Image processing
Back to top
