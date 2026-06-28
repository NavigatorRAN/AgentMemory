---
source_url: "https://www.home-assistant.io/integrations/alpha_vantage"
final_url: "https://www.home-assistant.io/integrations/alpha_vantage"
canonical_url: "https://www.home-assistant.io/integrations/alpha_vantage/"
source_handle: "web:www-home-assistant-io:5ca408d7d68d"
source_section: "integrations-alpha-vantage"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "ebb94db759d69a95ff2f2f945df9402f8fa69d2e57ba8aaff76a8cb406d8f720"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Alpha Vantage - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/alpha_vantage
- Final URL: https://www.home-assistant.io/integrations/alpha_vantage
- Canonical URL: https://www.home-assistant.io/integrations/alpha_vantage/
- Fetched at: 2026-06-28T02:27:33Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up Alpha Vantage within Home Assistant.

## Extracted Text

On this page
API information
Examples
Google and the exchange rate for Bitcoin
Related topics
The Alpha Vantage integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] uses Alpha Vantage to monitor the stock market. This platform also provides detail about exchange rates.
To enable the alpha_vantage platform, add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry sensor : - platform : alpha_vantage api_key : YOUR_API_KEY symbols : - symbol : GOOGL name : Google foreign_exchange : - name : USD_EUR from : USD to : EUR
Either a symbol or a foreign exchange must be configured, otherwise you will not get any data.
Configuration Variables
Looking for your configuration file?
api_key string Required
The API Key from Alpha Vantage .
symbols map ( Optional )
List of stock market symbols for given companies.
name string ( Optional )
The name of the sensor to use for the frontend.
currency string ( Optional , default: USD )
symbol string Required
The stock market symbol for the given company.
foreign_exchange map ( Optional )
List of currencies.
from string Required
The source currency.
to string Required
The target currency.
Alpha Vantage offers two tiers of the API key, one free and one paid for. If you are using the free version, you will be limited to twenty-five queries per day. The sensor polls every 5 minutes, so you will only get data for the first two hours per day. This can be configured using the scan_interval variable. To find the necessary symbols, you can use the search function of the API. For example, try this SYMBOL_SEARCH query .
The paid version starts at 75 queries per minute, increasing ticker quantity quite a bit.
In this section you find some real-life examples of how to use this sensor.
sensor : - platform : alpha_vantage api_key : YOUR_API_KEY symbols : - name : Google currency : USD symbol : GOOGL foreign_exchange : - from : BTC to : USD name : Bitcoin
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Alpha Vantage integration was introduced in Home Assistant 0.60, and it's used by
106 active installations.
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
