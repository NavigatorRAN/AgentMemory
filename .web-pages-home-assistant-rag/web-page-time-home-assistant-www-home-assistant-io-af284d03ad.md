# Time - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/time
- Final URL: https://www.home-assistant.io/integrations/time
- Canonical URL: https://www.home-assistant.io/integrations/time/
- Fetched at: 2026-06-28T03:22:37Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up time entities within Home Assistant.

## Extracted Text

On this page
The state of a time entity
List of actions
The Time integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] is built for controlling and monitoring times on devices.
Note
Building block integration
This time is a building block integration that cannot be added to your Home Assistant directly but is used and provided by other integrations.
A building block integration differs from the typical integration that connects to a device or service. Instead, other integrations that do integrate a device or service into Home Assistant use this time building block to provide entities, services, and other functionality that you can use in your automations or dashboards.
If one of your integrations features this building block, this page documents the functionality the time building block offers.
If you are looking for a way to create a similar entity, please take a look at the Date/Time helper .
The state of a time entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] is a timestamp in the format HH:MM:SS.
Screenshot showing the state of a time entity in the developer tools.
In addition, the entity can have the following states:
Unavailable : The entity is currently unavailable.
Unknown : The state is not yet known.
The Time integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Set time value ( time.set_value )
Sets the value of a time entity.
For an overview of every action across all integrations, see the actions reference .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Time entity was introduced in Home Assistant 2022.12.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Categories
Time
Back to top
