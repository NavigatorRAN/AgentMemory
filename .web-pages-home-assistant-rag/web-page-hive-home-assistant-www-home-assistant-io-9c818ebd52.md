---
source_url: "https://www.home-assistant.io/integrations/hive"
final_url: "https://www.home-assistant.io/integrations/hive"
canonical_url: "https://www.home-assistant.io/integrations/hive/"
source_handle: "web:www-home-assistant-io:9c818ebd521b"
source_section: "integrations-hive"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "d965226ee9c81202fdfa7df456cf18fb81573a1d5a4644abeacd3df2337d9143"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Hive - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/hive
- Final URL: https://www.home-assistant.io/integrations/hive
- Canonical URL: https://www.home-assistant.io/integrations/hive/
- Fetched at: 2026-06-28T02:49:04Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Hive devices with Home Assistant.

## Extracted Text

On this page
Configuration
Options
List of actions
Platforms
Binary sensor
Climate
Light
Sensor
Switch
Water heater
Removing the integration
To remove an integration instance from Home Assistant
The Hive integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] for Home Assistant allows you to interact with supported devices and services offered by
hivehome.com
This Hive integration uses the same username and password you use on the Hive website to configure it within Home Assistant. 2FA authentication must be enabled to use this integration. Once configured, Home Assistant will detect and add all Hive devices, including support for multi-zone heating.
Note
The credentials used must be for the Hive account owner. Shared accounts or secondary users will not work with this integration.
To add the Hive hub to your Home Assistant instance, use this My button:
Hive can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Hive .
Follow the instructions on screen to complete the setup.
Menu: Configuration > Integrations > Select your new integration > Press the options button
Scan Interval : Update the scan interval allowing the integration to poll for data more frequently (Cannot be set lower than 30 seconds).
The Hive integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Boost heating off ( hive.boost_heating_off )
Turns off the boost on a Hive heating zone or radiator valve.
Boost heating on ( hive.boost_heating_on )
Boosts a Hive heating zone or radiator valve to a target temperature for a set time.
Boost hotwater ( hive.boost_hot_water )
Turns the boost on or off for a Hive hot water tank for a set time.
For an overview of every action across all integrations, see the actions reference .
The hive binary sensor integration integrates your Hive sensors into Home Assistant.
The platform supports the following Hive devices and sensors:
Devices
Hive Window or Door Sensor
Hive Motion Sensor
Sensors
Hive Hub Online Status
Hive Hub 360 Glass Break
Hive Hub 360 Dog Bark
Hive Hub 360 Smoke CO2
The hive climate platform integrates your Hive thermostat and Hive radiator valves into Home Assistant, enabling control of setting the mode and setting the target temperature .
A short boost for Hive Heating can be set by using the Boost preset, this will turn on the boost feature for 30 minutes at 0.5 degrees higher than the current temperature.
The platform supports the following Hive products:
Hive Active Heating
Hive Multi-zone
Hive Radiator Valve
The hive light platform integrates your Hive lights into Home Assistant, enabling control of various settings, depending on the model light.
Hive Active Light Dimmable
Hive Active Light Cool to Warm White
Hive Active Light Color Changing
The hive sensor integration exposes Hive data as a sensor.
The platform exposes the following sensors:
Battery level for supported products
Boost for supported products
Mode for supported products
State for supported products
Current temperature for supported products
Target temperature for supported products
The hive switch platform integrates your Hive plugs into Home Assistant, enabling control of your devices.
Hive Active Plug
Hive Heat on Demand
The hive water heater platform integrates your Hive hot water into Home Assistant, enabling control of setting the mode .
Hot Water Control
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Removing the integration will also deregister this Home Assistant instance from your Hive account. If you set up the integration again, you will need to register a new device during the configuration process.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Hive hub was introduced in Home Assistant 0.59, and it's used by
3206 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@Rendili
@KJonline
Categories
Hub
Back to top
