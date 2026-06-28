---
source_url: "https://www.home-assistant.io/docs/configuration/splitting_configuration"
final_url: "https://www.home-assistant.io/docs/configuration/splitting_configuration"
canonical_url: "https://www.home-assistant.io/docs/configuration/splitting_configuration/"
source_handle: "web:www-home-assistant-io:047b6c2bf8d5"
source_section: "docs-configuration"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "6b2139e0ee5a56cc54dd928fec769e761fb6181f29fa06c352c6f2adeb106c5f"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Splitting the configuration file - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/docs/configuration/splitting_configuration
- Final URL: https://www.home-assistant.io/docs/configuration/splitting_configuration
- Canonical URL: https://www.home-assistant.io/docs/configuration/splitting_configuration/
- Fetched at: 2026-06-28T02:21:40Z
- Content type: text/html; charset=UTF-8

## Description

Keep your configuration.yaml manageable by splitting it into smaller, focused files using the !include directive.

## Extracted Text

On this page
Example configuration files for inspiration
How splitting works
Indentation
Comments
Multiple top-level keys
Using packages
Debugging configuration files
Including entire directories
Example: !include_dir_list
Example: !include_dir_named
Example: !include_dir_merge_list
Example: !include_dir_merge_named
Example: Combine !include_dir_merge_list with automations.yaml
Related topics
If you configure Home Assistant using YAML, your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file can grow large over time. You can split it into smaller, focused files using the !include directive.
Note
Most Home Assistant features are configured through the UI and don’t require editing the configuration.yaml at all. This page is for you if you use YAML-based configuration and want to keep your files organized.
First off, several community members have sanitized (read: without API keys/passwords) versions of their configurations available for viewing. You can see a list of example configuration on GitHub .
As commenting code doesn’t always happen, please read on to learn in detail how configuration files can be structured.
The configuration.yaml file stays in place when you split it. You move parts of its content into separate files and reference them with !include .
A fresh configuration.yaml includes several entries that should not be removed:
# Loads a standard set of integrations. Keep this entry. default_config : # These files store automations, scripts, and scenes created in the UI. automation : !include automations.yaml script : !include scripts.yaml scene : !include scenes.yaml
If you have added customizations or packages, there may also be a homeassistant: key. Any !include statements under it, such as for customize: or packages: , should stay nested inside it.
The included file must contain valid YAML for the location where it is included. You do not repeat the parent key inside the included file.
For example, if configuration.yaml contains:
customize : !include customize.yaml
Then customize.yaml contains only the entries that belong under customize: :
light.living_room : friendly_name : " Living Room" icon : mdi:ceiling-light switch.patio : friendly_name : " Patio Switch"
You can apply the same pattern to any integration:
switch : !include switch.yaml sensor : !include sensor.yaml
Give files names that match their purpose, so they are easier to find and maintain.
Nesting !include statements also works. A file that is itself included can use !include to pull in further files.
Home Assistant configuration files use YAML, where indentation is significant. Always use 2 spaces per level.
As a general rule:
Top-level keys (like homeassistant: , mqtt: , or sensor: ) are fully left-aligned with no indent.
Keys nested under a parent are indented 2 spaces.
List items ( - ) are indented to the correct level, followed by a single space before the value.
# Top-level key: no indent sensor : # Nested key: 2 spaces - platform : template sensors : living_room_temp : friendly_name : " Living room temperature"
Incorrect indentation is one of the most common reasons a configuration file fails to load.
A # symbol marks a comment. Anything after it on that line is ignored by Home Assistant. Comments are useful for adding context or temporarily disabling a line without deleting it.
# Automations for public transport notifications automation public transport : !include public-transport-automation.yaml
Some integrations support multiple top-level keys, letting you split their configuration across several files. Each key must have a different label. This applies to IoT domain integrations such as light , switch , and sensor , as well as automation , script , and template .
If an integration does not support multiple top-level keys, use Packages instead.
Example of multiple top-level keys
Here is an example using light . The first key keeps some entries inline, and the other keys use !include to pull in separate files:
configuration.yaml
light : - platform : group name : " Bedside Lights" entities : - light.left_bedside_light - light.right_bedside_light # More light groups in a separate file light groups : !include light-groups.yaml # Light switch mappings in a different file light switches : !include light-switches.yaml
light-groups.yaml
- platform : group name : " Outside Lights" entities : - light.porch_lights - light.patio_lights
light-switches.yaml
- platform : switch name : " Patio Lights" entity_id : switch.patio_lights - platform : switch name : " Floor Lamp" entity_id : switch.floor_lamp_plug
The same pattern works for automation :
# Automations managed in the UI automation ui : !include automations.yaml # Automations written by hand automation manual : !include automations_manual.yaml
Configuration can also be organized using Packages , which let you group all the configuration for a specific feature or room into a single file.
If you have many configuration files, Home Assistant provides a CLI that allows you to see how it interprets them. Each installation type has its own section in the common-tasks about this:
Operating System
Container
You can also include entire directories at once using four directory-level include options. The directory-level options only scan for files with the .yaml extension. Files with the .yml extension are ignored.
You can still use !include to load .yml files directly from within your .yaml files.
!include_dir_list returns the content of a directory as a list with each file content being an entry in the list. The list entries are ordered based on the alphanumeric ordering of the names of the files.
!include_dir_named returns the content of a directory as a dictionary that maps filenames to file contents.
!include_dir_merge_list returns the content of a directory as a list by merging all files (which should contain a list) into a single list.
!include_dir_merge_named returns the content of a directory as a dictionary by loading each file and merging it into a single dictionary.
These work recursively. For example, !include_dir_list automation includes all 6 files shown below:
.
└── .homeassistant
├── automation
│ ├── lights
│ │ ├── turn_light_off_bedroom.yaml
│ │ ├── turn_light_off_lounge.yaml
│ │ ├── turn_light_on_bedroom.yaml
│ │ └── turn_light_on_lounge.yaml
│ ├── say_hello.yaml
│ └── sensors
│ └── react.yaml
└── configuration.yaml ( not included )
automation : - alias : " Automation 1" triggers : - trigger : state entity_id : device_tracker.iphone to : " home" actions : - action : light.turn_on target : entity_id : light.entryway - alias : " Automation 2" triggers : - trigger : state entity_id : device_tracker.iphone from : " home" actions : - action : light.turn_off target : entity_id : light.entryway
can be turned into:
automation : !include_dir_list automation/presence/
automation/presence/automation1.yaml
alias : " Automation 1" triggers : - trigger : state entity_id : device_tracker.iphone to : " home" actions : - action : light.turn_on target : entity_id : light.entryway
automation/presence/automation2.yaml
alias : " Automation 2" triggers : - trigger : state entity_id : device_tracker.iphone from : " home" actions : - action : light.turn_off target : entity_id : light.entryway
Each file must contain only one entry when using !include_dir_list .
alexa : intents : LocateIntent : actions : action : notify.pushover data : message : " Your location has been queried via Alexa." speech : type : plaintext text : > {%- for state in states.device_tracker -%} {%- if state.name.lower() == User.lower() -%} {{ state.name }} is at {{ state.state }} {%- endif -%} {%- else -%} I am sorry. Pootie! I do not know where {{User}} is. {%- endfor -%} WhereAreWeIntent : speech : type : plaintext text : > {%- if is_state('device_tracker.iphone', 'home') -%} iPhone is home. {%- else -%} iPhone is not home. {% endif %}
alexa : intents : !include_dir_named alexa/
alexa/LocateIntent.yaml
actions : action : notify.pushover data : message : " Your location has been queried via Alexa." speech : type : plaintext text : > {%- for state in states.device_tracker -%} {%- if state.name.lower() == User.lower() -%} {{ state.name }} is at {{ state.state }} {%- endif -%} {%- else -%} I am sorry. Pootie! I do not know where {{User}} is. {%- endfor -%}
alexa/WhereAreWeIntent.yaml
speech : type : plaintext text : > {%- if is_state('device_tracker.iphone', 'home') -%} iPhone is home. {%- else -%} iPhone is not home. {% endif %}
automation : !include_dir_merge_list automation/
automation/presence.yaml
- alias : " Automation 1" triggers : - trigger : state entity_id : device_tracker.iphone to : " home" actions : - action : light.turn_on target : entity_id : light.entryway - alias : " Automation 2" triggers : - trigger : state entity_id : device_tracker.iphone from : " home" actions : - action : light.turn_off target : entity_id : light.entryway
When using !include_dir_merge_list , you must include a list in each file (each list item is denoted with a hyphen ( - )). Each file may contain one or more entries.
group : bedroom : name : " Bedroom" entities : - light.bedroom_lamp - light.bedroom_overhead hallway : name : " Hallway" entities : - light.hallway - thermostat.home front_yard : name : " Front Yard" entities : - light.front_porch - light.security - light.pathway - sensor.mailbox - camera.front_porch
group : !include_dir_merge_named group/
group/interior.yaml
bedroom : name : " Bedroom" entities : - light.bedroom_lamp - light.bedroom_overhead hallway : name : " Hallway" entities : - light.hallway - thermostat.home
group/exterior.yaml
front_yard : name : " Front Yard" entities : - light.front_porch - light.security - light.pathway - sensor.mailbox - camera.front_porch
Do you want to split your automations, while still being able to create them in Settings > Automations & scenes ? Here is how you can do that for automations.
Using labels like manual or ui allows for using multiple keys in the config:
# My own handmade automations automation manual : !include_dir_merge_list automations/ # Automations I create in the UI automation ui : !include automations.yaml
Several community members have shared versions of their configurations without sensitive information, like API keys and passwords. You can see a list of example configurations on GitHub .
Configuration.yaml file
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
