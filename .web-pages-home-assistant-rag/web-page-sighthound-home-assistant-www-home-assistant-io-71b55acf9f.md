---
source_url: "https://www.home-assistant.io/integrations/sighthound"
final_url: "https://www.home-assistant.io/integrations/sighthound"
canonical_url: "https://www.home-assistant.io/integrations/sighthound/"
source_handle: "web:www-home-assistant-io:71b55acf9f7d"
source_section: "integrations-sighthound"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "a14982c63f1d10c8c765808f99c17270031d03e288c2c59ee2346e3805c55834"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Sighthound - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/sighthound
- Final URL: https://www.home-assistant.io/integrations/sighthound
- Canonical URL: https://www.home-assistant.io/integrations/sighthound/
- Fetched at: 2026-06-28T03:15:56Z
- Content type: text/html; charset=UTF-8

## Description

Detect people with Sighthound Cloud.

## Extracted Text

On this page
Configuration
Process an Image
Related topics
Detect people in camera images using Sighthound Cloud . The Sighthound Developer tier (free for non-commercial use) allows 5000 images to be processed per month. If you need more processing per month you will need to sign up for a production account (for example, a Basic or Pro account).
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] adds an image processing entity where the state of the entity is the number of people detected in an image. For each person detected, an sighthound.person_detected event is fired. The event data includes the entity_id of the image processing entity firing the event, and the bounding box around the detected person.
If save_file_folder is configured, on each new detection of a person, an annotated image with the name sighthound_{camera_name}_latest.jpg is saved in the configured folder if it doesn’t already exist, and overwritten if it does exist. The saved image shows the bounding box around detected people and can be displayed on the Home Assistant front end using a Local File camera, and used in notifications. If save_timestamped_file is configured as true , then the annotated image is saved with a file name that includes the time of detection.
Note that by default the integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] will not automatically scan images, but requires you to call the image_processing.scan action, e.g., using an automation triggered by motion.
To enable this integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes.
# Example configuration.yaml entry image_processing : - platform : sighthound api_key : " MY_API_KEY" source : - entity_id : camera.my_cam
Configuration Variables
Looking for your configuration file?
api_key string Required
Your Sighthound Cloud API key.
account_type string ( Optional )
If you have a paid account, used prod .
save_file_folder string ( Optional )
The folder to save annotated images to.
save_timestamped_file boolean ( Optional , default: false )
Save the processed image with the time of detection in the filename. Requires save_file_folder to be configured.
source map Required
The list of image sources.
entity_id string Required
A camera entity id to get a picture from.
name string ( Optional )
This parameter allows you to override the name of your image_processing entity.
To verify the integration, check if a new entity is appeared as image_processing.sighthound_my_cam
When you want to process an image, you have to call image_processing.scan action and listen to the sighthound.person_detected and/or sighthound.vehicle_detected events.
An example using two automations:
The first automation is triggered, when a motion is detected. It calls the image_processing.scan action to send the camera image to the sighthound server for processing.
The second automation is triggered by a sighthound.vehicle_detected event. It sends a notification to a phone.
# Example automations.yaml entry - alias : " Entrance motion image processing" description : " Send a camera image to sighthound, when motion is detected at the entrance" triggers : - trigger : device type : motion device_id : YOUR_DEVICE_ID entity_id : binary_sensor.my_motion_sensor domain : binary_sensor actions : - action : image_processing.scan target : entity_id : image_processing.sighthound_my_cam - alias : " Arriving vehicle notification" description : " Send a notification to a phone, when a vehicle is detected at the entrance" triggers : - trigger : event event_type : sighthound.vehicle_detected actions : - action : notify.send_message target : entity_id : notify.my_device data : message : " Somebody has just arrived by car."
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Sighthound integration was introduced in Home Assistant 0.105, and it's used by
0 active installations.
Its IoT class is Cloud Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@robmarkcole
Categories
Image processing
Back to top
