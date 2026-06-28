---
source_url: "https://www.home-assistant.io/integrations/toon"
final_url: "https://www.home-assistant.io/integrations/toon"
canonical_url: "https://www.home-assistant.io/integrations/toon/"
source_handle: "web:www-home-assistant-io:0f6d12f22b96"
source_section: "integrations-toon"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "f77a37a55809f54951d63d287e6ebe2df3c22c15be0d8d50e4a03e4a6fa419b0"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Toon - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/toon
- Final URL: https://www.home-assistant.io/integrations/toon
- Canonical URL: https://www.home-assistant.io/integrations/toon/
- Fetched at: 2026-06-28T03:23:07Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Eneco Toon/Engie Electrabel Boxx/Viesgo within Home Assistant.

## Extracted Text

On this page
Prerequisites
Setting up a developer account
Configuration
Binary sensor
Climate
Sensor
Switch
The Toon integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] platform can be used to control your Quby Toon thermostat,
which is currently being sold as:
Eneco Toon
Engie Electrabel Boxx
Viesgo Toon
This integration adds a climate device for your Toon thermostat, some switches
allowing you to control the program and holiday mode of the thermostats as well.
Sensors for energy, power and gas consumption, sensors for solar production and
several binary sensors for things like boiler burner on/off, hot tap water and
boiler health status.
An active, paid Toon subscription with one of the supported providers (Eneco, Engie Electrabel, or Viesgo). The integration communicates with the Toon cloud service, which requires an active subscription.
A free Toon API developer account (see steps below).
Visit the Toon API developers website , and sign in . Create an account if you don’t have one already.
Open the “ My Apps ” page and click on “Add a new App” button on the top right.
The “Add App” page shows a form with two fields:
App Name : Can be anything you like, for example, “Home Assistant” will just do.
Callback URL : https://my.home-assistant.io/redirect/oauth .
Click on “Create App” to complete the creation process.
Open the “ My Apps ” page again and click on the app that you’ve just created.
You need the codes now shown: “Consumer Key” and “Consumer Secret”.
Add the following Toon configuration to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] and restart Home Assistant.
# Example configuration.yaml entry toon : client_id : YOUR_CONSUMER_KEY client_secret : YOUR_CONSUMER_SECRET
Configuration Variables
Looking for your configuration file?
client_id string Required
Toon API Consumer Key.
client_secret string Required
Toon API Consumer Secret.
To add the Toon device to your Home Assistant instance, use this My button:
Toon can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Toon .
Follow the instructions on screen to complete the setup.
I have manually disabled My Home Assistant
If you don’t have My Home Assistant on your installation,
you can use <HOME_ASSISTANT_URL>/auth/external/callback as the Callback URL
instead.
The <HOME_ASSISTANT_URL> must be the same as used during the configuration/
authentication process.
Internal examples: http://192.168.0.2:8123/auth/external/callback , http://homeassistant.local:8123/auth/external/callback .”
The Toon integration provides the following binary sensors:
Boiler Burner (only with OpenTherm)
Boiler Heating* (only with OpenTherm)
Boiler Module Connection*
Boiler Preheating* (only with OpenTherm)
Boiler Status (only with OpenTherm)
Hot Tap Water (only with OpenTherm)
OpenTherm Connection* (only with OpenTherm)
Thermostat Program Override*
Binary sensors marked with * are disabled by default, but can be enabled
from the UI, by clicking on the device and enabling the specific entity.
The Toon climate platform allows you to interact with your Toon thermostat.
Home Assistant support the four Toon presets: Comfort , Home , Away and Sleep .
It also supports setting the temperature manually.
Toon has no option to disable a preset. It will automatically unset
when values of the thermostat are changed.
The Toon integration provides the following sensors:
Average Daily Energy Usage*
Average Daily Gas Usage*
Average Daily Water Usage*
Average Gas Usage
Average Power Usage*
Average Water Usage*
Average Solar Power Production to Grid* (only with solar module)
Boiler Modulation Level* (only with OpenTherm)
Current Gas Usage
Current Power Usage
Current Power Usage Covered By Solar (only with solar module)
Current Solar Power Production (only with solar module)
Current Water Usage*
Electricity Meter Feed IN Tariff 1*
Electricity Meter Feed IN Tariff 2*
Electricity Meter Feed OUT Tariff 1*
Electricity Meter Feed OUT Tariff 2*
Energy Cost Today
Energy Produced To Grid Today* (only with solar module)
Energy Usage From Grid Today* (only with solar module)
Energy Usage Today
Gas Cost Today
Gas Meter
Gas Usage Today
Humidity*
Max Solar Power Production Today (only with solar module)
Solar Energy Produced Today (only with solar module)
Solar Power Production to Grid (only with solar module)
Temperature
Water Meter*
Water Usage Today*
Water Cost Today*
Sensors marked with * are disabled by default, but can be enabled
The Toon integration provides the following switches:
Thermostat Holiday Mode
Thermostat Program
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Toon device was introduced in Home Assistant 0.56, and it's used by
245 active installations.
Its IoT class is Cloud Push.
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Energy
Back to top
