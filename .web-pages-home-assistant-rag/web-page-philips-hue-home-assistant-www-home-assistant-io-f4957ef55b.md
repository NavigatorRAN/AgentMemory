# Philips Hue - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/hue
- Final URL: https://www.home-assistant.io/integrations/hue
- Canonical URL: https://www.home-assistant.io/integrations/hue/
- Fetched at: 2026-06-28T02:50:19Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on setting up Philips Hue within Home Assistant.

## Extracted Text

On this page
Configuration
Lights for Hue zones and rooms
Scenes
Configuration options
V2 bridges (square shape)
V1 bridges (round shape)
Hue remotes and switches
Support for legacy (V1) Hue bridges
List of actions
Data updates
Removing the integration
To remove an integration instance from Home Assistant
The Philips Hue integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control and monitor the lights and sensors connected to your Hue bridge. The integration supports:
Lights
Motion sensors (including temperature and light level sensors)
Remotes and switches (as device triggers for automations, and also exposed as battery sensors when they are battery-powered)
To add the Philips Hue hub to your Home Assistant instance, use this My button:
Philips Hue can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Philips Hue .
Follow the instructions on screen to complete the setup.
The Hue concept is based on Rooms and Zones. Although the underlying Hue lights are exposed directly to Home Assistant, it might also be useful to interact with the grouped lights of the Hue ecosystem, for example, to turn all lights in a Hue group on/off at the same time.
Home Assistant creates lights for each Hue zone and room automatically but disables them by default. To enable them, go to Settings > Devices & services , select the Philips Hue integration, and enable the grouped light entities you want to use.
You can create, edit, and delete Hue scenes from the official Hue app on iOS and Android. Each room and zone can have its own scenes, and there is a large library of preset scenes for specific moods. These Hue scenes are automatically imported into Home Assistant and available as scene entities. Creating or editing Hue scenes in Home Assistant is not supported.
Using Hue scenes is recommended when you want to control multiple lights at once. If you control multiple lights individually or use Home Assistant scenes, each command is sent to each light one by one. A Hue scene sends commands to all lights at once in an optimized way, resulting in a smoother experience.
After setting up the integration, the following options can be configured by going to Settings > Devices & services , selecting the Philips Hue integration, and selecting Configure .
Ignore connectivity status for the given devices
Select devices for which the connectivity (availability) status should be ignored. This is useful for battery-powered devices like remotes that are reported as unavailable when they go to sleep.
Allow Hue groups
When enabled, creates light entities for Hue rooms.
Allow unreachable bulbs to report their state correctly
When enabled, allows bulbs that are reported as unreachable by the bridge to still report their last known state.
Hue remotes such as the Dimmer Switch are stateless devices, meaning that they do not have an on/off state like regular entities in Home Assistant. Instead, these devices emit the event hue_event when a button is pressed. You can test what events come in by going to Settings > Developer tools > Events and subscribing to hue_event . Once you know what the event data looks like, you can use it to create automations.
Note
The Hue API limits each device to one event per second. This means that button events are rate-limited to one per second.
Signify released a newer version of the Hue bridge (square shape), and the legacy V1 bridge (round shape) is now end of life and no longer supported by Signify. Home Assistant will continue to support the V1 Hue bridge as long as it is technically possible, with the following limitations:
Scene entities are not automatically created for V1 bridges. To activate a Hue scene on a V1 bridge from Home Assistant, use the Philips Hue: Activate scene action and refer to the scene by its group and scene name.
State updates for devices on V1 bridges are not received instantly but polled on an interval.
Light entities for Hue rooms are not automatically created for V1 bridges. You can opt in to creating room entities in the integration’s options.
To activate a scene on a V1 bridge:
Go to Scripts and select Add New Script > Add Action > Philips Hue: Activate Scene .
Select the room name in the Group field and the scene name in the Scene field.
The Philips Hue integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Activate Hue scene ( hue.activate_scene )
Activates a Hue scene with extra control over options like dynamic mode and brightness.
Activate scene ( hue.hue_activate_scene )
Activates a Hue scene by its group and scene name as stored in the Hue app.
For an overview of every action across all integrations, see the actions reference .
V2 Hue bridges (square shape) push state changes to Home Assistant instantly over their local event stream. V1 Hue bridges (round shape) are polled on an interval because the V1 API does not support push updates.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Philips Hue hub was introduced in Home Assistant 0.60, and it's used by
16% of the active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@marcelveldt
Categories
Hub
Light
Back to top
