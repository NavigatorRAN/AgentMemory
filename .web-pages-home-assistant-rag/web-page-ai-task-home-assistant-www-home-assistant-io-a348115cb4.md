---
source_url: "https://www.home-assistant.io/integrations/ai_task"
final_url: "https://www.home-assistant.io/integrations/ai_task"
canonical_url: "https://www.home-assistant.io/integrations/ai_task/"
source_handle: "web:www-home-assistant-io:a348115cb44e"
source_section: "integrations-ai-task"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "4fb80233e1244079c6fdad4536ec0db2ddb364d7739b0f4c68798d445421e92c"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# AI Task - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/ai_task
- Final URL: https://www.home-assistant.io/integrations/ai_task
- Canonical URL: https://www.home-assistant.io/integrations/ai_task/
- Fetched at: 2026-06-28T02:26:20Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up AI task entities with Home Assistant.

## Extracted Text

On this page
The state of an AI task entity
List of actions
Examples
Template entity counting items on a camera
Structured output example
Simple text generation example
Weather visualization example
The AI Task integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to use AI to help you configure Home Assistant.
Note
Building block integration
This ai task is a building block integration that cannot be added to your Home Assistant directly but is used and provided by other integrations.
A building block integration differs from the typical integration that connects to a device or service. Instead, other integrations that do integrate a device or service into Home Assistant use this ai task building block to provide entities, services, and other functionality that you can use in your automations or dashboards.
If one of your integrations features this building block, this page documents the functionality the ai task building block offers.
For each task, you can set a preferred AI task entity. This allows you to use different AI models for different purposes, such as generating text, summarizing information, or even controlling devices. When the entity ID is omitted in the action, the preferred AI task entity will be used.
The state The state holds the information of interest of an entity, for example, if a light is on or off. Each entity has exactly one state and the state only holds one value at a time. However, entities can store attributes related to that state such as brightness, color, or a unit of measurement. [Learn more] of an AI task entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] is a timestamp showing the date and time when the AI task was last used.
The AI Task integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Generate data ( ai_task.generate_data )
Uses AI to run a task that generates data, such as text or structured output.
Generate image ( ai_task.generate_image )
Uses AI to generate an image from a set of instructions.
For an overview of every action across all integrations, see the actions reference .
template : - triggers : - trigger : homeassistant event : start - trigger : time_pattern minutes : " /5" # update every 5 minutes actions : - action : ai_task.generate_data data : task_name : " {{ this.entity_id }}" instructions : >- This is the inside of my goose coop. How many birds (chickens, geese, and ducks) are inside the coop? structure : birds : selector : number : attachments : media_content_id : media-source://camera/camera.chicken_coop media_content_type : image/jpeg response_variable : result sensor : - name : " Chickens" state : " {{ result.data.birds }}" state_class : total
Alternative ideas: detect number of parking spots available, count people in a room, or detect if a door is open.
# Example: Generate weather and indoor comfort report script : - alias : " Weather and comfort report" sequence : - action : ai_task.generate_data data : task_name : " weather comfort report" instructions : | Based on the current conditions: - Outdoor temperature: {{ states('sensor.outdoor_temperature') }}°C - Weather condition: {{ states('weather.home') }} - Indoor temperature: {{ states('sensor.living_room_temperature') }}°C - Indoor humidity: {{ states('sensor.living_room_humidity') }}% Generate a funny weather description and assess indoor comfort level. structure : weather_description : description : " A humorous description of the current weather outside" required : true selector : text : indoor_comfort : description : " Assessment of how comfortable it is inside compared to outside" required : true selector : text : response_variable : comfort_report - action : notify.persistent_notification data : title : " 🏠 Home climate report" message : | 🌤️ **Weather outside:** {{ comfort_report.data.weather_description }} 🛋️ **Indoor comfort:** {{ comfort_report.data.indoor_comfort }}
# Example: Generate a notification when garage door is left open automation : - alias : " Garage door notification" triggers : - trigger : state entity_id : cover.garage_door to : ' on' for : minutes : 10 actions : - action : ai_task.generate_data data : task_name : " garage door left open comment" instructions : " Generate a funny notification that garage door was left open" response_variable : generated_text - action : notify.persistent_notification data : message : " {{ generated_text.data }}"
# Example: Up-to date weather image automation : - alias : " Update image when weather changes" triggers : - trigger : state entity_id : weather.home actions : - alias : " Generate an image with AI Task" action : ai_task.generate_image response_variable : generated_image data : task_name : weather visualization instructions : >- New York when the weather is {{ states("weather.home") }} - alias : " Send out a manual event to update the image entity" event : new_weather_image event_data : url : ' {{ generated_image.url }}' template : - trigger : - alias : " Update image when a new weather image is generated" trigger : event event_type : new_weather_image image : - name : " AI generated image of New York" url : " http://localhost:8123{{ trigger.event.data.url }}"
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The AI Task entity was introduced in Home Assistant 2025.7.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Categories
AI
Back to top
