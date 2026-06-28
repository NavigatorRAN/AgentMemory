---
source_url: "https://www.home-assistant.io/integrations/geofency"
final_url: "https://www.home-assistant.io/integrations/geofency"
canonical_url: "https://www.home-assistant.io/integrations/geofency/"
source_handle: "web:www-home-assistant-io:08639e27422f"
source_section: "integrations-geofency"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "315a32ba4f581b9903d92e9754ba1f6b65729a1b2f7c9a46a620f5a045d2b60a"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Geofency - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/geofency
- Final URL: https://www.home-assistant.io/integrations/geofency
- Canonical URL: https://www.home-assistant.io/integrations/geofency/
- Fetched at: 2026-06-28T02:45:50Z
- Content type: text/html; charset=UTF-8

## Description

Instructions for how to use Geofency to track devices in Home Assistant.

## Extracted Text

On this page
Configuration
Zones
Related topics
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] sets up integration with Geofency . Geofency is a paid app for iOS that lets users to configure a request that will be sent when a geofence or iBeacon region is entered or exited. This can be configured with Home Assistant to update your location.
To configure Geofency, you must set it up via the integrations panel in the configuration screen. You must then configure the iOS app (via the Webhook feature) to send a POST request to your Home Assistant instance at the webhook URL provided by the integration during setup. Use the default POST format. Make sure to enable the ‘Update Geo-Position’ functionality for mobile beacons.
Geofency will automatically generate the device tracker name used for geofences, and you will find it in the integrations section after the first request. For beacons, the device name will be beacon_<name from Geofency> , e.g., device_tracker.beacon_car .
When using mobile beacons (optional) an entry in configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file is still needed as this can’t be added via the integrations panel.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
Configuration Variables
Looking for your configuration file?
mobile_beacons list ( Optional )
List of beacon names that are to be treated as mobile . The name must match the name you configure in Geofency. By default, beacons will be treated as stationary .
A sample configuration for the geofency integration when using mobile beacons is shown below:
# Example configuration.yaml entry geofency : mobile_beacons : - car - keys
When you enter a geofence or stationary beacon, your location name in Home Assistant will be set to the name of the geofence or beacon location in Geofency. When you exit a geofence or stationary beacon, your location name in Home Assistant will be set to not home . For mobile beacons, the location name will be not_home whenever the beacon is entered or exited outside of a zone , otherwise, it will be set to the name of the zone.
To make Geofency work better with the proximity integration, you should enable the ‘Send Current Location’ feature in the Webhook configuration screen. This ensures that the current GPS coordinates are included in exit events instead of the coordinates of the (center of) the zone that was exited.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Geofency integration was introduced in Home Assistant 0.53, and it's used by
442 active installations.
Its IoT class is Cloud Push.
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Presence detection
Back to top
