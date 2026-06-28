---
source_url: "https://www.home-assistant.io/integrations/upb"
final_url: "https://www.home-assistant.io/integrations/upb"
canonical_url: "https://www.home-assistant.io/integrations/upb/"
source_handle: "web:www-home-assistant-io:491d05128da7"
source_section: "integrations-upb"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "cb4d696476822c363d3be80bfae2c755dcb84d5f26d917b0558427bdf564e86b"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Universal Powerline Bus (UPB) - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/upb
- Final URL: https://www.home-assistant.io/integrations/upb
- Canonical URL: https://www.home-assistant.io/integrations/upb/
- Fetched at: 2026-06-28T03:25:09Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up Universal Powerline Bus integration.

## Extracted Text

On this page
Prerequisites
Configuration
Device configuration
Events
List of actions
Rate transition time
Examples
Notes
Debugging
The Universal Powerline Bus (UPB) integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows Home Assistant to connect to a Universal Powerline Bus Powerline Interface Module (UPB PIM) to get status and control UPB devices and UPB links. The UPB PIM may be connected either to a serial port or over TCP. The integration implements the following platforms:
Light
Scene
The UPB integration requires that an export from the UPStart UPB configuration program. To create an export, in UPStart , click the UPB button in the top left and select Export to File . This will create a file with the .upe extension. The file must be placed in the configuration directory of your Home Assistant installation.
To add the Universal Powerline Bus (UPB) integration to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Universal Powerline Bus (UPB) .
Follow the instructions on screen to complete the setup.
Using UPStart, configure each UPB dimmer-switch to report its state when it is manually operated. If you omit this step, manual changes to a dimmer-switch’s state (on/off/brightness) will not be reported to Home Assistant.
An event is generated whenever a UPB Link is:
activated
deactivated
goes to a new level
fade is started
fade is stopped
blink is started
The event is upb.scene_changed .
The event_data contains the following:
command : One of activated , blink , deactivated , fade_started ,
fade_stopped , or goto .
address : The address of the link reporting the event. The address
is comprised of the UPB network number and the UPB Link number.
For example for UPB Network number 42 and UPB Link number 24 the
address would be 42_24.
brightness_pct : The brightness level as a percentage. brightness_pct is
reported as -1 if the brightness is a default level of brightness is not
applicable to the link change.
rate : The rate for link to transition to the new level. rate is
-1 for the default transition rate.
The Universal Powerline Bus (UPB) integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Blink light ( upb.light_blink )
Starts a UPB light blinking at a set rate.
Start light fade ( upb.light_fade_start )
Starts fading a UPB light up or down to a target brightness.
Stop light fade ( upb.light_fade_stop )
Stops a running fade or transition on a UPB light.
Blink link ( upb.link_blink )
Starts a UPB scene blinking at a set rate.
Deactivate link ( upb.link_deactivate )
Deactivates a UPB scene.
Start link fade ( upb.link_fade_start )
Starts fading a UPB scene up or down to a target brightness.
Stop link fade ( upb.link_fade_stop )
Stops a running fade or transition on a UPB scene.
Go to link ( upb.link_goto )
Sets a UPB scene to a target brightness.
For an overview of every action across all integrations, see the actions reference .
Besides these actions, UPB lights and scenes also support the standard actions provided by the Home Assistant Light and Scene integrations.
Both the standard actions and the UPB actions that take a transition or a rate for changing brightness levels use a time in seconds. The UPB system only offers a discrete set of transition times, so the requested time is rounded to the closest supported value, based on the list below. This rounding does not apply to blink rates, only to brightness transition times.
Up to 0.4 seconds: 0 seconds
0.4 up to 1.2 seconds: 0.8 seconds
1.2 up to 2.45 seconds: 1.6 seconds
2.45 up to 4.15 seconds: 3.3 seconds
4.15 up to 5.8 seconds: 5 seconds
5.8 up to 8.3 seconds: 6.6 seconds
8.3 up to 15 seconds: 10 seconds
15 up to 25 seconds: 20 seconds
25 up to 45 seconds: 30 seconds
45 up to 90 seconds: 60 seconds
1.5 up to 3.5 minutes: 2 minutes
3.5 up to 7.5 minutes: 5 minutes
7.5 up to 12.5 minutes: 10 minutes
12.5 up to 22.5 minutes: 15 minutes
22.5 up to 45 minutes: 30 minutes
45 minutes or more: 1 hour
#automation: - alias : " Specific scene activated" description : " Trigger when scene 9 on network 42 is activated" triggers : - trigger : event event_type : upb.scene_changed event_data : command : activated address : " 42_9" actions : - action : persistent_notification.create data : title : " Scene Activated" message : > Activated scene 9 on network 42: {{trigger.event.data.command}}, {{trigger.event.data.address}}
#script: all_lights_on : alias : " All Lights On" description : " Activate two UPB scenes named interior_lights and exterior_lights" sequence : - action : scene.turn_on target : entity_id : - scene.interior_lights - scene.exterior_lights all_lights_off : alias : " All Lights Off" description : " Deactivate two UPB scenes named interior_lights and exterior_lights" sequence : - action : upb.link_deactivate target : entity_id : - scene.interior_lights - scene.exterior_lights kitchen_fade_on : alias : " Kitchen Fade to On" description : " Turn on kitchen light to 75% over a period of 10 seconds" sequence : - action : upb.light_fade_start target : entity_id : light.kitchen data : brightness_pct : 75 rate : 10
A UPB device does not always report its current state. For example, if you call upb.light_fade_start and then, a few seconds later, call upb.light_fade_stop , the selected UPB device will not report its new brightness level. However, if you then call homeassistant.update_entity it will make the UPB device report its current state to Home Assistant.
Alterations to your UPB configuration with UpStart must be re-exported. The exported UPE file must have the same filename in the Home Assistant config directory.
Debug logs are often required to solve an issue. To enable UPB debug logs add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file in your Home Assistant config directory:
logger : logs : upb_lib : debug homeassistant.components.upb : debug
After updating your configuration file, restart Home Assistant. The debug logs will be in the file homeassistant.log in the config directory.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Universal Powerline Bus (UPB) integration was introduced in Home Assistant 0.110, and it's used by
55 active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@gwww
Categories
Back to top
