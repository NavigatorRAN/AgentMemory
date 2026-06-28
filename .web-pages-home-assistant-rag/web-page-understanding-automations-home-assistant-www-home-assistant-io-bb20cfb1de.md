# Understanding automations - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/docs/automation/basics
- Final URL: https://www.home-assistant.io/docs/automation/basics
- Canonical URL: https://www.home-assistant.io/docs/automation/basics/
- Fetched at: 2026-06-28T02:20:45Z
- Content type: text/html; charset=UTF-8

## Description

A breakdown of what an automation consists of.

## Extracted Text

On this page
Exploring the internal state
Creating automations
Using the automation editor »
All automations Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] are made up of a trigger A trigger is a set of values or conditions of a platform that are defined to cause an automation to run. [Learn more] and an action Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] . Optionally combined with a condition Conditions are an optional part of an automation that will prevent an action from firing if they are not met. [Learn more] . Take for example the automation:
When Paulus arrives home and it is after sunset: Turn the lights on in the living room.
We can break up this automation into the following three parts:
(trigger) When Paulus arrives home
(condition) and it is after sunset:
(action) Turn the lights on in the living room
The first part is the trigger of the automation. Triggers describe events Every time something happens in Home Assistant, an event is fired. There are different types of events, such as state change events, when an action was triggered, or the time changed. All entities produce state change events. Every time a state changes, a state change event is produced. Events can be used to trigger automations or scripts. For example, you can trigger an automation when a light is turned on, then a speaker turns on in that room. Events can also be used to trigger actions in the frontend. For example, you can trigger an action when a button is pressed. [Learn more] that should trigger the automation. In this case, it is a person arriving home, which can be observed in Home Assistant using devices A device is a model representing a physical or logical unit that contains entities. / sensors Sensors return information about a thing, for instance the level of water in a tank. [Learn more] by observing the state of Paulus changing from not_home to home .
The second part is the condition . Conditions are optional tests that can limit an automation to only work in your specific use cases. A condition will test against the current state of the system. This includes the current time, devices, people and other things like the sun. In this case, we only want to act when the sun has set.
The third part is the action , which will be performed when an automation is triggered and all conditions are met. For example, it can turn a light on, set the temperature on your thermostat or activate a scene.
Note
The difference between a trigger and a condition can be confusing as they are very similar.
Triggers require an event to happen for the conditions to be evaluated using current state information.
Event: Arrive home
Condition: After Sunset?
Action: Turn lights on
Automations interact directly with the internal state of Home Assistant, so you’ll need to familiarize yourself with it. Home Assistant exposes its current state via the developer tools. These are available at the bottom of the sidebar in the frontend. Settings > Developer tools > States will show all currently available states. An entity can be anything. A light, a switch, a person and even the sun. A state consists of the following parts:
Name Description Example Entity ID Unique identifier for the entity. light.living_room State The current state of the device. off Attributes Extra data related to the device and/or current state. brightness
State changes can be used as the source of triggers and the current state can be used in conditions.
To explore the available actions open the Settings > Developer tools > Actions . Actions allow changing anything. For example, turn on a light, run a script, or enable a scene. Each action has a domain and a name. For example, the action light.turn_on is capable of turning on any light in your system. Parameters can be passed to an action to indicate, for example, which device to activate or which color to use.
Now that you’ve got a sneak peek of what is possible, it’s time to get your feet wet and create your first automation.
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
Using automation blueprints
Editor
Triggers
Conditions
Actions
Run modes
Automation actions
Templates
YAML
Testing and troubleshooting automations
Scenes
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
