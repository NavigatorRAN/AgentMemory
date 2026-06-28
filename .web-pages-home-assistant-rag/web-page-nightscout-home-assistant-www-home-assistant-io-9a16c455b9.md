---
source_url: "https://www.home-assistant.io/integrations/nightscout"
final_url: "https://www.home-assistant.io/integrations/nightscout"
canonical_url: "https://www.home-assistant.io/integrations/nightscout/"
source_handle: "web:www-home-assistant-io:9a16c455b9aa"
source_section: "integrations-nightscout"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "8a575b4f8668bcc0e0ca322046ab218874a8ffb46ecf6121c80dfa9745100892"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Nightscout - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/nightscout
- Final URL: https://www.home-assistant.io/integrations/nightscout
- Canonical URL: https://www.home-assistant.io/integrations/nightscout/
- Fetched at: 2026-06-28T03:03:17Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate your Nightscout CGM data into Home Assistant.

## Extracted Text

On this page
Configuration
Sensor
Example automation
The Nightscout integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to view your CGM data from Nightscout in Home Assistant.
To add the Nightscout service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Nightscout .
Follow the instructions on screen to complete the setup.
If your Nightscout instance requires authentication for API access, you are also required to input the API Key in the configuration form.
If you have a sensor session running, and you have enabled the Nightscout integration, you should see a sensor.blood_glucose entity.
The icon changes to indicate the direction or trend, of the glucose readings.
The state is the last reading from Nightscout, and you can see other information about the reading in the sensor’s attributes.
- alias : " overnight_low_kitchen_lights" description : Turn on the lights in the kitchen if my blood sugar drops low overnight triggers : - trigger : numeric_state entity_id : sensor.blood_glucose below : " 65" conditions : - condition : time after : " 22:00:00" before : " 06:00:00" actions : - action : light.turn_on target : entity_id : light.kitchen
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Nightscout service was introduced in Home Assistant 0.115, and it's used by
319 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@marciogranzotto
Categories
Back to top
