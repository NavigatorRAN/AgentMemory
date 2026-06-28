---
source_url: "https://www.home-assistant.io/integrations/foobot"
final_url: "https://www.home-assistant.io/integrations/foobot"
canonical_url: "https://www.home-assistant.io/integrations/foobot/"
source_handle: "web:www-home-assistant-io:ad644eb51168"
source_section: "integrations-foobot"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "90b0830bad42036d9eabdff4db4c010dffe49bd87b4a9950b7fe8759261fdcb9"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Foobot - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/foobot
- Final URL: https://www.home-assistant.io/integrations/foobot
- Canonical URL: https://www.home-assistant.io/integrations/foobot/
- Fetched at: 2026-06-28T02:43:48Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up Foobot Air Quality sensor in Home Assistant.

## Extracted Text

On this page
Configuring the Platform
Available metrics
The Foobot integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] will fetch air quality data from your or yours Foobot device(s) .
This sensor requires an API token. Please obtain one at Foobot API site .
To enable this sensor, add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
sensor : - platform : foobot token : FOOBOT_SECRET_KEY username : FOOBOT_USERNAME
Configuration Variables
Looking for your configuration file?
token string Required
The token for the Foobot API.
username string Required
Your Foobot username, used to fetch devices associated with an account.
Every ten minutes, it’ll fetch the last ten minutes average of the following measurements:
Temperature
Humidity
Co2
VOC
PM2.5
Index
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Foobot integration was introduced in Home Assistant 0.66, and it's used by
33 active installations.
Its IoT class is Cloud Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Health
Back to top
