# Azure Data Explorer - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/azure_data_explorer
- Final URL: https://www.home-assistant.io/integrations/azure_data_explorer
- Canonical URL: https://www.home-assistant.io/integrations/azure_data_explorer/
- Fetched at: 2026-06-28T02:30:23Z
- Content type: text/html; charset=UTF-8

## Description

Setup for Azure Data Explorer integration

## Extracted Text

On this page
Prerequisites
Creating a free Azure account
Creating a Service Principal (App registration)
Creating a Free Azure Data Explorer cluster and database
Creating an Azure data table
Configuration
Filters
Configuring a filter
Using Azure Data Explorer
Related topics
Azure Data Explorer is a high-performance time-series database, query engine, and dashboarding tool. The Home Assistant Azure Data Explorer integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to hook into the Home Assistant event bus and forward events to Azure Data Explorer for analytics and dashboarding. From here, data can be viewed in building dashboards, PowerBi, and Grafana, among others.
Before you can add Azure Data Explorer to Home Assistant, you need to set up an Azure account, create a Service Principal, create a cluster, and add a database.
Create a free Azure account . You will be asked for credit card information, but all resources created here are free.
For Home Assistant to authenticate with Azure Data Explorer, it needs a Service Principal .
To create a Service Principal, follow the guide on Creating Microsoft Entra application registration , steps 1-7.
Copy values for later use:
Application (client) ID: From App registration overview
Directory (tenant) ID: From App registration overview
Secret value: From when the secret was created in step 1.7
There are two ways of creating an Azure Data Explorer Cluster: Pay as you go (PAYG) or Free .
To create a paid cluster, follow the instructions from the Microsoft Quickstart Guide .
However, Microsoft has released a free offer, and this guide describes how to set up a free Azure Data Explorer Cluster and database:
There are a few differences between the PAYG and Free versions:
Feature PAYG cluster Free cluster Ingestion Streaming and queueing Queueing only (for now) Cluster size Fully scalable 4 vCPU, 8 GB Memory, ~100 GB data
Go to aka.ms/kustofree .
Go to My Cluster .
Select Create Cluster .
Name the cluster and database.
Copy the database name for later use.
Check the Terms and Conditions (after reading them) and select Create Cluster .
Within a minute, you will have an Azure Data Explorer cluster ready.
After the database has been created, copy the Data ingestion URI from the top of the page.
Go to Query .
Write and perform the following statements one by one, replacing the placeholder content between the <> with the copied values (including the brackets).
// Give the Service Principal write access to the database
.add database ['<databasename>'] ingestors ('aadapp=<ApplicationID>;<DirectoryID>');
// Give the Service Principal read access to the database (used for connectivity checks)
.add database ['<databasename>'] viewers ('aadapp=<ApplicationID>;<DirectoryID>');
// Create a table for the data to be ingested into (replace the name and copy inserted *name* for later use)
.create table ['<name_to_be_replaced>'] (entity_id: string, state: string, attributes: dynamic, last_changed: datetime, last_updated: datetime, context: dynamic)
// Creat a mapping from the incoming JSON to the table and columns just created (replace the name with the table name from the previous step)
.create table ['<name_to_be_replaced>'] ingestion json mapping 'ha_json_mapping' '[{"column":"entity_id","path":"$.entity_id"},{"column":"state","path":"$.state"},{"column":"attributes","path":"$.attributes"},{"column":"last_changed","path":"$.last_canged"},{"column":"last_updated","path":"$.last_updated"},{"column":"context","path":"$.context"}]'
This is an example with a free cluster for reference:
.add database ['HomeAssistant'] ingestors ('aadapp=b5253d02-c8f4-1234-a0f0-818491ba2a1f;72f123bf-86f1-41af-91ab-2d7cd011db93');
.add database ['HomeAssistant'] viewers ('aadapp=b5253d02-c8f4-1234-a0f0-818491ba2a1f;72f123bf-86f1-41af-91ab-2d7cd011db93');
.create table ['raw'] (entity_id: string, state: string, attributes: dynamic, last_changed: datetime, last_updated: datetime, context: dynamic)
.create table ['raw'] ingestion json mapping 'ha_json_mapping' '[{"column":"entity_id","path":"$.entity_id"},{"column":"state","path":"$.state"},{"column":"attributes","path":"$.attributes"},{"column":"last_changed","path":"$.last_canged"},{"column":"last_updated","path":"$.last_updated"},{"column":"context","path":"$.context"}]'
To add the Azure Data Explorer service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Azure Data Explorer .
Follow the instructions on screen to complete the setup.
If using a free cluster, check the Use Queueing client in the form.
After the flow has been completed, Home Assistant sends data to Azure Data Explorer.
By default, Home Assistant buffers for 5 seconds before sending, and the Batching Policy in Azure Data Explorer will further batch up for default.
Optionally, add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file for filtering data ingested into Azure Data Explorer:
# Example configuration.yaml entry azure_data_explorer : filter : include_domains : - homeassistant - light - media_player
Configuration Variables
Looking for your configuration file?
filter map Required
Filter domains and entities for Data Explorer. ( Configure Filter )
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
Warning
Not filtering domains or entities will send every event to Azure Data Explorer.
By default, no entity will be excluded. To limit which entities are being exposed to Azure Data Explorer , you can use the filter parameter.
# Example filter to include specified domains and exclude specified entities azure_data_explorer : filter : include_domains : - alarm_control_panel - light include_entity_globs : - binary_sensor.*_occupancy exclude_entities : - light.kitchen_light
Filters are applied as follows:
No includes or excludes - pass all entities.
Includes, no excludes - only include specified entities.
Excludes, no includes - only exclude specified entities.
Both includes and excludes:
Include domain and/or glob patterns specified:
If the domain is included, and the entity is not excluded or matches the exclude glob pattern, pass.
If the entity matches include glob pattern, and the entity does not match any exclude criteria (domain, glob pattern, or listed), pass.
If the domain is not included, the glob pattern does not match, and the entity not included, fail.
Exclude domain and/or glob patterns specified and include does not list domains or glob patterns
If the domain is excluded and the entity is not included, fail.
If the entity matches an exclude glob pattern and the entity is not included, fail.
If the entity does not match any exclude criteria (domain, glob pattern, or listed), pass.
Neither include or exclude specifies domains or glob patterns
If the entity is included, pass (as #2 above).
If the entity matches both an include and an exclude pattern, the entity exclude is ignored.
Once the setup is complete, data is being sent to Azure Data Explorer, and you can start exploring your data.
Here are some resources to help you learn how to use Azure Data Explorer:
MS Learn: https://aka.ms/learn.kql , https://aka.ms/learn.adx
YouTube: Official Microsoft Azure Data Explorer YouTube channal
Blog: Official Microsoft Data Explorer blog
The configuration.yaml file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Azure Data Explorer service was introduced in Home Assistant 2024.6, and it's used by
16 active installations.
Its IoT class is Cloud Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@kaareseras
Categories
History
Back to top
