---
source_url: "https://www.home-assistant.io/integrations/integration"
final_url: "https://www.home-assistant.io/integrations/integration"
canonical_url: "https://www.home-assistant.io/integrations/integration/"
source_handle: "web:www-home-assistant-io:e82418dd1025"
source_section: "integrations-integration"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "f4fd8ad86b561e6e3dabdf0905869641b541a3bc314bd65e8eb99cde3d2ae71a"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Integral - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/integration
- Final URL: https://www.home-assistant.io/integrations/integration
- Canonical URL: https://www.home-assistant.io/integrations/integration/
- Fetched at: 2026-06-28T02:52:35Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Integration Sensor into Home Assistant.

## Extracted Text

On this page
Configuration
YAML configuration
Data updates
Integration method
Trapezoidal
Left
Right
Energy
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the Riemann sum
of the values provided by a source sensor. The Riemann sum is an approximation
of an integral by a finite sum.
The integration sensors are updated whenever the source changes and, optionally, based on a predefined
time interval. Source sensors with higher sampling frequency provide more accurate results.
Note
The integral sensor keeps its value across Home Assistant restarts.
To add the Integral helper to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
At the top of the screen, select the tab: Helpers .
In the bottom right corner, select the
Create helper button.
From the list, select Integral .
Follow the instructions on screen to complete the setup.
Name
The name the sensor should have. You can change it again later.
Input sensor
The entity providing numeric readings to integrate.
Integral method
Riemann sum method to be used.
Precision
Round the calculated integration value to at most N decimal places.
Metric prefix
Metric unit to prefix the integration result.
Integration time
SI unit of time to integrate over.
Max sub-interval
Applies time-based integration if the source did not change for this duration. This implies that at least every max sub-interval , the integral is updated. If you don’t want time-based updates, enter 0 .
Alternatively, this integration can be configured and set up manually via YAML
as well. To enable the Integration sensor in your installation, add the
following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry sensor : - platform : integration source : sensor.current_power
Configuration Variables
Looking for your configuration file?
source string Required
The entity ID of the sensor providing numeric readings.
name string ( Optional )
Name to use in the frontend.
Default:
source entity ID integral
unique_id string ( Optional )
An ID that uniquely identifies the integration sensor. Set this to a unique value to allow customization through the UI.
round integer ( Optional , default: 3 )
unit_prefix string ( Optional , default: None )
Metric unit to prefix the integration result. Available units are k , M , G and T .
unit_time string ( Optional , default: h )
SI unit of time to integrate over. Available units are s , min , h and d .
method string ( Optional , default: trapezoidal )
Riemann sum method to be used. Available methods are trapezoidal , left and right .
max_sub_interval time ( Optional , default: 0 )
Applies time-based integration if the source did not change for this duration. This implies that at least every max sub-interval , the integral is updated. If you don’t want time-based updates, enter 0.
The unit of source together with unit_prefix and unit_time is used to generate a unit for the integral product (e.g. a source in W with prefix k and time h would result in kWh ). Note that unit_prefix and unit_time are also relevant to the Riemann sum calculation.
The integral sensor keeps its accumulated value when Home Assistant restarts. After a restart, it picks up where it left off and continues integrating from the restored value as soon as the source sensor starts providing new readings.
The Riemann Sum is an approximation of an integral by a finite sum and is therefore intrinsically inaccurate. Nonetheless, depending on the method used, values can be more or less accurate.
The integration method defines how to calculate the area under the source sensor when it changes. Regardless of the method used, the integration will be more accurate if the source updates more often. The config max_sub_interval can be used to trigger integration when the source sensor is constant.
The trapezoidal method follows the Trapezoidal rule . This method is the most accurate of the currently implemented methods, if the source updates often, since it better fits the curve of the intrinsic source.
The left method follows the Left rule . The method underestimates the intrinsic source, but is extremely accurate at estimating rectangular functions which are very stable for long periods of time and change very rapidly (e.g. such as the power function of a resistive load can jump instantly to a given value and stay at the same value for hours). If your source keeps its state for long periods of time, this method is preferable to the trapezoidal .
The right method follows the Right rule . The method is similar to the left method, but overestimates the intrinsic source. Again it is only appropriate to be used with rectangular functions.
An integration sensor is quite useful in energy billing scenarios since energy is generally billed in kWh and many sensors provide power in W (Watts).
If you have a sensor that provides you with power readings in Watts (uses W as unit_of_measurement , device_class of power ), then you can use the integration sensor to track how much energy is being spent. Take the next manual YAML configuration as an example:
sensor : - platform : integration source : sensor.current_power name : energy_spent unit_prefix : k round : 2 max_sub_interval : minutes : 5
This configuration will provide you with sensor.energy_spent which will have your energy in kWh, as a device_class of energy .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Integral helper was introduced in Home Assistant 0.87, and it's used by
11.3% of the active installations.
Its IoT class is Local Push.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@dgomes
Categories
Helper
Sensor
Utility
Back to top
