---
source_url: "https://www.home-assistant.io/integrations/google_air_quality"
final_url: "https://www.home-assistant.io/integrations/google_air_quality"
canonical_url: "https://www.home-assistant.io/integrations/google_air_quality/"
source_handle: "web:www-home-assistant-io:4fb65a12fb01"
source_section: "integrations-google-air-quality"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "130e4f53a450bba3b5d108f1e67e147de7834c0408a39c3a87d82077eceafa16"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Google Air Quality - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/google_air_quality
- Final URL: https://www.home-assistant.io/integrations/google_air_quality
- Canonical URL: https://www.home-assistant.io/integrations/google_air_quality/
- Fetched at: 2026-06-28T02:46:25Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Google Air Quality into Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Configuration parameters
Supported functionality
Sensor
Removing the integration
To remove an integration instance from Home Assistant
The Google Air Quality integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides Air quality data through the Google Air Quality API.
You need an API key. Follow the instructions in the Google developer documentation for creating an API key.
Additionally, you have to create a Billing Account . At the time of writing this documentation, Google allows 10,000 API calls per month for free.
Important
This integration polls every 60 minutes. Here is an overview about how many API calls are performed per month in dependence of the amount of coordinates:
Coordinates API calls per month 1 800 2 1,600 3 2,400 4 3,200 5 4,000 10 8,000 12 9,600
Consider each restart of Home Assistant is an additional API call, per coordinate/entry.
You can set up a budget for your billing account. This does not limit your costs, but you can get an alert when you reach the budget.
You may want to set up disable billing with notifications . This can still produce costs between incurring costs and receiving budget notifications.
Make sure to monitor the cost. If you make too many requests, you will be charged for it. The integration cannot monitor it for you.
To add the Google Air Quality service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Google Air Quality .
Follow the instructions on screen to complete the setup.
API key
The API key, which is described in the prerequisites.
HTTP Referrer
Specify this only if the API key has a website application restriction.
Name
A display name for this location, such as Home or Work.
Latitude
Latitude of your location.
Longitude
Longitude of your location.
Custom local air quality index
If you want to set a custom local Air Quality Index (AQI) during the setup of the integration you can do this in this optional section.
Enable custom local AQI
Turn on to use a custom local AQI for this location.
Country
The country of your location.
Custom local AQI
The custom local AQI.
The integration will create the following sensors, if they are available for the selected region.
For your local air quality you can find more details here
Universal Air Quality Index (UAQI)
The global air quality index provided by Google. Ranges from 0 (worst) to 100 (best).
UAQI Category
Descriptive category for UAQI. Possible values include: Excellent air quality, Good air quality, Moderate air quality, Low air quality, Poor air quality.
UAQI Dominant Pollutant
The pollutant that most significantly influences the UAQI value. Possible values include: PM2.5, PM10, Ozone (O₃), Nitrogen Dioxide (NO₂), Sulphur Dioxide (SO₂), Carbon Monoxide (CO)
Local Air Quality Index
A regionally calibrated AQI value.
Local Category
Descriptive category for the local AQI. The values can differ from the ones set as UAQI Category.
Local Dominant Pollutant
The pollutant that most significantly influences the local AQI. The values can differ from the ones set as UAQI Dominant Pollutant.
Ammonia (CH₃)
Ammonia concentration.
Benzene (C₆H₆)
Benzene concentration.
Carbon Monoxide (CO)
Carbon monoxide concentration.
Nitrogen Dioxide (NO₂)
Nitrogen dioxide concentration.
Nitrogen Monoxide (NO)
Non-methane hydrocarbons (NMHC)
Non-methane hydrocarbons concentration.
Ozone (O₃)
Ground-level ozone concentration.
PM2.5
Particulate matter smaller than 2.5 µm in diameter.
PM10
Particulate matter smaller than 10 µm in diameter.
Sulphur Dioxide (SO₂)
Sulphur dioxide concentration.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Google Air Quality service was introduced in Home Assistant 2025.12, and it's used by
748 active installations.
Its IoT class is Cloud Polling.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@Thomas55555
Categories
Back to top
