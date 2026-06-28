# Tutorial: Get notified when a device needs a new battery - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/docs/templating/tutorial-battery-alerts
- Final URL: https://www.home-assistant.io/docs/templating/tutorial-battery-alerts
- Canonical URL: https://www.home-assistant.io/docs/templating/tutorial-battery-alerts/
- Fetched at: 2026-06-28T02:23:15Z
- Content type: text/html; charset=UTF-8

## Description

Build a daily notification that lists devices with low batteries, step by step.

## Extracted Text

On this page
What you will build
Before you start
Step 1: See your battery sensors
Step 2: List the low batteries
Step 3: Format the message
Step 4: Create the automation
Add the trigger
Add the action
Step 5: Test it
Going further
Next steps
Related topics
In this tutorial, you will build a daily notification that tells you which devices need new batteries. It looks at every battery sensor in your home, picks out the ones below a threshold you choose, and sends you a message listing each device with its location and current percentage.
This is one of the most popular templates in the Home Assistant community, and it is a great first real-world template. You will learn how to loop over a collection of sensors, filter by state, build up a list, and format a message. All of these skills carry over to many other templates you will write later.
A notification that arrives each morning with a message like this:
2 devices need new batteries: Front door lock in Hallway (15%), Motion sensor in Kitchen (12%).
If everything is healthy, you get a reassuring message instead:
All batteries are healthy.
You need:
At least one battery-powered device reporting a percentage through Home Assistant. Zigbee, Z-Wave, and Matter devices usually do this automatically.
A notification service set up on your phone, usually the Home Assistant Companion app . The examples below use notify.send_message . Replace my_device in notify.my_device by your own target when you get there.
Five minutes with the Developer tools template editor open.
Before you write a single template, it helps to see what you are working with. Open Settings > Developer tools > States and filter on battery .
You should see a list of sensors with device_class: battery in their attributes and a number (like 85 or 12 ) in the state column. Those are the entities this automation will watch.
If you do not see any, your devices might be using the old binary_sensor battery class (which reports on / off instead of a percentage) or they do not report battery at all. This tutorial focuses on the numeric sensor kind.
Open Developer tools > Template and paste this in:
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {% set low = namespace(batteries=[]) %}
{% for sensor in states.sensor
| selectattr('attributes.device_class', 'eq', 'battery')
| rejectattr('state', 'in', ['unknown', 'unavailable']) %}
{% if sensor.state | float(100) < 20 %}
{% set low.batteries = low.batteries + [device_name(sensor.entity_id)] %}
{% endif %}
{% endfor %}
{{ low.batteries }}
Result ['Front door lock', 'Motion sensor', 'Bedroom sensor']
Read it left to right:
Create a namespace called low with an empty batteries list inside.
For each sensor whose device_class is battery , skipping any that are unknown or unavailable …
If its state (converted to a number) is below 20 …
Add the name of the device that sensor belongs to to low.batteries .
Why the device name? With modern Home Assistant naming, a battery sensor’s own name is often only “Battery”, which is not very helpful in a notification. The device_name function gives you back the friendly name of the device the sensor is attached to (like “Front door lock” or “Motion sensor”).
You should see a list of device names with low batteries. If the list is empty, you can temporarily raise the threshold (change 20 to 100 ) to confirm the template is working.
Note
Variables set inside a for loop do not survive outside the loop, so low is created with a namespace . That is the object whose attribute ( low.batteries ) can be updated inside the loop and still hold the full list afterwards. See Loops and conditions for more on this quirk.
A bare list is not what you want to send to your phone. Add the area the device is in, the current battery level, and turn the result into a friendly sentence. Replace the template with this:
{% set device = device_name(sensor.entity_id) %}
{% set area = area_name(sensor.entity_id) %}
{% set label = device ~ (' in ' ~ area if area else '')
~ ' (' ~ sensor.state ~ '%)' %}
{% set low.batteries = low.batteries + [label] %}
{% if low.batteries | count == 0 %}
{% elif low.batteries | count == 1 %}
1 device needs a new battery: {{ low.batteries[0] }}.
{% else %}
{{ low.batteries | count }} devices need new batteries: {{ low.batteries | join(', ') }}.
Result 3 devices need new batteries: Front door lock in Hallway (15%),
Motion sensor in Kitchen (12%), Window sensor in Bedroom (8%).
A few things changed from the previous step:
Two helper variables: device_name gives you the device’s friendly name, and area_name gives you the name of the area An area in Home Assistant is a logical grouping of devices and entities that are meant to match areas (or rooms) in the physical world: your home. For example, the living room area groups devices and entities in your living room. [Learn more] it is assigned to.
label builds one formatted piece of text per device, combining the device name, the area (only if it is set), and the battery percentage. The ~ symbol glues text together.
An if / elif / else picks between three messages based on how many items are in the list. No low batteries get a friendly “all healthy” message. One low battery uses singular wording. Two or more get the full list joined with commas.
Play with the template. Change the threshold, remove the % , reword the messages. The template editor updates as you type, so you can see the result of every change right away.
Now turn the template into an actual automation.
Go to Settings > Automations & scenes .
Select Create automation , then Create new automation .
Give it a name: Low battery notification .
You want this to run once every morning.
Under When , select Add trigger .
Choose Time .
Set the time to something reasonable, like 09:00:00 .
Under Then do , select Add action .
Choose Perform Action , then pick your notify action (like notify.send_message ).
Fill in the message field with the template you built in step 3.
In YAML, the action looks like this:
Action Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called *sequence*. [Learn more] - action: notify.send_message
target:
entity_id: notify.my_device
data:
title: "Battery check"
message: >
{% set low = namespace(batteries=[]) %}
Save the automation.
You do not want to wait until tomorrow morning to find out if it works.
Open your automation.
Select the Run button (or use the three-dots menu and choose Run actions ).
The notification should arrive on your phone within a few seconds. If it does not, check that the notify action name matches what you have on your setup, and look at the automation’s trace for clues.
A few ways to take this further:
Quiet “healthy” days . Skip the notification entirely when the list is empty. Put the “all healthy” message in an if branch that does nothing, or use a template condition before the notification action.
Different thresholds . Replace 20 with a helper input so you can tune the threshold from the dashboard without editing the automation.
Weekly instead of daily . Change the time trigger to a more specific schedule like “every Monday at 9am”.
Include unavailable devices . The current template skips sensors that are unknown or unavailable , but those might indicate a completely dead battery. You can add a second list for offline devices and mention them in the message.
Sort by percentage . If you have many devices, sort the list with the most-drained device first so you know what to replace first.
The Loops and conditions page explains the for loop and if / elif / else used here.
The Common template patterns page has more cookbook-style recipes.
Try the Tutorial: show the average home temperature on your dashboard next to learn how to build a template sensor Sensors return information about a thing, for instance the level of water in a tank. [Learn more] .
Loops and conditions
Common template patterns
`selectattr` filter
`float` filter
Notify actions
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
Templates in YAML
Working with states
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
