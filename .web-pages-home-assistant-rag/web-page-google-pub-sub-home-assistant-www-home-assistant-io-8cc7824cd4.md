# Google Pub/Sub - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/google_pubsub
- Final URL: https://www.home-assistant.io/integrations/google_pubsub
- Canonical URL: https://www.home-assistant.io/integrations/google_pubsub/
- Fetched at: 2026-06-28T02:46:50Z
- Content type: text/html; charset=UTF-8

## Description

Setup for Google Pub/Sub integration

## Extracted Text

On this page
First time setup
Configuration
Configure filter
Saving the data using a Google Cloud Function
Related topics
The Google Pub/Sub integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to hook into the Home Assistant event bus and send events to Google Cloud Pub/Sub . The current free tier of GCP should allow you to sync about 1 event every 2 seconds on average (2 million invocations per month).
This assumes you already have a Google Cloud project. If you don’t, please create one in the Google Cloud Console
Create a Google Pub/Sub topic in the Google Cloud API Console . The topic name will become something like projects/project-198373/topics/topic-name . Note the last part only (the name you chose): topic-name .
Next, you need to create a Service Account key in the Google Cloud API Console
Choose a new “New Service Account”, give it a name and leave the key type as JSON
Select the role: Pub/Sub Publisher
This will download the Service Account JSON key to your machine. Do NOT share this with anyone. Place this file in your Home Assistant configuration folder.
Add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes.
# Example configuration.yaml entry google_pubsub : project_id : YOUR_PROJECT_ID topic_name : YOUR_TOPIC_NAME credentials_json : CREDENTIALS_FILENAME
Configuration Variables
Looking for your configuration file?
project_id string Required
Project ID from the Google console (looks like words-2ab12 ).
topic_name string Required
The Pub/Sub relative topic name (looks like hass ).
credentials_json string Required
The filename of the Google Service Account JSON file.
filter map Required
Filter domains and entities for Google Cloud Pub/Sub. ( Configure Filter )
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
Important
Not filtering domains or entities will send every event to Google PubSub, thus hitting the free tier limit very fast. Be sure to fill in this configuration parameter or have a paid subscription for Google Cloud.
By default, no entity will be excluded. To limit which entities are being exposed to Google Pub/Sub , you can use the filter parameter.
# Example filter to include specified domains and exclude specified entities google_pubsub : project_id : YOUR_PROJECT_ID topic_name : YOUR_TOPIC_NAME credentials_json : CREDENTIALS_FILENAME filter : include_domains : - alarm_control_panel - light include_entity_globs : - binary_sensor.*_occupancy exclude_entities : - light.kitchen_light
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
To save your data automatically to BigQuery, follow the instructions here . The current free tier of GCP should allow you to store up to 10GB of data.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Google Pub/Sub integration was introduced in Home Assistant 0.88, and it's used by
42 active installations.
Its IoT class is Cloud Push.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
History
Back to top
