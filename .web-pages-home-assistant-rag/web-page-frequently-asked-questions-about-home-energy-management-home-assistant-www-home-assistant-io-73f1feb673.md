# Frequently Asked Questions about home energy management - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/docs/energy/faq
- Final URL: https://www.home-assistant.io/docs/energy/faq
- Canonical URL: https://www.home-assistant.io/docs/energy/faq/
- Fetched at: 2026-06-28T02:21:58Z
- Content type: text/html; charset=UTF-8

## Description

Home energy management is a vast topic and not everything might be clear. This page tries to clarify a couple of things.

## Extracted Text

On this page
Energy vs power
Creating an energy sensor out of a power sensor
Split consumption by tariffs
Setting up a dedicated solar export connection in the Energy dashboard
The Energy dashboard is not visible
Troubleshooting missing entities
Condition
Resolution
People often confuse power with energy ; they are different physical quantities. Power is the rate at which energy is transferred or converted (how fast), while energy is the amount that has been transferred or converted (how much).
Power is measured in watts (W) and energy is commonly measured in kilowatt-hours (kWh). Think of this as analogous to speed and distance: power is like the speed at which you are travelling, and energy is like the distance driven.
Mathematically, energy is the integral of power over time. When working with sampled power values, the energy over an interval is the time integral of power (or a numerical approximation computed from the samples).
This distinction is important because you need to use the correct entities in the Energy dashboard.
Since Home Assistant works with discrete samples of power rather than continuous power functions, you can’t obtain an exact energy value by integrating from a single, sparsely sampled stream. Instead, you must approximate the integral from the available samples.
If you can sample power values frequently enough (for example, every few seconds), you can reliably estimate transferred energy using numerical approximations such as Riemann sums .
If you are using a third-party device (for example, not reading directly from your utility meter or from the utility provider’s cloud service) you need Home Assistant to split your energy measurements into two or more tariffs in accordance with your utility provider contract.
To accomplish this, you can use the utility_meter integration . With this integration you define as many tariffs as required by your utility provider.
If you have a solar installation with a dedicated grid connection that is used only for exporting production—separate from the main household consumption grid connection—you can configure the energy dashboard as follows:
If not configured yet, add your main household grid connection as a Grid source with Energy imported from grid , Energy exported to grid , and Power measurement configured as normal. Do not add any sensor for the separate solar production to this connection.
Add your inverter production energy and power sensors as a Solar panels source, as usual.
Add the dedicated solar grid connection as a Grid source.
Configure Energy exported to grid and leave Energy imported from grid empty, as this connection never imports.
Set the Power measurement sensor for this connection to a sensor that reads the export power.
Set the Type of power measurement setting to Inverted so that the value is negative when exporting to the grid. Most inverters report export power as a positive value.
On the Export compensation setting, select one of the desired cost tracking options. Leave the Cost tracking setting empty.
With this setup, the dashboard correctly attributes solar production exported via the dedicated connection as Solar → Grid .
If you do not see the Energy dashboard in the sidebar, make sure you have not removed default_config: from your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] . If you have, you will need to enable the integrations and UI elements required for the dashboard to appear.
You are trying to add a sensor to the Energy dashboard, but it does not appear in the selection list.
To find out why the sensor is not showing, check the following points:
The sensor must have the appropriate attributes. Check your entity attributes in Settings > Developer tools > States to confirm the following:
device_class must be energy or power for electricity grid, solar, or battery categories. It must be gas for gas, or water for water.
state_class must be measurement for power sensors and total or total_increasing for all others.
The sensor must have an appropriate unit_of_measurement . See the help text for each category to see which units are accepted. Units containing an exponent must match superscript characters exactly.
If any of the attributes are not correct, please open an issue against the integration that provides your sensor, or if you are developing custom template sensors, make sure the templates have the correct attributes.
The entity must be a sensor . If you are trying to add something from another domain (for example an input_number ), then you must first create a template sensor from it.
The entity must not have any statistics errors. Go to Settings > Developer tools > Statistics to check your specific entity. If your unit has a listed issue here, address that first.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View given feedback
Documentation
Overview
|
FAQ
Glossary
Automations
Dashboards
Voice assistants
Organization
Home energy management
Electricity grid
Solar panels
Home batteries
Gas usage
Water usage
Individual devices
Templating
Common tasks
Configuration
Authentication
Tools and helpers
iOS and Android apps
Official hardware
Home Assistant Green
Home Assistant Connect ZBT-1
Home Assistant Connect ZBT-2
Home Assistant Connect ZWA-2
Home Assistant Yellow
Home Assistant Voice Preview Edition
Back to top
