# Entities and domains - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/docs/configuration/entities_domains
- Final URL: https://www.home-assistant.io/docs/configuration/entities_domains
- Canonical URL: https://www.home-assistant.io/docs/configuration/entities_domains/
- Fetched at: 2026-06-28T02:21:23Z
- Content type: text/html; charset=UTF-8

## Description

Entities are the building blocks of Home Assistant: each device, sensor, or service appears as one or more entities, grouped by domain such as light, switch, or sensor.

## Extracted Text

On this page
Domains
Related topics
Your devices are represented in Home Assistant as entities. Entities are the basic building blocks to hold data in Home Assistant. An entity represents a sensor Sensors return information about a thing, for instance the level of water in a tank. [Learn more] , actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device A device is a model representing a physical or logical unit that contains entities. or a service The term “service” in Home Assistant is used in the sense of an information
service . For example, the municipal waste management service that provides
entities for organic, paper, and packaging waste. In terms of functionality,
the information service is like a device. It is called service to avoid
confusion, as it does not come with a piece of hardware. . Entities have states and state attributes .
All your entities are listed in the entities table, under Settings > Devices & services > Entities .
Screenshot of the Entities table. Each line represents an entity.
Each integration in Home Assistant has a unique identifier: a domain. All entities and actions available in Home Assistant are provided by integrations and thus belong to such a domain. The first part of the entity or action, before the . shows the domain they belong to. For example, light.bed_light is an entity in the light domain. bed_light is the ID of the entity.
The domain provides entities, services, and other functionality that other integrations can use. For example, IKEA and Philips Hue both use functionalities provided by the light integration. This is why the look and feel and behavior is similar in Home Assistant.
There are different types of domains: integration domains and entity domains:
Integration domains provide functionality primarily for itself: examples are Hue, Matter, or Zigbee.
Entity domains don’t use their own functionality as such. But they provide it for other integrations to use.
The integrations listed below are used as entity domains. They are also referred to as building block integrations or entity integrations :
AI Task
Air quality
Alarm control panel
Assist Satellite
Binary sensor
Button
Calendar
Camera
Climate
Conversation
Cover
Date
Date/Time
Device tracker
Event
Fan
Geolocation
Humidifier
Image
Image processing
Infrared
Lawn mower
Light
Lock
Media player
Notifications
Number
Radio frequency
Remote
Scenes
Select
Sensor
Siren
Speech-to-text (STT)
Switch
Tags
Text
Time
To-do list
Text-to-speech (TTS)
Update
Vacuum
Valve
Wake-word detection
Water heater
Weather
State object, entity state and attributes
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
Common tasks
Configuration
Home information
People and user configuration
Customizing entities
Remote access to Home Assistant
Securing your Home Assistant
Storing secrets in YAML
YAML syntax
The configuration.yaml file
Troubleshooting configuration
Splitting up the configuration
Packages
Events
State and state object
Entities and domains
Entity component platform options
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
