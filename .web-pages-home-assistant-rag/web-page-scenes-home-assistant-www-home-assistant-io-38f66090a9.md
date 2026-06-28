---
source_url: "https://www.home-assistant.io/integrations/scene"
final_url: "https://www.home-assistant.io/integrations/scene"
canonical_url: "https://www.home-assistant.io/integrations/scene/"
source_handle: "web:www-home-assistant-io:38f66090a942"
source_section: "integrations-scene"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "0151f1bc7ec16241caa95b0db2aa6cef1048c9bc9c3d0869f60cad12b135742f"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Scenes - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/scene
- Final URL: https://www.home-assistant.io/integrations/scene
- Canonical URL: https://www.home-assistant.io/integrations/scene/
- Fetched at: 2026-06-28T03:13:48Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up scenes within Home Assistant.

## Extracted Text

On this page
The state of a scene
Scenes created by integrations
Creating a scene
Applying a scene without defining it
Using scene transitions
Reloading scenes
Creating scenes on the fly
Video tutorial
Deleting dynamically created scenes
List of triggers
A scene entity can restore the state of a group of entities.
You can define scenes yourself, or they can be provided by an integration.
Note
Building block integration
This scenes is a building block integration that cannot be added to your Home Assistant directly but is used and provided by other integrations.
A building block integration differs from the typical integration that connects to a device or service. Instead, other integrations that do integrate a device or service into Home Assistant use this scenes building block to provide entities, services, and other functionality that you can use in your automations or dashboards.
If one of your integrations features this building block, this page documents the functionality the scenes building block offers.
The scene entity is stateless. Unlike a normal switch entity, it does not have an on or off state.
Every scene entity keeps track of the timestamp of when it was last called, either via the Home Assistant UI or via an action.
Screenshot showing the state of a scene entity in the developer tools.
In addition, the entity can have the following states:
Unavailable : The entity is currently unavailable.
Unknown : The state is not yet known.
Some integrations such as Philips Hue , MQTT , and KNX provide scenes. You can activate them from the Home Assistant UI or via an action. In this case, the integration provides the preferred states to restore.
You can create scenes that capture the states you want for certain entities. For example, a scene can specify that light A should be turned on and light B should be bright red.
You can create and manage scenes via the user interface using the scene editor . You can also configure them manually via configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] . Note that entity data is not an action parameter; it’s a representation of the desired state:
# Example configuration.yaml entry scene : - name : Romantic icon : " mdi:flower-tulip" entities : light.tv_back_light : " on" light.ceiling : state : " on" brightness : 200 color_mode : " xy" xy_color : [ 0.33 , 0.66 ] - name : Movies entities : light.tv_back_light : state : " on" brightness : 125 light.ceiling : " off" media_player.sony_bravia_tv : state : " on" source : " HDMI 1" - name : Standard entities : light.tv_back_light : state : " off" light.ceiling : state : " on" brightness : 125 color_mode : " white"
Configuration Variables
Looking for your configuration file?
name string Required
Friendly name of the scene.
icon string ( Optional )
Icon for the scene.
entities list Required
Entities to control and their desired states.
There are two ways to define the states of each entity_id :
Define the state directly with the entity. The state is required.
Define a complex state with its attributes. You can see all attributes available for a particular entity under Developer tools > States .
Scenes can be activated using the scene.turn_on action (there is no scene.turn_off action).
# Example automation automation : triggers : - trigger : state entity_id : device_tracker.sweetheart from : " not_home" to : " home" actions : - action : scene.turn_on target : entity_id : scene.romantic
With the scene.apply action, you can apply a scene without first defining it via configuration. Instead, you pass the states as part of the action data. The format of the data is the same as the entities field in a configuration.
# Example automation automation : triggers : - trigger : state entity_id : device_tracker.sweetheart from : " not_home" to : " home" actions : - action : scene.apply data : entities : light.tv_back_light : state : " on" brightness : 100 light.ceiling : " off" media_player.sony_bravia_tv : state : " on" source : " HDMI 1"
Both the scene.apply and scene.turn_on actions support setting a transition to smooth the change into the scene.
Here’s an example automation that activates a romantic scene with a 2.5 second transition.
# Example automation automation : triggers : - trigger : state entity_id : device_tracker.sweetheart from : " not_home" to : " home" actions : - action : scene.turn_on target : entity_id : scene.romantic data : transition : 2.5
Transitions are currently only supported by lights, and the lights themselves must also support them. However, the scene does not need to consist only of lights to have a transition set.
Whenever you make a change to your scene configuration, you can call the scene.reload action to reload the scenes.
Create a new scene without having to configure it by calling the scene.create action. This scene will be discarded after reloading the configuration.
You need to pass a scene_id in lowercase and with underscores instead of spaces. You may also want to specify the entities in the same format as when configuring the scene. You can also take a snapshot of the current state by using the snapshot_entities parameter. In this case, you have to specify the entity_id of all entities you want to take a snapshot of. entities and snapshot_entities can be combined, but you have to use at least one of them.
If the scene was previously created by scene.create , it will be overwritten. If the scene was created by YAML, nothing happens and a warning appears in your log files.
This video tutorial explains how scenes work and how you can use scenes on the fly.
# Example automation using entities automation : triggers : - trigger : homeassistant event : start actions : - action : scene.create data : scene_id : my_scene entities : light.tv_back_light : state : " on" brightness : 100 light.ceiling : " off" media_player.sony_bravia_tv : state : " on" source : " HDMI 1"
Any scene that you have created with the scene.create action can also be deleted on demand with the scene.delete action.
You will need to pass in the entity_id of such a scene. As opposed to the scene_id used for creation, the entity_id must also include the scene domain.
If the scene was not previously created by scene.create , the action will fail and an error will appear in the logs.
# Example automation automation : triggers : - trigger : state entity_id : sun.sun to : " below_horizon" actions : - action : scene.delete data : entity_id : scene.my_scene
The following example turns off some entities as soon as a window opens. The states of the entities are restored after the window is closed again.
# Example automation using snapshot - alias : " Window opened" triggers : - trigger : state entity_id : binary_sensor.window from : " off" to : " on" actions : - action : scene.create data : scene_id : before snapshot_entities : - climate.ecobee - light.ceiling_lights - action : light.turn_off target : entity_id : light.ceiling_lights - action : climate.set_hvac_mode target : entity_id : climate.ecobee data : hvac_mode : " off" - alias : " Window closed" triggers : - trigger : state entity_id : binary_sensor.window from : " on" to : " off" actions : - action : scene.turn_on target : entity_id : scene.before
The Scenes integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following triggers. Each link below opens a dedicated page with examples, fields, and a step-by-step UI walkthrough.
Scene activated ( scene.activated )
Triggers when one or more scenes are activated.
For an overview of every trigger across all integrations, see the triggers reference .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Scenes entity was introduced in Home Assistant 0.15.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Categories
Organization
Back to top
