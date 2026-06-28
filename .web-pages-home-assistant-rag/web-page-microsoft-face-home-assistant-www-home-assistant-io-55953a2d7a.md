# Microsoft Face - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/microsoft_face
- Final URL: https://www.home-assistant.io/integrations/microsoft_face
- Canonical URL: https://www.home-assistant.io/integrations/microsoft_face/
- Fetched at: 2026-06-28T02:59:56Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Microsoft Face integration into Home Assistant.

## Extracted Text

On this page
Setup
Configuration
Person and Groups
The Microsoft Face integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] is the main integration for Microsoft
Azure Cognitive service
Face .
All data are stored in your own private instance in the Azure cloud.
You need an API key, which is free, but requires an
Azure registration using your
Microsoft ID. The free resource ( F0 ) is limited to 20 requests per minute and
30k requests in a month. If you don’t want to use the Azure cloud, you can also
get an API key by registering with
cognitive-services .
All keys on cognitive services must be recreated every 90 days.
To enable the Microsoft Face integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] ,
add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry microsoft_face : api_key : YOUR_API_KEY azure_region : eastus2
Configuration Variables
Looking for your configuration file?
api_key string Required
The API key for your Cognitive resource.
azure_region string ( Optional )
The region where you instantiated your Microsoft Cognitive services endpoint.
timeout time ( Optional , default: 10s )
Set timeout for the API connection.
For most services, you need to set up a group or a person.
This limits the processing and detection to elements provided by the group.
Home Assistant creates an entity for all groups and allows you to show the
state, person, and IDs directly on the frontend.
The following actions are available for managing this feature and can be called
via the Frontend, a script, or the REST API.
microsoft_face.create_group
microsoft_face.delete_group
action : microsoft_face.create_group data : name : " Family"
microsoft_face.create_person
microsoft_face.delete_person
action : microsoft_face.create_person data : group : family name : " Hans Maier"
You need to add an image of a person. You can add multiple images for every
person to make the detection better. You can take a picture from a camera or
send a local image to your Azure resource.
microsoft_face.face_person
action : microsoft_face.face_person data : group : family name : " Hans Maier" camera_entity : camera.door
For the local image we need curl .
The {personId} is present in group entity as attribute.
$ curl -v -X POST "https://westus.api.cognitive.microsoft.com/face/v1.0/persongroups/{GroupName}/persons/{personId}/persistedFaces" \ -H "Ocp-Apim-Subscription-Key: YOUR_API_KEY" \ -H "Content-Type: application/octet-stream" --data-binary "@/tmp/image.jpg"
After we’re done with changes on a group,
we need train this group to teach the AI how to handle the new data.
microsoft_face.train_group
action : microsoft_face.train_group data : group : family
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Microsoft Face integration was introduced in Home Assistant 0.37, and it's used by
1 active installations.
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
