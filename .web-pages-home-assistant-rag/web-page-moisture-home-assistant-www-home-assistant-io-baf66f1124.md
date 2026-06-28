# Moisture - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/moisture
- Final URL: https://www.home-assistant.io/integrations/moisture
- Canonical URL: https://www.home-assistant.io/integrations/moisture/
- Fetched at: 2026-06-28T03:00:49Z
- Content type: text/html; charset=UTF-8

## Description

This integration provides moisture automation triggers and conditions.

## Extracted Text

On this page
Moisture and humidity
List of triggers
List of conditions
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides automation triggers and conditions for binary sensors, sensors, and number entities with device class moisture. There are no configuration options for this integration.
The moisture and humidity integrations both work with water, but they apply to different aspects:
Moisture describes water in or on a surface. It covers wet/dry detection (such as a leak sensor reporting water under a sink) and the moisture content of materials (such as a soil sensor reporting how wet the soil in a plant pot is). Moisture sensors come in two shapes:
Binary moisture sensors ( binary_sensor entities with the moisture device class) report only wet or dry , like a water leak sensor.
Numerical moisture sensors ( sensor entities with the moisture device class) report a moisture content as a percentage, like a soil moisture probe.
Humidity describes water vapor in the air. It’s reported as a relative humidity percentage by climate devices, humidifiers, weather sensors, and dedicated humidity sensors. For automations based on humidity, use the Humidity integration instead.
If you’re reacting to water in or on a surface (a leak, soil, a sponge), use the moisture triggers and conditions. If you’re reacting to how damp the air feels in a room, use humidity .
The Moisture integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following triggers. Each link below opens a dedicated page with examples, fields, and a step-by-step UI walkthrough.
Moisture content changed ( moisture.changed )
Triggers when one or more moisture content values change.
Moisture cleared ( moisture.cleared )
Triggers when one or more moisture sensors stop detecting moisture.
Moisture content crossed threshold ( moisture.crossed_threshold )
Triggers when one or more moisture content values cross a threshold.
Moisture detected ( moisture.detected )
Triggers when one or more moisture sensors start detecting moisture.
For an overview of every trigger across all integrations, see the triggers reference .
The Moisture integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following conditions. Each link below opens a dedicated page with examples, fields, and a step-by-step UI walkthrough.
Moisture is detected ( moisture.is_detected )
Tests if one or more moisture sensors are detecting moisture.
Moisture is not detected ( moisture.is_not_detected )
Tests if one or more moisture sensors are not detecting moisture.
Moisture level ( moisture.is_value )
Tests if a moisture content value is above a threshold, below a threshold, or in a range of values.
For an overview of every condition across all integrations, see the conditions reference .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Moisture system was introduced in Home Assistant 2026.4, and it's used by
0 active installations.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Categories
Automation
Back to top
