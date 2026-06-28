---
source_url: "https://www.home-assistant.io/integrations/point"
final_url: "https://www.home-assistant.io/integrations/point"
canonical_url: "https://www.home-assistant.io/integrations/point/"
source_handle: "web:www-home-assistant-io:f1e64065e89b"
source_section: "integrations-point"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "30a7bf2811f3f0401666de63ae36381f3838c8aabd5c3a1ea3bc2b238bb04a17"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Minut Point - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/point
- Final URL: https://www.home-assistant.io/integrations/point
- Canonical URL: https://www.home-assistant.io/integrations/point/
- Fetched at: 2026-06-28T03:08:41Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Minut Point into Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Device types
Alarm
Binary sensor
Automation example
Webhook events
Sensor
Related topics
The Point hub enables integration with the Minut Point .
Before adding the integration to Home Assistant, you need to get Minut Point application credentials.
Navigate to the API-client | Minut dashboard and Create client :
Enter a Name for your client (this is just an identifier).
Enter https://my.home-assistant.io/redirect/oauth in the Redirect URI field.
Get the ClientID and ClientSecret for the new client and store them in a safe place. You need them to complete the integration setup in Home Assistant.
If you are a Kickstarter backer, you need to send an email to [email protected] to retrieve the ClientID and ClientSecret . Don’t forget to mention that the Redirect URI should be https://my.home-assistant.io/redirect/oauth .
To add the Minut Point hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Minut Point .
Follow the instructions on screen to complete the setup.
The integration supports the following device types within Home Assistant:
Note
The Point is just active occasionally so the sensors are only updated every hour or so. The binary sensors are however updated via Cloud Push , making the changes close to instant.
Each home configured in the Point mobile application will show up as a separate alarm control panel. The panels allow arming and disarming of the Point home alarm system.
The Point only supports a Arm/Disarm action, so it is only Arm Away that is implemented.
Each Point exposes the following binary sensors:
alarm : On means alarm sound was recognized, Off means normal
battery : On means low, Off means normal
button_press : On means the button was pressed, Off means normal
cold : On means cold, Off means normal
connectivity : On means connected, Off means disconnected
dry : On means too dry, Off means normal
glass : On means the sound of glass break was detected, Off means normal
heat : On means hot, Off means normal
light : On means light detected, Off means no light
moisture : On means moisture detected (wet), Off means no moisture (dry)
motion : On means motion was detected, Off means no motion
noise : On means noise was detected, Off means noise levels have gone back to normal
sound : On means sound detected, Off means no sound (clear)
tamper : On means the point was removed, Off means normal
tamper_old : On means the point was removed or attached, Off means normal (this is only supported on some “old” devices)
The binary sensors button_press , sound and tamper are switched On for a brief moment and are then switched back to Off .
The following example show how to implement an automation for the button_press binary sensor.
# Example configuration.yaml Automation entry automation : alias : " Point button press" triggers : - trigger : state entity_id : binary_sensor.point_button_press # Change this accordingly to : " on" actions : - action : persistent_notification.create data : title : Point button press message : Point button was pressed.
The events shown as binary sensors are sent to Home Assistant as webhooks with the event_type set to point_webhook_received . Below is an example of how to use such a webhook do note the trigger.event.data.event.device_id which translates to the id of the Point device that sent the event.
# Example configuration.yaml Automation entry automation : alias : " Point button press (webhook)" triggers : - trigger : event event_type : point_webhook_received event_data : {} conditions : - condition : template value_template : " {{ trigger.event.data.event.type == 'short_button_press' }}" actions : - action : persistent_notification.create data : title : Point button press (webhook) message : " Button press on Point {{ trigger.event.data.event.device_id }}"
Each Point exposes the following sensors:
temperature : Temperature in °C.
humidity : Percentage of humidity in the air.
sound_level : Sound level in dBA
Application credentials
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Minut Point hub was introduced in Home Assistant 0.83, and it's used by
28 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@fredrike
Categories
Hub
Back to top
