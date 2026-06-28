---
source_url: "https://www.home-assistant.io/integrations/ads"
final_url: "https://www.home-assistant.io/integrations/ads"
canonical_url: "https://www.home-assistant.io/integrations/ads/"
source_handle: "web:www-home-assistant-io:ddbb07b67dcc"
source_section: "integrations-ads"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "eb44be7bf208825d78f9aca73a0d8a64c7e8c0990631f16dd8243ced4b89dc4d"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# ADS - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/ads
- Final URL: https://www.home-assistant.io/integrations/ads
- Canonical URL: https://www.home-assistant.io/integrations/ads/
- Fetched at: 2026-06-28T02:26:05Z
- Content type: text/html; charset=UTF-8

## Description

Connect Home Assistant to TwinCAT devices via the ADS interface.

## Extracted Text

On this page
Configuration
List of actions
Binary sensor
Light
Sensor
Switch
Cover
Select
Valve
Related topics
The ADS (automation device specification) integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] describes a device-independent and fieldbus-independent interface for communication between Beckhoff automation devices running TwinCAT and other devices implementing this interface.
There is currently support for the following device types within Home Assistant:
To enable ADS, add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry ads : device : " 127.0.0.1.1.1" port : 801
Configuration Variables
Looking for your configuration file?
device string Required
The AMS NetId that identifies the device.
port integer Required
The port that runs the AMS server on the device, typically this would be 801 or 851.
ip_address string ( Optional )
The IP address of the ADS device, if not set the first 4 bytes of the device id will be used.
The ADS integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Write data by name ( ads.write_data_by_name )
Writes a value to a variable on a connected ADS device.
For an overview of every action across all integrations, see the actions reference .
The ads binary sensor platform can be used to monitor a boolean value on your ADS device.
To use your ADS device, you first have to set up your ADS hub and then add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more]
file:
# Example configuration.yaml entry binary_sensor : - platform : ads adsvar : .boolean1
adsvar string Required
The name of the variable that you want to access on the ADS device.
name string ( Optional )
An identifier for the binary sensor in the frontend.
device_class string ( Optional )
Sets the class of the device , changing the device state and icon that is displayed on the frontend.
The ads light platform allows you to control your connected ADS lights.
# Example configuration.yaml entry light : - platform : ads adsvar : GVL.enable_light adsvar_brightness : GVL.brightness adsvar_color_temp_kelvin : GVL.color_temp_kelvin min_color_temp_kelvin : 2700 max_color_temp_kelvin : 6500
The name of the boolean variable that switches the light on.
adsvar_brightness string ( Optional )
The name of the variable that controls the brightness. Use an unsigned integer on the PLC side.
adsvar_color_temp_kelvin string ( Optional )
The name of the variable that controls the color temperature in Kelvin. Use an unsigned integer on the PLC side.
min_color_temp_kelvin integer ( Optional , default: 2000 )
The minimum color temperature in Kelvin.
max_color_temp_kelvin integer ( Optional , default: 6500 )
The maximum color temperature in Kelvin.
An identifier for the light in the frontend.
The ads sensor platform allows reading the value of a numeric variable on your ADS device. The variable can be of type BOOL , BYTE , INT , UINT , SINT , USINT , DINT , UDINT , WORD , DWORD , REAL , or LREAL .
# Example configuration.yaml entry sensor : - platform : ads adsvar : GVL.temperature unit_of_measurement : " °C" adstype : int
The name of the variable that you want to access.
adstype string ( Optional , default: int )
The data type of the ADS variable. Possible values: bool , byte , int , uint , sint , usint , dint , udint , word , dword , real , and lreal .
An identifier for the sensor.
factor integer ( Optional , default: 1 )
A factor that divides the stored value before displaying it in Home Assistant.
The factor can be used to implement fixed decimals. For example, set factor to 100 if you want to display a fixed decimal value with two decimals. A variable value of 123 will be displayed as 1.23 .
The ads switch platform accesses a boolean variable on the connected ADS device. The variable is identified by its name.
# Example configuration.yaml entry switch : - platform : ads adsvar : .global_bool
An identifier for the switch in the frontend.
The ads cover platform allows you to control your connected ADS covers.
# Example configuration.yaml entry cover : - platform : ads name : Curtain master bed room adsvar : covers.master_bed_room_is_closed adsvar_open : covers.master_bed_room_open adsvar_close : covers.master_bed_room_close adsvar_stop : covers.master_bed_room_stop device_class : curtain
The name of the boolean variable that returns the current status of the cover ( true means closed).
adsvar_position string ( Optional )
The name of the variable that returns the current cover position. Use a byte variable on the PLC side.
adsvar_set_position string ( Optional )
The name of the variable that sets the new cover position. Use a byte variable on the PLC side.
adsvar_open string ( Optional )
The name of the boolean variable that triggers the cover to open.
adsvar_close string ( Optional )
The name of the boolean variable that triggers the cover to close.
adsvar_stop string ( Optional )
The name of the boolean variable that triggers the cover to stop.
An identifier for the cover in the frontend.
device_class device_class ( Optional )
The ads select entity accesses an ENUM (int) variable on the connected ADS device. The variable is identified by its name. You have to set up a corresponding ENUM in the TwinCAT PLC. It is recommended to use explicit values starting from 0 .
TYPE E_SampleA :
(
e1 := 0,
e2 := 1,
e3 := 2,
);
END_TYPE
# Example configuration.yaml entry select : - platform : ads adsvar : MAIN.eMyEnum options : - " Off" - " Setup" - " Automatic" - " Manual" - " Guest" - " Error"
options string Required
The available options to select from.
An identifier for the select in the frontend.
The ads valve entity accesses a boolean variable on the connected ADS device. The variable is identified by its name.
# Example configuration.yaml entry valve : - platform : ads adsvar : MAIN.bValveControl
An identifier for the valve in the frontend.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The ADS integration was introduced in Home Assistant 0.60, and it's used by
91 active installations.
Its IoT class is Local Push.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@mrpasztoradam
Categories
Hub
Back to top
