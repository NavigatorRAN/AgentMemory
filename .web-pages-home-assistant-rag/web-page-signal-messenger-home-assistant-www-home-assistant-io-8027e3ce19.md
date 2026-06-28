---
source_url: "https://www.home-assistant.io/integrations/signal_messenger"
final_url: "https://www.home-assistant.io/integrations/signal_messenger"
canonical_url: "https://www.home-assistant.io/integrations/signal_messenger/"
source_handle: "web:www-home-assistant-io:8027e3ce1995"
source_section: "integrations-signal-messenger"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "9a6931375e01120626ab6bea21b27da7105d8c745ed2301ca139ab6d877e1fb8"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Signal Messenger - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/signal_messenger
- Final URL: https://www.home-assistant.io/integrations/signal_messenger
- Canonical URL: https://www.home-assistant.io/integrations/signal_messenger/
- Fetched at: 2026-06-28T03:15:58Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Signal Messenger within Home Assistant.

## Extracted Text

On this page
Setup
Configuration
Notification action
Examples
Sending messages to Signal to trigger events
Related topics
The Signal Messenger integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] uses the Signal Messenger REST API to deliver notifications from Home Assistant to your Android or iOS device.
The requirements are:
You need to set up the Signal Messenger REST API.
You need a spare phone number to register with the Signal Messenger service.
Please follow those instructions , to set up the Signal Messenger REST API.
To send Signal Messenger notifications with Home Assistant, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry for Signal Messenger notify : - name : signal platform : signal_messenger url : " http://127.0.0.1:8080" # the URL where the Signal Messenger REST API is listening number : " YOUR_PHONE_NUMBER" # the sender number recipients : # one or more default recipients (can be overwritten per message) - " RECIPIENT1"
Both phone numbers and Signal Messenger groups can be added to the default recipients list.
However, it’s not possible to mix phone numbers and Signal Messenger groups in a single notifier.
If you would like to have individual phone numbers and Signal Messenger groups in the default recipients list,
separate notifiers need to be created.
To obtain the Signal Messenger group ids, follow this guide .
Configuration Variables
Looking for your configuration file?
name string ( Optional , default: notify )
Setting the optional parameter name allows multiple notifiers to be created. The notifier will bind to the notify.NOTIFIER_NAME action.
url string Required
The URL where the Signal Messenger REST API listens for incoming requests.
number string Required
The sender number.
recipients list Required
A list of default recipients (either phone numbers or Signal Messenger group ids). It can be overwritten for individual messages.
A few examples on how to use this integration to send notifications from automations.
Text message
... actions : - action : notify.NOTIFIER_NAME data : message : " That's an example that sends a simple text message to the recipients specified in the configuration.yaml. If text mode is 'styled', you can use *italic*, **bold** or ~strikethrough~ ." # optional: custom recipients list target : - ' +4917011111111' # optional: formatted mode data : text_mode : styled
Attribute Optional Default Description target optional as configured via recipients for the notify a list of strings, containing either fully qualified phone numbers (including country prefix) or Signal group IDs Data Attribute Optional Default Description text_mode optional normal Accepted values are normal or styled . If set to styled , additional text formatting is enabled ( *italic* , **bold** , and ~strikethrough~ ). Text message with an attachment
This example assumes you have an image stored in the default www -folder in Home Assistant Operating System.
... actions : - action : notify.NOTIFIER_NAME data : message : " Alarm in the living room!" data : attachments : - " /config/www/surveillance_camera.jpg" text_mode : styled
Data attribute Optional Default Description attachments required - List of paths of files to be attached. text_mode optional normal Accepted values are normal or styled . If set to styled , additional text formatting is enabled ( *italic* , **bold** , and ~strikethrough~ ). Text message with an attachment from a URL
... actions : - action : notify.NOTIFIER_NAME data : message : " Person detected on Front Camera!" data : verify_ssl : false urls : - " http://homeassistant.local/api/frigate/notifications/<event-id>/thumbnail.jpg" text_mode : styled
Data attribute Optional Default Description urls required - List of URLs of files to be attached. verify_ssl optional true Accepted values are true , false . You can set it to false to ignore SSL errors. text_mode optional normal Accepted values are normal or styled . If set to styled , additional text formatting is enabled ( *italic* , **bold** , and ~strikethrough~ ).
Notes:
To attach files from outside of Home Assistant, the URLs must be reachable and added to the allowlist_external_urls list.
There is a 50MB size limit for attachments retrieved via URLs.
You can use the Signal Messenger REST API as a Home Assistant trigger. In this example, we will make a simple chatbot. If you write anything to your Signal account linked to Signal Messenger REST API, the automation gets triggered, with the condition that the number (attribute source) is correct, to take action by sending a Signal notification back with a “Message received!”.
To accomplish this, make sure the addon’s mode parameter is set to native or normal , and edit the configuration of Home Assistant, adding a RESTful resource as follows:
- resource : " http://127.0.0.1:8080/v1/receive/<number>" headers : Content-Type : application/json sensor : - name : " Signal message received" value_template : " {{ value_json[0].envelope.dataMessage.message }}" #this will fetch the message json_attributes_path : $[0].envelope json_attributes : - source #using attributes you can get additional information, in this case, the phone number.
You can create an automation as follows:
... triggers : - trigger : state entity_id : - sensor.signal_message_received attribute : source to : " <yournumber>" actions : - action : notify.signal data : message : " Message received!"
NOTE If the addon’s mode parameter is set to json-rpc , then you can use signal-api-receiver in the configuration of Home Assistant to receive from Signal as follows:
- resource : " http://127.0.0.1:8105/receive/pop" sensor : - name : " Signal message received" value_template : > {{ value_json['envelope']['dataMessage']['message'] }} json_attributes_path : envelope json_attributes : - source - sourceNumber - sourceUuid - sourceDevice - timestamp
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Signal Messenger integration was introduced in Home Assistant 0.104, and it's used by
889 active installations.
Its IoT class is Cloud Push.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@bbernhard
Categories
Notifications
Back to top
