---
source_url: "https://www.home-assistant.io/integrations/transport_nsw"
final_url: "https://www.home-assistant.io/integrations/transport_nsw"
canonical_url: "https://www.home-assistant.io/integrations/transport_nsw/"
source_handle: "web:www-home-assistant-io:88269916aecb"
source_section: "integrations-transport-nsw"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "a7a0d849cd793a9b4e132fc6f6506e982482cb4b5db628992e1c640cf098f39b"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Transport NSW - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/transport_nsw
- Final URL: https://www.home-assistant.io/integrations/transport_nsw
- Canonical URL: https://www.home-assistant.io/integrations/transport_nsw/
- Fetched at: 2026-06-28T03:23:52Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate timetable data for Transport NSW (Australia) within Home Assistant.

## Extracted Text

On this page
Setup
Configuration
Examples
The Transport NSW integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] will give you the time until the next departure from a Transport NSW stop for bus, train, light rail or ferry.
Prerequisite is a free API key from Transport NSW . You will need to register an account and then create a new application. You will need to add the ‘Trip Planner APIs’ to your application. Transport NSW has instructions for doing so .
To find your stop id, use the Transport NSW stop finder and search for your stop. The URL will contain the stop id as a number.
You may also try going to Google maps and clicking on any bus/train/ferry stop. The pop up window shows the stop ID underneath the station name. For train stations the easiest way to get a stop id for a platform is through Transport NSW Info .
As a default the sensor picks up the next mode of transport leaving from a stop id.
To enable the sensor, add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry sensor : - platform : transport_nsw stop_id : " 200024" api_key : " YOUR API KEY"
Configuration Variables
Looking for your configuration file?
api_key string Required
Your API key for Open Data Transport NSW.
stop_id string Required
The ID of the stop to get the information for.
route string ( Optional )
Filter on bus route at the stop. This is the same as the bus number, e.g., 83 .
destination string ( Optional )
Useful for ferry or train stops to filter the destination of the sensor, e.g., Circular Quay .
name string ( Optional )
A friendly name for this sensor.
The public information is provided from Transport NSW .
More example configurations for bus or ferry.
# Example bus route configuration.yaml entry sensor : - platform : transport_nsw name : " Bus" stop_id : " 209516" route : ' 199' api_key : " YOUR API KEY"
# Example ferry configuration.yaml entry sensor : - platform : transport_nsw name : " Ferry" stop_id : " 10102008" destination : " Circular Quay" api_key : " YOUR API KEY"
The sensor returns n/a if no stop event is found within the next 24h. A template sensor can help building a more meaningful string.
# Sample template sensor template : - sensor : - name : " Bus monitor 199" state : >- {% if is_state_attr('sensor.bus', 'due', 'n/a') %} No schedule found {% else %} {{ state_attr('sensor.bus', 'route') }} in {{ state_attr('sensor.bus', 'due') }}m ({{ state_attr('sensor.bus', 'delay') }}) {% endif %}
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Transport NSW integration was introduced in Home Assistant 0.81, and it's used by
97 active installations.
Its IoT class is Cloud Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Transport
Back to top
