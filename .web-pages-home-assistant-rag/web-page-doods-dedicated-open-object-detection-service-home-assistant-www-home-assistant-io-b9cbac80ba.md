# DOODS - Dedicated Open Object Detection Service - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/doods
- Final URL: https://www.home-assistant.io/integrations/doods
- Canonical URL: https://www.home-assistant.io/integrations/doods/
- Fetched at: 2026-06-28T02:37:46Z
- Content type: text/html; charset=UTF-8

## Description

Detect and recognize objects with DOODS.

## Extracted Text

On this page
Setup
Configuration
Supported labels
Sample configuration
Optimizing resources
Related topics
The DOODS image processing integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to detect and recognize objects in a camera image using DOODS . The state of the entity is the number of objects detected and recognized objects are listed in the summary attribute along with quantity. The matches attribute provides the confidence score for recognition and the bounding box of the object for each detection category.
The DOODS software needs to be running before this integration can be used. Options to run the DOODS software:
Run as Home Assistant app
Run as a Docker container
To enable this integration in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes.
# Example configuration.yaml entry image_processing : - platform : doods url : " http://<my doods server>:8080" detector : default source : - entity_id : camera.front_yard
Configuration Variables
Looking for your configuration file?
source map Required
The list of image sources.
entity_id string Required
A camera entity id to get picture from.
name string ( Optional )
This parameter allows you to override the name of your image_processing entity.
url string Required
The URL of the DOODS server.
auth_key string ( Optional )
The authentication key as set in the DOODS configuration file or as a Docker environment variable (DOODS_AUTH_KEY)
timeout integer ( Optional , default: 90 )
Timeout for requests (in seconds).
detector string Required
The DOODS detector to use.
confidence float ( Optional )
The default confidence for any detected objects where not explicitly set.
area map ( Optional )
Global detection area. Objects in this box will be reported. Top of image is 0, bottom is 1. Same left to right.
top float ( Optional , default: 0 )
Top line defined as % from top of image.
left float ( Optional , default: 0 )
Left line defined as % from left of image.
bottom float ( Optional , default: 1 )
Bottom line defined as % from top of image.
right float ( Optional , default: 1 )
Right line defined as % from left of image.
covers boolean ( Optional , default: true )
If true the detection must be fully in this box. If false any part of the detection in the box will trigger.
file_out list ( Optional )
A template for the integration to save processed images including bounding boxes. camera_entity is available as the entity_id string of the triggered source camera.
labels map ( Optional )
Information about the selected labels model.
name string Required
The label of the object to select for detection.
The minimum confidence for the selected label.
Custom detection area. Only objects fully in this box will be reported. Top of image is 0, bottom is 1. Same left to right.
Both detectors default and tensorflow use the labels in this file .
# Example advanced configuration.yaml entry image_processing : - platform : doods scan_interval : 1000 url : " http://<my doods server>:8080" timeout : 60 detector : default auth_key : 2up3rL0ng4uthK3y source : - entity_id : camera.front_yard file_out : - " /tmp/{{ camera_entity.split('.')[1] }}_latest.jpg" - " /tmp/{{ camera_entity.split('.')[1] }}_{{ now().strftime('%Y%m%d_%H%M%S') }}.jpg" confidence : 50 # This global detection area is required for all labels area : # Exclude top 10% of image top : 0.1 # Exclude right 5% of image right : 0.95 # The entire detection must be inside this box covers : true labels : - name : person confidence : 40 area : # Exclude top 10% of image top : 0.1 # Exclude right 15% of image right : 0.85 # Any part of the detection inside this area will trigger covers : false - car - truck
The Image processing integration processes the image from a camera at a fixed period given by the scan_interval . This leads to excessive processing if the image on the camera hasn’t changed, as the default scan_interval is 10 seconds. You can override this by adding to your configuration scan_interval: 10000 (setting the interval to 10,000 seconds) and then call the image_processing.scan action when you actually want to perform processing.
# Example advanced configuration.yaml entry image_processing : - platform : doods scan_interval : 10000 source : - entity_id : camera.driveway - entity_id : camera.backyard
# Example advanced automations.yaml entry - alias : " Doods scanning" triggers : - trigger : state entity_id : - binary_sensor.driveway actions : - action : image_processing.scan target : entity_id : image_processing.doods_camera_driveway
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The DOODS - Dedicated Open Object Detection Service integration was introduced in Home Assistant 0.100, and it's used by
111 active installations.
Its IoT class is Local Polling.
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
