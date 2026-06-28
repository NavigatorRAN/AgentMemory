---
source_url: "https://www.home-assistant.io/docs/blueprint/schema"
final_url: "https://www.home-assistant.io/docs/blueprint/schema"
canonical_url: "https://www.home-assistant.io/docs/blueprint/schema/"
source_handle: "web:www-home-assistant-io:c6e915aa4328"
source_section: "docs-blueprint"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "d270852b1c32d6f4963bc9e12476fcd366e65609300165200e5d13bee924d23b"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# About the blueprint schema - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/docs/blueprint/schema
- Final URL: https://www.home-assistant.io/docs/blueprint/schema
- Canonical URL: https://www.home-assistant.io/docs/blueprint/schema/
- Fetched at: 2026-06-28T02:21:11Z
- Content type: text/html; charset=UTF-8

## Description

Introduction to the blueprint schema.

## Extracted Text

On this page
The blueprint schema
Blueprint inputs
Blueprint input sections
Blueprint inputs in templates
Example blueprints
Related topics
Related links
Blueprint schemas currently supports three types of schema depending on its domain: automation ; script ; and template .
The configuration schema of a blueprint consists of 2 parts:
The blueprint’s high-level metadata: name, domain and, optionally, any input required from the user.
The schema for the blueprint domain it describes.
The first part is referred to as the blueprint schema . It contains the
blueprint’s metadata.
Minimum required metadata for a blueprint is its name and domain. In its most basic form,
a blueprint looks like:
blueprint : name : Example blueprint domain : automation
Although this is a valid blueprint, it is not very useful.
The second part depends on its domain, the type of blueprint. For example, when creating a blueprint for an automation, the full
schema for an automation applies.
This is the full blueprint schema:
Configuration Variables
Looking for your configuration file?
name string Required
The name of the blueprint. Keep this short and descriptive.
description string ( Optional )
The description of the blueprint. While optional, this field is highly recommended. Describe what the blueprint does and describe the inputs the blueprint requires. The description can include Markdown .
domain string Required
The domain in which this blueprint is used. Currently, only three types, automation , script and template are supported.
author string ( Optional )
The name of the blueprint author.
homeassistant map ( Optional )
Home Assistant version required for the blueprint to work successfully.
min_version string ( Optional )
Minimum required version of Home Assistant to use the blueprint in the format of major . minor . patch (all parts are required). For example, 2022.4.0 . It is important to set this if the blueprint uses any features introduced in recent releases to head off issues.
input map ( Optional )
A dictionary of defined user inputs or sections. These are the input fields that the consumer of your blueprint can provide using YAML definition, or via a configuration form in the UI. Sections provide a way to visually group a set of related inputs (see below).
A blueprint can accept one or multiple inputs from the user, but does not require any input.
These inputs can be of any type (string, boolean, list, map). They can have
a default value and provide a selector that
ensures a matching input field in the user interface.
A blueprint input has the following configuration:
name string ( Optional )
The name of the input field.
A short description of the input field. Keep this short and descriptive. The description can include Markdown .
selector selector ( Optional )
The selector to use for this input. A selector defines how the input is displayed in the frontend UI.
default any ( Optional )
The default value of this input, in case the input is not provided by the user of this blueprint.
Each input field can be referred to, outside of the blueprint metadata, using
the !input custom YAML tag before its name.
The following example shows a minimal blueprint schema with a single input:
blueprint : name : Example blueprint description : Example showing an input domain : automation input : my_input : name : Example input
In the above example, my_input is the identifier of the input. It can be
referenced by using the !input my_input custom tag.
In this example, no selector was provided. In the user interface, a text input field would be shown to the user.
It is then up to the user to find out what to enter there. Blueprints that come with selectors are easier to use.
A blueprint can have as many inputs as you like.
One or more input sections can be added under the main input key. Each section visually groups the inputs in that section,
allows an optional description, and optionally allows for collapsing those inputs. Note that the section only impacts how
inputs are displayed to the user when they fill in the blueprint. Inputs must have unique names and be referenced directly
by their name; not by section and name.
A section is differentiated from an input by the presence of an additional input key within that section.
Caution
Input sections are a new feature in version 2024.6.0. Set the min_version for the blueprint to at least this version if using input sections. Otherwise, the blueprint will generate errors on older versions. See this section for more details.
The full configuration for an input section is below:
A name for the section. If omitted the key of the section is used.
icon string ( Optional )
An icon to display next to the name of the section.
An optional description of this section, which will be displayed at the top of the section. The description can include Markdown .
collapsed boolean ( Optional , default: false )
If true , the section will be collapsed by default. Useful for optional or less important inputs. All collapsed inputs must also have a defined default before they can be hidden.
input map Required
A dictionary of defined user inputs within this section.
The following example shows a blueprint schema with some inputs in a section:
blueprint : name : Example sections blueprint description : Example showing a section input : base_input : name : An input not in the section my_section : name : My Section icon : mdi:cog description : These options control a specific feature of this blueprint input : my_input : name : Example input my_input_2 : name : 2nd example input
The inputs are available as custom YAML tags, but not as template variables.
To use a blueprint input in a template, it first needs to be exposed as either
a script level variable or in
a variable script step .
variables : # Make input my_input available as a script level variable my_input : !input my_input
The built-in blueprints
are great examples to get a bit of a feeling of how blueprints work.
Here is the built-in motion light automation blueprint.
Note the blueprint schema under the blueprint key is followed by its domain schema. In this example, an automation schema.
blueprint : name : Motion-activated Light description : Turn on a light when motion is detected. domain : automation input : motion_entity : name : Motion Sensor selector : entity : filter : device_class : motion domain : binary_sensor light_target : name : Light selector : target : entity : domain : light no_motion_wait : name : Wait time description : Time to leave the light on after last motion is detected. default : 120 selector : number : min : 0 max : 3600 unit_of_measurement : seconds # If motion is detected within the delay, # we restart the script. mode : restart max_exceeded : silent triggers : - trigger : state entity_id : !input motion_entity from : " off" to : " on" actions : - action : light.turn_on target : !input light_target - wait_for_trigger : - trigger : state entity_id : !input motion_entity from : " on" to : " off" - delay : !input no_motion_wait - action : light.turn_off target : !input light_target
About blueprints
Blueprint selectors
Using blueprints in automations
Tutorial: create an automation blueprint
Blueprint community forum
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
Basic automations
Scenes
Blueprints
Tutorial
Blueprint schema
Selectors
Scripts
Dashboards
Voice assistants
Organization
Home energy management
Templating
Common tasks
Configuration
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
