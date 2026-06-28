---
source_url: "https://www.home-assistant.io/integrations/cielo_home"
final_url: "https://www.home-assistant.io/integrations/cielo_home"
canonical_url: "https://www.home-assistant.io/integrations/cielo_home/"
source_handle: "web:www-home-assistant-io:334c5c3a5451"
source_section: "integrations-cielo-home"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "cf320c1c23a2c7774660a93ca9c547ad9687aecd7a88fcc872f4d612d90993d4"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Cielo Home - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/cielo_home
- Final URL: https://www.home-assistant.io/integrations/cielo_home
- Canonical URL: https://www.home-assistant.io/integrations/cielo_home/
- Fetched at: 2026-06-28T02:33:42Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Cielo smart thermostats in Home Assistant.

## Extracted Text

On this page
Supported devices
Prerequisites
Important API key rules
Obtaining an API key
Configuration
Supported functionality
Climates
Data updates
Actions
API limitations
Troubleshooting
Removing the integration
To remove an integration instance from Home Assistant
The Cielo Home integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control Cielo devices directly from Home Assistant, using the cloud-based Cielo Connect API .
The Cielo Home integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] supports the following devices.
Cielo Breez Max : Smart thermostat for mini-splits.
Cielo Breez Edge Pro : Smart thermostat for mini-splits.
Cielo Thermostat Eco : Smart thermostat for central HVAC systems.
Cielo Smart Thermostat : Smart thermostat for central HVAC systems.
Before integrating the Cielo devices with Home Assistant, ensure that:
Your Cielo device is already registered in the Cielo Home app.
The device is among the supported devices listed above.
The device has a configured remote (automatically or manually).
Your Home Assistant server has internet access.
Before proceeding, ensure the Cielo device is fully compatible with Home Assistant.
To safeguard security and prevent unauthorized access, Cielo enforces the following API security restrictions:
Each API key can be used only once.
A new API key cannot be generated until the current one is revoked.
You may generate a maximum of 3 keys per month.
Once a new API key is generated, wait 60 seconds for it to be displayed on the screen.
Revoking an API key will disconnect Home Assistant immediately or within about a minute.
Visit the Cielo Web Portal .
Open the Menu by selecting the hamburger menu icon at the top left side.
Select Home Assistant from the sidebar.
The API key will be displayed. Copy the API key from the dialog.
Tip
If the message This key is already used appears, you must first revoke the old key before generating a new one.
To add the Cielo Home hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Cielo Home .
Follow the instructions on screen to complete the setup.
If authentication succeeds, Home Assistant will automatically create the climate entities for all supported Cielo devices in your account.
Note
If you add or set up a new Cielo device after configuring the integration in Home Assistant, you must reload the integration:
Select Cielo Home and in the right corner, select the three dots menu.
Select Reload .
Each supported device exposes at least one climate entity.
Depending on device support, some entities might not be available as the device does not support them.
The climate platform integrates the compatible Cielo devices into Home Assistant, allowing control through its user interface.
Cielo Breez Max & Cielo Breez Edge Pro
HVAC modes (varies by device): Heat, Cool, Dry, Fan, Auto, Off
Temperature control : Provide a target temperature where applicable.
Fan modes : Provide a fan mode if applicable.
Vertical swing position : Provide a vertical swing position where applicable.
Presets : Home, Away, Sleep, & Pets (where supported & defined)
Some fan modes or swing positions depend on the device’s remote configuration.
Cielo Smart Thermostat & Cielo Smart Thermostat Eco
HVAC modes (varies by equipment): Cool, Auto, Heat, Off
Temperature control : Set the temperature setpoint.
Presets : Home, Away, Sleep & pets (where supported and defined)
This integration relies on cloud polling Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] , with data refreshed approximately every 120 seconds (2 minutes). If the Cielo API or your device becomes unavailable, Home Assistant will automatically retry.
Manual changes made in the Cielo Home app or via IR remote are synced automatically on the next poll.
If the device is added after the integration, you need to reload the Cielo Home integration.
This integration does not provide any custom service actions. All controls are performed using the standard Home Assistant climate services.
API key cannot be reused.
Revoking an API key will immediately disconnect Home Assistant.
You can generate a maximum of three API keys within last 30 days.
This integration relies on an active internet connection and access to the Cielo Home API. Here are a few things to check before raising an issue:
Confirm that your Home Assistant has internet access.
Verify that your Cielo device is online by checking its status in the Cielo Home app.
Ensure that the device’s remote configuration is complete. Devices without remotes will not expose HVAC modes.
Check that your API key is still valid and hasn’t been revoked.
Reconfigure the integration and provide a freshly generated key.
Try refreshing the entities manually in Home Assistant.
If devices still fail to load after these steps, please contact Cielo Tech Support .
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Optional : Revoke your API key in the Cielo Home Web Portal .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Cielo Home hub was introduced in Home Assistant 2026.6, and it's used by
22 active installations.
Its IoT class is Cloud Polling.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@ihsan-cielo
@mudasar-cielo
Categories
Climate
Back to top
