# Radio frequency - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/radio_frequency
- Final URL: https://www.home-assistant.io/integrations/radio_frequency
- Canonical URL: https://www.home-assistant.io/integrations/radio_frequency/
- Fetched at: 2026-06-28T03:11:00Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to use radio frequency entities in Home Assistant.

## Extracted Text

On this page
The state of a radio frequency entity
Setting up devices that use radio frequency
A radio frequency (RF) entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] represents a radio frequency transmitter device, allowing other integrations to send RF commands to control devices such as remote outlets, garage doors, string lights, and other RF-controlled appliances.
The Radio Frequency integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] acts as an abstraction layer between RF transmitter hardware (such as ESPHome) and device-specific integrations that provide control for RF-controlled devices.
Note
Building block integration
This radio frequency is a building block integration that cannot be added to your Home Assistant directly but is used and provided by other integrations.
A building block integration differs from the typical integration that connects to a device or service. Instead, other integrations that do integrate a device or service into Home Assistant use this radio frequency building block to provide entities, services, and other functionality that you can use in your automations or dashboards.
If one of your integrations features this building block, this page documents the functionality the radio frequency building block offers.
The radio frequency entity is stateless in the traditional sense, as in, it cannot have a state like on or off . Instead, the state of a radio frequency entity is a timestamp showing the date and time when an RF command was last sent through the transmitter.
In addition, the entity can have the following states:
Unavailable : The entity is currently unavailable.
Unknown : The state is not yet known.
Because the state The state holds the information of interest of an entity, for example, if a light is on or off. Each entity has exactly one state and the state only holds one value at a time. However, entities can store attributes related to that state such as brightness, color, or a unit of measurement. [Learn more] of a radio frequency entity in Home Assistant is a timestamp, it changes every time an RF command is sent. This means we can use it to track when the transmitter was last used. The logbook can also show context about which integration or action triggered the transmission.
When setting up an integration for an RF-controlled device (such as the Honeywell String Lights), you will typically be asked to select which RF transmitter to use during the configuration process. This allows you to choose the specific radio frequency entity that is physically positioned to control your device.
The selected radio frequency entity must be provided by a hardware integration (such as ESPHome) that has already been set up with an RF transmitter compatible with the frequency and modulation that your device uses.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Radio frequency entity was introduced in Home Assistant 2026.5.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Categories
Radio Frequency
Back to top
