---
source_url: "https://www.home-assistant.io/integrations/filter"
final_url: "https://www.home-assistant.io/integrations/filter"
canonical_url: "https://www.home-assistant.io/integrations/filter/"
source_handle: "web:www-home-assistant-io:9f14989c0763"
source_section: "integrations-filter"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "429f131d98bca38605c3156e74c22fea624cbaa055e36f5ef2fd1c5b79511428"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Filter - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/filter
- Final URL: https://www.home-assistant.io/integrations/filter
- Canonical URL: https://www.home-assistant.io/integrations/filter/
- Fetched at: 2026-06-28T02:42:35Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Data Filter Sensors into Home Assistant.

## Extracted Text

On this page
Configuration
YAML Configuration
Filters
Low-pass
Outlier
Throttle
Time throttle
Time Simple Moving Average
Range
Related topics
The Filter integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] enables sensors that process the states of other entities.
filter applies a signal processing algorithm to a sensor, previous and current states, and generates a new state given the chosen algorithm. The next image depicts an original sensor and the filter sensor of that same sensor using the History Graph integration.
To add the Filter helper to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
At the top of the screen, select the tab: Helpers .
In the bottom right corner, select the
Create helper button.
From the list, select Filter .
Follow the instructions on screen to complete the setup.
Note
The UI configuration only supports setting one filter. For more advanced configurations where multiple filters are needed, please use the YAML configuration option to configure your filter sensor.
Further information about these configuration options can be found under the YAML configuration
Name
The name the sensor should have.
Entity
The entity that provides the input. Only sensor entities are supported.
Filter
Algorithm to be used to filter data. Available filters are “Lowpass”, “Outlier”, “Range”, “Throttle”, “Time throttle” and “Moving Average (Time based)”.
Precision
Defines the precision of the filtered state.
Window size
Size of the window of previous states. Time-based filters require a time period, while other filters require an integer.
Time constant
Loosely relates to the amount of time it takes for a state to influence the output.
Radius
Band radius from median of previous states.
Type
Defines the type of Simple Moving Average.
Lower bound
Lower bound for filter range.
Upper bound
Upper bound for filter range.
To enable Filter Sensors in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes.
# Example configuration.yaml entry sensor : - platform : filter name : " filtered realistic humidity" entity_id : sensor.realistic_humidity filters : - filter : outlier window_size : 4 radius : 4.0 - filter : lowpass time_constant : 10 precision : 2 - platform : filter name : " filtered realistic temperature" entity_id : sensor.realistic_temperature filters : - filter : outlier window_size : 4 radius : 2.0 - filter : lowpass time_constant : 10 - filter : time_simple_moving_average window_size : " 00:05" precision : 2
Filters can be chained and are applied according to the order present in the configuration file.
Configuration Variables
Looking for your configuration file?
entity_id string Required
The entity ID of the sensor to be filtered.
name string ( Optional )
Name to use in the frontend.
unique_id string ( Optional )
An ID that uniquely identifies the filter sensor. Set this to a unique value to allow customization through the UI.
filters list Required
Filters to be used.
filter string Required
Algorithm to be used to filter data. Available filters are lowpass , outlier , range , throttle , time_throttle and time_simple_moving_average .
precision integer ( Optional , default: 2 )
Defines the precision of the filtered state, through the argument of round().
window_size integer | time ( Optional , default: 1 )
Size of the window of previous states. Time based filters such as time_simple_moving_average will require a time period (size in time), while other filters such as outlier will require an integer (size in number of states). Time periods are in hh:mm format and must be quoted.
time_constant integer ( Optional , default: 10 )
See lowpass filter. Loosely relates to the amount of time it takes for a state to influence the output.
radius float ( Optional , default: 2.0 )
See outlier filter. Band radius from median of previous states.
type string ( Optional , default: last )
See time_simple_moving_average filter. Defines the type of Simple Moving Average.
lower_bound float ( Optional , default: negative infinity )
See range filter. Lower bound for filter range.
upper_bound float ( Optional , default: positive infinity )
See range filter. Upper bound for filter range.
Warning
When configuring a window_size that is not a time and with a value larger than the default of 1 , the database must examine nearly every stored state for that entity during Home Assistant startup. If you have modified the Recorder purge_keep_days value or have many states stored in the database for the filtered entity, this can cause your Home Assistant instance to respond poorly during startup.
The Low-pass filter ( lowpass ) is one of signal processing most common filters, as it smooths data by shortcutting peaks and valleys.
The included Low-pass filter is very basic and is based on exponential smoothing , in which the previous data point is weighted with the new data point.
B = 1.0 / time_constant A = 1.0 - B LowPass ( state ) = A * previous_state + B * state
The Outlier filter ( outlier ) is a basic Band-pass filter, as it cuts out any value outside a specific range.
The included Outlier filter will discard any value beyond a band centered on the median of the previous values, replacing it with the median value of the previous values. If inside the band, the current state is returned.
distance = abs ( state - median ( previous_states )) if distance > radius : median ( previous_states ) else : state
The Throttle filter ( throttle ) will only update the state of the sensor for the first state in the window. This means the filter will skip all other values.
To adjust the rate you need to set the window_size. To throttle a sensor down to 10%, the window_size should be set to 10, for 50% should be set to 2.
This filter is relevant when you have a sensor which produces states at a very high-rate, which you might want to throttle down for storing or visualization purposes.
The Time Throttle filter ( time_throttle ) will only update the state of the sensor for the first state in the window. This means the filter will skip all other values.
To adjust the rate you need to set the window_size. To throttle a sensor down to 1 value per minute, the window_size should be set to “00:01”.
This filter is relevant when you have a sensor which produces states at a very high inconstant rate, which you might want to throttle down to some constant rate for storing or visualization purposes.
The Time SMA filter ( time_simple_moving_average ) is based on the paper Algorithms for Unevenly Spaced Time Series: Moving Averages and Other Rolling Operators by Andreas Eckner.
The paper defines three types/versions of the Simple Moving Average (SMA): last , next and linear . Currently only last is implemented.
Theta, as described in the paper, is the window_size parameter, and can be expressed using time notation (e.g., “00:05” for a five minutes time window).
The Range filter ( range ) restricts incoming data to a range specified by a lower and upper bound.
All values greater then the upper bound are replaced by the upper bound and all values lower than the lower bound are replaced by the lower bound.
Per default there are neither upper nor lower bound.
if new_state > upper_bound : upper_bound if new_state < lower_bound : lower_bound new_state
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Filter helper was introduced in Home Assistant 0.65, and it's used by
1.9% of the active installations.
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
