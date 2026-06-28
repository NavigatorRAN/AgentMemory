---
source_url: "https://www.home-assistant.io/integrations/zabbix"
final_url: "https://www.home-assistant.io/integrations/zabbix"
canonical_url: "https://www.home-assistant.io/integrations/zabbix/"
source_handle: "web:www-home-assistant-io:121f00239c4a"
source_section: "integrations-zabbix"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "63339a422bc4821068236a9b4e21b877b5ffd662c8fb79540414bab031e67d4a"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Zabbix - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/zabbix
- Final URL: https://www.home-assistant.io/integrations/zabbix
- Canonical URL: https://www.home-assistant.io/integrations/zabbix/
- Fetched at: 2026-06-28T03:30:40Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Zabbix into Home Assistant.

## Extracted Text

On this page
Configuration
Full configuration
Configure filter
Sensor
Related topics
The Zabbix integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] is the main integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] to connect to a Zabbix monitoring instance via the Zabbix API.
It is possible to publish Home Assistant state changes to Zabbix. In Zabbix a host has to be created which will contain the Home Assistant states as individual items. These items are automatically created using Zabbix Low-Level Discovery (LLD). To make setup in Zabbix easy, you can use this template for the host.
There is currently also support for the following device types within Home Assistant:
To set the Zabbix integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] up, add the following information to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry zabbix : host : IP_ADDRESS
Configuration Variables
Looking for your configuration file?
host string Required
Your Zabbix server.
path string ( Optional , default: /zabbix/ )
Path to your Zabbix install.
ssl boolean ( Optional , default: false )
Set to true if your Zabbix installation is using SSL.
username string ( Optional )
Your Zabbix username.
password string ( Optional )
Your Zabbix password.
publish_states_host string ( Optional )
The host that will receive the state changes from Home Assistant. It needs to be manually created in Zabbix first and have the template associated with it (see above).
publish_string_states boolean ( Optional , default: false )
Also publish string states, that is, states which cannot be cast to a numeric value.
exclude list ( Optional )
Configure which integrations should be excluded from being published to Zabbix. ( Configure Filter )
entities string | list ( Optional )
The list of entity ids to be excluded from being published to Zabbix.
entity_globs string | list ( Optional )
Exclude all entities matching a listed pattern.
domains string | list ( Optional )
The list of domains to be excluded from being published to Zabbix.
include list ( Optional )
Configure which integrations should be included in being published to Zabbix. If set, all other entities will not be published to Zabbix. ( Configure Filter )
The list of entity ids to be included in being published to Zabbix.
Include all entities matching a listed pattern.
The list of domains to be included in being published to Zabbix.
# Example configuration.yaml entry zabbix : host : ZABBIX_HOST path : ZABBIX_PATH ssl : false username : USERNAME password : PASSWORD publish_states_host : homeassistant publish_string_states : true exclude : domains : - device_tracker entities : - sun.sun - sensor.time
By default, no entity will be excluded. To limit which entities are being published to Zabbix, you can use the include and exclude parameters.
# Example filter to include specified domains and exclude specified entities zabbix : include : domains : - alarm_control_panel - light entity_globs : - binary_sensor.*_occupancy exclude : entities : - light.kitchen_light
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
The zabbix sensor platform let you monitor the current count of active triggers for your Zabbix monitoring instance.
Important
You must have the Zabbix integration configured to use those sensors.
To set it up, add the following information to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry sensor : - platform : zabbix triggers : name : Important Hosts Trigger Count hostids : [ 10051 , 10081 , 10084 ] individual : true
triggers string Required
Specifies that this sensor is for Zabbix ‘triggers’. In the future there will be other Zabbix sensors.
name string ( Optional )
Allows you to specify the name for the Sensor, otherwise the host name, as stored in Zabbix, is used. This is useful when you are specifying a list of hostids to monitor as a single count.
hostids string ( Optional )
This is a list of Zabbix hostids that we want to filter our count on.
individual boolean ( Optional , default: false )
A ‘true’/‘false’ to specify whether we should show individual sensors when a list of hostids is provided. If false, the sensor state will be the count of all triggers for the specified hosts (or all hosts within the Zabbix instance, if hostids isn’t provided).
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Zabbix integration was introduced in Home Assistant 0.37, and it's used by
89 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@kruton
Categories
System monitor
Back to top
