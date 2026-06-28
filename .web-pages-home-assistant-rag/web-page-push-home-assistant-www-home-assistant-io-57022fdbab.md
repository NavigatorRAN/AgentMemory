---
source_url: "https://www.home-assistant.io/integrations/push"
final_url: "https://www.home-assistant.io/integrations/push"
canonical_url: "https://www.home-assistant.io/integrations/push/"
source_handle: "web:www-home-assistant-io:57022fdbab2f"
source_section: "integrations-push"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "0f81dbd9efcfff5989142338edcca0e2afb4cedd429ed0b15ed751187c4f0fc0"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Push - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/push
- Final URL: https://www.home-assistant.io/integrations/push
- Canonical URL: https://www.home-assistant.io/integrations/push/
- Fetched at: 2026-06-28T03:09:59Z
- Content type: text/html; charset=UTF-8

## Description

Instructions how to use Push Camera within Home Assistant.

## Extracted Text

On this page
Integration with motionEye
Configuration
Related topics
The Push integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to integrate images sent over HTTP POST to Home Assistant as a camera. External applications/daemons/scripts are therefore able to “stream” images through Home Assistant.
Optionally the Push Camera can buffer a given number of images, creating an animation of the detected motion after the event has been recorded.
Images are cleared on new events, and events are separated by a soft (configurable) timeout .
The push camera can as an example be used with motionEye a web frontend for the motion daemon. motionEye is usually configured to save/record files only when motion is detected. It provides a hook to run a command whenever an image is saved, which can be used together with cURL to send the motion detected images to the push camera, as shown in this example:
In motionEye, under File Storage -> Run A Command type in:
curl -X POST -F "image=@%f" http://my.hass.server.com:8123/api/webhook/my_custom_webhook_id
# inserting a backslash in the middle of "webhook" stops Motion to move the command to a webhook
Optionally configure motionEye to save only motion triggered images by going into Still Images -> Capture Mode and setting Motion Triggered . Tune your preferences under Motion Detection .
In this setup, you can configure the push camera to continuously replay the last motion triggered event using a configuration such as:
camera : - platform : push name : MotionEye Outdoor buffer : 3 timeout : 5 webhook_id : my_custom_webhook_id
To enable this camera in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry camera : - platform : push name : My Push Camera webhook_id : my_custom_webhook_id
Configuration Variables
Looking for your configuration file?
name string ( Optional , default: Push Camera )
The name you would like to give to the camera.
buffer string ( Optional , default: 1 )
Number of images to buffer per event. Be conservative, large buffers will starve your system memory.
timeout time ( Optional , default: 5 seconds )
Amount of time after which the event is considered to have finished.
webhook_id string Required
User provided string acting as camera identifier and access control, should be a large string (more then 8 chars).
field string ( Optional , default: image )
HTTP POST field containing the image file
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Push integration was introduced in Home Assistant 0.74, and it's used by
30 active installations.
Its IoT class is Local Push.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@dgomes
Categories
Camera
Back to top
