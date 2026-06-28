---
source_url: "https://www.home-assistant.io/integrations/hue_ble"
final_url: "https://www.home-assistant.io/integrations/hue_ble"
canonical_url: "https://www.home-assistant.io/integrations/hue_ble/"
source_handle: "web:www-home-assistant-io:c239cbd11a8a"
source_section: "integrations-hue-ble"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "635ee9d1f97201a71dd2a1f595a32c75aca6a3e5710b840519f4354300ed8d4c"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Philips Hue BLE - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/hue_ble
- Final URL: https://www.home-assistant.io/integrations/hue_ble
- Canonical URL: https://www.home-assistant.io/integrations/hue_ble/
- Fetched at: 2026-06-28T02:50:21Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up Philips Hue Bluetooth lights within Home Assistant.

## Extracted Text

On this page
Prerequisites
Alexa/Google pairing mode
Factory reset
Configuration
Supported models
Removing the integration
To remove an integration instance from Home Assistant
Known limitations
The Hue BLE integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control your Philips Hue Bluetooth lights with Home Assistant.
Before trying to connect your light(s) to Home Assistant, you must put the light(s) into pairing mode, there are two ways to achieve this.
The Hue app can put lights in pairing mode using the pair to voice assistant feature. This allows you to keep controlling the lights using the Hue app as well as Home Assistant.
In the Philips Hue app ( Android , iOS ), go to Settings > Voice Assistants > Amazon Alexa or Google Home > Make Discoverable .
Once the light is in pairing mode, you can connect to it to Home Assistant.
To view the discovered lights, in Home Assistant, go to Settings > Devices & services . They are shown in the Discovered section.
Factory resetting a Hue light automatically puts it in pairing mode. It can be directly connected to by Home Assistant without using the Hue app.
To add the Philips Hue BLE device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Philips Hue BLE .
Follow the instructions on screen to complete the setup.
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] is tested to work with the following models:
Model number Product name LCA004 Hue White and Color 800 LCA006 Hue White and Color 1100 LCA011 Hue White and Color ambiance 1100 LCL009 Hue Solo Lightstrip LCX029 Hue Festavia globe bulb string lights LWA021 Hue Filament Bulb White LWA031 Hue White 1600 LTO002 Hue White ambiance filament globe bulb Unknown Hue White and Color Ambiance Infuse ceiling lamp Unknown Hue White and Color Ambiance Go portable accent light
The Philips Hue BLE integration has been designed to work with other models as well. If you have a different model and it is working, please let us know.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
If you factory reset a Hue light it will be discovered as a new device even if it was previously connected to Home Assistant or ignored. This is because the Bluetooth address of Hue lights is randomly generated and changes if the light is factory reset.
Hue lights connected using Zigbee are still discoverable and controllable by this integration, even if they are connected to another Zigbee network or bound to a Zigbee switch. This means you can use Zigbee and Bluetooth at the same time. This can be done by pairing the light to the Zigbee hub or switch and then using the Hue app to connect to the light over Bluetooth using the QR code on the side of the light and then using the Alexa/Google pairing steps described above.
This integration requires an active Bluetooth connection to control lights which not all Bluetooth adapters can provide. See the Bluetooth documentation for more information about which adapters can provide an active connection.
If the connection to the light is lost for a significant period of time the integration will not re-attempt to connect to the light and a restart or reload of the integration must be performed for the light to become available again.
If you have multiple Bluetooth adapters/proxies only the adapter/proxy which was used to pair to the light during setup will be able to control the light. If this adapter/proxy becomes unavailable you will not be able to use a different adapter/proxy to control the light without setting it up again. Home Assistant automatically uses the adapter/proxy with the strongest signal, if for whatever reason this is not the adapter/proxy the light was set up with, it will not be able to connect. It is possible to resolve this by pairing the light to multiple proxies by making other proxies unavailable and re-setting up the light until all desired proxies are paired to the light, this requires the use of the Alexa/Google pairing mode setup.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Philips Hue BLE device was introduced in Home Assistant 2025.12, and it's used by
98 active installations.
Its IoT class is Local Push.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@flip-dots
Categories
Light
Back to top
