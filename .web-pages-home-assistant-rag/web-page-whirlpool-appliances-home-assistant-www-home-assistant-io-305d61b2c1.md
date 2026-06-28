---
source_url: "https://www.home-assistant.io/integrations/whirlpool"
final_url: "https://www.home-assistant.io/integrations/whirlpool"
canonical_url: "https://www.home-assistant.io/integrations/whirlpool/"
source_handle: "web:www-home-assistant-io:305d61b2c114"
source_section: "integrations-whirlpool"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "b3003298822edb816edbdcc2ca4c02a1a10cd97aa122bbc67715bbd2ad119a4e"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Whirlpool Appliances - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/whirlpool
- Final URL: https://www.home-assistant.io/integrations/whirlpool
- Canonical URL: https://www.home-assistant.io/integrations/whirlpool/
- Fetched at: 2026-06-28T03:28:29Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Whirlpool appliances with Home Assistant.

## Extracted Text

On this page
Supported devices
Prerequisites
Configuration
Supported functionality
Binary Sensor
Climate
Select
Sensor
Removing the integration
To remove an integration instance from Home Assistant
The Whirlpool Appliances integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to connect Whirlpool, Maytag, KitchenAid, and Consul appliances to Home Assistant.
The following appliances are confirmed to be working, but other models may also work.
Air conditioners:
Whirlpool SPIW309A2WF
Whirlpool SPIW312A2WF
Whirlpool SPIW409A2WF
Washers:
Whirlpool WTW6120HW2
Whirlpool WTW8127LW1
Maytag MHW8630HW0
Dryers:
Whirlpool WGD8127LW3
Valid Whirlpool (or related brand) account credentials.
Registered appliances in the official Whirlpool (or related brand) mobile app.
To add the Whirlpool Appliances hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Whirlpool Appliances .
Follow the instructions on screen to complete the setup.
Username
The username of your Whirlpool (or related brand) account.
Password
The password of your Whirlpool (or related brand) account.
Region
The region in which your account is registered.
Brand
The brand of the mobile app. It may or may not be the same brand as the appliances.
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] maps appliances to entities in Home Assistant. A single appliance may be represented by one or more entities.
The binary sensor platform provides the following functionality:
state of the washer/dryer machine door (open/closed)
The whirlpool climate platform integrates Whirlpool air conditioning systems into Home Assistant, allowing control of the appliance through the user interface. The current inside temperature is also displayed on the thermostat card.
The following actions are also available:
set_hvac_mode ( off , heat , cool , fan_only )
target temperature
turn on/off
fan mode ( low , medium , high )
swing mode ( off , horizontal )
The select platform provides the following entity for refrigerators:
Temperature level : Sets the temperature level of the refrigerator. The available options are -4 °C , -2 °C , 0 °C , 3 °C , and 5 °C .
The whirlpool sensor platform integrates Whirlpool Washer and Dryer systems into Home Assistant, allowing views of the machine state, time remaining, and the “wash & go” tank fill status as sensors for each device.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Whirlpool Appliances hub was introduced in Home Assistant 2022.10, and it's used by
609 active installations.
Its IoT class is Cloud Push.
🥈 Silver quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@abmantis
@mkmer
Categories
Hub
Back to top
