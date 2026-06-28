# Sun - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/sun
- Final URL: https://www.home-assistant.io/integrations/sun
- Canonical URL: https://www.home-assistant.io/integrations/sun/
- Fetched at: 2026-06-28T03:19:21Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to track the sun within Home Assistant.

## Extracted Text

On this page
Configured by default
Configuration
YAML configuration
Automation trigger
Maintains entity sun.sun
Sensors
Binary sensors
Related topics
The Sun integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] calculates sun-related times such as sunrise, sunset, dawn, and dusk based on your configured home location. This means that all time-based calculations and triggers will be accurate for your specific location, as defined in your basic configuration .
The sun integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] will use the location as
configured in your Home Assistant configuration to
track if the sun is above or below the horizon. The sun can be used within
automations as
a trigger with an optional offset to simulate dawn/dusk or as
a condition with an optional offset to test if the sun has already set or risen .
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] is configured and installed by default, so you don’t need
to set it up yourself, unless you’ve disabled or removed the
default_config: line from your
YAML configuration.
If that is the case, follow the steps below to set it up.
To add the Sun service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Sun .
Follow the instructions on screen to complete the setup.
Alternatively, you can configure and set up this integration manually via YAML.
To enable the sun integration in your installation, add the
following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes.
# Example configuration.yaml entry sun :
The sun’s event listener performs the action when the sun rises or sets, with an optional offset.
The sun trigger needs the trigger type sun , an event ( sunset or sunrise ), and an optional offset:
triggers : - trigger : sun event : sunrise # Fire one hour before sunrise. offset : " -01:00:00"
The following keys are available:
event : Required. Either sunrise or sunset .
offset : Optional. A time offset relative to the sun event, specified as a number of seconds or in HH:MM:SS format. A negative value fires the trigger before the sun event, a positive value fires it after .
For example, if sunrise is at 06:00 and you set offset: "-01:00:00" , the automation runs at 05:00. With offset: "01:00:00" , it runs at 07:00. The same rule applies to sunset.
Tip
Because the duration of twilight varies throughout the year, a fixed offset is not always the best way to trigger automations around dawn or dusk. For more precise dawn or dusk automations, use a sun elevation trigger instead.
Possible state Description above_horizon When the sun is above the horizon. below_horizon When the sun is below the horizon.
The sensors are also available as attributes on the sun.sun entity for backward compatibility.
Sensors Description Next rising Date and time of the next sun rising (in UTC). Next setting Date and time of the next sun setting (in UTC). Next dawn Date and time of the next dawn (in UTC). Next dusk Date and time of the next dusk (in UTC). Next noon Date and time of the next solar noon (in UTC). Next midnight Date and time of the next solar midnight (in UTC). Elevation Solar elevation. This is the angle between the sun and the horizon. Negative values mean the sun is below the horizon. Azimuth Solar azimuth. The angle is shown clockwise from north.
The binary sensors are also available as attributes on the sun.sun entity for backward compatibility.
Sensors Description Solar rising on when the sun is currently rising (after solar midnight and before solar noon).
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Sun service was introduced in Home Assistant pre 0.7, and it's used by
99.6% of the active installations.
Its IoT class is Calculated.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Categories
Environment
Back to top
