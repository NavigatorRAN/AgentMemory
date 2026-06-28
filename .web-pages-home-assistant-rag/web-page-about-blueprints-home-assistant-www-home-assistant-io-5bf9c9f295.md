# About blueprints - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/docs/blueprint
- Final URL: https://www.home-assistant.io/docs/blueprint
- Canonical URL: https://www.home-assistant.io/docs/blueprint/
- Fetched at: 2026-06-28T02:21:08Z
- Content type: text/html; charset=UTF-8

## Description

Blueprints are ready-made automations, scripts, and template entities that you can install with a few clicks and customize for your own home, no coding required.

## Extracted Text

On this page
What is a blueprint?
Related topics
Related links
Blueprints are the easiest way to add automations, scripts, or template entities to your Home Assistant. Someone in the community has already done the work of writing the configuration, and you fill in the bits that are specific to your home, like which sensor to watch and which light to control.
You can find a blueprint for almost any common use case in the community blueprint forum : motion-activated lights, low-battery notifications, holiday lighting, presence-based heating, and many more.
This page is a high-level introduction. If you want to create your own blueprint to share, see About the blueprint schema .
A blueprint is a script Scripts are components that allow you to specify a sequence of actions to be executed by Home Assistant when turned on. [Learn more] , automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] , or template entity configuration where some parts have been left blank, ready for you to fill in. That way, the same blueprint can be reused over and over with different devices and settings.
Imagine you want to turn on a light when motion is detected. A blueprint provides the generic automation, while letting you select which motion sensor and which light. You can use that same blueprint twice, once for the hallway and once for the bathroom, and end up with two completely independent automations that each behave the way you configured them.
Automations inherit from the blueprint they were built on, so if the blueprint is updated, all automations using it pick up the change the next time Home Assistant reloads them. To reload manually, go to Settings > Developer tools > YAML and reload the automations.
Blueprints are shared by the community in the blueprint community forum .
About the blueprint schema
About the blueprint selectors
Using blueprints in automations
Tutorial: create an automation blueprint
Blueprint community forum
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
Blueprints
Tutorial
Blueprint schema
Selectors
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
