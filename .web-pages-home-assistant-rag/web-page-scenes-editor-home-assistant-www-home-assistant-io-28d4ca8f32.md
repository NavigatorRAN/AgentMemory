---
source_url: "https://www.home-assistant.io/docs/scene/editor"
final_url: "https://www.home-assistant.io/docs/scene/editor"
canonical_url: "https://www.home-assistant.io/docs/scene/editor/"
source_handle: "web:www-home-assistant-io:28d4ca8f322d"
source_section: "docs-scene"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "aa8375e46ee6629d1b0e6feec8667a4b11602ba63aebf43e1d5657fe2bea1822"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Scenes editor - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/docs/scene/editor
- Final URL: https://www.home-assistant.io/docs/scene/editor
- Canonical URL: https://www.home-assistant.io/docs/scene/editor/
- Fetched at: 2026-06-28T02:22:37Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to use the scenes editor.

## Extracted Text

On this page
Updating your configuration to use the editor
Migrating your scenes to scenes.yaml
From the UI choose Settings which is located in the sidebar, then select Automations & scenes to go to the scene editor. Press the Add scene button in the lower right corner to get started.
Choose a meaningful name for your scene.
Select all the devices A device is a model representing a physical or logical unit that contains entities. or entities An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] you want to include in your scene.
The state of your devices will be saved, so it can be restored when you are finished creating your scene.
Set the state of the devices to how you want them to be in your scene, this can be done by selecting it and edit the state from the popup, or any other method that changes the state.
On the moment you save the scene, all the states of your devices are stored in the scene.
When you leave the editor the states of the devices are restored to the state from before you started editing.
The menu on the top-right has options to Duplicate scene and Delete scene .
A scene can be called in automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] action and scripts Scripts are components that allow you to specify a sequence of actions to be executed by Home Assistant when turned on. [Learn more] using a turn on scene action Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] :
action : scene.turn_on target : entity_id : scene.my_unique_id
First, check that you have activated the configuration editor.
# Activate the configuration editor config :
The scene editor reads and writes to the file scenes.yaml in the root of your configuration folder.
Currently, both the name of this file and its location are fixed.
Make sure that you have set up the scene integration to read from it:
# Configuration.yaml example scene : !include scenes.yaml
If you still want to use your old scene section, add a label to the old entry:
scene old : - name : ...
You can use the scene: and scene old: sections at the same time:
scene old: to keep your manual designed scenes
scene: to save the scene created by the online editor
scene : !include scenes.yaml scene old : !include_dir_merge_list scenes
If you want to migrate your old scenes to use the editor, you’ll have to copy them to scenes.yaml . Make sure that scenes.yaml remains a list! For each scene that you copy over, you’ll have to add an id . This can be any string as long as it’s unique.
For example:
# Example scenes.yaml entry - id : my_unique_id # <-- Required for editor to work. name : Romantic entities : light.tv_back_light : on light.ceiling : state : on xy_color : [ 0.33 , 0.66 ] brightness : 200
Note
Any comments in the YAML YAML is a human-readable data serialization language. It is used to store and transmit data in a structured format. In Home Assistant, YAML is used for configuration, for example in the configuration.yaml or automations.yaml files. [Learn more] file will be lost and templates will be reformatted when you update a scene via the editor.
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
Editor
Blueprints
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
