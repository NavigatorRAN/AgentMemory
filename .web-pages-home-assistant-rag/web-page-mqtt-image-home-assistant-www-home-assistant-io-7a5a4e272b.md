---
source_url: "https://www.home-assistant.io/integrations/image.mqtt"
final_url: "https://www.home-assistant.io/integrations/image.mqtt"
canonical_url: "https://www.home-assistant.io/integrations/image.mqtt/"
source_handle: "web:www-home-assistant-io:7a5a4e272b8e"
source_section: "integrations-image-mqtt"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "f373d5ae07a875325f7de4f0c60119c4d7880dda1995e46bcef01eadde57c7a5"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# MQTT Image - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/image.mqtt
- Final URL: https://www.home-assistant.io/integrations/image.mqtt
- Canonical URL: https://www.home-assistant.io/integrations/image.mqtt/
- Fetched at: 2026-06-28T02:51:38Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to use an MQTT image message as an Image within Home Assistant.

## Extracted Text

On this page
Configuration
Example receiving images from a URL
Example receiving images from a file
The MQTT Image integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to integrate the content of an image file sent through MQTT into Home Assistant as an image.
The image platform is a simplified version of the camera platform that only accepts images.
Every time a message under the image_topic in the configuration is received, the image displayed in Home Assistant will also be updated. Messages received on image_topic should contain the full contents of an image file, for example, a JPEG image, without any additional encoding or metadata.
This can be used with an application or a service capable of sending images through MQTT.
An alternative setup is to use the url_topic option to receive an image URL for a new picture to show.
To use an MQTT image entity in your installation, add an MQTT device as a subentry , or add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes.
# Example configuration.yaml entry mqtt : - image : url_topic : mynas/status/url
Alternatively, you can set it up via MQTT discovery .
Configuration Variables
Looking for your configuration file?
availability list ( Optional )
A list of MQTT topics subscribed to receive availability (online/offline) updates. Must not be used together with availability_topic .
payload_available string ( Optional , default: online )
The payload that represents the available state.
payload_not_available string ( Optional , default: offline )
The payload that represents the unavailable state.
topic string Required
An MQTT topic subscribed to receive availability (online/offline) updates.
value_template template ( Optional )
Defines a template to extract device’s availability from the topic . To determine the devices’s availability result of this template will be compared to payload_available and payload_not_available .
availability_mode string ( Optional , default: latest )
When availability is configured, this controls the conditions needed to set the entity to available . Valid entries are all , any , and latest . If set to all , payload_available must be received on all configured availability topics before the entity is marked as online. If set to any , payload_available must be received on at least one configured availability topic before the entity is marked as online. If set to latest , the last payload_available or payload_not_available received on any configured availability topic controls the availability.
availability_template template ( Optional )
Defines a template to extract device’s availability from the availability_topic . To determine the devices’s availability result of this template will be compared to payload_available and payload_not_available .
availability_topic string ( Optional )
The MQTT topic subscribed to receive availability (online/offline) updates. Must not be used together with availability .
content_type string ( Optional , default: image/jpeg )
The content type of and image data message received on image_topic . This option cannot be used with the url_topic because the content type is derived when downloading the image.
default_entity_id string ( Optional )
Use default_entity_id instead of name for automatic generation of the entity ID. For example, image.foobar . When used without a unique_id , the entity ID will update during restart or reload if the entity ID is available. If the entity ID already exists, the entity ID will be created with a number at the end. When used with a unique_id , the default_entity_id is only used when the entity is added for the first time. When set, this overrides a user-customized entity ID if the entity was deleted and added again.
device map ( Optional )
Information about the device this image is a part of to tie it into the device registry . Only works through MQTT discovery and when unique_id is set. At least one of identifiers or connections must be present to identify the device.
configuration_url string ( Optional )
A link to the webpage that can manage the configuration of this device. Can be either an http:// , https:// or an internal homeassistant:// URL.
connections list ( Optional )
A list of connections of the device to the outside world as a list of tuples [connection_type, connection_identifier] . For example the MAC address of a network interface: "connections": [["mac", "02:5b:26:a8:dc:12"]] .
hw_version string ( Optional )
The hardware version of the device.
identifiers list | string ( Optional )
A list of IDs that uniquely identify the device. For example a serial number.
manufacturer string ( Optional )
The manufacturer of the device.
model string ( Optional )
The model of the device.
model_id string ( Optional )
The model identifier of the device.
name string ( Optional )
The name of the device.
serial_number string ( Optional )
The serial number of the device.
suggested_area string ( Optional )
Suggest an area if the device isn’t in one yet.
sw_version string ( Optional )
The firmware version of the device.
via_device string ( Optional )
Identifier of a device that routes messages between this device and Home Assistant. Examples of such devices are hubs, or parent devices of a sub-device. This is used to show device topology in Home Assistant.
enabled_by_default boolean ( Optional , default: true )
Controls whether this entity is enabled by default. When set to true , the entity is enabled and usable immediately. Disabled entities are hidden by default until you enable them from the device page.
encoding string ( Optional , default: utf-8 )
The encoding of the payloads received. Set to "" to disable decoding of incoming payload. Use image_encoding to enable Base64 decoding on image_topic .
entity_category string ( Optional )
The category of the entity.
entity_picture string ( Optional )
Picture URL for the entity.
icon icon ( Optional )
Icon for the entity.
image_encoding string ( Optional )
The encoding of the image payloads received. Set to "b64" to enable base64 decoding of image payload. If not set, the image payload must be raw binary data.
image_topic string ( Exclusive )
The MQTT topic to subscribe to receive the image payload of the image to be downloaded. Ensure the content_type type option is set to the corresponding content type. This option cannot be used together with the url_topic option. But at least one of these option is required.
json_attributes_template template ( Optional )
Defines a template to extract the JSON dictionary from messages received on the json_attributes_topic .
json_attributes_topic string ( Optional )
The MQTT topic subscribed to receive a JSON dictionary payload and then set as sensor attributes. Implies force_update of the current sensor state when a message is received on this topic.
The name of the image. Can be set to null if only the device name is relevant.
unique_id string ( Optional )
An ID that uniquely identifies this image. If two images have the same unique ID Home Assistant will raise an exception. Required when used with device-based discovery.
url_template template ( Optional )
Defines a template to extract the image URL from a message received at url_topic .
url_topic string ( Exclusive )
The MQTT topic to subscribe to receive an image URL. A url_template option can extract the URL from the message. The content_type will be derived from the image when downloaded. This option cannot be used together with the image_topic option, but at least one of these options is required.
Add the configuration below to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] .
To test it publish an image URL to the topic from the console:
mosquitto_pub -h <mqtt_broker> -t mynas/status/url -m "https://design.home-assistant.io/images/logo.png"
To test it, publish an image URL to the topic from the console:
mosquitto_pub -h <mqtt_broker> -t mynas/status/file -f <logo.png>
# Example configuration.yaml entry mqtt : - image : image_topic : mynas/status/file content_type : image/png
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The MQTT Image integration was introduced in Home Assistant 2023.7, and it's used by
48.5% of the active installations.
Its IoT class is Configurable.
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Image
Back to top
