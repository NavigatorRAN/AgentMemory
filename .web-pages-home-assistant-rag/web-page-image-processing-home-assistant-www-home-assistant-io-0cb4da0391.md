# Image processing - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/image_processing
- Final URL: https://www.home-assistant.io/integrations/image_processing
- Canonical URL: https://www.home-assistant.io/integrations/image_processing/
- Fetched at: 2026-06-28T02:51:41Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up image processing with Home Assistant.

## Extracted Text

On this page
The state of an image processing entity
ALPR
Face
scan_interval and optimizing Resources
Image processing enables Home Assistant to process images from cameras . Only camera entities are supported as sources.
Note
Building block integration
This image processing is a building block integration that cannot be added to your Home Assistant directly but is used and provided by other integrations.
A building block integration differs from the typical integration that connects to a device or service. Instead, other integrations that do integrate a device or service into Home Assistant use this image processing building block to provide entities, services, and other functionality that you can use in your automations or dashboards.
If one of your integrations features this building block, this page documents the functionality the image processing building block offers.
For face recognition applications, the state of an image processing entity can be the name of the detected person or motion that was detected.
In addition, the entity can have the following states:
Unavailable : The entity is currently unavailable.
Unknown : The state is not yet known.
ALPR entities have a vehicle counter attribute vehicles and all found plates are stored in the plates attribute.
The found_plate event is triggered after OpenALPR has found a new license plate.
# Example configuration.yaml automation entry automation : - alias : " Open garage door" triggers : - trigger : event event_type : image_processing.found_plate event_data : entity_id : openalpr.camera_garage_1 plate : BE2183423 ...
The following event attributes will be present (platform-dependent): entity_id , plate , confidence
Face entities have a face counter attribute total_faces and all face data is stored in the faces attribute.
The detect_face event is triggered after a Face entity has found a face.
# Example configuration.yaml automation entry automation : - alias : " Known person in front of my door" triggers : - trigger : event event_type : image_processing.detect_face event_data : entity_id : image_processing.door name : " Hans Maier" ...
The following event attributes will be present (platform-dependent): entity_id , name , confidence , age , gender , motion , glasses
Image processing integrations process the image from a camera at a fixed period given by the scan_interval . This leads to excessive processing if the image on the camera hasn’t changed, as the default scan_interval is 10 seconds. You can override this by adding to your configuration scan_interval: 10000 (setting the interval to 10,000 seconds), and then call the image_processing.scan action when you actually want to perform processing.
# Example configuration.yaml sensor : - platform : _AN_IMAGE_PROCESSING_PLATFORM_ scan_interval : 10000 ... automation : - alias : " Scan for faces when motion detected" triggers : - trigger : state entity_id : sensor.door_motion_sensor to : " on" actions : - action : image_processing.scan target : entity_id : image_processing.door ...
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Image processing entity was introduced in Home Assistant 0.36.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Categories
Image processing
Back to top
