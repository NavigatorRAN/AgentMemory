---
source_url: "https://www.home-assistant.io/integrations/fixer"
final_url: "https://www.home-assistant.io/integrations/fixer"
canonical_url: "https://www.home-assistant.io/integrations/fixer/"
source_handle: "web:www-home-assistant-io:8d8300deb51a"
source_section: "integrations-fixer"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "7b022717e3cb2d94c592973d9d274d527e7fb9aead503c27d4a0d4ee37fb5489"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Fixer - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/fixer
- Final URL: https://www.home-assistant.io/integrations/fixer
- Canonical URL: https://www.home-assistant.io/integrations/fixer/
- Fetched at: 2026-06-28T02:43:02Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate exchange rates from Fixer.io within Home Assistant.

## Extracted Text

On this page
Setup
Configuration
Related topics
The Fixer integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] will show you the current exchange rate from Fixer.io which is using data from the European Central Bank (ECB) .
To get an overview about the available currencies .
You need to create an API key . The free account is limited to only EUR as a base currency, allows 100 requests per month, and updates every hour.
To enable this integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] , add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry sensor : - platform : fixer api_key : YOUR_API_KEY target : CHF
Configuration Variables
Looking for your configuration file?
api_key string Required
Your API key for Fixer.io .
target string Required
The symbol of the target currency.
name string ( Optional , default: Exchange rate )
Name to use in the frontend.
Details about the API are available in the Fixer.io documentation .
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Fixer integration was introduced in Home Assistant 0.23, and it's used by
16 active installations.
Its IoT class is Cloud Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Finance
Back to top
