---
source_url: "https://www.home-assistant.io/integrations/sensor"
final_url: "https://www.home-assistant.io/integrations/sensor"
canonical_url: "https://www.home-assistant.io/integrations/sensor/"
source_handle: "web:www-home-assistant-io:69a8f4e7ac63"
source_section: "integrations-sensor"
collection: "home-assistant-docs"
doc_type: "code-documentation"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "9d76710ad62d7ecfc022e3274935ea9eb8e21c27fbb26cd0e47efe688dd67d11"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "code-docs"
---

# Sensor - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/sensor
- Final URL: https://www.home-assistant.io/integrations/sensor
- Canonical URL: https://www.home-assistant.io/integrations/sensor/
- Fetched at: 2026-06-28T03:14:36Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up your sensors with Home Assistant.

## Extracted Text

On this page
The state of a sensor entity
Device class
Related topics
Sensors are a basic integration in Home Assistant. They monitor the states and conditions of a variety of entities. An entity can be many things. This can include a physical device like a motion sensor that reports the battery level, a web service that retrieves the weather temperature, a built-in function that calculates the sun’s elevation relative to your GPS position, or even a custom sensor you may have created to report the free space on your laptop. These are all things reporting different types of information.
Some of these sensors are built-in to Home Assistant, some are created automatically when you add an integration (see this list ), and some can be created manually. The Statistics and Template sensors are two examples of the last case.
The state of a sensor entity is its currently detected value, which can be either text or a number.
Screenshot showing the state of a sensor entity in the developer tools.
In addition, the entity can have the following states:
Unavailable : The entity is currently unavailable.
Unknown : The state is not yet known.
A device class is a measurement categorization in Home Assistant. It influences how the entity is represented in the dashboard . This can be modified in the customize section . For example, different states may be represented by different icons, colors, or text.
The screenshot shows different icons representing different device classes for sensors:
Example of various device class icons for sensors.
The following device classes are supported for sensors:
None : Generic sensor. This is the default and doesn’t need to be set.
absolute_humidity : Absolute humidity in g/m³, mg/m³.
apparent_power : Apparent power in mVA, VA or kVA.
aqi : Air Quality Index (unitless).
area : Area in m², cm², km², mm², in², ft², yd², mi², ac, ha
atmospheric_pressure : Atmospheric pressure in cbar, bar, hPa, mmHg, inHg, kPa, mbar, Pa or psi
battery : Percentage of battery that is left in %
blood_glucose_concentration : Blood glucose concentration in mg/dL, mmol/L
carbon_dioxide : Carbon Dioxide (CO₂) concentration in ppm
carbon_monoxide : Carbon Monoxide (CO) concentration in ppb, ppm, µg/m³, mg/m³
conductivity : Conductivity in S/cm, mS/cm, or µS/cm
current : Current in A, mA, µA
data_rate : Data rate in bit/s, kbit/s, Mbit/s, Gbit/s, B/s, kB/s, MB/s, GB/s, KiB/s, MiB/s or GiB/s
data_size : Data size in bit, kbit, Mbit, Gbit, B, kB, MB, GB, TB, PB, EB, ZB, YB, KiB, MiB, GiB, TiB, PiB, EiB, ZiB or YiB
date : Date string (ISO 8601)
distance : Generic distance in km, m, cm, mm, mi, nmi, yd, or in
duration : Duration in d, h, min, s, ms, or µs
energy : Energy in J, kJ, MJ, GJ, mWh, Wh, kWh, MWh, GWh, TWh, cal, kcal, Mcal, or Gcal
energy_distance : Energy per distance in kWh/100km, Wh/km, mi/kWh, or km/kWh.
energy_storage : Stored energy in J, kJ, MJ, GJ, mWh, Wh, kWh, MWh, GWh, TWh, cal, kcal, Mcal, or Gcal
enum : Has a limited set of (non-numeric) states
frequency : Frequency in mHz, Hz, kHz, MHz, or GHz
gas : Gas volume in L, m³, ft³, CCF, or MCF
humidity : Percentage of humidity in the air in %
illuminance : The current light level in lx
irradiance : Irradiance in W/m² or BTU/(h⋅ft²)
moisture : Percentage of water in a substance in %
monetary : The monetary value ( ISO 4217 )
nitrogen_dioxide : Concentration of Nitrogen Dioxide in ppb, ppm, µg/m³
nitrogen_monoxide : Concentration of Nitrogen Monoxide in ppb, µg/m³
nitrous_oxide : Concentration of Nitrous Oxide in µg/m³
ozone : Concentration of Ozone in ppb, ppm, or µg/m³
ph : Potential hydrogen (pH) value of a water solution
pm1 : Concentration of particulate matter less than 1 micrometer in µg/m³
pm25 : Concentration of particulate matter less than 2.5 micrometers in µg/m³
pm4 : Concentration of particulate matter less than 4 micrometers in µg/m³
pm10 : Concentration of particulate matter less than 10 micrometers in µg/m³
power_factor : Power factor (unitless), unit may be None or %
power : Power in mW, W, kW, MW, GW or TW
precipitation : Accumulated precipitation in cm, in or mm
precipitation_intensity : Precipitation intensity in in/d, in/h, mm/d or mm/h
pressure : Pressure in mPa, Pa, hPa, kPa, bar, cbar, mbar, mmHg, inHg, inH₂O or psi
reactive_energy : Reactive energy in varh or kvarh
reactive_power : Reactive power in mvar, var, or kvar
signal_strength : Signal strength in dB or dBm
sound_pressure : Sound pressure in dB or dBA
speed : Generic speed in ft/s, in/d, in/h, in/s, km/h, kn, m/s, mph, mm/d, or mm/s
sulphur_dioxide : Concentration of sulphur dioxide in ppb or µg/m³
temperature : Temperature in °C, °F or K
temperature_delta : Temperature difference between two measurements in °C, °F, or K
timestamp : Datetime object or timestamp string (ISO 8601)
uptime : Last boot time as datetime object or timestamp string (ISO 8601)
volatile_organic_compounds : Concentration of volatile organic compounds in µg/m³ or mg/m³
volatile_organic_compounds_parts : Ratio of volatile organic compounds in ppm or ppb
voltage : Voltage in V, mV, µV, kV, MV
volume : Generic volume in L, mL, gal, fl. oz., m³, ft³, CCF, or MCF
volume_flow_rate : Volume flow rate in m³/h, m³/min, m³/s, ft³/min, L/h, L/min, L/s, gal/d, gal/h, gal/min, or mL/s
volume_storage : Generic stored volume in L, mL, gal, fl. oz., m³, ft³, CCF, or MCF
water : Water consumption in L, gal, m³, ft³, CCF, or MCF
weight : Generic mass in kg, g, mg, µg, oz, lb, or st
wind_direction : Wind direction in °
wind_speed : Wind speed in Beaufort, ft/s, km/h, kn, m/s, or mph
Customizing devices
Dashboard
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Sensor entity was introduced in Home Assistant 0.7.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Categories
Sensor
Back to top
