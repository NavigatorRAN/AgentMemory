# Version - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/version
- Final URL: https://www.home-assistant.io/integrations/version
- Canonical URL: https://www.home-assistant.io/integrations/version/
- Fetched at: 2026-06-28T03:26:31Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate the Version integration into Home Assistant.

## Extracted Text

On this page
Configuration
Version sources
Entities
Sensor
Binary Sensor
The Version integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] can display the current Home Assistant Core versions.
To add the Version integration to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Version .
Follow the instructions on screen to complete the setup.
With this integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] you can select various sources to get a version from.
Local installation
This will get the version you are currently running.
Home Assistant Versions
This will use the same source that are used by the Supervisor to check for updates based on the channel and image you choose.
Home Assistant Website
This will check the website you are reading this on to find the latest version.
Docker Hub
This will check the latest tag published to Docker Hub based on the channel and image you choose.
Python Package Index (PyPI)
This will check PyPI for the latest published package.
The entities created by this integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] depends on which source you set it up with (you can also set up the integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] multiple times to use more sources).
For all sources the integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] will create a sensor entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] that displays the newest version published to that source.
For all sources (except for the “Local installation” source) the integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] will create a binary_sensor entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] that show if there is a newer version than the one you are currently running published to that source.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Version integration was introduced in Home Assistant 0.52, and it's used by
2.2% of the active installations.
Its IoT class is Local Push.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@ludeeus
Categories
Utility
Back to top
