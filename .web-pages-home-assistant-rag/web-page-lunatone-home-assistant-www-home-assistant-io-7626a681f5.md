---
source_url: "https://www.home-assistant.io/integrations/lunatone"
final_url: "https://www.home-assistant.io/integrations/lunatone"
canonical_url: "https://www.home-assistant.io/integrations/lunatone/"
source_handle: "web:www-home-assistant-io:7626a681f5cc"
source_section: "integrations-lunatone"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "f42527de9d8eb9cde2921dff1308510db518812f1d42ccae4acfa3ad97d19c79"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Lunatone - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/lunatone
- Final URL: https://www.home-assistant.io/integrations/lunatone
- Canonical URL: https://www.home-assistant.io/integrations/lunatone/
- Fetched at: 2026-06-28T02:58:00Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Lunatone REST API devices with Home Assistant.

## Extracted Text

On this page
Supported devices
Prerequisites
Configuration
Supported functionality
Entities
Removing the integration
To remove an integration instance from Home Assistant
The Lunatone integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] is used to integrate with the devices of Lunatone that offer a REST API. This allows you to use lights and sensors in Home Assistant that are connected to the DALI bus via your device.
Right now the following devices are supported:
DALI-2 IoT Gateway
DALI-2 IoT4 Gateway
DALI-2 Display 4’’
DALI-2 Display 7’’
Important
Home Assistant automatic discovery requires device firmware version 1.17.1 or later. Manual setup is available with device firmware version 1.14.1 or later.
Before setting up the Lunatone integration, ensure you have:
Your gateway device powered and connected to your network.
The IP address or hostname of your device.
To add the Lunatone hub to your Home Assistant instance, use this My button:
Lunatone can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Lunatone .
Follow the instructions on screen to complete the setup.
URL
The URL to your gateway device. For example: http://10.0.0.131
The Lunatone integration provides the following entities.
Lights
Brightness
Description : Control the brightness of the light
Available for devices : All
Color Temperature
Description : Control the color temperature of the light
Available for devices : Devices with firmware version 1.17.0 or later
RGB Color
Description : Control the RGB color of the light
RGBW Color
Description : Control the RGBW color of the light
Sensors
The following sensor entities are available from your Lunatone gateway and connected DALI devices..
Air quality index
Description : Shows the overall air quality index reported by the connected sensor device.
Carbon dioxide
Description : Shows the measured carbon dioxide concentration.
Humidity
Description : Shows the measured relative humidity.
Illuminance
Description : Shows the measured ambient light level.
Pressure
Description : Shows the measured air pressure.
Temperature
Description : Shows the measured temperature.
Volatile organic compounds
Description : Shows the measured level of volatile organic compounds.
This integration follows standard integration removal. No extra steps are
required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Lunatone hub was introduced in Home Assistant 2025.11, and it's used by
6 active installations.
Its IoT class is Local Polling.
🥈 Silver quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@MoonDevLT
Categories
Hub
Light
Sensor
Back to top
