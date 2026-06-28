---
source_url: "https://www.home-assistant.io/integrations/seven_segments"
final_url: "https://www.home-assistant.io/integrations/seven_segments"
canonical_url: "https://www.home-assistant.io/integrations/seven_segments/"
source_handle: "web:www-home-assistant-io:f70e6f003c88"
source_section: "integrations-seven-segments"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "4d186543f21142d13f1e6510eced89d5b93342ffd7614be2fa3f98eab448ef67"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Seven Segments OCR - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/seven_segments
- Final URL: https://www.home-assistant.io/integrations/seven_segments
- Canonical URL: https://www.home-assistant.io/integrations/seven_segments/
- Fetched at: 2026-06-28T03:15:18Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to use OCR for seven segments displays into Home Assistant.

## Extracted Text

On this page
Configuration
Setup process
Related topics
The Seven Segments OCR integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to read physical seven segments displays through Home Assistant. ssocr is used to extract the value shown on the display which is observed by a camera .
To enable the OCR of a seven segment display in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes.
# Example configuration.yaml entry image_processing : - platform : seven_segments source : - entity_id : camera.seven_segments
Configuration Variables
Looking for your configuration file?
ssocr_bin string ( Optional , default: ssocr )
The command line tool ssocr . Set it if you use a different name for the executable.
x_position integer ( Optional , default: 0 )
X coordinate of the upper left corner of the area to crop.
y_position integer ( Optional , default: 0 )
Y coordinate of the upper left corner of the area to crop.
height integer ( Optional , default: 0 )
Height of the area to crop.
width integer ( Optional , default: 0 )
Width of the area to crop.
rotate integer ( Optional , default: 0 )
Rotation of the image.
threshold integer ( Optional , default: 0 )
Threshold for the difference between the digits and the background.
digits integer ( Optional , default: -1 )
Number of digits in the display.
extra_arguments string ( Optional )
Other arguments to use. Like -D , dilation , erosion , greyscale , or make_mono .
source list Required
List of image sources.
entity_id string Required
A camera entity id to get picture from.
name string ( Optional )
This parameter allows you to override the name of your image_processing entity.
It’s suggested that the first attempt to determine the needed parameters is using ssocr directly. This may require a couple of iterations to get the result
ssocr -D erosion crop 390 250 490 280 -t 20 -d 4 seven-seg.png
This would lead to the following entry for the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
camera : - platform : local_file file_path : /home/homeassistant/.homeassistant/seven-seg.png name : seven_segments image_processing : - platform : seven_segments x_position : 390 y_position : 250 height : 280 width : 490 threshold : 20 digits : 4 source : - entity_id : camera.seven_segments
With the help of a template sensor , the value can be shown as badge.
sensor : - platform : template sensors : power_meter : value_template : " {{ states('image_processing.sevensegment_ocr_seven_segments') }}" friendly_name : " Ampere" unit_of_measurement : " A"
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Seven Segments OCR integration was introduced in Home Assistant 0.45, and it's used by
66 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@fabaff
Categories
Image processing
Back to top
