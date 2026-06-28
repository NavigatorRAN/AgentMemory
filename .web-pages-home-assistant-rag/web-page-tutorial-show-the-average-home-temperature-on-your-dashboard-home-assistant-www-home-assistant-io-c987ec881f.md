---
source_url: "https://www.home-assistant.io/docs/templating/tutorial-average-temperature"
final_url: "https://www.home-assistant.io/docs/templating/tutorial-average-temperature"
canonical_url: "https://www.home-assistant.io/docs/templating/tutorial-average-temperature/"
source_handle: "web:www-home-assistant-io:c987ec881f5e"
source_section: "docs-templating"
collection: "home-assistant-docs"
doc_type: "code-documentation"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "8bc8c88a390be3f45bf6145b3517095ae106ef8be459c11c1ef54b98ad3c69b7"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "code-docs"
---

# Tutorial: Show the average home temperature on your dashboard - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/docs/templating/tutorial-average-temperature
- Final URL: https://www.home-assistant.io/docs/templating/tutorial-average-temperature
- Canonical URL: https://www.home-assistant.io/docs/templating/tutorial-average-temperature/
- Fetched at: 2026-06-28T02:23:12Z
- Content type: text/html; charset=UTF-8

## Description

Build a template sensor that averages all your temperature sensors, step by step.

## Extracted Text

On this page
What you will build
Before you start
Step 1: See your temperature sensors
Step 2: Write the averaging template
Step 3: Make it a real sensor
Fill in the form
Step 4: Check it
Step 5: Add it to your dashboard
Going further
Next steps
Related topics
In this tutorial, you will build a template sensor Sensors return information about a thing, for instance the level of water in a tank. [Learn more] that averages all temperature readings in your home into a single number. It’s ideal for seeing your whole-house temperature at a glance, or for triggering automations based on overall comfort. It shows up on your dashboard like any other sensor, and it updates automatically whenever one of the underlying temperature readings changes.
This is a classic first template sensor. You will learn how to gather readings from many entities, average them, round the result, and wire the whole thing into Home Assistant as a real sensor you can use anywhere else.
A sensor Sensors return information about a thing, for instance the level of water in a tank. [Learn more] called sensor.home_average_temperature that you can place on any dashboard. It shows a single number like 21.4 °C, calculated from all the temperature sensors in your home.
You get a real sensor entity, so you can also use it in automations, chart it in history, or reference it from other templates.
You need:
At least two temperature sensors in Home Assistant. They should have device_class: temperature in their attributes. Most climate integrations set this automatically.
Five minutes with the Developer tools template editor open.
If you want your result in Fahrenheit, see the Going further section at the bottom.
Open Settings > Developer tools > States and filter on temperature .
You should see a list of entities with device_class: temperature in their attributes. The state column shows the current reading as text, like 22.5 .
These are the sensors your new sensor will average. Make a mental note of how many you have.
In Developer tools > Template , paste this:
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {{
states.sensor
| selectattr('attributes.device_class', 'eq', 'temperature')
| rejectattr('state', 'in', ['unknown', 'unavailable'])
| map(attribute='state') | map('float') | average | round(1)
}}
Result 21.4
That is one long line. Read it left to right as one sentence:
Start with every sensor entity.
Keep only the ones whose device_class is temperature .
Drop any that are unknown or unavailable .
From each remaining entity, pull out only the state value.
Convert each state from text to a number.
Average them.
Round the result to one decimal.
Your result should be a single number close to what you feel in your home.
Tip
If you see an error, try running the template one piece at a time. Remove the | round(1) , then | average , then | map('float') , and see where it breaks. Step-by-step narrowing is explained in Debugging templates .
A one-off template in the editor is great for testing. To use the result on a dashboard, you need to turn it into an actual entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] . You do this with a template helper , which Home Assistant creates for you from the user interface.
Go to Settings > Devices & services > Helpers .
Select Create helper in the bottom-right.
Pick Template .
Pick Template a sensor .
You will see a form with several fields. Fill them out like this:
Name : Home average temperature . This is what you will see in dashboards and the app, and it is used to generate the entity ID ( sensor.home_average_temperature ).
State template : paste the template you tested in step 2. Paste it exactly, including the {{ ... }} delimiters.
Unit of measurement : °C (or °F if your sensors report Fahrenheit).
Device class : Temperature . This tells Home Assistant this sensor represents a temperature so dashboards and voice assistants pick the right icon and handle units correctly.
State class : Measurement . This tells Home Assistant the value changes continuously over time, which is what makes the sensor chartable in history.
Select Submit . Your new sensor is ready to use immediately, no restart needed.
If you later rename the helper, its unique ID stays the same. That is the internal identifier Home Assistant uses to track this sensor across renames, moves, and configuration tweaks. History, dashboards, and automations keep working because they reference the unique ID behind the scenes. You don’t have to do anything with it, but it’s good to know it exists if you ever see it mentioned elsewhere.
Your new helper now appears on the Settings > Devices & services > Helpers page. Find Home average temperature in the list and select it to open the details dialog. The current value shows there.
If the value looks wrong, use the three-dot menu in the dialog to open the helper’s settings and adjust the template. Changes save immediately.
Open a dashboard in edit mode.
Select Add card .
Pick a Tile card (clean display with optional extras) or a Gauge card (visual dial).
Choose sensor.home_average_temperature from the entity list.
Save the dashboard.
The card updates automatically whenever any of your temperature sensors changes.
A few ways to extend this:
Fahrenheit . If your sensors report in Fahrenheit, open the sensor’s settings from the entity and set Unit of measurement to °F . No changes to the template are needed.
By area . Instead of averaging the whole house, limit it to a single area. Replace the states.sensor starting point with area_entities('living_room') and add a step to filter for temperature sensors. See area_entities .
Highest and lowest too . Add two more sensors that use max and min instead of average . Great for seeing the spread.
Weighted average . If you want the bedroom thermostat to count more than the garage sensor, you will need a bit more template logic. A for loop with manual weighting handles that.
Skip sensors reporting unrealistic values . If a broken sensor reports 999 , it will skew your average. Filter out values outside a reasonable range with an additional step before | average .
Group by type . You can build one for humidity, one for pressure, one for CO₂. Same template shape, different device_class value.
The Working with states page explains the selectattr , rejectattr , and map filters used here.
The Common template patterns page has more aggregation recipes.
If this is the first tutorial you did, try the Tutorial: get notified when a device needs a new battery next to learn about templates in automations.
Working with states
Common template patterns
`selectattr` filter
`average` filter
Template integration
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
Dashboards
Voice assistants
Organization
Home energy management
Templating
Introduction
Where to use templates
Template syntax
Loops and conditions
Templates in YAML
Types and conversion
Dates and times
Python methods
Common patterns
Debugging templates
Error messages
Custom templates and macros
Tutorial: Low battery alerts
Tutorial: Average temperature
Template functions reference
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
