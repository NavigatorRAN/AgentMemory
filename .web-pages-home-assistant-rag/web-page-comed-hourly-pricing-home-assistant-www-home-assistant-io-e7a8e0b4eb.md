# ComEd Hourly Pricing - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/comed_hourly_pricing
- Final URL: https://www.home-assistant.io/integrations/comed_hourly_pricing
- Canonical URL: https://www.home-assistant.io/integrations/comed_hourly_pricing/
- Fetched at: 2026-06-28T02:34:35Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up the ComEd Hourly Pricing sensor in Home Assistant.

## Extracted Text

On this page
The ComEd Hourly Pricing program is an optional program available to ComEd electric subscribers which charges customers a variable rate for electricity supply based on current demand rather than a traditional fixed rate. Live prices are published here and also via an API which we can integrate as a sensor in Home Assistant.
There are two price feeds available: the 5-minute price and current hour average price.
To use this sensor in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry sensor : - platform : comed_hourly_pricing monitored_feeds : - type : five_minute - type : current_hour_average
Configuration Variables
Looking for your configuration file?
monitored_feeds list Required
Feeds to monitor.
type list Required
Name of the feed.
five_minute
The latest 5-minute price in cents.
current_hour_average
The latest current hour average price in cents.
name string ( Optional )
Custom name for the sensor.
offset float ( Optional , default: 0.0 )
The pricing feeds provide only the supply cost of the electricity. The offset parameter allows you to provide a fixed constant that will be added to the pricing data to provide a more accurate representation of the total electricity cost per kWh.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The ComEd Hourly Pricing integration was introduced in Home Assistant 0.40, and it's used by
283 active installations.
Its IoT class is Cloud Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Energy
Back to top
