---
source_url: "https://www.home-assistant.io/getting-started/concepts-terminology"
final_url: "https://www.home-assistant.io/getting-started/concepts-terminology"
canonical_url: "https://www.home-assistant.io/getting-started/concepts-terminology/"
source_handle: "web:www-home-assistant-io:f58c1aa3e218"
source_section: "getting-started-concepts-terminology"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "9f410e685178e5b23614185069f4c769810aecc2b297cf8d4c38606f6306b527"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Concepts and terminology - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/getting-started/concepts-terminology
- Final URL: https://www.home-assistant.io/getting-started/concepts-terminology
- Canonical URL: https://www.home-assistant.io/getting-started/concepts-terminology/
- Fetched at: 2026-06-28T02:24:49Z
- Content type: text/html; charset=UTF-8

## Description

The core concepts behind Home Assistant: integrations, devices, entities, areas, and automations.

## Extracted Text

On this page
Integrations
Devices
Entities
Areas
Automations
Scripts
Scenes
Apps
Now that you are in Home Assistant, let’s look at the most important concepts. Home Assistant is built around a small set of building blocks: integrations, devices, entities, areas, and automations. Once you understand how they fit together, the rest of the platform falls into place.
Integrations are pieces of software that allow Home Assistant to connect to other software and platforms. For example, a product by Philips called Hue would use the Philips Hue integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] and allow Home Assistant to talk to the hardware controller Hue Bridge. Any Home Assistant compatible devices A device is a model representing a physical or logical unit that contains entities. connected to the Hue Bridge would appear in Home Assistant as devices .
Some integration cards show an icon:
The globe icon indicates that this integration requires the internet.
The file icon indicates that this integration was not set up via the UI. You have either set it up in your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, or it is a dependency set up by another integration. If you want to configure it, you will need to do so in your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
The custom icon indicates that this is not an official Home Assistant integration but that it was custom made. It could be imported from another source, for example downloaded from HACS.
For a full list of compatible integrations Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] , refer to the integrations documentation.
Once an integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] has been added, the hardware and/or data are represented in Home Assistant as devices and entities .
Devices are a logical grouping for one or more entities An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] . A device A device is a model representing a physical or logical unit that contains entities. may represent a physical device A device is a model representing a physical or logical unit that contains entities. , which can have one or more sensors. The sensors appear as entities associated with the device A device is a model representing a physical or logical unit that contains entities. . For example, a motion sensor is represented as a device A device is a model representing a physical or logical unit that contains entities. . It may provide motion detection, temperature, and light levels as entities An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] . Entities have states such as detected when motion is detected and clear when there is no motion.
Devices and entities are used throughout Home Assistant. To name a few examples:
Dashboards can show a state of an entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] . For example, if a light is on or off.
An automation can be triggered from a state change on an entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] . For example, a motion sensor entity detects motion and triggers a light to turn on.
A predefined color and brightness setting for a light can be saved as a scene .
Entities are the basic building blocks to hold data in Home Assistant. An entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] represents a sensor Sensors return information about a thing, for instance the level of water in a tank. [Learn more] , actor An entity that receives a control signal and performs an action in a system. , or function in Home Assistant. Entities are used to monitor physical properties or to control other entities An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] . An entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] is usually part of a device A device is a model representing a physical or logical unit that contains entities. or a service The term “service” in Home Assistant is used in the sense of an information
service . For example, the municipal waste management service that provides
entities for organic, paper, and packaging waste. In terms of functionality,
the information service is like a device. It is called service to avoid
confusion, as it does not come with a piece of hardware. . Entities have states The state holds the information of interest of an entity, for example, if a light is on or off. Each entity has exactly one state and the state only holds one value at a time. However, entities can store attributes related to that state such as brightness, color, or a unit of measurement. [Learn more] .
Screenshot of the Entities table. Each line represents an entity.
An area in Home Assistant is a logical grouping of devices A device is a model representing a physical or logical unit that contains entities. and entities An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] that are meant to match areas (or rooms) in the physical world: your home. For example, the living room area groups devices and entities in your living room. Areas allow you to target actions at an entire group of devices. For example, turning off all the lights in the living room.
These are locations within your home, such as the living room or the dance floor. Areas can be assigned to floors A floor in Home Assistant is a logical grouping of areas that are meant to match the physical floors in your home. Devices & entities are not assigned to floors but to areas. Floors can be used in automations and scripts as a target for actions. For example, to turn off all the lights on the downstairs floor when you go to bed. [Learn more] .
Areas can also be used for automatically generated cards, such as the Area card .
A set of repeatable actions Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] that can be set up to run automatically. Automations are made of three key components:
Triggers - events that start an automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] . For example, when the sun sets or a motion sensor is activated.
Conditions - optional tests that must be met before an action Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] can be run. For example, if someone is home.
Actions - interact with devices A device is a model representing a physical or logical unit that contains entities. such as turn on a light.
To learn the basics about automations Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] , refer to the automation basics page or try creating an automation yourself.
Similar to automations Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] , scripts are repeatable actions Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] that can be run. The difference between scripts Scripts are components that allow you to specify a sequence of actions to be executed by Home Assistant when turned on. [Learn more] and automations Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] is that scripts Scripts are components that allow you to specify a sequence of actions to be executed by Home Assistant when turned on. [Learn more] do not have triggers. This means that scripts Scripts are components that allow you to specify a sequence of actions to be executed by Home Assistant when turned on. [Learn more] cannot automatically run unless they are used in automations Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] . Scripts are particularly useful if you perform the same actions Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] in different automations Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] or trigger them from a dashboard. For information on how to create scripts Scripts are components that allow you to specify a sequence of actions to be executed by Home Assistant when turned on. [Learn more] , refer to the scripts documentation.
Scenes allow you to create predefined settings for your devices A device is a model representing a physical or logical unit that contains entities. . Similar to a driving mode on phones, or driver profiles in cars, it can change an environment to suit you. For example, your watching films scene Scenes capture the states you want certain entities to be. For example, a scene can specify that light A should be turned on and light B should be bright red. [Learn more] may dim the lighting, switch on the TV and increase its volume. This can be saved as a scene Scenes capture the states you want certain entities to be. For example, a scene can specify that light A should be turned on and light B should be bright red. [Learn more] and used without having to set individual devices A device is a model representing a physical or logical unit that contains entities. every time.
To learn how to use scenes Scenes capture the states you want certain entities to be. For example, a scene can specify that light A should be turned on and light B should be bright red. [Learn more] , refer to the scene documentation.
Apps are third-party applications that provide additional functionality in Home Assistant. Apps run directly alongside Home Assistant, whereas integrations Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] connect Home Assistant to other apps. Apps are only supported when using Home Assistant Operating System Home Assistant OS, the Home Assistant Operating System, is an embedded, minimalistic, operating system designed to run the Home Assistant ecosystem on single board computers (like the Raspberry Pi) or Virtual Machines. It includes Home Assistant Core, the Home Assistant Supervisor, and supports apps. Home Assistant Supervisor keeps it up to date, removing the need for you to manage an operating system. Home Assistant Operating System is the recommended installation type for most users. .
Apps are installed from the app store under Settings > Apps . If you are curious now and feel like installing every app that looks interesting: beware that apps can use quite a bit of resources in terms of disk space, memory, and additional load on the processor.
Among the most used apps are the ones that provide file access and edit files in Home Assistant.
Screenshot of the app store, showing all the installable apps.
Edit the dashboard
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View given feedback
Getting started
Installation
Onboarding
Concepts and terminology
Editing the dashboard
Adding integrations
Automating devices
Presence detection
Join the community
Next steps
Back to top
