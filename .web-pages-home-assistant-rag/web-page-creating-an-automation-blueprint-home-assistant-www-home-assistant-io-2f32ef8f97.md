# Creating an automation blueprint - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/docs/blueprint/tutorial
- Final URL: https://www.home-assistant.io/docs/blueprint/tutorial
- Canonical URL: https://www.home-assistant.io/docs/blueprint/tutorial/
- Fetched at: 2026-06-28T02:21:16Z
- Content type: text/html; charset=UTF-8

## Description

Tutorial on creating an automation blueprint.

## Extracted Text

On this page
Creating an automation blueprint
Prerequisites
Creating an automation
Creating the blueprint file
Using your blueprint via configuration.yaml
Improving the inputs
Add a user friendly names to the inputs
Describe the inputs
The final blueprint
Using the blueprint via the UI
Video tutorial
Share the love
Share informally
Share on the Blueprint Exchange
Related topics
Tip
While the tutorial only shows how to create an automation blueprint, scripts Scripts are components that allow you to specify a sequence of actions to be executed by Home Assistant when turned on. [Learn more] also support blueprints in the same way.
In this tutorial, we’re going to create an automation blueprint that controls a light based on a motion sensor. We will do this by taking an existing automation and converting it to a blueprint.
This tutorial assumes knowledge in the following topics:
Editing the configuration file
YAML , and specifically, YAML used in automations
Scripts
To create a blueprint, we first need to have a working automation.
For this tutorial, we use a simple automation. The process for converting a complex automation is no different.
The automation we’re going to use in this tutorial controls a light based on a motion sensor:
triggers : - trigger : state entity_id : binary_sensor.motion_kitchen actions : - action : > {% if trigger.to_state.state == "on" %} light.turn_on {% else %} light.turn_off {% endif %} target : entity_id : light.kitchen
The options that can be used with the trigger object are listed under automation trigger variables .
In this example, a state trigger is used.
turn_on and turn_off are homeassistant actions . They are not tied to a specific domain. You can use them on lights, switches, and other domains.
Automation blueprints are YAML files (with the .yaml extension) and live in the <config>/blueprints/automation/ folder. You can create as many subdirectories in this folder as you want.
To get started with our blueprint, we’re going to copy the above automation YAML and save it in that directory with the name motion_light_tutorial.yaml .
Add basic blueprint metadata
Home Assistant needs to know about the blueprint. This is achieved by adding a blueprint: section. It should contain the domain of the integration it is for ( automation ) and name , the name of your blueprint. Optionally, you can also include a description for your blueprint.
Add this to the top of the file:
blueprint : name : Motion Light Tutorial description : Turn a light on based on detected motion domain : automation
Define the configurable parts as inputs
Now we have to decide what steps we want to make configurable. We want to make it as re-usable as possible, without losing its original intent of turning on a light-based on a motion sensor.
Configurable parts in blueprints are called inputs . To make the motion sensor entity configurable, we’re replacing the entity ID with a custom YAML tag !input . This YAML tag has to be combined with the name of the input:
triggers : - trigger : state entity_id : !input motion_sensor
For the light, we can offer some more flexibility. We want to allow the user to be able to define any device or area as the target. The target property in the action can contain references to areas, devices, and/or entities, so that’s what we will use.
Inputs are not limited to strings. They can contain complex objects too. So in this case, we’re going to mark the whole target as input:
actions : - action : > {% if trigger.to_state.state == "on" %} light.turn_on {% else %} light.turn_off {% endif %} target : !input target_light
Add the inputs to the metadata
All parts that are marked as inputs need to be added to the metadata. The minimum is that we add their names as used in the automation:
blueprint : name : Motion Light Tutorial description : Turn a light on based on detected motion domain : automation input : motion_sensor : target_light :
For more information on blueprint inputs, refer to the documentation of the blueprint schema
With the bare minimum metadata added, your blueprint is ready to use.
Open your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] and add the following:
automation tutorial : use_blueprint : path : motion_light_tutorial.yaml input : motion_sensor : binary_sensor.kitchen target_light : entity_id : light.kitchen
Reload automations and your new automation should pop up. Because we configured the exact values as the original automation, they should work exactly the same.
Blueprints are easier to use if it’s easy to see what each field is used for.
We can improve this experience by adding names and descriptions to our inputs:
blueprint : name : Motion Light Tutorial description : Turn a light on based on detected motion domain : automation input : motion_sensor : name : Motion Sensor description : This sensor will be synchronized with the light. target_light : name : Lights description : The lights to keep in sync.
Our blueprint doesn’t currently describe what the inputs should contain. Without this information, Home Assistant will offer the user an empty text box.
To instead allow Home Assistant to offer more assistance, we will use selectors . Selectors describe a type and can be used to help the user pick a matching value.
The selector for the motion sensor entity should describe that we want entities from the binary sensor domain that have the device class motion .
The selector for the target light should describe that we want to target light entities.
blueprint : name : Motion Light Tutorial domain : automation input : motion_sensor : name : Motion Sensor description : This sensor will be synchronized with the light. selector : entity : filter : - domain : binary_sensor device_class : motion target_light : name : Lights description : The lights to keep in sync. selector : target : entity : - domain : light
By limiting our blueprint to working with lights and motion sensors, we unlock a couple of benefits: the UI will be able to limit suggested values to lights and motion sensors instead of all devices. It will also allow the user to pick an area to control the lights in.
After we have added all the steps, our blueprint will look like this:
blueprint : name : Motion Light Tutorial description : Turn a light on based on detected motion domain : automation input : motion_sensor : name : Motion Sensor description : This sensor will be synchronized with the light. selector : entity : filter : - domain : binary_sensor device_class : motion target_light : name : Lights description : The lights to keep in sync. selector : target : entity : - domain : light triggers : - trigger : state entity_id : !input motion_sensor actions : - action : > {% if trigger.to_state.state == "on" %} light.turn_on {% else %} light.turn_off {% endif %} target : !input target_light
To configure your blueprint via the UI, go to Settings > Automations & scenes > Blueprints .
Find the Motion Light Tutorial blueprint and select Create Automation .
Important
Don’t forget to reload automations after you make changes to your blueprint to have the UI and the automation integration pick up the latest blueprint changes.
This video tutorial explains how to create a blueprint that toggles a light on motion when the lux value is below a certain threshold.
The final step is to share this blueprint with others. For this tutorial we’re going to share it on GitHub Gists.
For this tutorial, we’re going to share it on GitHub Gists. This is a good option if you don’t want to publish your blueprint to a larger audience.
Go to GitHub Gists
Gist description : blueprint tutorial
Filename including extension : motion_light_tutorial.yaml
Content is the content of the blueprint file.
Select Create Gist .
To share your blueprint with other people, copy the URL of your new Gist. They can import it by going to Settings > Automations & scenes > Blueprints and select Import blueprint .
Celebrate! Cheers to you. You created your first blueprint and helped someone in the community.
If you follow the Rules and format for posting , you can share your blueprint on the Home Assistant Blueprint Exchange forum. This option is accessible to the general Home Assistant community but recommended only for your original blueprints. Please don’t post this tutorial to the Blueprint Exchange, but instead, remember this as an option for releasing your real blueprints.
YAML syntax
Yaml used in automations
Blueprint selectors
Blueprint schema
About blueprints
Using automation blueprints
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
Selectors
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
