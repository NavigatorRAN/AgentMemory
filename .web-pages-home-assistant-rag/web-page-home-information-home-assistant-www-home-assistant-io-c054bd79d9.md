---
source_url: "https://www.home-assistant.io/docs/configuration/basic"
final_url: "https://www.home-assistant.io/docs/configuration/basic"
canonical_url: "https://www.home-assistant.io/docs/configuration/basic/"
source_handle: "web:www-home-assistant-io:c054bd79d959"
source_section: "docs-configuration"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "e7f1ca2753c77503234c70ea991bfe7b2da2991fbe0a9afbc2e1a9aedf13ed56"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Home information - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/docs/configuration/basic
- Final URL: https://www.home-assistant.io/docs/configuration/basic
- Canonical URL: https://www.home-assistant.io/docs/configuration/basic/
- Fetched at: 2026-06-28T02:21:20Z
- Content type: text/html; charset=UTF-8

## Description

Set the general information about your Home Assistant, such as your home's name, location, time zone, and units of measurement.

## Extracted Text

On this page
Editing the home information
Actions related to general home information
Changing display names and usernames
Related topics
As part of the default onboarding process, Home Assistant can detect your location from IP address geolocation. Home Assistant will automatically select a unit system and time zone based on this location. If you didn’t adjust this directly during onboarding, you can do it later.
To change the home information (formerly called general settings) that were defined during onboarding, follow these steps:
To change the name, go to Settings > System > Home information .
Under Home name , enter a new name and select Save .
To change location or radius, go to Settings > System > Home information .
Under Location , select Edit . This opens the home zone editor.
Then, adjust the location and radius on the map. These changes are saved automatically.
To add a new zone, select Create zone .
To edit an existing zone, select the edit icon next to it. You can then change its name, icon, and radius, among other settings.
To apply your changes, select Save .
To change regional settings, go to Settings > System > Home information .
Under Region , you can change the following parameters:
Time zone
Elevation above sea level
Unit system : select Metric or US customary .
Currency
Country
Language
To change network-related configuration, such as the network name, go to Settings > System > Network .
Troubleshooting: If any of the settings are grayed out and can’t be edited, this is because they are defined in the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
If you prefer editing the settings in the UI, you have to delete these entries from the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
For more information about the general settings in YAML, refer to the Home Assistant Core integration documentation .
The settings described here are managed by the Home Assistant Core integration . If you are interested in the actions available in the core integration, check out the documentation.
To change a person’s display name or username, refer to User configuration .
Home Assistant Core
The configuration.yaml file
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
