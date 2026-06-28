---
source_url: "https://www.home-assistant.io/integrations/trend"
final_url: "https://www.home-assistant.io/integrations/trend"
canonical_url: "https://www.home-assistant.io/integrations/trend/"
source_handle: "web:www-home-assistant-io:5bbe9b76e233"
source_section: "integrations-trend"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "ad168cabf657425ff9603f436b509d07abbc7f2a5d0a6dee00c4315ff1ebc614"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Trend - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/trend
- Final URL: https://www.home-assistant.io/integrations/trend
- Canonical URL: https://www.home-assistant.io/integrations/trend/
- Fetched at: 2026-06-28T03:23:58Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Trend binary sensors into Home Assistant.

## Extracted Text

On this page
Configuration
YAML Configuration
Using Multiple Samples
Examples
The Trend integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to create sensors that show the trend of
numeric state or state_attributes from other entities. This sensor requires
at least two updates of the tracked entity to establish a trend.
Thus it can take some time to show an accurate state. It can be useful
as part of automations, where you want to base an action on a trend.
To add the Trend helper to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
At the top of the screen, select the tab: Helpers .
In the bottom right corner, select the
Create helper button.
From the list, select Trend .
Follow the instructions on screen to complete the setup.
Name
The name the sensor should have. You can change it again later.
Entity that the sensor tracks
The sensor or counter entity that this sensor tracks.
Attribute of the entity that the sensor tracks
The attribute of the previously selected entity that this sensor tracks. If no attribute is specified, the sensor will track the state.
Invert the result
Invert the result. A true value would mean descending rather than ascending.
To enable Trend binary sensors in your installation,
add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry binary_sensor : - platform : trend sensors : cpu_speed : entity_id : sensor.cpu_speed
Configuration Variables
Looking for your configuration file?
sensors map Required
List of your sensors.
entity_id string Required
The entity that this sensor tracks.
attribute string ( Optional )
The attribute of the entity that this sensor tracks. If no attribute is specified then the sensor will track the state.
device_class string ( Optional )
Sets the class of the device , changing the device state and icon that is displayed on the frontend.
friendly_name string ( Optional )
Name to use in the Frontend.
invert boolean ( Optional , default: false )
max_samples integer ( Optional , default: 2 )
Limit the maximum number of stored samples.
min_samples integer ( Optional , default: 2 )
The minimum number of samples that must be collected before the gradient can be calculated.
min_gradient string ( Optional , default: 0.0 )
The minimum rate at which the observed value must be changing for this sensor to switch on. The gradient is measured in sensor units per second.
sample_duration integer ( Optional , default: 0 )
The duration in seconds to store samples for. Samples older than this value will be discarded.
unique_id string ( Optional )
An ID that uniquely identifies this sensor. Set this to a unique value to allow customization through the UI and to enable the sensor to be placed in areas.
If the optional sample_duration and max_samples parameters are specified
then multiple samples can be stored and used to detect long-term trends.
Each time the state changes, a new sample is stored along with the sample time. Samples older than sample_duration seconds will be discarded. The max_samples parameter must be large enough to store sensor updates over the requested duration. If you want to trend over two hours and your sensor updates every 120s then max_samples must be at least 60, that is, 7200/120 = 60.
A trend line is then fitted to the available samples, and the gradient of this
line is compared to min_gradient to determine the state of the trend sensor.
The gradient is measured in sensor units per second - so if you want to know
when the temperature is falling by 2 degrees per hour,
use a gradient of (-2) / (60 x 60) = -0.00055
The current number of stored samples is displayed on the States page.
In this section you find some real-life examples of how to use this sensor.
This example indicates true if the sun is still rising:
binary_sensor : - platform : trend sensors : sun_rising : entity_id : sun.sun attribute : elevation
This example creates two sensors to indicate whether the temperature is
rising or falling at a rate of at least 3 degrees an hour,
and collects samples over a two hour period:
binary_sensor : - platform : trend sensors : temp_falling : entity_id : sensor.outside_temperature unique_id : outside_temp_falling_trend sample_duration : 7200 max_samples : 120 min_samples : 20 min_gradient : -0.0008 device_class : cold temp_rising : entity_id : sensor.outside_temperature unique_id : outside_temp_rising_trend sample_duration : 7200 max_samples : 120 min_samples : 20 min_gradient : 0.0008 device_class : heat
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Trend helper was introduced in Home Assistant 0.28, and it's used by
1.2% of the active installations.
Its IoT class is Calculated.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@jpbede
Categories
Binary sensor
Helper
Utility
Back to top
