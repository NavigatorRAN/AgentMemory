---
source_url: "https://www.home-assistant.io/dashboards/energy"
final_url: "https://www.home-assistant.io/dashboards/energy"
canonical_url: "https://www.home-assistant.io/dashboards/energy/"
source_handle: "web:www-home-assistant-io:459ecf73c950"
source_section: "dashboards-energy"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "11a10c9630731040bfb526ea7c4e568e54feec3ecf737fe66f77857a49499398"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Energy cards - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/dashboards/energy
- Final URL: https://www.home-assistant.io/dashboards/energy
- Canonical URL: https://www.home-assistant.io/dashboards/energy/
- Fetched at: 2026-06-28T02:18:55Z
- Content type: text/html; charset=UTF-8

## Description

An overview of the energy cards and badges that are available.

## Extracted Text

On this page
Energy date picker
YAML configuration
Example
Energy compare alert
Energy usage graph
Solar production graph
Gas consumption graph
Water consumption graph
Water Sankey graph
Examples
Energy distribution
Energy sources table
Grid neutrality gauge
Grid energy balance
Solar consumed gauge
Carbon consumed gauge
Self-sufficiency gauge
Devices energy graph
Detail devices energy graph
Sankey energy graph
Power flow Sankey graph
Power sources graph
Power consumption badge
Gas flow rate badge
Water flow rate badge
Using multiple collections
Related topics
This is a list of all the cards and badges used in the energy dashboard. You can also place them anywhere you want in your dashboard.
You can add these cards using the visual card editor or by editing the YAML directly. In the visual editor, these are located in the Energy cards section of the card picker dialog.
You can configure them on the energy configuration page .
Screenshot of the Energy date selection card.
This card allows you to pick what data to show. Changing it in this card will influence the data in all other cards.
Specific dates and ranges can be selected by opening the date range picker. The current period can be compared to the previous one using the compare data option within the menu.
The following YAML options are available:
Configuration Variables
Looking for your configuration file?
type string Required
energy-date-selection
collection_key string ( Optional )
Collection key to use for the card. This links the card to a specific energy dashboard collection. If not provided, defaults to the current dashboard page URL.
vertical_opening_direction string ( Optional , default: auto )
up , down or auto . Determines the vertical direction to open the date range picker. auto changes it based on the screen size.
opening_direction string ( Optional , default: auto )
left , right , center or auto . Determines the horizontal direction to open the date range picker. auto changes it based on the screen size.
disable_compare boolean ( Optional , default: false )
When true, will disable the option to compare data periods.
type : energy-date-selection
Screenshot of the energy compare alert card.
This card shows which date ranges are being compared, and provides the option to switch between different compare modes.
The card is only visible when comparing data periods, otherwise it will be hidden.
energy-compare-card
type : energy-compare-card
Screenshot of the Energy usage graph card.
The energy usage graph card shows the amount of energy your house has consumed, and from what source this energy came.
It will also show the amount of energy your have returned to the grid.
energy-usage-graph
title string ( Optional )
When defined, shows a card header with the title string and total energy consumed chip.
type : energy-usage-graph
Screenshot of the Solar production graph card.
The solar production graph card shows the amount of energy your solar panels have produced per source, and if setup and available the forecast of the solar production.
energy-solar-graph
When defined, shows a card header with the title string and total solar produced chip.
type : energy-solar-graph
Screenshot of the gas consumption graph card.
The gas consumption graph card shows the amount of gas consumed per source.
energy-gas-graph
When defined, shows a card header with the title string and total gas consumed chip.
type : energy-gas-graph
Screenshot of the water consumption graph card.
The water consumption graph card shows the amount of water consumed per source.
energy-water-graph
When defined, shows a card header with the title string and total water consumed chip.
type : energy-water-graph
Screenshot of the water sankey graph card.
The water Sankey graph shows the flow of water consumption in your home. It visualizes how water flows from sources to the various consumers. Devices are grouped into floors and areas if these are configured.
This card displays historical water data based on the selected date range from the energy date picker.
water-sankey
The title of the card.
layout string ( Optional , default: auto )
vertical , horizontal or auto . Determines the orientation (flow direction) of the card. auto changes it based on the screen size.
group_by_area boolean ( Optional , default: true )
Whether to group the devices by area
group_by_floor boolean ( Optional , default: true )
Whether to group the devices by floor
type : water-sankey
The following example orients the flow from left to right:
type : water-sankey layout : horizontal
Screenshot of the Energy distribution card.
The energy distribution card shows how the energy flowed, from the grid to your house, from your solar panels to your house and/or back to the grid.
If setup, it will also tell you how many kWh of the energy you got from the grid was produced without using fossil fuels.
energy-distribution
link_dashboard boolean ( Optional , default: false )
Whether to include a link to the energy dashboard.
type : energy-distribution link_dashboard : true
Screenshot of the Energy sources table card.
The energy sources table card shows all your energy sources, and the corresponding amount of energy.
If setup, it will also show the costs and compensation per source and the total.
energy-sources-table
types list ( Optional )
If defined, table displays listed types of consumption only. Valid values are: grid , solar , battery , gas , and water .
show_only_totals boolean ( Optional , default: false )
Display table as a summarized version with only the resource totals listed.
type : energy-sources-table types : - gas - water
Screenshot of the Grid neutrality gauge card.
The grid neutrality gauge card represents your energy dependency. If the needle is in the purple, you returned more energy to the grid than you consumed from it. If it’s in the blue, you consumed more energy from the grid than you returned.
type : energy-grid-neutrality-gauge
Screenshot of the Grid energy balance card.
The grid energy balance card shows your net grid energy as an equation: imported energy minus exported energy. A positive value means you imported more energy from the grid than you exported. A negative value means you exported more energy to the grid than you imported. It includes a visual bar gauge that represents the ratio between imported and exported energy, with the bar filling from a center line toward the dominant direction.
type : energy-grid-balance
Screenshot of the Solar consumed gauge card.
The solar consumed gauge represents how much of the solar energy was used by your home and was not returned to the grid. If you frequently return a lot, try to conserve this energy by installing a battery or buying an electric car to charge.
type : energy-solar-consumed-gauge
Screenshot of the Carbon consumed gauge card.
The carbon consumed gauge card represents how much of the energy consumed by your home was generated using non-fossil fuels like solar, wind and nuclear. It includes the solar energy you generated your self.
type : energy-carbon-consumed-gauge
Screenshot of the self-sufficiency gauge card.
The self-sufficiency gauge represents how self-sufficient your home is. If you rely on grid imports, this value decreases. You can increase this value by adding more solar capacity or battery storage.
type : energy-self-sufficiency-gauge
Screenshot of the devices energy graph card.
The devices energy graph shows the energy usage per device. It is sorted by usage.
energy-devices-graph
max_devices integer ( Optional )
By default, this card will show all your devices. Optionally, the number of devices can be limited by adding the max_devices option and specifying the maximum number of devices to show. If there are more devices available than shown, the devices with the highest energy usage are shown.
hide_compound_stats boolean ( Optional , default: false )
Hide upstream energy devices like breakers. These are devices that are set as included_in_stat of another device.
type : energy-devices-graph
The following example limits the number of shown devices to 5:
type : energy-devices-graph max_devices : 5
Screenshot of the detail devices energy graph card.
The Detail devices energy graph card is similar to the Devices energy graph card, but shows the individual usage on a time scale.
type : energy-devices-detail-graph
type : energy-devices-detail-graph max_devices : 5
Screenshot of the sankey energy graph card.
The sankey energy graph shows the flow of energy in your home. It starts with sources and flows into the various consumers. Devices are grouped into floors and areas if these are configured.
energy-sankey
type : energy-sankey
The following example orients the flow from top to bottom:
type : energy-sankey layout : vertical
Screenshot of the power Sankey graph card.
The power Sankey graph shows the real-time flow of power in your home. Unlike the energy Sankey card, which shows historical energy data based on the selected date range, this card displays current power values and is not affected by the date picker selection.
It visualizes the instantaneous power flow from sources (like the grid, solar panels, and battery) to consumers in your home. Devices are grouped into floors and areas if these are configured.
power-sankey
type : power-sankey
type : power-sankey layout : horizontal
The power sources graph shows historical power data.
power-sources-graph
show_legend boolean ( Optional , default: true )
Show or hide the legend
type : power-sources-graph
Screenshot of the power consumption badge.
The power consumption badge displays the current total power consumption of your home. It calculates the total power by combining grid import, solar, and battery sources.
power-total
collection_key string ( Optional , default: energy_dashboard )
Collection key to use for the badge. This links the badge to a specific energy dashboard collection. Defaults to energy_dashboard .
type : power-total
Screenshot of the gas flow rate badge.
The gas flow rate badge displays the current total gas flow rate from all configured gas sources.
gas-total
type : gas-total
Screenshot of the water flow rate badge.
The water flow rate badge displays the current total water flow rate from all configured water sources.
water-total
type : water-total
By default, all energy cards on the current dashboard are linked together. Any energy-date-selection cards on this dashboard control what data is shown. If there are none, a default date of today is used. When you add multiple date selection cards, they always show the same date. Any energy-date-selection card on a different dashboard does not affect energy cards on the current dashboard.
To enable multiple different date selections on the same dashboard, they must be linked to different collections. This is done using the collection_key parameter, either in the visual editor or in the card YAML, with a value of any custom string that begins with energy_ (strings that do not start with energy_ will generate an error).
All energy cards support use of collection_key option.
Example view with multiple collections:
type : masonry path : example cards : - type : energy-date-selection - type : energy-date-selection collection_key : energy_2 # This card is linked to the first (default) date selection - type : energy-usage-graph # This card is linked to the second date selection - type : energy-usage-graph collection_key : energy_2
Themes
Dashboard cards
Dashboard badges
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
Dashboard basics
Introduction
Dashboard types
Views
Cards
Badges
View types
Masonry
Panel
Sections (default)
Sidebar
Card types
Activity
Alarm panel
Area
Button
Calendar
Clock
Conditional
Distribution
Energy cards
Entities
Entity
Entity filter
Gauge
Glance
Grid
Heading
History graph
Horizontal stack
Humidifier
Light
Map
Markdown
Media control
Picture
Picture elements
Picture entity
Picture glance
Plant status
Sensor
Shortcut
Statistic
Statistics graph
Thermostat
Tile
To-do list
Vertical stack
Weather forecast
Webpage
Dashboard configuration
Card features
Card headers & footers
Dashboard actions
Developing custom cards
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
