# Azure Event Hub - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/azure_event_hub
- Final URL: https://www.home-assistant.io/integrations/azure_event_hub
- Canonical URL: https://www.home-assistant.io/integrations/azure_event_hub/
- Fetched at: 2026-06-28T02:30:28Z
- Content type: text/html; charset=UTF-8

## Description

Setup for Azure Event Hub integration

## Extracted Text

On this page
First time setup
Configuration
Filter configuration
Using the data in Azure
Related topics
The Azure Event Hub integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to hook into the Home Assistant event bus and send events to Azure Event Hub or to an Azure IoT Hub .
This assumes you already have an Azure account. Otherwise create a Free account here .
You need to create an Event Hub namespace and an Event Hub in that namespace, you can follow this guide . Alternatively you can directly deploy an ARM template with the namespace and the Event Hub from here .
You must then create a Shared Access Policy for the Event Hub with ‘Send’ claims or use the RootManageAccessKey from your namespace (this key has additional claims, including managing the event hub and listening, which are not needed for this purpose), for more details on the security of Event Hubs go here .
Once you have the name of your namespace, instance, Shared Access Policy and the key for that policy, you can set up the integration itself.
The alternative approach is to use a connection string and instance name, this can be retrieved in the same way as the Shared Access Policy and this can also be gotten for a device in an IoT Hub (Event Hub-compatible connection string). In the case of IoT Hub, you need to put the Device ID as the instance name.
The final thing to consider is how often you want the integration to send messages in a batch to your hub, this is set with the send_interval , with a default of 5 seconds. Since this component runs in an asynchronous way there is no guarantee that the sending happens exactly on time, and because your Home Assistant might be very busy with lots of events happening it might discard several events that are older then 20 seconds plus the send_interval .
To add the Azure Event Hub service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Azure Event Hub .
Follow the instructions on screen to complete the setup.
You can set up filters through the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] .
Warning
Not filtering domains or entities will send every event to Azure Event Hub, thus taking up a lot of space and bandwidth.
Note
Event Hubs have a retention time of at most 7 days, if you do not capture or use the events they are deleted automatically from the Event Hub, the default retention is 1 day.
By default, no entity will be excluded. To limit which entities are being exposed to Azure Event Hub , you can use the filter parameter.
# Example filter to include specified domains and exclude specified entities azure_event_hub : filter : include_domains : - alarm_control_panel - light include_entity_globs : - binary_sensor.*_occupancy exclude_entities : - light.kitchen_light
Filters are applied as follows:
No filter
All entities included
Only includes
Entity listed in entities include: include
Otherwise, entity matches domain include: include
Otherwise, entity matches glob include: include
Otherwise: exclude
Only excludes
Entity listed in exclude: exclude
Otherwise, entity matches domain exclude: exclude
Otherwise, entity matches glob exclude: exclude
Otherwise: include
Domain and/or glob includes (may also have excludes)
Otherwise, entity listed in entities exclude: exclude
Domain and/or glob excludes (no domain and/or glob includes)
Otherwise, entity listed in exclude: exclude
No Domain and/or glob includes or excludes
The following characters can be used in entity globs:
* - The asterisk represents zero, one, or multiple characters
? - The question mark represents zero or one character
Configuration Variables
Looking for your configuration file?
filter map ( Optional )
Filter domains and entities for Event Hub.
Default:
Includes all entities from all domains
include_domains list ( Optional )
List of domains to include (e.g., light ).
exclude_domains list ( Optional )
List of domains to exclude (e.g., light ).
include_entity_globs list ( Optional )
Include all entities matching a listed pattern (e.g., sensor.weather_* ).
exclude_entity_globs list ( Optional )
Exclude all entities matching a listed pattern (e.g., sensor.weather_* ).
include_entities list ( Optional )
List of entities to include (e.g., light.attic ).
exclude_entities list ( Optional )
There are several ways to stream the data that comes into the Event Hub into storages in Azure, the easiest way is to use the built-in Capture function and this allows you to capture the data in Azure Blob Storage or Azure Data Lake store, details here .
Other storages in Azure (and outside) are possible with an Azure Stream Analytics job , for instance for Cosmos DB , Azure SQL DB , Azure Table Storage , custom writing to Azure Blob Storage and Topic and Queues .
On the analytical side, Event Hub can be directly fed into Azure Databricks Spark , Azure Time Series Insights and Microsoft Power BI .
The final way to use the data in Azure is to connect an Azure Function to the Event Hub using the Event Hub trigger binding .
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Azure Event Hub service was introduced in Home Assistant 0.94, and it's used by
19 active installations.
Its IoT class is Cloud Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@eavanvalkenburg
Categories
History
Back to top
