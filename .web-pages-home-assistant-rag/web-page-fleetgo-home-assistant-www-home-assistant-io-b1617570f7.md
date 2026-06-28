---
source_url: "https://www.home-assistant.io/integrations/fleetgo"
final_url: "https://www.home-assistant.io/integrations/fleetgo"
canonical_url: "https://www.home-assistant.io/integrations/fleetgo/"
source_handle: "web:www-home-assistant-io:b1617570f770"
source_section: "integrations-fleetgo"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "925fa5c2f4c1d13fd34b793652c9d5afccd44215d7d14cb1ddaf82118bd93260"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# FleetGO - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/fleetgo
- Final URL: https://www.home-assistant.io/integrations/fleetgo
- Canonical URL: https://www.home-assistant.io/integrations/fleetgo/
- Fetched at: 2026-06-28T02:43:08Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to use a FleetGO as a device tracker.

## Extracted Text

On this page
Setup
Configuration
Available attributes
Related topics
The FleetGO integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to integrate your vehicles equipped with FleetGO hardware into Home Assistant. It allows you to see certain details about your vehicle, but also shows your vehicle on the map.
To use this integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] , you need an API key and API secret , which can be requested by contacting [email protected] .
To use this device tracker in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry device_tracker : - platform : fleetgo client_id : YOUR_CLIENT_ID client_secret : YOUR_CLIENT_SECRET username : YOUR_FLEETGO_USERNAME password : YOUR_FLEETGO_PASSWORD include : - LICENSE_PLATE
Configuration Variables
Looking for your configuration file?
client_id string Required
The client ID used to connect to the FleetGO API.
client_secret string Required
The client secret used to connect to the FleetGO API.
username string Required
Your FleetGO username.
password string Required
Your FleetGO password.
include list ( Optional )
A list of license plates to include, if this is not specified, all vehicles will be added.
See the device tracker integration page for instructions on how to configure the people to be tracked.
Attribute Description latitude The latitude of your vehicle longitude The longitude of your vehicle altitude Altitude of your vehicle id Identifier used to identify your vehicle make The make of the vehicle model Model of your vehicle license_plate License plate number active If the engine is currently active or not odo The odometer in kilometers speed The current speed of your vehicle, in KM/h last_seen The date and time when your vehicle last communicated with the API fuel_level Fuel level of the vehicle [1] malfunction_light Are any malfunction lights burning [1] coolant_temperature Temperature of the coolant [1] power_voltage Power voltage measured by the hardware [1] distance_from_home How far is your vehicle located from your Home Assistant Home location current_max_speed The maximum speed on the road the device is currently on (if available) current_address Object with address information the device is currently on. This resolves to the closest address to the coordinates of the device.
[1] Only available on certain cars and hardware revisions.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The FleetGO integration was introduced in Home Assistant 0.76, and it's used by
1 active installations.
Its IoT class is Cloud Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Car
Back to top
