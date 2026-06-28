---
source_url: "https://www.home-assistant.io/integrations/azure_service_bus"
final_url: "https://www.home-assistant.io/integrations/azure_service_bus"
canonical_url: "https://www.home-assistant.io/integrations/azure_service_bus/"
source_handle: "web:www-home-assistant-io:8a8651c5d218"
source_section: "integrations-azure-service-bus"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "609b7c8d5f7114a7f2878d2241cdd916c62d1a62602b8de9d58b6e1ebbf9d402"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Azure Service Bus - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/azure_service_bus
- Final URL: https://www.home-assistant.io/integrations/azure_service_bus
- Canonical URL: https://www.home-assistant.io/integrations/azure_service_bus/
- Fetched at: 2026-06-28T02:30:32Z
- Content type: text/html; charset=UTF-8

## Description

Setup for Azure Service Bus integration

## Extracted Text

On this page
First-time setup
Configuration
Usage
Related topics
The Azure Service Bus integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to send messages to Azure Service Bus from within Home Assistant.
This assumes you already have an Azure account. Otherwise, create a free account here .
You need to create a Service Bus namespace; you can follow this guide .
You must then create a Shared Access Policy for the Service Bus with Send claims or use the RootManageAccessKey from your namespace (this key has additional claims, including managing the event hub and listening, which are not needed for this purpose), for more details on the security of Service Bus go here . Alternatively you can create a dedicated key for only one queue or topic, to restrict access to only that queue or topic.
Once you have the connection string with Send policy, you can set up the integration itself.
Important
The queue or topic that you are sending to needs to exists with the service bus namespace before you use it within Home Assistant. See here for how to set up a queue and here for setting up a topic and subscriptions.
Add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry notify : - platform : azure_service_bus connection_string : !secret servicebus_connection_string topic : t-test - platform : azure_service_bus connection_string : !secret servicebus_connection_string queue : q-test
Configuration Variables
Looking for your configuration file?
name string ( Optional , default: notify )
Setting the optional parameter name allows multiple notifiers to be created. The notifier will bind to the notify.NOTIFIER_NAME action.
connection_string string Required
Connection string found in the Azure portal, with send claim in the key.
queue string ( Exclusive )
Which queue to send notifications on.
topic string ( Exclusive )
Which topic to send notifications on.
Tip
If you plan to send all state changes from one or more entities within Home Assistant, you should consider using the Azure Event Hub integration instead.
The notification service will translate the data given to a JSON object on the service bus. The message field will always be set, but the fields target and title are optional and are only included in the service bus message if set. Any input given in the data section, will be flattened to the root of the JSON object and follow the structure given. All input given in the data section will be included in the message.
See the example below for how an automation trigger translates to a message on the service bus.
automation : - alias : " Sunset Service Bus message" triggers : - trigger : sun event : sunset actions : - action : notify.test_queue data : message : " Sun is going down" title : " Good evening" data : sun_direction : " Down" custom_field : 123 custom_object : trigger_more : true explain : " It's starting to get dark"
The message that can be retrieved from a queue or topic subscription:
{ "message" : "Sun is going down" , "title" : "Good evening" , "sun_direction" : "Down" , "custom_field" : 123 , "custom_object" : { "trigger_more" : true , "explain" : "It's starting to get dark" } }
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Azure Service Bus integration was introduced in Home Assistant 0.102, and it's used by
6 active installations.
Its IoT class is Cloud Push.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@hfurubotten
Categories
Notifications
Back to top
