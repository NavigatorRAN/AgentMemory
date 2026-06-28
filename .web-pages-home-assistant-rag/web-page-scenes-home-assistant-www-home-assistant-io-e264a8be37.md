# Scenes - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/docs/scene
- Final URL: https://www.home-assistant.io/docs/scene
- Canonical URL: https://www.home-assistant.io/docs/scene/
- Fetched at: 2026-06-28T02:22:35Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to setup scenes within Home Assistant.

## Extracted Text

On this page
How to configure your scene
Applying a scene without defining it
Using scene transitions
Reloading scenes
You can create scenes that capture the states you want certain entities to be. For example, a scene can specify that light A should be turned on and light B should be bright red. Scenes are available as an entity through the standalone Scene integration but can also be embedded in automations Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] and scripts Scripts are components that allow you to specify a sequence of actions to be executed by Home Assistant when turned on. [Learn more] .
# Example configuration.yaml entry scene : - name : Romantic entities : light.tv_back_light : " on" light.ceiling : state : " on" xy_color : [ 0.33 , 0.66 ] brightness : 200 - name : Movies entities : light.tv_back_light : state : " on" brightness : 125 light.ceiling : off media_player.sony_bravia_tv : state : " on" source : HDMI 1
In the scene you define in your YAML YAML is a human-readable data serialization language. It is used to store and transmit data in a structured format. In Home Assistant, YAML is used for configuration, for example in the configuration.yaml or automations.yaml files. [Learn more] files, please ensure you use
all required parameters as listed below.
Configuration Variables
Looking for your configuration file?
name string Required
Friendly name of the scene.
entities list Required
Entities to control and their desired state.
As you can see, there are two ways to define the states of each entity_id :
Define the state directly with the entity. Be aware, that state needs to be defined.
Define a complex state with its attributes. You can see all attributes available for a particular entity under developer-tools -> state .
Scenes can be activated using the action scene.turn_on (there is no ‘scene.turn_off’ action).
# Example automation automation : triggers : - trigger : state entity_id : device_tracker.sweetheart from : " not_home" to : " home" actions : - action : scene.turn_on target : entity_id : scene.romantic
With the scene.apply action you are able to apply a scene without first defining it via configuration. Instead, you pass the states as part of the data. The format of the data is the same as the entities field in a configuration.
# Example automation automation : triggers : - trigger : state entity_id : device_tracker.sweetheart from : " not_home" to : " home" actions : - action : scene.apply data : entities : light.tv_back_light : state : " on" brightness : 100 light.ceiling : off media_player.sony_bravia_tv : state : " on" source : " HDMI 1"
Both the scene.apply and scene.turn_on actions support setting a transition,
which enables you to smoothen the transition to the scene.
This is an example of an automation that sets a romantic scene, in which the
light will transition to the scene in 2.5 seconds.
# Example automation automation : triggers : - trigger : state entity_id : device_tracker.sweetheart from : " not_home" to : " home" actions : - action : scene.turn_on target : entity_id : scene.romantic data : transition : 2.5
Transitions are currently only support by lights, which in their turn, have
to support it as well. However, the scene itself does not have to consist of
only lights to have a transition set.
Whenever you make a change to your scene configuration, you can call the scene.reload action to reload the scenes.
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
