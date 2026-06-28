# Derivative - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/derivative
- Final URL: https://www.home-assistant.io/integrations/derivative
- Canonical URL: https://www.home-assistant.io/integrations/derivative/
- Fetched at: 2026-06-28T02:36:41Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Derivative Sensor into Home Assistant.

## Extracted Text

On this page
Configuration
YAML configuration
Temperature example
The derivative ( Wikipedia ) integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] creates a sensor that estimates the derivative of the
values provided by another sensor (the source sensor ). Derivative sensors are updated upon changes of the source sensor .
For sensors that reset to zero after a power interruption and need a “non-negative derivative”, such as bandwidth counters in routers, or rain gauges, you can now use this integration directly. Ensure that the input sensor has a total_increasing state class, as this is necessary for the integration to handle resets correctly without registering significant changes in the derivative sensor.
To add the Derivative helper to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
At the top of the screen, select the tab: Helpers .
In the bottom right corner, select the
Create helper button.
From the list, select Derivative .
Follow the instructions on screen to complete the setup.
Name
The name the sensor should have. You can change it again later.
Input sensor
The entity providing numeric readings to create the derivative of.
Precision
Round the calculated derivative value to at most N decimal places.
Time window
The time window in which to calculate the derivative. Derivatives in this window will be averaged with a simple moving average algorithm (SMA) weighted by time. This is for instance useful for a sensor that outputs discrete values, or to filter out short duration noise. By default the derivative is calculated between two consecutive updates without any smoothing.
Metric Prefix
Metric unit to prefix the derivative result ( Wikipedia ).
Time unit
SI unit of time of the derivative. If this parameter is set, the unit of measurement will be set to x/y where x is the unit of the source sensor and y is the value of this parameter.
Max sub-interval
Normally, the derivative is calculated each time the source sensor updates. If a time is specified for this option, the derivative will also be recalculated if this amount of time elapses without an update of the source sensor.
Alternatively, this integration can be configured and set up manually via YAML
instead. To enable the Derivative sensor in your installation, add the
following to your configuration.yaml file:
# Example configuration.yaml entry sensor : - platform : derivative source : sensor.current_speed
Configuration Variables
Looking for your configuration file?
source string Required
The entity ID of the sensor providing numeric readings
name string ( Optional )
Name to use in the frontend.
Default:
source entity ID derivative
unique_id string ( Optional )
An ID that uniquely identifies the derivative sensor. Set this to a unique value to allow customization through the UI.
round integer ( Optional , default: 3 )
unit_prefix string ( Optional , default: None )
Metric unit to prefix the derivative result ( Wikipedia ). Available symbols are “n” (1e-9), “µ” (1e-6), “m” (1e-3), “k” (1e3), “M” (1e6), “G” (1e9), “T” (1e12).
unit_time string ( Optional , default: h )
SI unit of time of the derivative. Available units are s, min, h, d. If this parameter is set, the attribute unit_of_measurement will be set like x/y where x is the unit of the sensor given via the source parameter and y is the value given here.
unit string ( Optional )
Unit of Measurement to be used for the derivative. This will overwrite the automatically set unit_of_measurement as explained above.
time_window time ( Optional , default: 0 )
The time window in which to calculate the derivative. Derivatives in this window will be averaged with a Simple Moving Average algorithm weighted by time. This is for instance useful for a sensor that outputs discrete values, or to filter out short duration noise. By default the derivative is calculated between two consecutive updates without any smoothing.
max_sub_interval time ( Optional , default: 0 )
For example, you have a temperature sensor sensor.temperature that outputs a value every few seconds, but rounds to the nearest half number.
That means that two consecutive output values might be the same (so the derivative is Δy/Δx=0 because Δy=0 !)
However, the temperature might actually be changing over time.
To capture this, you should use a time_window , such that immediate jumps don’t result in high derivatives and that after the next sensor update, the derivatives doesn’t vanish to zero.
An example YAML configuration that uses time_window is
sensor : - platform : derivative source : sensor.temperature name : Temperature change per hour round : 1 unit_time : h # the resulting "unit_of_measurement" will be °C/h if the sensor.temperate has set °C as its unit time_window : " 00:30:00" # we look at the change over the last half hour
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Derivative helper was introduced in Home Assistant 0.105, and it's used by
3.1% of the active installations.
Its IoT class is Calculated.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@afaucogney
@karwosts
Categories
Energy
Helper
Sensor
Utility
Back to top
