---
source_url: "https://www.home-assistant.io/integrations/netdata"
final_url: "https://www.home-assistant.io/integrations/netdata"
canonical_url: "https://www.home-assistant.io/integrations/netdata/"
source_handle: "web:www-home-assistant-io:8abe71874764"
source_section: "integrations-netdata"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "658b968ae91912094b581c506dbcdb849515bd47d26e12c7aa8bb1ac97c10e06"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Netdata - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/netdata
- Final URL: https://www.home-assistant.io/integrations/netdata
- Canonical URL: https://www.home-assistant.io/integrations/netdata/
- Fetched at: 2026-06-28T03:02:40Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Netdata within Home Assistant.

## Extracted Text

On this page
Prerequisites
Setup
Configuration
Full example
Related topics
The Netdata integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to display information collected by Netdata .
A running Netdata instance, accessible from your Home Assistant instance. For more information on setting up Netdata, check out their documentation .
Getting the details to configure the sensors is a bit tricky as Netdata uses different name for the element: value that is required. To get the value for the data_group: use Netdata’s web interface. 1. marks the name for the data_group: . 2. are the names for the element to show in Home Assistant. The name that is shown can be different than the name under which the metrics are available.
To check if the element: name matches the name in the Netdata frontend, use curl with the IP address of your Netdata instance, its port and the data_group :
$ curl -X GET "http://[Netdata_Instance]:19999/api/v1/data?chart=[data_group]&points=2&options=jsonwrap" { "api" : 1,
"id" : "system.ipv4" ,
"name" : "system.ipv4" ,
[ ...]
"dimension_names" : [ "received" , "sent" ] ,
"dimension_ids" : [ "InOctets" , "OutOctets" ] ,
dimension_names : Names shown in the frontend.
dimension_ids : Names to use for element .
Alternatively you can browse to the built in Netdata API in your browser http://[Netdata_Instance]:19999/api/v1/allmetrics?format=json and search for the data_group identified in the Netdata frontend. In the example JSON below the data group is “system.load”.
"system.load" : { "name" : "system.load" , "context" : "system.load" , "units" : "load" , "last_updated" : 1558446920 , "dimensions" : { "load1" : { "name" : "load1" , "value" : 0.1250000 }, "load5" : { "name" : "load5" , "value" : 0.1290000 }, "load15" : { "name" : "load15" , "value" : 0.1430000 } } } ,
Once the data_group “system.load” and the element “load15” have been identified from the JSON it can be configured in your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
Add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] .
# Example configuration.yaml entry sensor : - platform : netdata resources : load : data_group : system.load element : load15
Configuration Variables
Looking for your configuration file?
host string ( Optional , default: localhost )
The IP address or hostname of your Netdata instance.
port integer ( Optional , default: 19999 )
The port that the Netdata instance is running on.
name string ( Optional , default: Netdata )
Name of the monitored Netdata instance.
resources map Required
List of details to monitor.
name string Required
Name to use for the sensor in the frontend.
data_group string Required
Name of the data group to monitor, e.g., system.cpu .
element string Required
The element of the group to monitor.
icon icon ( Optional , default: mdi:desktop-classic )
Icon to use for the sensor.
invert boolean ( Optional , default: false )
Invert the sensor values.
# Example configuration.yaml entry sensor : - platform : netdata host : " 192.168.1.2" port : " 19999" name : SomeHostName resources : system_load : data_group : system.load element : load15 core0_freq : data_group : " cpu.cpufreq" element : " cpu0" icon : mdi:chip
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Netdata integration was introduced in Home Assistant 0.35, and it's used by
141 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@fabaff
Categories
System monitor
Back to top
