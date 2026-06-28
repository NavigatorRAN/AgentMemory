# Tilt Pi - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/tilt_pi
- Final URL: https://www.home-assistant.io/integrations/tilt_pi
- Canonical URL: https://www.home-assistant.io/integrations/tilt_pi/
- Fetched at: 2026-06-28T03:22:33Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to configure a Tilt Pi.

## Extracted Text

On this page
Prerequisites
Configuration
Supported functionality
Entities
Data updates
Supported devices
Removing the integration
To remove an integration instance from Home Assistant
Related links
The Tilt Pi integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to connect a Tilt Pi to Home Assistant to
automatically discover Tilt Hydrometer devices.
The Tilt Pi is a Raspberry Pi-based device that can read data from Tilt
Hydrometers and broadcast it over the network. The Tilt Pi can be used to
monitor the fermentation of beer, wine, cider, and other beverages.
The benefit of the Tilt Pi is that it can be placed in a location with better
reception than the Tilt Hydrometer itself, allowing for more reliable data
collection.
Note
For instances where you only have a Tilt Hydrometer and not a Tilt Pi, consider
using the Tilt Hydrometer integration .
Have a Raspberry Pi with the Tilt Pi software installed.
Have a Tilt Hydrometer in range of the Tilt Pi.
Have the IP address or hostname of the Tilt Pi.
To add the Tilt Pi hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Tilt Pi .
Follow the instructions on screen to complete the setup.
Host
The hostname or IP address of the Tilt Pi.
Port
The port of the Tilt Pi. The default port is 1880.
After adding the integration, you can add the Tilt Pi device to your Home
Assistant. If the Tilt Pi was found and there are Tilt Hydrometers in its range,
then entities will be created for each Tilt Hydrometer.
You may then use these entities in automations, scripts, dashboards, and other
integrations.
Sensors
Tilt Hydrometer temperature
Description : Current temperature of the Tilt Hydrometer.
Entity name : tilt_<tilt-pi-color>_temperature
Tilt Hydrometer gravity
Description : Current specific gravity of the Tilt Hydrometer.
Entity name : tilt_<tilt-pi-color>_gravity
The Tilt Pi integration polls Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] the Tilt Pi for data every 60 seconds. This
interval is currently not configurable.
The following devices are known to be supported by the integration:
Tilt™ Pi v2 Bookworm May24
This integration follows standard integration removal. No extra steps are
required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Tilt Pi product page
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Tilt Pi hub was introduced in Home Assistant 2025.7, and it's used by
20 active installations.
Its IoT class is Local Polling.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@michaelheyman
Categories
Sensor
Back to top
