# Templating - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/docs/templating
- Final URL: https://www.home-assistant.io/docs/templating
- Canonical URL: https://www.home-assistant.io/docs/templating/
- Fetched at: 2026-06-28T02:22:47Z
- Content type: text/html; charset=UTF-8

## Description

Learn how to use templates to make Home Assistant adapt to your needs.

## Extracted Text

On this page
Quick example
Learning guide
Tutorials
Reference
Templates are short snippets of code you can use wherever Home Assistant needs to figure something out for you. Instead of typing a fixed message or value, you write a small instruction that reads your data and produces the right result.
For example, instead of a notification that always says “Someone is home”, a template can say “Frenck is home” or “Nobody is home, they’re at the gym” depending on what’s actually happening.
Action Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called *sequence*. [Learn more] action: notify.send_message
target:
entity_id: notify.my_device
data:
message: >
{% if is_state('device_tracker.frenck', 'home') %}
Frenck is home.
{% else %}
Frenck is at {{ states('device_tracker.frenck') }}.
{% endif %}
Result Frenck is at gym.
The text between {% , %} and {{ , }} is the template. When the action runs, Home Assistant replaces it with the right message.
Start here if you are new to templating in Home Assistant. The pages below walk you through the concepts step by step.
Introduction
What templates are and why you would use them.
Where to use templates
The places in Home Assistant where templates show up.
Template syntax
The building blocks of every template, explained in plain language.
Loops and conditions
Making decisions and repeating work with if , for , and friends.
Templates in YAML
Quoting, multi-line strings, and other YAML gotchas.
Working with states
Reading states, attributes, and entity information.
Types and conversion
Understand data types and how to convert between them.
Dates and times
Format, compare, and calculate with dates and times.
Python methods
Cheat sheet of Python methods available in templates.
Common patterns
Recipes for the things you actually want to do.
Debugging templates
Fixing mistakes with the template editor.
Error messages
What each error means and how to fix it.
Custom templates and macros
Share templates across your configuration.
Two step-by-step walkthroughs that show templating in practice.
Notify me about low batteries
Build a daily notification that lists devices with low batteries.
Average home temperature
Create a template sensor that averages all your temperature sensors.
Home Assistant provides hundreds of template functions, filters, and tests for working with your data. Each one has its own page with explanations and examples.
Template functions reference . Browse all functions, filters, and tests by category.
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
