---
source_url: "https://www.home-assistant.io/integrations/dexcom"
final_url: "https://www.home-assistant.io/integrations/dexcom"
canonical_url: "https://www.home-assistant.io/integrations/dexcom/"
source_handle: "web:www-home-assistant-io:9ed0bda2ed17"
source_section: "integrations-dexcom"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "4a7877d89c4e1cf8bdd26b96f0070d7d72b7fd9a1c5cd700960aa512c07bc370"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Dexcom - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/dexcom
- Final URL: https://www.home-assistant.io/integrations/dexcom
- Canonical URL: https://www.home-assistant.io/integrations/dexcom/
- Fetched at: 2026-06-28T02:37:06Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate your Dexcom CGM data into Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Troubleshooting
Sensor
Example automation
The Dexcom integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to view your CGM data from Dexcom in Home Assistant.
You will need to set up the Dexcom Share feature in your Dexcom G6 or G7 app to use this integration. Enabling the Dexcom Share service requires setup of at least one follower. The integration will use the Dexcom user’s credentials, not the follower’s credentials.
To add the Dexcom service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Dexcom .
Follow the instructions on screen to complete the setup.
Username
Username, email address, or phone number. Format phone numbers with a + , your country code, then your phone number.
Region
The Dexcom Share API endpoint, one of US, Outside of US, Japan.
Validate your Dexcom account credentials by logging on to the Dexcom Account Management website for your region:
For users in the United States: uam1.dexcom.com .
For users outside of the United States: uam2.dexcom.com .
For users in Japan: uam.dexcom.jp .
If you have a sensor session running, and once you have enabled the Dexcom integration, you should see the following sensors:
Blood glucose value sensor
Blood glucose trend sensor
- alias : " Overnight low kitchen lights" description : " Turn on the lights in the kitchen if my blood sugar drops low overnight" triggers : - trigger : numeric_state entity_id : sensor.dexcom_YOUR_USERNAME_glucose_value below : 65 conditions : - condition : time after : " 22:00:00" before : " 06:00:00" actions : - action : light.turn_on target : entity_id : light.kitchen
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Dexcom service was introduced in Home Assistant 0.113, and it's used by
855 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@gagebenne
Categories
Health
Back to top
