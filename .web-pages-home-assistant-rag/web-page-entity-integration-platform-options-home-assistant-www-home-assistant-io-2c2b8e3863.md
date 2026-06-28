---
source_url: "https://www.home-assistant.io/docs/configuration/platform_options"
final_url: "https://www.home-assistant.io/docs/configuration/platform_options"
canonical_url: "https://www.home-assistant.io/docs/configuration/platform_options/"
source_handle: "web:www-home-assistant-io:2c2b8e386345"
source_section: "docs-configuration"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "0a0ea4cd0a01c2695553bc365412be14ac3b054a8c0940e8e0e6c9ac7e869d1e"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Entity integration platform options - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/docs/configuration/platform_options
- Final URL: https://www.home-assistant.io/docs/configuration/platform_options
- Canonical URL: https://www.home-assistant.io/docs/configuration/platform_options/
- Fetched at: 2026-06-28T02:21:30Z
- Content type: text/html; charset=UTF-8

## Description

Configure shared entity options such as the polling interval for any integration through configuration.yaml.

## Extracted Text

On this page
Entity namespace
Scan interval
Important
These options are being phased out and are only available for single platform integrations.
Some integrations or platforms (those that are based on the entity class) allow various extra options to be set.
By setting an entity namespace, all entities will be prefixed with that namespace. That way, light.bathroom can become light.holiday_house_bathroom .
# Example configuration.yaml entry light : - platform : your_lights entity_namespace : holiday_house
Platforms that require polling will be polled in an interval specified by the main integration. For example, a light will check every 30 seconds for a changed state. It is possible to overwrite this scanning interval for any platform that is being polled by specifying a scan_interval configuration key. In the example below, we set up the your_lights platform but tell Home Assistant to poll the devices every 10 seconds instead of the default 30 seconds.
# Example configuration.yaml entry to poll your_lights every 10 seconds. light : - platform : your_lights scan_interval : 10
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View given feedback
Documentation
Overview
|
FAQ
Glossary
Automations
Dashboards
Voice assistants
Organization
Home energy management
Templating
Common tasks
Configuration
Home information
People and user configuration
Customizing entities
Remote access to Home Assistant
Securing your Home Assistant
Storing secrets in YAML
YAML syntax
The configuration.yaml file
Troubleshooting configuration
Splitting up the configuration
Packages
Events
State and state object
Entities and domains
Entity component platform options
Authentication
Tools and helpers
iOS and Android apps
Official hardware
Home Assistant Green
Home Assistant Connect ZBT-1
Home Assistant Connect ZBT-2
Home Assistant Connect ZWA-2
Home Assistant Yellow
Home Assistant Voice Preview Edition
Back to top
