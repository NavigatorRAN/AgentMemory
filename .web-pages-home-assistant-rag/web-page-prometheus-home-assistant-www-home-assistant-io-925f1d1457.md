---
source_url: "https://www.home-assistant.io/integrations/prometheus"
final_url: "https://www.home-assistant.io/integrations/prometheus"
canonical_url: "https://www.home-assistant.io/integrations/prometheus/"
source_handle: "web:www-home-assistant-io:925f1d1457a8"
source_section: "integrations-prometheus"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "9dd906ed1472d65d7602b671798f3e072315770665799c356a462b518c3da928"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Prometheus - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/prometheus
- Final URL: https://www.home-assistant.io/integrations/prometheus
- Canonical URL: https://www.home-assistant.io/integrations/prometheus/
- Fetched at: 2026-06-28T03:09:20Z
- Content type: text/html; charset=UTF-8

## Description

Record events in Prometheus.

## Extracted Text

On this page
Configuration
Configure Filter
Full Example
Metrics in unavailable or unknown states
Supported metrics
Related topics
The Prometheus integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] exposes metrics in a format which Prometheus can read.
To use the prometheus integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes.
# Example configuration.yaml entry prometheus :
Configuration Variables
Looking for your configuration file?
namespace string ( Optional )
The “namespace” that will be assigned to all the Prometheus metrics. This is the prefix of the metric name. E.g., having myhass as the namespace will cause the device tracker metrics to be myhass_device_tracker_state , the switch metrics to be myhass_switch_state and so on. The default is to not add any prefix to the metrics name. (available in version 0.73.0 and later)
filter list ( Optional )
Filtering directives for the integrations which should be included or excluded from recording. ( Configure Filter )
exclude_entities list ( Optional )
The list of entity ids to be excluded from recording.
exclude_entity_globs list ( Optional )
Exclude all entities matching a listed pattern (e.g., sensor.weather_* ).
exclude_domains list ( Optional )
The list of domains to be excluded from recording.
include_entities list ( Optional )
The list of entity ids to be included from recordings. If set, all other entities will not be recorded. Values set by the exclude_ * option will prevail.
include_entity_globs list ( Optional )
Include all entities matching a listed pattern (e.g., sensor.weather_* ). If set, all other entities will not be recorded. Values set by the exclude_ * option will prevail.
include_domains list ( Optional )
The list of domains to be included from recordings. If set, all other entities will not be recorded. Values set by the exclude_ * option will prevail.
default_metric string ( Optional )
Metric name to use when an entity doesn’t have a unit.
Default:
uses the entity id of the entity
override_metric string ( Optional )
Metric name to use instead of unit or default metric. This will store all data points in a single metric.
component_config string ( Optional )
This attribute contains integration-specific override values. See Customizing devices and services for format.
component_config_domain string ( Optional )
This attribute contains domain-specific integration override values. See Customizing devices and services for format.
component_config_glob string ( Optional )
requires_auth boolean ( Optional , default: true )
This makes authentication optional for the /api/prometheus endpoint.
By default, no entity will be excluded. To limit which entities are being exposed to Prometheus , you can use the filter parameter.
# Example filter to include specified domains and exclude specified entities prometheus : filter : include_domains : - alarm_control_panel - light include_entity_globs : - binary_sensor.*_occupancy exclude_entities : - light.kitchen_light
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
Advanced configuration example:
# Advanced configuration.yaml entry prometheus : namespace : hass component_config_glob : sensor.*_hum : override_metric : humidity_percent sensor.*_temp : override_metric : temperature_c sensor.temperature* : override_metric : temperature_c sensor.*_bat : override_metric : battery_percent filter : include_domains : - sensor exclude_entity_globs : - sensor.weather_*
You can then configure Prometheus to fetch metrics from Home Assistant by adding to its scrape_configs configuration.
# Example Prometheus scrape_configs entry - job_name : " hass" scrape_interval : 60s metrics_path : /api/prometheus # Legacy api password params : api_password : [ ' PASSWORD' ] # Long-Lived Access Token bearer_token : " your.longlived.token" scheme : https static_configs : - targets : [ ' HOSTNAME:8123' ]
Replace your.longlived.token with a Home Assistant generated token .
The format to configure the bearer token has changed in Prometheus 2.26, so if you have a newer version, you can use this configuration sample:
# Example Prometheus scrape_configs entry (For version 2.26+) - job_name : " hass" scrape_interval : 60s metrics_path : /api/prometheus # Long-Lived Access Token authorization : credentials : " your.longlived.token" scheme : https static_configs : - targets : [ ' HOSTNAME:8123' ]
When looking into the metrics on the Prometheus side, there will be:
All Home Assistant domains, which can be easily found through the common namespace prefix, if defined.
The client library provided metrics, which are a bunch of process_* and also a single pseudo-metric python_info which contains (not as value but as labels) information about the Python version of the client, that is, the Home Assistant Python interpreter.
Typically, you will only be interested in the first set of metrics.
When the Prometheus exporter starts (typically when Home Assistant starts), all non-excluded entities in an unavailable or unknown state are not exported until they are available and known.
If an available entity goes into state unavailable or unknown, then it will automatically be unexported and return again automatically when available and known.
Note
To filter out these stale values, entity_available could be used in a query or recording rule. For example:
- record : " known_temperature_c" expr : " temperature_c unless entity_available == 0"
This use of unless (which can be slow to compute) is no longer necessary, but will continue to work.
Metrics are exported only for the following domains:
alarm_control_panel , automation , binary_sensor , climate , cover , counter , device_tracker , fan , geo_location , humidifier , input_boolean , input_number , light , lock , number , person , sensor , switch , update , water_heater
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Prometheus integration was introduced in Home Assistant 0.49, and it's used by
3191 active installations.
Its IoT class is Assumed State.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@knyar
Categories
History
Back to top
