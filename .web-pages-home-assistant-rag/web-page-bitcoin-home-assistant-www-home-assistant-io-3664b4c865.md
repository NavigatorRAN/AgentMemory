---
source_url: "https://www.home-assistant.io/integrations/bitcoin"
final_url: "https://www.home-assistant.io/integrations/bitcoin"
canonical_url: "https://www.home-assistant.io/integrations/bitcoin/"
source_handle: "web:www-home-assistant-io:3664b4c86502"
source_section: "integrations-bitcoin"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "e11a40df595f524811de5d15be99ebda082ebab277f29d87a19069f1645e2efa"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Bitcoin - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/bitcoin
- Final URL: https://www.home-assistant.io/integrations/bitcoin
- Canonical URL: https://www.home-assistant.io/integrations/bitcoin/
- Fetched at: 2026-06-28T02:31:22Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Bitcoin data within Home Assistant.

## Extracted Text

On this page
Related topics
The Bitcoin integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] displays various details about the Bitcoin network.
To add the Bitcoin sensor to your installation, add a selection of the available display options to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry sensor : - platform : bitcoin display_options : - exchangerate - trade_volume_btc
Configuration Variables
Looking for your configuration file?
currency string ( Optional , default: USD )
The currency to exchange to, such as CHF, USD, or EUR.
display_options list Required
Options to display in the frontend.
exchangerate
Exchange rate of 1 BTC
trade_volume_btc
Trade volume
miners_revenue_usd
Miners revenue
btc_mined
BTC mined
trade_volume_usd
Trade volume in USD
difficulty
Difficulty
minutes_between_blocks
Time between blocks in minutes
number_of_transactions
Number of transactions
hash_rate
Hash rate in PH/s
timestamp
Timestamp
mined_blocks
Mined Blocks
blocks_size
Block size
total_fees_btc
Total fees in BTC
total_btc_sent
Total sent in BTC
estimated_btc_sent
Estimated sent in BTC
total_btc
Total of BTC
total_blocks
Total Blocks
next_retarget
Next retarget
estimated_transaction_volume_usd
Estimated transaction volume in BTC
miners_revenue_btc
Miners revenue in BTC
market_price_usd
Market price in USD
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Bitcoin integration was introduced in Home Assistant pre 0.7, and it's used by
719 active installations.
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
