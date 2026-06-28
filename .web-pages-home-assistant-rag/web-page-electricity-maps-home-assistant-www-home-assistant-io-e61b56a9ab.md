---
source_url: "https://www.home-assistant.io/integrations/co2signal"
final_url: "https://www.home-assistant.io/integrations/co2signal"
canonical_url: "https://www.home-assistant.io/integrations/co2signal/"
source_handle: "web:www-home-assistant-io:e61b56a9ab51"
source_section: "integrations-co2signal"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "bb0326b4fd1214a2ba935172ee08c967703c75325eb60c67b802a1e495ba22e3"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Electricity Maps - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/co2signal
- Final URL: https://www.home-assistant.io/integrations/co2signal
- Canonical URL: https://www.home-assistant.io/integrations/co2signal/
- Fetched at: 2026-06-28T02:34:21Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to use the Electricity Maps (formerly known as CO2Signal) data within Home Assistant

## Extracted Text

On this page
Use case
Prerequisites
Configuration
Supported functionality
Sensors
Examples
Creating a dashboard card
Automation example: Run appliances when carbon intensity is low
Creating a history graph to track changes
Energy Dashboard integration
Data updates
Known limitations
Troubleshooting
Integration fails to set up
Sensors show “unavailable”
Removing the integration
To remove an integration instance from Home Assistant
The Electricity Maps integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] (formerly known as CO2Signal) queries the Electricity Maps API for the CO2 intensity of a specific region.
Data can be collected for your home by using the home location, latitude/longitude, or a zone key.
This API uses the same data as shown on the Electricity Maps app .
Not all countries/regions in the world are supported, so please check the app to verify local availability before setting up the integration.
The Electricity Maps integration helps you understand the carbon intensity of your electricity grid in real-time. This information can be valuable for:
Timing energy-intensive tasks (like charging electric vehicles or running appliances) during periods of lower carbon intensity.
Creating automations that respond to changing grid conditions.
Visualizing your region’s progress towards cleaner energy.
Understanding how weather conditions affect renewable energy availability in your area.
Tracking the carbon impact of your home’s energy usage in the Energy Dashboard .
To configure and use this integration, you need to obtain a free API key from Electricity Maps by signing up to the Free Tier product on the Electricity Maps API Portal .
Please be aware that the Free Tier API is limited to one location, called a zone. A zone represents a specific electricity grid region. These zones don’t match your utility provider. You need to select and specify the zone for your home location when creating your account. For example, the United States has multiple zones like US-CENT-SWPP (Southwest Power Pool), US-CAR-DUK (Duke Energy Carolinas), or US-CAR-CPLE (Duke Energy Progress East).
To find your zone identifier, you can:
Check the Electricity Maps app to see which zone covers your location. You can get the exact zone key from the URL. For France, the URL looks like .../map/zone/FR/live/... . The zone key is after .../zone/{zone key} . In this case, it would be FR .
Use the Coverage table to find zones by geographic regions.
To add the Electricity Maps service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Electricity Maps .
Follow the instructions on screen to complete the setup.
The integration provides the following configuration options when setting it up:
Location
Choose between using your Home Assistant’s configured home location, a specific zone key, or custom latitude/longitude coordinates.
API key
The API key obtained from the Electricity Maps API Portal.
When configuring the location based on latitude/longitude, you will be prompted to enter the following:
Latitude
The latitude of your home location.
Longitude
The longitude of your home location.
When configuring the location based on a zone key, you will be prompted to enter the following:
Zone key
The zone key for your home location. For most countries, this is the two-letter ISO 3166-1 alpha-2 country code (for example, DE for Germany, GB for Great Britain). However, for the United States, you need to specify a zone key that includes the specific electricity grid region, such as US-CENT-SWPP for the Southwest Power Pool, US-CAR-DUK for Duke Energy Carolinas, or US-CAR-CPLE for Duke Energy Progress East. You can find zone key in the Electricity Maps app or using the Zones API reference .
The integration creates two sensors for each configured location:
Carbon intensity : Shows the carbon intensity of electricity production in your area, measured in gCO2eq/kWh (grams of CO2 equivalent per kilowatt-hour).
Fossil fuel percentage : Shows what percentage of the electricity grid currently relies on fossil fuels for production.
You can create a gauge card to visualize the carbon intensity of your electricity:
type : gauge entity : sensor.electricity_maps_carbon_intensity name : Carbon Intensity min : 0 max : 500 severity : green : 0 yellow : 150 red : 300
This automation starts your dishwasher when the carbon intensity drops below a specific threshold:
alias : " Run Dishwasher at Low Carbon Intensity" description : " Starts the dishwasher when carbon intensity is low" trigger : - platform : numeric_state entity_id : sensor.electricity_maps_carbon_intensity below : 100 for : minutes : 10 condition : - condition : time after : " 22:00:00" before : " 06:00:00" - condition : state entity_id : binary_sensor.dishwasher_ready state : " on" actions : - action : switch.turn_on target : entity_id : switch.dishwasher - action : notify.send_message target : entity_id : notify.my_device data : message : " Dishwasher started during low carbon intensity period ({{ states('sensor.electricity_maps_carbon_intensity') }} gCO2eq/kWh)"
Add this to your dashboard to track how carbon intensity changes throughout the day:
type : history-graph entities : - entity : sensor.electricity_maps_carbon_intensity name : Carbon Intensity hours_to_show : 24 refresh_interval : 60
The Electricity Maps integration is automatically used on the Energy Dashboard when set up. The carbon intensity data appears in the Energy Dashboard as a real-time gauge showing the carbon footprint of your household electricity usage.
You don’t need to manually configure anything - the integration is automatically detected and used by the Energy Dashboard to calculate and display your home’s carbon emissions based on your energy consumption and the current grid carbon intensity.
To view this information:
Navigate to the Energy Dashboard .
Look for the carbon intensity gauge in the dashboard.
If you don’t see the carbon information in your Energy Dashboard:
Make sure the Electricity Maps integration is properly set up and working.
Verify that you have energy monitoring configured in Home Assistant.
The integration polls Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] data from the Electricity Maps API every 15 minutes by default. The actual update frequency may be limited by your API tier’s rate limits.
The Free Tier API is limited to one zone. A zone represents a specific electricity grid region. You need to specify the zone when creating your account. If you need to change zones, you will need to delete and reconfigure the integration.
The Free Tier API has a limit of 50 requests per hour, but the integration is designed to poll at a rate that won’t exceed this limit.
Not all geographic regions are supported by Electricity Maps. Check their app to see if your region has coverage.
Symptom: “The given token is invalid” during setup
If you see an invalid token error during setup, your API key may be invalid or expired.
Resolution
Verify that you’ve correctly copied the API key from the Electricity Maps API portal.
Check if your API key is still active in the Electricity Maps API portal.
Try generating a new API key if the issue persists.
Symptom: “No data available for selected location” during setup
If you receive a “No data available for selected location” error, the coordinates or zone key you provided might not be supported by Electricity Maps, or there may be a zone mismatch.
Check the Electricity Maps app to verify coverage for your location.
If using a zone key, verify that you’re using the correct format. For the United States for example, you should use a specific zone key like US-CENT-SWPP rather than just US . For country level data, use the two-letter ISO country code.
Make sure the zone key you enter in Home Assistant matches the zone you selected when you created your API key. If you need to change zones, you will need to create a new API key with the new zone and reconfigure the integration.
Try using a zone key instead of coordinates. This is more accurate and less error prone.
If your exact location isn’t supported, try using the nearest supported location.
If your sensors show as “unavailable” after successful setup, there might be issues with the API connection.
Check your internet connection.
Verify that your API key still has available quota for the day.
Check if the Electricity Maps service is experiencing downtime.
Restart Home Assistant if the issue persists.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Electricity Maps service was introduced in Home Assistant 0.87, and it's used by
12.2% of the active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@jpbede
@VIKTORVAV99
Categories
Climate
Energy
Environment
Back to top
