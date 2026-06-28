# Microsoft Face Detect - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/microsoft_face_detect
- Final URL: https://www.home-assistant.io/integrations/microsoft_face_detect
- Canonical URL: https://www.home-assistant.io/integrations/microsoft_face_detect/
- Fetched at: 2026-06-28T02:59:59Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Microsoft Face Detect into Home Assistant.

## Extracted Text

On this page
Configuration
Related topics
The Microsoft Face Detect integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to use the
Microsoft Face Identify
API through Home Assistant. This platform enables you to detect face on camera
and fire an event with attributes.
Please refer to the Microsoft Face integration configuration on
how to set up the API key.
For using the result inside an automation rule,
take a look at the Image Processing integration page.
Important
The free version of the Microsoft Face identify API limits the number of requests possible per month. Therefore, it is strongly recommended that you limit the scan_interval when setting up an instance of this entity as detailed on the main Image Processing integration page.
To enable the integration, add it to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes.
# Example configuration.yaml entry image_processing : - platform : microsoft_face_detect source : - entity_id : camera.door
Configuration Variables
Looking for your configuration file?
confidence integer ( Optional , default: 80 )
The minimum of confidence in percent to process with Home Assistant.
source list Required
List of image sources.
entity_id string Required
A camera entity id to get picture from.
name string ( Optional )
This parameter allows you to override the name of your image_processing entity.
attributes list ( Optional , default: [age, gender] )
The image search attributes. Supported: age , gender , glasses .
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Microsoft Face Detect integration was introduced in Home Assistant 0.38, and it's used by
0 active installations.
Its IoT class is Cloud Push.
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
