---
source_url: "https://www.home-assistant.io/integrations/ffmpeg_noise"
final_url: "https://www.home-assistant.io/integrations/ffmpeg_noise"
canonical_url: "https://www.home-assistant.io/integrations/ffmpeg_noise/"
source_handle: "web:www-home-assistant-io:1f560a1db0e0"
source_section: "integrations-ffmpeg-noise"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "a521514e1e0e59eed74872297adda6307e026d7b7068da92bb372c315d8cdbf0"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# FFmpeg Noise - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/ffmpeg_noise
- Final URL: https://www.home-assistant.io/integrations/ffmpeg_noise
- Canonical URL: https://www.home-assistant.io/integrations/ffmpeg_noise/
- Fetched at: 2026-06-28T02:42:20Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate an FFmpeg-based noise binary sensor

## Extracted Text

On this page
Configuration
Troubleshooting
Related topics
The FFmpeg Noise integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to use any video or audio feed with FFmpeg for various sensors in Home Assistant.
Note
If the ffmpeg process is broken, the sensor will be unavailable. To control the FFmpeg process of sensor, use the ffmpeg.start , ffmpeg.stop , and ffmpeg.restart actions.
To add FFmpeg with noise detection to your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry binary_sensor : - platform : ffmpeg_noise input : FFMPEG_SUPPORTED_INPUT
Configuration Variables
Looking for your configuration file?
input string Required
An FFmpeg-compatible input file, stream, or feed.
name string ( Optional )
Override the name of your camera.
initial_state boolean ( Optional , default: true )
Start FFmpeg with Home Assistant.
peak integer ( Optional , default: -30 )
The threshold of detecting noise, in dB. 0 is very loud and -100 is low.
duration integer ( Optional , default: 1 )
How long the noise needs to be over the peak to trigger the state.
reset integer ( Optional , default: 20 )
The time to reset the state after no new noise is over the peak.
extra_arguments string ( Optional )
Extra options to pass to ffmpeg , like audio frequency filtering.
output string ( Optional )
Allows you to send the audio output of this sensor to an Icecast server or other FFmpeg-supported output, e.g., to stream with Sonos after a state is triggered.
To experiment with values:
ffmpeg -i YOUR_INPUT -vn -filter :a silencedetect = n = -30dB :d = 1 -f null -
Unresponsive after a while
If the noise sensor becomes unresponsive, make sure you have extra_arguments: -nostats in the configuration.
# Example configuration.yaml entry binary_sensor : - platform : ffmpeg_noise input : FFMPEG_SUPPORTED_INPUT extra_arguments : -nostats
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The FFmpeg Noise integration was introduced in Home Assistant 0.27, and it's used by
200 active installations.
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
